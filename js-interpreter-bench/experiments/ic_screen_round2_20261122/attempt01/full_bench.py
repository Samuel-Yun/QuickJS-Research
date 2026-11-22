"""One same-cohort pass, rotating all eligible engines within each case."""
import importlib.util
import json
import os
from pathlib import Path

from build import HERE,ROOT,PACKAGE,LABELS,sha,save

OUT=HERE/'full_bench'
TESTS=PACKAGE/'tests'
NATIVE=ROOT/'experiments/native_confirmation_20261108/attempt02'
spec=importlib.util.spec_from_file_location('screen_capture',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
spec=importlib.util.spec_from_file_location('screen_validator',TESTS/'run.py')
v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)


def verify(protocol):
    for label,m in protocol['engines'].items():
        assert not m['instrumented'] and sha(m['binary'])==m['binary_sha256']
        for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
    for n,h in protocol['inputs'].items():assert sha(n)==h,n


def main():
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.sched_setaffinity(0,{2})
    OUT.mkdir(exist_ok=False);b.H=OUT
    gates=json.loads((HERE/'gate.json').read_text())
    labels=[l for l in LABELS if gates.get(l,{}).get('status')=='PASS']
    assert labels[0]=='SPARSE'
    catalog=json.loads((TESTS/'benchmarks.json').read_text())
    native=json.loads((NATIVE/'protocol.json').read_text())
    inputs={str(TESTS/'benchmarks.json'):sha(TESTS/'benchmarks.json'),str(TESTS/'run.py'):sha(TESTS/'run.py')}
    schedule=[]
    case_index=0
    for i in range(26):
        for suite in ['octane','sunspider']:
            cases=catalog['cases'][suite]
            if i>=len(cases):continue
            c=cases[i];old=native['scripts'][suite][c['case']]['measure']
            assert c['N']==old['N'] and c['sha256']==old['sha256']==sha(TESTS/c['path'])
            inputs[str(TESTS/c['path'])]=c['sha256']
            shift=case_index%len(labels);order=labels[shift:]+labels[:shift]
            for label in order:schedule.append(dict(label=label,suite=suite,case=c))
            case_index+=1
    assert case_index==43
    for n,h in catalog['support'].items():assert sha(TESTS/n)==h;inputs[str(TESTS/n)]=h
    engines={l:json.loads((HERE/(l+'.release.manifest.json')).read_text()) for l in labels}
    protocol=dict(engines=engines,labels=labels,CPU=2,TZ='Asia/Shanghai',locale='C',schedule=schedule,
        inputs=inputs,first_Run_included=True,warmup_calls=0,processes_per_version_per_case=1,
        comparison='same cohort; rotate version order at each case; fresh SPARSE baseline',
        driver_sha256=sha(Path(__file__)),no_automatic_retries=True)
    save(OUT/'protocol.json',protocol);verify(protocol)
    save(OUT/'environment.before.json',b.environment())
    total=len(schedule)
    for i,j in enumerate(schedule):
        verify(protocol)
        label,suite,c=j['label'],j['suite'],j['case'];m=engines[label]
        command=[m['binary']]
        if c['case']=='zlib.zlib':command+=['--std','-I',str(TESTS/'support/zlib_read.js')]
        command.append(str(TESTS/c['path']))
        name=f'{suite}.{c["case"]}.{label}'
        print('RUN',f'{i+1}/{total}',name,flush=True)
        r=b.capture(command,'full',name,timeout=600,identity=dict(label=label,suite=suite,case=c['case'],
            N=c['N'],binary_sha256=m['binary_sha256'],fresh_process=True))
        row=dict(event='sample',label=label,suite=suite,case=c['case'],name=c['name'],group=c['group'],N=c['N'],valid=False)
        try:
            assert r['exit_code']==0 and not r['timeout'] and not r['stderr'],r['stderr'][-2000:]
            prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
            payloads=[json.loads(l[len(prefix):]) for l in r['stdout'].splitlines() if l.startswith(prefix)]
            assert len(payloads)==1
            payload=payloads[0];value=v.validate(payload,suite,c)
            assert 0<payload['elapsed_ms']<=r['external_wall_ms']+5
            row.update(valid=True,payload=payload,ms_per_Run=value)
        except Exception as e:
            row['error']=str(e);b.append(row);raise
        b.append(row);print('PASS',f'{i+1}/{total}',name,f'{value:.6f}',flush=True)
    verify(protocol)
    save(OUT/'environment.after.json',b.environment())
    save(OUT/'complete.json',dict(status='PASS',new_processes=total,labels=labels,octane_cases=17,sunspider_cases=26))
    print('FULL_PASS',total,flush=True)


if __name__=='__main__':main()
