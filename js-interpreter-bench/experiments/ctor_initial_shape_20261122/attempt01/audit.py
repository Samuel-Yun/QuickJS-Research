"""Check source isolation, measurements and the reported selection without rerunning JS."""
import csv
import json
import math
from pathlib import Path
import re
import statistics
import subprocess
import tempfile

from build import HERE,PACKAGE,PARENTS,LABELS,sha,save,source
from full_bench import OUT,verify
from analyze import change


ALL=['SPARSE','P2','P2_COLD']+LABELS


def read(path):return json.loads(Path(path).read_text())
def events(path):return [json.loads(s) for s in Path(path).read_text().splitlines()]
def section(s,a,b):return s[s.index(a):s.index(b,s.index(a))]


def processes(path,number,diagnostic=False):
    data=events(path)
    starts=[r for r in data if r['event']=='process_start']
    ends=[r for r in data if r['event']=='process_result']
    assert len(starts)==len(ends)==number,(path,len(starts),len(ends),number)
    assert len({(r['boot_id'],r['child_pid']) for r in starts})==number
    assert all(a['token']==b['token'] and a['child_pid']==b['child_pid'] for a,b in zip(starts,ends))
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(ends,ends[1:]))
    assert all(r['exit_code']==0 and not r['timeout'] for r in ends)
    if not diagnostic:assert all(not r['stderr'] for r in ends)
    return [r for r in data if r['event']=='sample']


def patches(before,after,path):
    with tempfile.TemporaryDirectory(prefix='ctor-initial-patch-') as td:
        root=Path(td)
        for n,s in before.items():
            p=root/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
        subprocess.run(['patch','-p1','--batch','--fuzz=0','-i',str(path)],cwd=root,
                       check=True,capture_output=True,text=True)
        for n,s in after.items():assert (root/n).read_text()==s,(path,n)


def main():
    frozen=read(PACKAGE/'manifest.json')['modified']
    for n,h in frozen.items():assert sha(PACKAGE/'modified'/n)==h,n
    assert read(HERE/'anchor.json')['HEAD'].startswith('7c941da')
    assert read(HERE/'SPARSE.release.manifest.json')['sources']==frozen
    for label in ALL:
        for mode in ['release','diag']:
            m=read(HERE/(label+'.'+mode+'.manifest.json'))
            assert sha(m['binary'])==m['binary_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,(label,n)
            assert m['instrumented']==(mode=='diag')
        base,parent,d,_=source(label,'release')
        assert 'identity_misses' not in d['four_runtime.inc'] and 'borrow_miss_site' not in d['quickjs.c']
        assert 'OP_get_field_rdi16' not in d['quickjs.c']
        if label in LABELS:
            patches(base,d,HERE/'patches'/('SPARSE-to-'+label+'.patch'))
            patches(parent,d,HERE/'patches'/(PARENTS[label]+'-to-'+label+'.patch'))
        if label in ['INIT_FREE','P2_COLD_INIT']:
            f=d['four_runtime.inc'];p=parent['four_runtime.inc']
            assert 'find_hashed_shape_proto' not in f and '->initial' not in f
            assert 'reserved_initial' in f and 'sizeof(FullPlan)==96' in f
            assert 'offsetof(FullPlan,final)==24' in f and 'offsetof(FullPlan,recipe)==32' in f
            assert section(f,'static int plan_try','\n#include "sparse_runtime.inc"')==section(p,'static int plan_try','\n#include "sparse_runtime.inc"')
            assert section(f,'static int plan_chain','static int plan_base')==section(p,'static int plan_chain','static int plan_base')
            assert section(f,'static int plan_base','static int plan_slow_eligible')==section(p,'static int plan_base','static int plan_slow_eligible')
            assert d['sparse_runtime.inc']==parent['sparse_runtime.inc']
        if label=='P2_KEEP_PRIMARY':
            from candidates import keep_primary
            expected=dict(parent);keep_primary(expected);assert expected==d
        _,_,diag,_=source(label,'diag')
        # Detailed tracing adds no fields to the VM's site/plan/bytecode records.
        for name in ['struct FourSite {','struct FullPlan {']:
            assert section(d['four_runtime.inc'],name,'\n};')==section(diag['four_runtime.inc'],name,'\n};')
        assert 'JS_DupValue' not in diag['ctor_trace.h'] and 'js_dup_shape' not in diag['ctor_trace.h']
        m=read(HERE/(label+'.release.manifest.json'))
        names=subprocess.check_output(['nm','-a',m['binary']],text=True)
        assert not re.search(r'\b(?:trace_enter|trace_report|screen_counts|screen_report|follow_stats)\b',names),label

    for phase,labels,number in [('initial',ALL[:3],21),('candidates',ALL,84)]:
        rows=processes(HERE/phase/'runs.jsonl',number)
        assert len(rows)==number and all(r['valid'] for r in rows)
        assert read(HERE/phase/'complete.json')['status']=='PASS'
        summary=read(HERE/phase/'summary.json')
        for r in summary:
            values=[v['value_ms'] for v in rows if v['label']==r['label'] and v['case']==r['case']]
            assert len(values)==7 and values==r['raw_ms']
            assert statistics.median(values)==r['median_ms'] and min(values)==r['min_ms'] and max(values)==r['max_ms']
        expected=[]
        for rep in range(7):
            shift=rep%len(labels);order=labels[shift:]+labels[:shift]
            expected.extend((l,'tree',rep+1) for l in order)
            if phase=='candidates':expected.extend((l,'micro',rep+1) for l in order[::-1])
        assert [(r['label'],r['case'],r['rep']) for r in rows]==expected
    all_diag={}
    for phase,labels in [('diagnostics',ALL[:3]),('candidate_diagnostics',LABELS)]:
        processes(HERE/phase/'runs.jsonl',len(labels),True)
        ds=read(HERE/phase/'summary.json');all_diag.update(ds)
        for label in labels:
            trace=read(HERE/phase/(label+'.trace.json'));assert not trace['overflow']
            assert ds[label]['totals']['calls']==10770432
            for key,value in ds[label]['totals'].items():assert value==sum(r[key] for r in trace['rows'])
            assert sum(s['calls'] for s in ds[label]['top_sites'])==10770432
    light=read(HERE/'extra_counts/light_comparison.json')
    assert all(r['same_distribution'] and r['light']==r['detailed'] for r in light.values())
    for label in ['INIT_FREE','P2_COLD_INIT']:
        d=all_diag[label]['totals']
        assert d['published']==512 and d['primary_hits']+d['secondary_hits']==10769918
        assert d['before_initial_missing']==d['after_initial_missing']==0
    assert all(read(HERE/'gate.json')[l]['status']=='PASS' for l in LABELS)
    san=read(HERE/'sanitize.json');assert san['ASan'] and san['UBSan']
    assert all(san['results'][l]['status']=='PASS' for l in LABELS)
    assert 'SKIPPED' in read(HERE/'decisions.json')['P2_SIDE']
    selection=read(HERE/'screen.json')
    assert selection['criteria']==read(HERE/'decisions.json')['screening']
    assert selection['selected']==['INIT_FREE','P2_COLD_INIT']
    for r in selection['results']:
        assert r['pass_full_gate']==(r['Tree_change_pct']<=-5 and r['pairs_at_least_5pct_faster']>=5 and r['stable_change_pct']<=2)

    p=read(OUT/'protocol.json');verify(p)
    assert p['labels']==['SPARSE','P2']+selection['selected']
    assert sha(HERE/'full_bench.py')==p['driver_sha256'] and p['CPU']==2 and p['warmup_calls']==0
    rows=processes(OUT/'runs.jsonl',172)
    assert len(rows)==172
    assert [(r['label'],r['suite'],r['case']) for r in rows]==[(s['label'],s['suite'],s['case']['case']) for s in p['schedule']]
    assert all(r['valid'] and r['payload']['correctness']=='PASS' and r['payload']['warmup_calls']==0 for r in rows)
    assert all(math.isclose(r['ms_per_Run'],r['payload']['elapsed_ms']/r['N'],abs_tol=1e-12) for r in rows)
    for l in p['labels']:
        assert sum(r['label']==l and r['suite']=='octane' for r in rows)==17
        assert sum(r['label']==l and r['suite']=='sunspider' for r in rows)==26
    comparison=list(csv.DictReader((OUT/'comparison.csv').open()));assert len(comparison)==43
    summary=read(OUT/'summary.json')
    for suite in ['octane','sunspider']:
        data=[{k:float(v) if k.endswith('_ms') else v for k,v in r.items()} for r in comparison if r['suite']==suite]
        for label in p['labels']:
            assert math.isclose(change(data,label,suite),summary['aggregates'][suite][label]['GM_pct'],abs_tol=1e-10)
    save(HERE/'audit.json',dict(status='PASS',requested_anchor='7c941da',frozen_source_untouched=True,
        independent_parent_and_SPARSE_patches_apply=True,initial_removed_without_changing_plan_try=True,
        original_hot_layout_asserted=True,trace_no_VM_record_or_reference_changes=True,
        detailed_vs_light_distribution_identical=True,correctness_and_ASan_UBSan_pass=True,
        Tree_original_N=256,initial_fresh_processes=21,candidate_fresh_processes=84,
        same_cohort_full_processes=172,fresh_SPARSE_and_P2_cases_each=43,GM_verified=True,
        no_instrumentation_in_timing=True,rotating_schedule_verified=True,
        artifacts={n:sha(OUT/n) for n in ['runs.jsonl','comparison.csv','summary.json','protocol.json']},
        patches={p.name:sha(p) for p in sorted((HERE/'patches').glob('*.patch'))}))
    print('AUDIT_PASS: independent patches; 21 + 84 targeted and 172 full Release processes',flush=True)


if __name__=='__main__':main()
