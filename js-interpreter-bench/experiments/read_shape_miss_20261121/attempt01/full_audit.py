"""Audit a single new SKIP_REPROBE pass and the explicitly historical controls."""
import json
import math
from pathlib import Path
import re
import subprocess

from build import HERE,save
from full_bench import sha
from full_bench import OUT,verify
from full_analyze import change

def main():
    protocol=json.loads((OUT/'protocol.json').read_text());verify(protocol)
    assert json.loads((OUT/'complete.json').read_text())['status']=='PASS'
    assert not protocol['engine']['instrumented']
    names=subprocess.check_output(['nm','-a',protocol['engine']['elf']],text=True)
    assert not re.search(r'\b(?:sm_counts|sm_record|sm_report|mc_calls|mc_four|four_active|follow_stats)\b',names)
    events=[json.loads(s) for s in (OUT/'runs.jsonl').read_text().splitlines()]
    starts=[r for r in events if r['event']=='process_start']
    procs=[r for r in events if r['event']=='process_result']
    rows=[r for r in events if r['event']=='sample']
    assert len(starts)==len(procs)==len(rows)==43
    assert len({r['child_pid'] for r in procs})==43
    assert all(r['command'][0]==protocol['engine']['elf'] and r['exit_code']==0 and not r['timeout'] and not r['stderr'] for r in procs)
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(procs,procs[1:]))
    assert all(r['valid'] and r['payload']['warmup_calls']==0 and r['payload']['correctness']=='PASS' for r in rows)
    assert [(r['suite'],r['case']) for r in rows]==[(j['suite'],j['case']['case']) for j in protocol['schedule']]
    assert all(math.isclose(r['ms_per_Run'],r['payload']['elapsed_ms']/r['N'],abs_tol=1e-12) for r in rows)
    assert sum(r['suite']=='octane' for r in rows)==17 and sum(r['suite']=='sunspider' for r in rows)==26
    import csv
    comparison=list(csv.DictReader((OUT/'comparison.csv').open()));assert len(comparison)==43
    summary=json.loads((OUT/'summary.json').read_text())
    for suite in ['octane','sunspider']:
        data=[{k:float(v) if k.endswith('_ms') else v for k,v in r.items()} for r in comparison if r['suite']==suite]
        actual=change(data,'SKIP_REPROBE_ms','SPARSE_ms',suite)
        assert math.isclose(actual,summary['aggregates'][suite]['SKIP_REPROBE_vs_SPARSE_pct'],abs_tol=1e-10)
    save(OUT/'audit.json',dict(status='PASS',fresh_new_processes=43,
        newly_measured_versions=['SKIP_REPROBE'],A_new_processes=0,SPARSE_new_processes=0,V8_new_processes=0,
        comparison='跨批次单轮筛选；不是两版同批交错',
        every_case_one_new_process=True,input_and_N_identical_to_original=True,
        all_original_checksums_pass=True,Release_has_no_counters=True,all_samples_retained=True,
        Octane_GM='14 suites equal; subitems within suite geometric mean',SunSpider_GM='26 cases equal',
        source_and_ELF_verified=True,CPU=2,
        artifacts={n:sha(OUT/n) for n in ['comparison.csv','summary.json','table.md','results.md','runs.jsonl','protocol.json']}))
    print('FULL_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
