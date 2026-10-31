"""1024 serial processes, frozen quadruples, monotonic endpoints, no retries."""
import argparse,collections,itertools,math,random,re
from common import *
TIMEOUT=300
PILOT=[['A','M','ON','LOOKUP'],['M','LOOKUP','A','ON'],['ON','A','LOOKUP','M']]
def balanced():
    block=[[VERSIONS[(x+k)%4] for x in [0,1,3,2]] for k in range(4)]
    seq=[list(s) for s in itertools.permutations(VERSIONS)]+block+block
    assert len(seq)==32
    positions={v:[sum(s[i]==v for s in seq) for i in range(4)] for v in VERSIONS};assert all(x==[8]*4 for x in positions.values())
    pairs=collections.Counter((a,b) for s in seq for a,b in zip(s,s[1:]));assert len(pairs)==12 and set(pairs.values())=={8}
    return seq,dict(positions=positions,directed_pairs={'/'.join(k):v for k,v in pairs.items()},permutations={'/'.join(k):v for k,v in collections.Counter(tuple(s) for s in seq).items()})
def init():
    m=read(HERE/'manifest.json')
    for p in [HERE/'run.py',HERE/'common.py',HERE/'micros.py',*sorted((HERE/'cases').glob('*.js'))]:m['inputs'][p.relative_to(ROOT).as_posix()]=sha(p)
    save(HERE/'measurement_manifest.json',m);_,balance=balanced();save(HERE/'balance_precheck.json',balance)
    env=mode_env('ON');save(HERE/'base_environment.json',env)
    save(HERE/'protocol.json',dict(campaign=m['campaign'],mode=MODE,cases=CASES,conditions=VERSIONS,repetitions=32,seed=SEED,
      pilot_orders=PILOT,max_N=131072,timeout_seconds=TIMEOUT,first_Run_included=True,warmup_calls=0,
      inside='N original Run calls + original assertions/dynamic compile/GC/builtin/regexp + common driver support',
      outside='source/static compilation, required Setup, validation/TearDown/output/exit; not pure lookup self time',
      schedule='24 permutations once + two cyclic [0,1,3,2] blocks; 8 per position and directed adjacency; shuffled seed20261024',
      comparisons=['LOOKUP/ON','A/M','M/ON','A/ON','A/LOOKUP'],no_GM=True,
      statistics='10000 quadruple-paired ratio-of-medians bootstrap; n-1 sd; Tukey halves quartiles; percentile linear CI; exploratory',
      failures='retain and continue non-clock failures; no retry/removal; timer anomalies BLOCKED_TIMER',
      clock='parent perf_counter_ns and child captured native performance.now, CLOCK_MONOTONIC; UTC date only; 1ms endpoint tolerance',
      base_environment_sha256=sha(HERE/'base_environment.json'),mode_env_key=MODE_KEY,mode_values={v:config(v) for v in VERSIONS},input_hashes=m['inputs']))
    environment('init');print('INITIALIZED',flush=True)
def verify():
    m=verify_runtime();mm=read(HERE/'measurement_manifest.json')
    for p,h in mm['inputs'].items():assert sha(ROOT/p)==h,p
    assert sha(HERE/'base_environment.json')==read(HERE/'protocol.json')['base_environment_sha256']
    return mm
def script(case,n,correctness=False):
    if case in MICRO_CASES:
        from micros import make_script
        return make_script(case,n,correctness)
    suite,bench=case.split('.')
    driver=(HERE/'inputs/driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=case,N=n,phase='correctness' if correctness else 'measure'))).replace('__SUITE__',json.dumps(suite)).replace('__INDEX__','0').replace('__BENCHMARK__',json.dumps(bench)).replace('MAIN_MONOTONIC_V1',MODE)
    parts=[(HERE/'inputs/adapter.js').read_bytes()]+[(ROOT/'benchmarks/octane/upstream'/p).read_bytes() for p in ['base.js',*FILES[suite]]]
    path=HERE/'generated'/f'{case}.N{n}.{"check" if correctness else "measure"}.js';save(path,b'\n;\n'.join(parts)+b'\n;\n'+driver.encode());return path
def invoke(stage,c,v,n,rep,pos):
    m=read(HERE/'measurement_manifest.json');a=m['artifacts'][v];stem=HERE/'raw'/stage/c/f'rep{rep}.N{n}.{v}.pos{pos}';record=Path(str(stem)+'.json')
    if record.exists():return read(record)
    path=script(c,n,stage in ['correctness','selected_correctness']);assert sha(a['path'])==a['sha256']
    e=read(HERE/'base_environment.json');e[MODE_KEY]=config(v);cmd=[a['path'],str(path)]
    r=dict(campaign=m['campaign'],cohort=m['cohort'],mode=MODE,stage=stage,case=c,variant=v,N=n,rep=rep,order=pos,
      command=cmd,cwd=str(ROOT),flags=[],mode_env_key=MODE_KEY,mode_value=e[MODE_KEY],base_environment_sha256=sha(HERE/'base_environment.json'),
      environment_sha256=digest(json.dumps(e,sort_keys=True).encode()),binary_sha256=a['sha256'],script_sha256=sha(path),
      input_hashes_sha256=digest(json.dumps(m['inputs'],sort_keys=True).encode()),source_commit=m['base'],script_relative=path.relative_to(HERE).as_posix(),
      timestamp=stamp(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),valid=False,elapsed_ms=None,elapsed_per_call_ms=None)
    stem.parent.mkdir(parents=True,exist_ok=True)
    with Path(str(stem)+'.stdout').open('xb') as out,Path(str(stem)+'.stderr').open('xb') as err:
        start=time.perf_counter_ns();r['outer_start_ns']=start
        try:p=subprocess.run(cmd,cwd=ROOT,stdout=out,stderr=err,env=e,timeout=TIMEOUT);r.update(exit_code=p.returncode,timeout=False)
        except subprocess.TimeoutExpired:r.update(exit_code=None,timeout=True)
    stop=time.perf_counter_ns();r.update(outer_stop_ns=stop,outer_wall_ns=stop-start,stdout=Path(str(stem)+'.stdout').read_text(errors='replace'),stderr=Path(str(stem)+'.stderr').read_text(errors='replace'))
    clock=False
    try:
        found=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M);assert not r['timeout'] and r['exit_code']==0 and not r['stderr'] and len(found)==1
        p=json.loads(found[0]);assert p['case']==c and p['N']==n and p['mode']==MODE and p['correctness']=='PASS' and p['warmup_calls']==0;r['payload']=p
        if stage not in ['correctness','selected_correctness']:
            clock=True;t=p['elapsed_ms'];assert math.isfinite(t) and t>0 and p['stop_ms']-p['start_ms']==t
            assert start/1e6-1<=p['start_ms']<p['stop_ms']<=stop/1e6+1;r.update(elapsed_ms=t,elapsed_per_call_ms=t/n)
        r['valid']=True
    except (AssertionError,ValueError,KeyError,TypeError):r['error']='TIMEOUT' if r['timeout'] else 'TIMER' if clock else 'EXIT_STDERR_PAYLOAD'
    save(record,r);print(stage,c,v,n,'PASS' if r['valid'] else r.get('error'),r['elapsed_ms'],flush=True)
    if r.get('error')=='TIMER':save(HERE/'BLOCKED_TIMER.json',dict(status='BLOCKED_TIMER',record=r));raise RuntimeError('timer anomaly')
    return r
def correctness():
    verify();assert read(HERE/'correctness/gate.json')['status']=='PASS';rows=[]
    for c in CASES:
        for n in [1,2]:
            for pos,v in enumerate(VERSIONS):
                r=invoke('correctness',c,v,n,n,pos);rows.append(dict(case=c,variant=v,N=n,valid=r['valid'],exit_code=r['exit_code']))
    csvout(HERE/'correctness/workloads.csv',rows);assert len(rows)==64 and all(r['valid'] for r in rows)
def calibrate():
    verify();assert (HERE/'correctness/workloads.csv').exists()
    for c in CASES:
        target=HERE/'selected'/f'{c}.json'
        if target.exists():continue
        n=read(PREVIOUS/'selected'/f'{c}.json')['N']
        while n<=131072:
            rr=[invoke('calibration',c,v,n,0,pos) for pos,v in enumerate(VERSIONS)];assert all(r['valid'] for r in rr)
            if min(r['elapsed_ms'] for r in rr)>=1000:
                pilot=[invoke('pilot',c,v,n,rep,pos) for rep,seq in enumerate(PILOT) for pos,v in enumerate(seq)];assert all(r['valid'] for r in pilot)
                if min(r['elapsed_ms'] for r in pilot)>=1000:
                    cc=[invoke('selected_correctness',c,v,n,0,pos) for pos,v in enumerate(VERSIONS)];assert all(r['valid'] for r in cc)
                    save(target,dict(case=c,N=n,pilot_ms=[r['elapsed_ms'] for r in pilot]));break
            n*=2
        else:raise RuntimeError('CALIBRATION_LIMIT '+c)
    rng=random.Random(SEED);base,_=balanced();orders={c:base.copy() for c in CASES}
    for seq in orders.values():rng.shuffle(seq)
    schedule=[]
    for rep in range(32):
        cs=CASES.copy();rng.shuffle(cs)
        for c in cs:
            for pos,v in enumerate(orders[c][rep]):schedule.append(dict(index=len(schedule),case=c,N=read(HERE/'selected'/f'{c}.json')['N'],rep=rep,order=pos,variant=v))
    save(HERE/'schedule.json',schedule);save(HERE/'script_hashes.json',{c:sha(script(c,read(HERE/'selected'/f'{c}.json')['N'])) for c in CASES})
    save(HERE/'frozen.json',dict(protocol_sha256=sha(HERE/'protocol.json'),manifest_sha256=sha(HERE/'measurement_manifest.json'),schedule_sha256=sha(HERE/'schedule.json'),script_hashes_sha256=sha(HERE/'script_hashes.json'),selected={p.name:sha(p) for p in sorted((HERE/'selected').glob('*.json'))},frozen_at=stamp()))
    environment('post_pilot');print('PILOT_FROZEN',flush=True)
def formal():
    verify();f=read(HERE/'frozen.json')
    for k,p in [('protocol_sha256','protocol.json'),('manifest_sha256','measurement_manifest.json'),('schedule_sha256','schedule.json'),('script_hashes_sha256','script_hashes.json')]:assert sha(HERE/p)==f[k]
    for name,h in f['selected'].items():assert sha(HERE/'selected'/name)==h
    for name in ['gate','mechanism_gate','timer_gate']:assert read(HERE/'correctness'/f'{name}.json')['status']=='PASS'
    assert read(HERE/'machinecode/gate.json')['status']=='PASS'
    assert not any(x in ['cc1','cc1plus'] for x in subprocess.run(['ps','-eo','comm'],capture_output=True,text=True).stdout.splitlines())
    environment('pre_formal' if not (HERE/'raw/environment/pre_formal.json').exists() else 'resume_'+str(time.time_ns()));last=0
    for row in read(HERE/'schedule.json'):
        r=invoke('formal',row['case'],row['variant'],row['N'],row['rep'],row['order']);assert r['outer_start_ns']>=last;last=r['outer_stop_ns']
    verify();environment('post_formal');print('FORMAL_COMPLETE',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['init','correctness','calibrate','formal']);a=p.parse_args();globals()[a.stage]()
