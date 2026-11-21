"""One controlled C/D alternating-new experiment; no benchmark suites."""
import argparse
import importlib.util
import json
import math
import os
from pathlib import Path

from build import HERE,ROOT,PARENT,sha,save

N=67108864
REPEATS=5
CPU=2
spec=importlib.util.spec_from_file_location('miss_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)

def manifest(label):return json.loads((HERE/(label+'.manifest.json')).read_text())
def verify():
    old=ROOT/'experiments/sparse_whitebox_20261116/attempt01/ctor.js'
    assert (HERE/'ctor.js').read_bytes()==old.read_bytes()
    for label in ['NORMAL','BYPASS','COUNTS']:
        m=manifest(label);assert sha(m['elf'])==m['elf_sha256']
        for name,h in m['sources'].items():assert sha(Path(m['elf']).parent/name)==h,name

def capture(label,phase,rep,n,rate=0,safety=False):
    m=manifest(label)
    script=PARENT/'safety.js' if safety else HERE/'ctor.js'
    cmd=[m['elf'],str(script),*([] if safety else ['positive',str(rate),str(n)])]
    name=f'{label}.r{rep}.rate{rate}'+('.safety' if safety else '')
    result=b.capture(cmd,phase,name,timeout=300,identity=dict(engine=label,
        binary_sha256=m['elf_sha256'],script_sha256=sha(script),iterations=n,
        target=rate,diagnostic=label=='COUNTS'))
    row=dict(event='sample',label=label,rep=rep,iterations=n,target=rate,safety=safety,valid=False)
    try:
        assert not result['timeout'] and result['exit_code']==0,result
        if safety:
            assert not result['stderr'];row.update(valid=True,stdout=result['stdout'])
        else:
            payload=json.loads(result['stdout'])
            assert payload['mode']=='positive' and payload['target']==rate and payload['iterations']==n
            assert payload['checksum']==3*n and payload['warmup_calls']==0
            assert math.isfinite(payload['elapsed_ms']) and payload['elapsed_ms']>0
            row.update(payload=payload,elapsed_ms=payload['elapsed_ms'],valid=True)
            if label=='COUNTS':
                prefix='CTOR_MISS_COUNTS:'
                assert result['stderr'].startswith(prefix),result['stderr']
                c=json.loads(result['stderr'][len(prefix):]);row['counts']=c
                assert c['four'][0]==n==c['four'][1]+c['four'][4]
                assert c['site_count']==1 and c['argc']==2
                assert c['normal_constructions']==c['four'][4]
                if rate==100:assert c['four'][1]>n*.99
            else:
                assert not result['stderr'],result['stderr']
                if phase=='measure':assert payload['elapsed_ms']>3000
    except Exception as exc:
        row.update(valid=False,error=str(exc));b.append(row);raise
    b.append(row)
    value=row.get('elapsed_ms','safety PASS')
    if label=='COUNTS':
        c=row['counts'];value=dict(queries=c['four'][0],hits=c['four'][1],
            normal=c['normal_constructions'],recipe=sum(c['recipe']))
    print(phase,name,value,flush=True)
    return row

def main():
    parser=argparse.ArgumentParser();parser.add_argument('phase',choices=['gate','measure','counts']);a=parser.parse_args()
    verify()
    os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C',CTOR_PROBE_FUNCTION='ctorLoop')
    assert CPU in os.sched_getaffinity(0)
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.sched_setaffinity(0,{CPU})
    output=HERE/'raw'/a.phase;output.mkdir(parents=True,exist_ok=False);b.H=output
    save(output/'environment.before.json',b.environment())
    protocol=dict(phase=a.phase,CPU=CPU,TZ='Asia/Shanghai',locale='C',iterations=N,
        repeats=REPEATS if a.phase=='measure' else 1,target=0,first_Run_included=True,warmup_calls=0,
        sequence_length=65536,sequence='A,B,A,B,... at the same ctorLoop new C(3,0) site',
        original_script_unchanged=True,script_sha256=sha(HERE/'ctor.js'),
        scope='only positive alternating constructors; no full suites',
        diagnostics_used_as_timing=False,
        builds={k:manifest(k) for k in ['NORMAL','BYPASS','COUNTS']},
        driver_sha256=sha(Path(__file__)),failure_policy='preserve failure; no automatic retries')
    if a.phase=='measure':protocol['schedule']=[dict(rep=i+1,label=k) for i in range(REPEATS) for k in (['NORMAL','BYPASS'] if i%2==0 else ['BYPASS','NORMAL'])]
    save(output/'protocol.json',protocol)
    if a.phase=='gate':
        safety=[capture(k,a.phase,0,0,safety=True)['stdout'] for k in ['NORMAL','BYPASS']]
        assert len(set(safety))==1
        for rate in [0,100]:
            for label in ['NORMAL','BYPASS','COUNTS']:capture(label,a.phase,0,65536,rate)
        save(HERE/'gate.json',dict(status='PASS',safety_outputs_equal=True,
            input_script_unchanged=True,counter_scope_single_site=True,short_rate100_hits_verified=True))
    else:
        assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
        if a.phase=='counts':capture('COUNTS',a.phase,1,N)
        else:
            for job in protocol['schedule']:capture(job['label'],a.phase,job['rep'],N)
    verify()
    save(output/'environment.after.json',b.environment())
    print('PHASE_PASS',a.phase,flush=True)
if __name__=='__main__':main()
