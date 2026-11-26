"""Three patterns and three conditions, with independent diagnostic builds."""
import argparse
import importlib.util
import json
import math
import os
from pathlib import Path

from build import HERE,ROOT,PREV,LABELS,sha,save

PATTERNS=['alternating','all_c','c_then_d']
N=67108864
REPEATS=5
CPU=2
spec=importlib.util.spec_from_file_location('keep_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py')
b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
def manifest(label,mode):return json.loads((HERE/(label+'.'+mode+'.manifest.json')).read_text())
def verify():
    assert (HERE/'ctor.js').read_bytes()==(PREV/'ctor.js').read_bytes()
    def kernel(s):return s[s.index('function ctorLoop('):s.index('\nfunction main()')]
    assert kernel((HERE/'ctor.js').read_text())==kernel((HERE/'switch.js').read_text())
    for label in LABELS:
        for mode in ['release','counts']:
            m=manifest(label,mode);assert sha(m['elf'])==m['elf_sha256']
            for n,h in m['sources'].items():assert sha(Path(m['elf']).parent/n)==h,n
def arguments(pattern,n):
    return [str(HERE/'switch.js'),str(n)] if pattern=='c_then_d' else [str(HERE/'ctor.js'),'positive','0' if pattern=='alternating' else '100',str(n)]

def capture(label,mode,pattern,rep,n,phase):
    m=manifest(label,mode);cmd=[m['elf'],*arguments(pattern,n)]
    name=f'{pattern}.{label}.{mode}.r{rep}'
    r=b.capture(cmd,phase,name,timeout=300,identity=dict(label=label,mode=mode,pattern=pattern,
        iterations=n,rep=rep,binary_sha256=m['elf_sha256']))
    row=dict(event='sample',label=label,mode=mode,pattern=pattern,rep=rep,iterations=n,valid=False)
    try:
        assert r['exit_code']==0 and not r['timeout'],r
        v=json.loads(r['stdout']);assert v['iterations']==n and v['checksum']==3*n and v['warmup_calls']==0
        assert math.isfinite(v['elapsed_ms']) and v['elapsed_ms']>0
        if pattern=='c_then_d':assert math.isclose(v['C_ms']+v['D_ms'],v['elapsed_ms'],abs_tol=1e-6)
        row.update(payload=v,elapsed_ms=v['elapsed_ms'])
        if mode=='counts':
            prefix='CTOR_MISS_COUNTS:';assert r['stderr'].startswith(prefix),r['stderr']
            c=json.loads(r['stderr'][len(prefix):]);row['counts']=c
            assert c['total_calls']==n==sum(c['phase_calls'])
            assert c['site_count']==1 and c['argc']==2 and c['pc']==18
            assert c['four'][1]+c['normal_constructions']==n
            assert c['four'][0]+c['identity_bypasses']==n if label!='BYPASS' else c['four'][0]==0
            if label=='BYPASS':assert c['four'][1]==c['four'][3]==0 and c['normal_constructions']==n
            if label=='KEEP_PLAN':assert c['four'][3]==1
            if pattern=='all_c':
                assert c['phase_calls']==[n,0]
                if label!='BYPASS':assert c['four'][1]>=n-2
            else:assert c['phase_calls']==[n//2,n//2]
        else:assert not r['stderr'],r['stderr']
        row['valid']=True
    except Exception as exc:
        row['error']=str(exc);b.append(row);raise
    b.append(row)
    info=round(row['elapsed_ms'],3)
    if mode=='counts':
        c=row['counts'];info=dict(calls=c['total_calls'],hits=c['four'][1],updates=c['four'][3],identity_bypasses=c['identity_bypasses'],normal=c['normal_constructions'])
    print(phase,name,info,flush=True)
    return row

def main():
    parser=argparse.ArgumentParser();parser.add_argument('phase',choices=['gate','counts','measure']);args=parser.parse_args()
    verify();os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C',CTOR_PROBE_FUNCTION='ctorLoop')
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.sched_setaffinity(0,{CPU})
    out=HERE/'raw'/args.phase;out.mkdir(parents=True,exist_ok=False);b.H=out
    save(out/'environment.before.json',b.environment())
    schedule=[]
    if args.phase=='gate':
        for pattern in PATTERNS:
            for label in LABELS:
                for mode in ['release','counts']:schedule.append(dict(pattern=pattern,label=label,mode=mode,rep=0,n=65536))
    elif args.phase=='counts':
        schedule=[dict(pattern=p,label=l,mode='counts',rep=0,n=N) for p in PATTERNS for l in LABELS]
    else:
        for rep in range(REPEATS):
            for pi,pattern in enumerate(PATTERNS):
                start=(rep+pi)%3;order=LABELS[start:]+LABELS[:start]
                if rep%2:order=order[::-1]
                for label in order:schedule.append(dict(pattern=pattern,label=label,mode='release',rep=rep+1,n=N))
    save(out/'protocol.json',dict(schedule=schedule,CPU=CPU,TZ='Asia/Shanghai',locale='C',warmup_calls=0,
        first_Run_included=True,total_iterations=N,phase_iterations=N//2,
        builds={l:{m:manifest(l,m) for m in ['release','counts']} for l in LABELS},
        frozen={str(p):sha(p) for p in [Path(__file__),HERE/'ctor.js',HERE/'switch.js']},
        release_samples_reused=False,previous_Release_binaries_reused=True,
        counter_times_used=False,full_benchmarks=False,failure_policy='preserve failure; no automatic retry'))
    if args.phase=='gate':
        outputs=[]
        for label in LABELS:
            m=manifest(label,'release')
            r=b.capture([m['elf'],HERE/'semantics.js'],'gate','semantics.'+label,timeout=120)
            assert r['exit_code']==0 and not r['stderr'],r;outputs.append(r['stdout'])
        assert len(set(outputs))==1
    else:assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
    for job in schedule:capture(**job,phase=args.phase)
    verify();save(out/'environment.after.json',b.environment())
    if args.phase=='gate':save(HERE/'gate.json',dict(status='PASS',semantic_outputs_equal=True,short_cases=len(schedule),same_static_new_site=True))
    print('PHASE_PASS',args.phase,flush=True)
if __name__=='__main__':main()
