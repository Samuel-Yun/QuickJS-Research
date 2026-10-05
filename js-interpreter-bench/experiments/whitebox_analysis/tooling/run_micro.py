"""Write-once derived correctness/calibration/formal campaign; safe resume."""
import argparse, itertools, json, math, random, re
from pathlib import Path
import common as c

VARIANTS={'richards_fields':('richards','Array','richards_fields.js'),
          'richards_cached':('richards','Array','richards_cached.js'),
          'navier_array':('navier','Array','navier_kernel.js'),
          'navier_f64':('navier','Float64Array','navier_kernel.js')}
REPS=30;SEED=20261005;TARGET=1000;MAX_N=1048576

def inputs():
    files=[Path(__file__),c.BASE/'tooling/common.py',c.BASE/'tooling/oracle.c',
           c.ATTEMPT/'manifest.json',c.ATTEMPT/'protocol.md']+list((c.ATTEMPT/'microbench').glob('*.js'))
    return {str(p.relative_to(c.ROOT)):c.sha(p) for p in sorted(files)}

def freeze():
    path=c.ATTEMPT/'microbench/design.json'
    if path.exists():
        m=c.read(path)
        if m['inputs']!=inputs():raise RuntimeError('frozen design/tooling changed; new attempt needed')
        return m
    m={'mode':c.MODE,'timestamp_utc':c.stamp(),'variants':VARIANTS,'inputs':inputs(),
       'seed':SEED,'target_ms':TARGET,'max_N':MAX_N,'timeout_seconds':180,'reps':REPS,
       'metric':'first-call-inclusive interpreter-mode execution, derived workload',
       'frontend_excluded':None,'warmup_calls':0,'clock':'benchNow; frozen adapters',
       'clock_tolerance_ms':5,'statistics':'median/mean/sample stddev/Tukey halves IQR/min/max; ratios of medians'}
    c.save(path,m);return m

def expected(group,n):
    if group=='richards':return (n*163840)&0xffffffff
    binary=c.ATTEMPT/'microbench/oracle'
    if not binary.exists():
        r=c.capture('oracle.build',['gcc','-O2','-Wall','-ffp-contract=off',str(c.BASE/'tooling/oracle.c'),'-lm','-o',str(binary)])
        if r['exit_code']!=0:raise RuntimeError('independent oracle build failed')
        c.save(c.ATTEMPT/'microbench/oracle_manifest.json',{'binary_sha256':c.sha(binary),'source_sha256':c.sha(c.BASE/'tooling/oracle.c'),'command':r['command']})
    r=c.capture('oracle.N'+str(n),[str(binary),str(n)],180)
    if r['exit_code']!=0:raise RuntimeError('oracle failed')
    return int(r['stdout'].strip())

def script(variant,n):
    group,array,kernel=VARIANTS[variant]
    cfg={'variant':variant,'group':group,'N':n,'expected':expected(group,n)}
    text=(c.ATTEMPT/'microbench/driver.js').read_text().replace('__CONFIG__',json.dumps(cfg,separators=(',',':')))
    text=text.replace('__ARRAY__',array).replace('__KERNEL__',(c.ATTEMPT/'microbench'/kernel).read_text())
    path=c.ATTEMPT/'microbench/generated'/f'{variant}.N{n}.js';c.save(path,text);return path,cfg

def invoke(stage,variant,e,n,rep=0,order=0,permutation=(),index=0):
    design=freeze();path,cfg=script(variant,n)
    key=f'{stage}.{variant}.N{n}.rep{rep}.{e}.order{order}'
    record=c.ATTEMPT/'raw/records'/stage/(key+'.json')
    cmd=c.command(e,path)
    if record.exists():
        r=c.read(record)
        if not r['valid'] or r['design_sha256']!=c.sha(c.ATTEMPT/'microbench/design.json') or r['script_sha256']!=c.sha(path) or r['command']!=cmd:
            raise RuntimeError('existing failed/mismatched position retained; diagnose before recovery '+str(record))
        return r
    r=c.capture('sample.'+key,cmd,180)
    errors=[];payload=None
    matches=re.findall(r'^WB_RESULT:(.*)$',r['stdout'],re.M)
    if r['exit_code']!=0:errors.append('exit_code')
    if len(matches)!=1:errors.append('missing/nonunique result')
    else:
        try:payload=json.loads(matches[0])
        except (ValueError,TypeError):errors.append('invalid JSON')
    if payload:
        elapsed=payload.get('elapsed_ms')
        if not isinstance(elapsed,(int,float)) or not math.isfinite(elapsed) or elapsed<=0:errors.append('invalid inner interval')
        elif elapsed>r['outer_wall_ns']/1e6+5:errors.append('inner exceeds outer+5ms')
        if payload.get('checksum')!=cfg['expected'] or payload.get('correctness')!='PASS':errors.append('checksum')
        if payload.get('N')!=n or payload.get('variant')!=variant or payload.get('mode')!=c.MODE or payload.get('warmup_calls')!=0:errors.append('contract')
    m=c.manifest()
    r.update(stage=stage,case=VARIANTS[variant][0],variant=variant,engine=e,N=n,rep=rep,order=order,
        permutation=permutation,schedule_index=index,mode=c.MODE,cohort=m['cohort'],
        flags=m['runtime']['engines'][e]['runtime_flags'],binary_sha256=m['runtime']['engines'][e]['binary']['sha256'],
        script_sha256=c.sha(path),adapters=m['adapters'][e],design_sha256=c.sha(c.ATTEMPT/'microbench/design.json'),
        checksum=None if payload is None else payload.get('checksum'),expected_checksum=cfg['expected'],
        payload=payload,elapsed_ms=None if payload is None else payload.get('elapsed_ms'),
        elapsed_per_call_ms=None if payload is None else payload.get('elapsed_ms')/n,
        errors=errors,valid=not errors)
    c.save(record,r)
    print(stage,variant,e,'N='+str(n),'rep='+str(rep),'ms='+str(r['elapsed_ms']),'PASS' if r['valid'] else str(errors),flush=True)
    if errors:raise RuntimeError('affected campaign stopped; raw retained: '+str(record))
    return r

def correctness():
    for v in VARIANTS:
        for n in (1,2):
            for e in c.ENGINES:invoke('correctness',v,e,n)

def calibrate():
    selected={}
    for group in ('richards','navier'):
        vs=[v for v,cfg in VARIANTS.items() if cfg[0]==group]
        n=1
        while n<=MAX_N:
            rows=[invoke('calibration',v,e,n) for v in vs for e in c.ENGINES]
            if all(r['elapsed_ms']>=TARGET for r in rows):
                selected[group]=n;break
            n*=2
        else:raise RuntimeError('N ceiling reached '+group)
    c.save(c.ATTEMPT/'microbench/selected_n.json',selected)
    for v,cfg in VARIANTS.items():
        for e in c.ENGINES:invoke('selected_correctness',v,e,selected[cfg[0]])
    return selected

def schedule(selected):
    rng=random.Random(SEED);perms=list(itertools.permutations(c.ENGINES));jobs=[]
    for v,cfg in VARIANTS.items():
        orderings=perms*5;rng.shuffle(orderings)
        jobs.extend({'variant':v,'rep':rep,'N':selected[cfg[0]],'permutation':list(p)} for rep,p in enumerate(orderings,1))
    rng.shuffle(jobs)
    for ix,j in enumerate(jobs):j['schedule_index']=ix
    c.save(c.ATTEMPT/'microbench/schedule.json',jobs);return jobs

def formal():
    selected=c.read(c.ATTEMPT/'microbench/selected_n.json')
    for v,cfg in VARIANTS.items():
        for e in c.ENGINES:
            p=c.ATTEMPT/'raw/records/selected_correctness'/f'selected_correctness.{v}.N{selected[cfg[0]]}.rep0.{e}.order0.json'
            if not p.exists() or not c.read(p)['valid']:raise RuntimeError('selected correctness gate not passed')
    jobs=schedule(selected)
    for j in jobs:
        for pos,e in enumerate(j['permutation'],1):
            invoke('formal',j['variant'],e,j['N'],j['rep'],pos,j['permutation'],j['schedule_index'])
    print('FORMAL_DONE 360/360',flush=True)

def main():
    args=argparse.ArgumentParser();args.add_argument('stage',choices=('prepare','formal','all'))
    stage=args.parse_args().stage
    c.verify(check_preservation=True);freeze()
    if stage in ('prepare','all'):correctness();selected=calibrate();schedule(selected)
    if stage in ('formal','all'):formal()
    c.verify(check_preservation=True)

if __name__=='__main__':main()
