"""Check frozen identity, independent patches, fresh-cohort records and GMs."""
import csv
import json
import math
from pathlib import Path
import re
import subprocess
import tempfile

from build import HERE,PACKAGE,LABELS,sha,save,source
from full_bench import verify,OUT
from analyze import change


def main():
    frozen=json.loads((PACKAGE/'manifest.json').read_text())['modified']
    for n,h in frozen.items():assert sha(PACKAGE/'modified'/n)==h,n
    for label in LABELS:
        for mode in ['release','counts']:
            m=json.loads((HERE/(label+'.'+mode+'.manifest.json')).read_text())
            assert sha(m['binary'])==m['binary_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
        base,d,identity=source(label,'release')
        if label=='SPARSE':
            assert json.loads((HERE/'SPARSE.release.manifest.json').read_text())['sources']==frozen
            continue
        with tempfile.TemporaryDirectory(prefix='ic-screen-patch-') as td:
            target=Path(td)
            for n,s in base.items():
                p=target/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
            r=subprocess.run(['patch','-p1','--batch','--fuzz=0','-i',str(HERE/'patches'/(label+'.patch'))],
                cwd=target,capture_output=True,text=True,check=True)
            for n,s in d.items():assert (target/n).read_text()==s,n
        assert 'identity_misses' not in d['four_runtime.inc'] and 'borrow_miss_site' not in d['quickjs.c']
    multi=[]
    for label in ['P2','P3','P4']:
        _,d,_=source(label,'release')
        d['four_runtime.inc']=re.sub(r'#define CTOR_CAPACITY [234]','#define CTOR_CAPACITY N',d['four_runtime.inc'])
        multi.append(d)
    assert multi[0]==multi[1]==multi[2]
    gates=json.loads((HERE/'gate.json').read_text());assert all(gates[l]['status']=='PASS' for l in LABELS)
    sanitizers=json.loads((HERE/'sanitize.json').read_text())
    assert all(v['status']=='PASS' for v in sanitizers['results'].values())
    assert json.loads((HERE/'mechanisms/complete.json').read_text())['status']=='PASS'
    # Counter-build semantic outputs must also equal the original A outputs.
    gate_raw=[json.loads(l) for l in (HERE/'gate.raw.jsonl').read_text().splitlines()]
    expected={Path(r['command'][1]).stem:r['stdout'] for r in gate_raw if r['name'].startswith('A.')}
    events=[json.loads(l) for l in (HERE/'mechanisms/runs.jsonl').read_text().splitlines()]
    for r in events:
        if r['event']=='process_result' and r['identity']['case'].startswith('gate.'):
            name=r['identity']['case'].split('.')[1];assert r['stdout']==expected[name],name
    p=json.loads((OUT/'protocol.json').read_text());verify(p)
    assert sha(HERE/'full_bench.py')==p['driver_sha256']
    assert p['labels']==LABELS and all(not m['instrumented'] for m in p['engines'].values())
    for l,m in p['engines'].items():
        names=subprocess.check_output(['nm','-a',m['binary']],text=True)
        assert not re.search(r'\b(?:screen_counts|screen_report|screen_image)\b',names),l
    events=[json.loads(l) for l in (OUT/'runs.jsonl').read_text().splitlines()]
    starts=[r for r in events if r['event']=='process_start']
    ends=[r for r in events if r['event']=='process_result']
    samples=[r for r in events if r['event']=='sample']
    assert len(starts)==len(ends)==len(samples)==301
    assert len({r['child_pid'] for r in ends})==301
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(ends,ends[1:]))
    assert all(r['exit_code']==0 and not r['timeout'] and not r['stderr'] for r in ends)
    assert all(r['valid'] and r['payload']['correctness']=='PASS' and r['payload']['warmup_calls']==0 for r in samples)
    actual=[(r['label'],r['suite'],r['case']) for r in samples]
    assert actual==[(j['label'],j['suite'],j['case']['case']) for j in p['schedule']]
    assert all(math.isclose(r['ms_per_Run'],r['payload']['elapsed_ms']/r['N'],abs_tol=1e-12) for r in samples)
    rows=list(csv.DictReader((OUT/'comparison.csv').open()));assert len(rows)==43
    summary=json.loads((OUT/'summary.json').read_text())
    for suite in ['octane','sunspider']:
        data=[{k:float(v) if k.endswith('_ms') else v for k,v in r.items()} for r in rows if r['suite']==suite]
        for label in LABELS:
            assert math.isclose(change(data,label,suite),summary['aggregates'][suite][label]['GM_pct'],abs_tol=1e-10)
    save(HERE/'audit.json',dict(status='PASS',frozen_untouched=True,independent_patches_apply=True,
        multi_candidates_differ_only_in_capacity=True,all_release_semantics_pass=True,
        ASan_UBSan_pass=True,LSan_unavailable=sanitizers['LSan_reason'],
        counter_semantics_equal_A=True,mechanisms_separate_from_timing=True,
        fresh_same_cohort_processes=301,fresh_baseline_cases=43,rotating_order_verified=True,
        all_original_inputs_N_checksums=True,GM_verified=True,
        outputs={n:sha(OUT/n) for n in ['results.md','summary.json','comparison.csv','runs.jsonl','protocol.json']}))
    print('AUDIT_PASS: 7 independent versions, 301 same-cohort fresh processes, all validations and GMs',flush=True)


if __name__=='__main__':main()
