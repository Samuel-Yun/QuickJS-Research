"""One fresh process per full-suite case for SKIP_REPROBE only; historical SPARSE control."""
import argparse
import importlib.util
import json
import math
import os
from pathlib import Path

from build import HERE,PACKAGE,sha as source_sha,save
ROOT=PACKAGE.parent
def sha(p):return source_sha(Path(p))

OUT=HERE/'full_bench'
TESTS=ROOT/'on_demand_ctor_cache/tests'
OLD=ROOT/'experiments/native_confirmation_20261108/attempt02'
SPARSE=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor'
spec=importlib.util.spec_from_file_location('full_twice_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
v_spec=importlib.util.spec_from_file_location('frozen_case_validator',TESTS/'run.py')
validator=importlib.util.module_from_spec(v_spec);v_spec.loader.exec_module(validator)

def prepare():
    OUT.mkdir(exist_ok=False)
    m=json.loads((HERE/'SKIP_REPROBE.release.manifest.json').read_text())
    m.update(elf=m['binary'],elf_sha256=m['binary_sha256'],instrumented=False)
    assert m['constructor_sources_unchanged'] and not m['instrumented'] and sha(m['elf'])==m['elf_sha256']
    for n,h in m['sources'].items():assert sha(Path(m['elf']).parent/n)==h,n
    assert json.loads((HERE/'audit.json').read_text())['status']=='PASS'
    catalog=json.loads((TESTS/'benchmarks.json').read_text())
    native=json.loads((OLD/'protocol.json').read_text())
    files={str(TESTS/'benchmarks.json'):sha(TESTS/'benchmarks.json'),str(TESTS/'run.py'):sha(TESTS/'run.py')}
    for suite,cases in catalog['cases'].items():
        assert len(cases)==(17 if suite=='octane' else 26)
        for c in cases:
            old=native['scripts'][suite][c['case']]['measure']
            assert old['N']==c['N'] and old['sha256']==c['sha256']==sha(TESTS/c['path'])
            files[str(TESTS/c['path'])]=c['sha256']
    for n,h in catalog['support'].items():assert sha(TESTS/n)==h;files[str(TESTS/n)]=h
    schedule=[]
    # Interleave suites within the sole newly measured engine. No historical
    # control is represented as a new process or as a same-batch measurement.
    for i in range(26):
        for suite in ['octane','sunspider']:
            cases=catalog['cases'][suite]
            if i<len(cases):schedule.append(dict(suite=suite,case=cases[i]))
    references={str(SPARSE/'analysis'/f'{s}.csv'):sha(SPARSE/'analysis'/f'{s}.csv') for s in ['octane','sunspider']}
    protocol=dict(engine=m,CPU=2,TZ='Asia/Shanghai',locale='C',warmup_calls=0,
        first_Run_included=True,processes_per_case=1,new_processes=43,
        only_engine_measured='SKIP_REPROBE',schedule=schedule,input_files=files,
        controls_reused=dict(SPARSE='historical one process per case; original 06aada4 SPARSE'),
        comparison_type='cross-batch single-pass screening; NOT two engines measured in the same cohort',
        reference_files=references,driver_sha256=sha(Path(__file__)),
        correctness_validator='same frozen test harness; original checksums and fixed N',
        failure_policy='preserve failed sample; no automatic retry or extra rounds')
    save(OUT/'protocol.json',protocol)
    return protocol

def verify(protocol):
    m=protocol['engine'];assert sha(m['elf'])==m['elf_sha256']
    for n,h in m['sources'].items():assert sha(Path(m['elf']).parent/n)==h,n
    for n,h in {**protocol['input_files'],**protocol['reference_files']}.items():assert sha(n)==h,n
    assert sha(Path(__file__))==protocol['driver_sha256']

def main():
    parser=argparse.ArgumentParser();parser.add_argument('action',choices=['run']);parser.parse_args()
    os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.sched_setaffinity(0,{2});protocol=prepare();b.H=OUT
    save(OUT/'environment.before.json',b.environment())
    for i,job in enumerate(protocol['schedule']):
        verify(protocol)
        suite,c=job['suite'],job['case'];command=[protocol['engine']['elf']]
        if c['case']=='zlib.zlib':command+=['--std','-I',str(TESTS/'support/zlib_read.js')]
        command.append(str(TESTS/c['path']))
        name=suite+'.'+c['case'];print(f'RUN {i+1}/43 {name}',flush=True)
        result=b.capture(command,'full',name,timeout=600,identity=dict(suite=suite,case=c['case'],
            N=c['N'],elf_sha256=protocol['engine']['elf_sha256'],fresh_process=True))
        row=dict(event='sample',suite=suite,case=c['case'],name=c['name'],group=c['group'],N=c['N'],valid=False)
        try:
            assert result['exit_code']==0 and not result['timeout'] and not result['stderr'],result['stderr'][-2000:]
            prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
            lines=[s[len(prefix):] for s in result['stdout'].splitlines() if s.startswith(prefix)]
            assert len(lines)==1,result['stdout'][-2000:]
            payload=json.loads(lines[0]);value=validator.validate(payload,suite,c)
            assert 0<payload['elapsed_ms']<=result['external_wall_ms']+5
            row.update(valid=True,payload=payload,ms_per_Run=value)
        except Exception as exc:
            row['error']=str(exc);b.append(row);raise
        b.append(row);print(f'PASS {i+1}/43 {name} {value:.6f} ms/Run',flush=True)
    verify(protocol);save(OUT/'environment.after.json',b.environment())
    save(OUT/'complete.json',dict(status='PASS',fresh_processes=43,octane=17,sunspider=26,
        newly_measured_versions=['SKIP_REPROBE'],controls_remeasured=False))
    print('FULL_PASS_COMPLETE',flush=True)
if __name__=='__main__':main()
