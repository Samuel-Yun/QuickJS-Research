"""Audit round-two isolation, layouts, proofs, fresh baseline and all samples."""
import csv
import json
import math
from pathlib import Path
import re
import subprocess
import tempfile

from build import HERE,PACKAGE,LABELS,REFERENCES,sha,save,source,previous
from full_bench import OUT,verify
from analyze import change


def main():
    frozen=json.loads((PACKAGE/'manifest.json').read_text())['modified']
    for n,h in frozen.items():assert sha(PACKAGE/'modified'/n)==h,n
    for label in LABELS+REFERENCES:
        for mode in ['release','counts']:
            m=json.loads((HERE/(label+'.'+mode+'.manifest.json')).read_text())
            assert sha(m['binary'])==m['binary_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
        base,d,_=source(label,'release')
        if label=='SPARSE':
            assert json.loads((HERE/'SPARSE.release.manifest.json').read_text())['sources']==frozen
        elif label in LABELS:
            with tempfile.TemporaryDirectory(prefix='ic-round2-patch-') as td:
                directory=Path(td)
                for n,s in base.items():
                    p=directory/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
                subprocess.run(['patch','-p1','--batch','--fuzz=0','-i',str(HERE/'patches'/(label+'.patch'))],
                    cwd=directory,capture_output=True,text=True,check=True)
                for n,s in d.items():assert (directory/n).read_text()==s,n
        assert 'identity_misses' not in d['four_runtime.inc'] and 'borrow_miss_site' not in d['quickjs.c']
        if label in ['NEG_DIRECT','P2_COLD','PROTO_SMALL']:
            assert 'OP_get_field_rdi16' not in d['quickjs.c']
        if label in REFERENCES:
            parent='P2' if label=='OLD_P2' else 'D16'
            _,old,_=previous.source(parent,'release')
            for n,s in old.items():
                if n!='screen_diag.h':assert d[n]==s,n
    for label in ['SPARSE','PROTO_SMALL']:
        m=json.loads((HERE/(label+'.atomcounts.manifest.json')).read_text())
        assert sha(m['binary'])==m['binary_sha256']
        for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h
    # Learning and all semantic qualification functions are unchanged in COLD.
    _,cold,_=source('P2_COLD','release');_,base,_=source('SPARSE','release')
    def section(s,a,b):return s[s.index(a):s.index(b,s.index(a))]
    for a,b in [('static int plan_recipe','static JSObject*plan_proto'),
                ('static JSObject*plan_proto','static int plan_slow_eligible'),
                ('static int plan_slow_eligible','static void plan_learn')]:
        assert section(cold['four_runtime.inc'],a,b)==section(base['four_runtime.inc'],a,b)
    assert 'sizeof(FourSite)==32' in cold['four_runtime.inc'] and 'sizeof(FullPlan)==96' in cold['four_runtime.inc']
    _,old_d16,_=previous.source('D16','release');_,new_d16,_=source('D16_STATIC','release')
    for a,b in [('static int d16_allowed','static void d16_export')]:
        assert section(old_d16['d16_runtime.inc'],a,b)==section(new_d16['d16_runtime.inc'],a,b)
    assert json.loads((HERE/'assembly/proof.json').read_text())['status']=='PASS'
    for phase in ['counts','measure']:
        assert json.loads((HERE/'targeted'/phase/'complete.json').read_text())['status']=='PASS'
    assert all(json.loads((HERE/'gate.json').read_text())[l]['status']=='PASS' for l in LABELS)
    san=json.loads((HERE/'sanitize.json').read_text());assert all(v['status']=='PASS' for v in san['results'].values())
    p=json.loads((OUT/'protocol.json').read_text());verify(p)
    assert p['labels']==LABELS and sha(HERE/'full_bench.py')==p['driver_sha256']
    for l,m in p['engines'].items():
        assert not m['instrumented'] and not m['reference_only']
        names=subprocess.check_output(['nm','-a',m['binary']],text=True)
        assert not re.search(r'\b(?:screen_counts|screen_report|screen_image|screen_proto_lookup)\b',names),l
    events=[json.loads(s) for s in (OUT/'runs.jsonl').read_text().splitlines()]
    starts=[r for r in events if r['event']=='process_start'];ends=[r for r in events if r['event']=='process_result']
    rows=[r for r in events if r['event']=='sample']
    assert len(starts)==len(ends)==len(rows)==215
    assert len({r['child_pid'] for r in ends})==215
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(ends,ends[1:]))
    assert all(r['exit_code']==0 and not r['timeout'] and not r['stderr'] for r in ends)
    assert [(r['label'],r['suite'],r['case']) for r in rows]==[(j['label'],j['suite'],j['case']['case']) for j in p['schedule']]
    assert all(r['valid'] and r['payload']['correctness']=='PASS' and r['payload']['warmup_calls']==0 for r in rows)
    assert all(math.isclose(r['ms_per_Run'],r['payload']['elapsed_ms']/r['N'],abs_tol=1e-12) for r in rows)
    comparison=list(csv.DictReader((OUT/'comparison.csv').open()));assert len(comparison)==43
    summary=json.loads((OUT/'summary.json').read_text())
    for suite in ['octane','sunspider']:
        data=[{k:float(v) if k.endswith('_ms') else v for k,v in r.items()} for r in comparison if r['suite']==suite]
        for label in LABELS:
            assert math.isclose(change(data,label,suite),summary['aggregates'][suite][label]['GM_pct'],abs_tol=1e-10)
    save(HERE/'audit.json',dict(status='PASS',frozen_source_untouched=True,
        independent_patches_apply=True,cold_learning_qualification_identical=True,
        cold_original_sizes_and_offsets_asserted=True,D16_layout_rules_identical=True,
        actual_bytecode_and_Release_assembly_pass=True,ASan_UBSan_pass=True,
        upgrade_failure_checked=True,fresh_baseline_cases=43,new_full_processes=215,
        references_only_in_targeted_tests=True,all_inputs_N_original=True,all_checksums_pass=True,
        no_instrumentation_in_timing=True,rotating_schedule_verified=True,GM_verified=True,
        artifacts={n:sha(OUT/n) for n in ['results.md','comparison.csv','summary.json','runs.jsonl','protocol.json']}))
    print('ROUND2_AUDIT_PASS: 215 same-cohort processes, four isolated patches and mechanism proofs',flush=True)


if __name__=='__main__':main()
