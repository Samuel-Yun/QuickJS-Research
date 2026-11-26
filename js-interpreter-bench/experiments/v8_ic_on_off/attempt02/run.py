"""Three cases/conditions, fixed workload and append-only fresh-process samples."""
import argparse,itertools,random
from common import *
ADAPTER='''// Native clock captured before benchmark loading; identical across conditions.
;(function(){
  var object=performance, method=performance.now;
  if(typeof method!=="function")throw Error("native performance.now missing");
  Object.defineProperty(globalThis,"__icSwitchNow",{value:method.bind(object)});
})();
'''
def script(case,n):
    assert case in CASES and 1<=n<=131072
    if case=='Richards':
        body=b'\n;\n'.join((HERE/'cases/octane'/s).read_bytes() for s in ['base.js','richards.js'])
        setup='var suite=BenchmarkSuite.suites[0],test=suite.benchmarks[0];if(test.run!==runRichards)throw Error("Run identity");BenchmarkSuite.ResetRNG();test.Setup();var run=test.run;'
        sumstep='';validate='test.TearDown();';checksum='null'
    else:
        name='M1.own_integer.js' if case=='own_integer' else 'M4.numeric_control.js'
        body=(HERE/'cases'/name).read_bytes();setup='var run=microRun;';sumstep='checksum+=last;'
        expected=12288 if case=='own_integer' else 8386560
        validate=f'microValidate(last);if(checksum!==count*{expected})throw Error("checksum");';checksum='checksum'
    driver='''
;(function(){
  var count=__N__,last,checksum=0;__SETUP__
  var now=__icSwitchNow;
  var start=now();
  for(var iteration=0;iteration<count;iteration++){last=run();__SUM__}
  var stop=now();
  __VALIDATE__
  console.log("IC_SWITCH_RESULT:"+JSON.stringify({case:__CASE__,N:count,mode:__MODE__,
    start_ms:start,stop_ms:stop,elapsed_ms:stop-start,elapsed_per_Run_ms:(stop-start)/count,
    checksum:__CHECKSUM__,correctness:"PASS",warmup_calls:0}));
})();
'''
    for key,value in dict(N=str(n),SETUP=setup,SUM=sumstep,VALIDATE=validate,CASE=json.dumps(case),MODE=json.dumps(MODE),CHECKSUM=checksum).items():driver=driver.replace('__'+key+'__',value)
    path=HERE/'scripts'/case/f'N{n}.js';save(path,ADAPTER.encode()+body+driver.encode());return path

def verify_frozen():
    m=verify_runtime()
    if (HERE/'frozen.json').exists():
        f=read(HERE/'frozen.json')
        for p,h in f['files'].items():assert sha(HERE/p)==h,'frozen input changed '+p
    return m

def invoke(stage,case,c,n,rep,order,index=None):
    dest=HERE/'raw'/stage/case/f'N{n}.rep{rep:02d}.pos{order}.{c}.json'
    if dest.exists():
        r=read(dest);assert r['valid'],'previous failed position must not be retried';return r
    p=script(case,n);m=read(HERE/'runtime.json');binary=m['quickjs']['binary'] if c==CONDITIONS[0] else m['v8']['binary']
    cmd=prefixes()[c]+[str(p)];assert environment()==read(HERE/'environment.json')
    r=dict(cohort=m['cohort'],mode=MODE,stage=stage,case=case,condition=c,N=n,rep=rep,order=order,schedule_index=index,
        command=cmd,flags=cmd[1:-1],cwd=str(ROOT),environment_sha256=sha(HERE/'environment.json'),
        binary_sha256=binary['sha256'],data_dependencies=m['v8']['dependencies'] if c!=CONDITIONS[0] else [],
        script_sha256=sha(p),script_relative=p.relative_to(HERE).as_posix(),input_manifest_sha256=sha(HERE/'inputs.json'),
        timestamp=stamp(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),affinity=sorted(os.sched_getaffinity(0)),
        valid=False,elapsed_ms=None,elapsed_per_Run_ms=None,checksum=None,failed_reason=None)
    reserve=HERE/'raw/started'/stage/case/dest.name
    assert not reserve.exists(),'interrupted started position; retain it, do not auto retry'
    save(reserve,dict(command=cmd,timestamp=r['timestamp'],script_sha256=r['script_sha256']))
    start=time.perf_counter_ns()
    try:
        x=subprocess.run(cmd,cwd=ROOT,env=environment(),capture_output=True,text=True,timeout=60)
        r.update(exit_code=x.returncode,stdout=x.stdout,stderr=x.stderr,timeout=False)
    except subprocess.TimeoutExpired as x:
        def text(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        r.update(exit_code=None,stdout=text(x.stdout),stderr=text(x.stderr),timeout=True)
    stop=time.perf_counter_ns();r.update(outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,completed_at=stamp())
    try:
        assert r['exit_code']==0 and not r['stderr'],'process exit/stderr/timeout'
        rows=re.findall(r'^IC_SWITCH_RESULT:(.*)$',r['stdout'],re.M);assert len(rows)==1,'payload count'
        payload=json.loads(rows[0]);r['payload']=payload
        assert payload['case']==case and payload['N']==n and payload['mode']==MODE and payload['correctness']=='PASS' and payload['warmup_calls']==0,'payload identity/correctness'
        if case!='Richards':assert payload['checksum']==n*(12288 if case=='own_integer' else 8386560),'checksum'
        a,b,e=(payload[k] for k in ['start_ms','stop_ms','elapsed_ms'])
        assert all(math.isfinite(v) for v in [a,b,e]) and e==b-a and e>=0,'timer arithmetic'
        assert e<=(stop-start)/1e6+5,'duration enclosure'
        if stage in ['pilot','formal','selected_correctness']:assert e>0,'zero timed duration'
        r.update(valid=True,elapsed_ms=e,elapsed_per_Run_ms=e/n,checksum=payload['checksum'],timer_duration_enclosed=True,parent_child_absolute_origin_verified=False)
    except (AssertionError,ValueError,KeyError,TypeError) as error:r['failed_reason']=str(error)
    save(dest,r)
    print(f'{stage} {case} {c} N={n} rep={rep} pos={order} '+('PASS' if r['valid'] else 'FAIL')+f' internal_ms={r["elapsed_ms"]}',flush=True)
    if not r['valid']:raise RuntimeError('new process/correctness/timer failure; preserved at '+str(dest))
    return r

def correctness():
    verify_runtime();assert read(HERE/'gate.json')['status']=='PASS_WITH_OBSERVABILITY_LIMITATION'
    rows=[]
    for case in CASES:
        for n in [1,2]:
            for pos,c in enumerate(CONDITIONS):rows.append(invoke('correctness',case,c,n,n,pos))
    csvout(HERE/'correctness.csv',[{k:r[k] for k in ['case','condition','N','valid','exit_code','checksum','script_sha256']} for r in rows])
    clock=HERE/'probes/clock.js';save(clock,ADAPTER+'''
var now=__icSwitchNow,start=now(),last=start;
for(var i=0;i<10000;i++){var next=now();if(next<last)throw Error("nonmonotonic");last=next;}
var stop=now();console.log("CLOCK:"+JSON.stringify({start_ms:start,stop_ms:stop,elapsed_ms:stop-start,calls:10002}));
''')
    clocks=[]
    for c in CONDITIONS:
        r=capture(HERE/'raw/capability'/('clock_'+c+'.json'),prefixes()[c]+[str(clock)]);assert r['exit_code']==0 and not r['stderr']
        p=json.loads(re.findall(r'^CLOCK:(.*)$',r['stdout'],re.M)[0]);assert 0<=p['elapsed_ms']<=(r['outer_stop_ns']-r['outer_start_ns'])/1e6+5 and p['elapsed_ms']==p['stop_ms']-p['start_ms']
        clocks.append(dict(condition=c,monotonic_check_passed=True,duration_enclosure=True,parent_child_absolute_origin_verified=False,performance_sample=False))
    save(HERE/'correctness_gate.json',dict(status='PASS',valid=18,expected=18,clock_checks=clocks))
    files=['protocol_amendment.md','protocol.json','source_notes.md','source_verification.json','gate.json','runtime.json','inputs.json','environment.json','common.py','prepare.py','run.py','correctness_gate.json']
    paths=[HERE/f for f in files]+list((HERE/'cases').rglob('*'))
    save(HERE/'pre_pilot_freeze.json',dict(timestamp=stamp(),files={p.relative_to(HERE).as_posix():sha(p) for p in sorted(paths,key=lambda p:p.as_posix()) if p.is_file()}))
    print('CORRECTNESS_18_AND_CLOCK_3_PASS',flush=True)

def check_budget():
    p=HERE/'campaign_clock.json'
    boot=Path('/proc/sys/kernel/random/boot_id').read_text().strip()
    if not p.exists():save(p,dict(start_ns=time.perf_counter_ns(),boot_id=boot,start_UTC=stamp(),limit_seconds=7200))
    t=read(p);assert t['boot_id']==boot,'WSL boot changed; monotonic campaign budget cannot be joined'
    assert (time.perf_counter_ns()-t['start_ns'])/1e9<7200,'PILOT_FORMAL_BUDGET_EXHAUSTED'

def calibrate():
    verify_runtime();assert read(HERE/'correctness_gate.json')['status']=='PASS'
    for p,h in read(HERE/'pre_pilot_freeze.json')['files'].items():assert sha(HERE/p)==h
    initial=read(HERE/'protocol.json')['initial_N']
    for case in CASES:
        selected=HERE/'selected'/f'{case}.json'
        if selected.exists():continue
        n=initial[case]
        while n<=131072:
            rows=[]
            for rep in range(3):
                order=CONDITIONS[rep:]+CONDITIONS[:rep]
                for pos,c in enumerate(order):
                    check_budget();rows.append(invoke('pilot',case,c,n,rep,pos))
            if min(r['elapsed_ms'] for r in rows)>=1000:
                save(selected,dict(case=case,N=n,pilot_records=9,minimum_ms=min(r['elapsed_ms'] for r in rows),all_pilot_ms=[dict(condition=r['condition'],rep=r['rep'],elapsed_ms=r['elapsed_ms']) for r in rows]));break
            n*=2
        else:raise RuntimeError('MAX_N '+case)
    # Independent repeated-call correctness at frozen N, not warmup in formal processes.
    for case in CASES:
        n=read(HERE/'selected'/f'{case}.json')['N']
        for pos,c in enumerate(CONDITIONS):check_budget();invoke('selected_correctness',case,c,n,0,pos)
    rng=random.Random(SEED);orders={c:list(itertools.permutations(CONDITIONS))*5 for c in CASES}
    for c in CASES:rng.shuffle(orders[c])
    schedule=[]
    for rep in range(30):
        cases=CASES.copy();rng.shuffle(cases)
        for case in cases:
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,rep=rep,order=pos,N=read(HERE/'selected'/f'{case}.json')['N']))
    assert len(schedule)==270;save(HERE/'schedule.json',schedule)
    files=read(HERE/'pre_pilot_freeze.json')['files']
    files.update({'schedule.json':sha(HERE/'schedule.json')})
    for case in CASES:
        p=HERE/'selected'/f'{case}.json';files[p.relative_to(HERE).as_posix()]=sha(p)
        p=script(case,read(p)['N']);files[p.relative_to(HERE).as_posix()]=sha(p)
    save(HERE/'frozen.json',dict(timestamp=stamp(),files=files,formal_target=270,formal_scripts={case:dict(path=script(case,read(HERE/'selected'/f'{case}.json')['N']).relative_to(HERE).as_posix(),sha256=sha(script(case,read(HERE/'selected'/f'{case}.json')['N']))) for case in CASES},seed=SEED))
    print('COMMON_N_AND_270_POSITIONS_FROZEN',flush=True)

def formal():
    verify_frozen()
    for s in read(HERE/'schedule.json'):
        check_budget();invoke('formal',s['case'],s['condition'],s['N'],s['rep'],s['order'],s['index'])
        if (s['index']+1)%9==0:print(f'FORMAL_PROGRESS {s["index"]+1}/270',flush=True)
    verify_frozen();m=verify_runtime()
    assert all(sha(Path(m['quickjs']['source'])/p)==h for p,h in m['quickjs']['source_files'].items())
    from prepare import tree
    assert tree(PREVIOUS)==read(HERE/'attempt01_identity_before.json'),'attempt01 changed'
    for f in read(HERE/'source_verification.json')['files']:assert sha(HERE/'materials/V8_IC_Resume_Materials_20261025'/f['path'])==f['sha256']
    save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),quickjs_sha256=sha(m['quickjs']['binary']['path']),v8_sha256=sha(m['v8']['binary']['path']),source_files_checked=77,attempt01_unchanged=True,frozen_files_unchanged=True,reference_sources_unchanged=True,dependencies_verified=True))
    print('FORMAL_270_FINISHED_AND_IDENTITIES_UNCHANGED',flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['correctness','pilot','formal','campaign']);a=p.parse_args()
    if a.stage in ['correctness','campaign']:correctness()
    if a.stage in ['pilot','campaign']:calibrate()
    if a.stage in ['formal','campaign']:formal()
