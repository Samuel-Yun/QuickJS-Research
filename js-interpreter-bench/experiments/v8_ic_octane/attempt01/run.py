"""16-unit extension: common scripts, serial triples, per-case failure isolation."""
import argparse,itertools,random
from common import *
def script(case,n,phase='measure'):
    row=next(r for r in read(HERE/'case_catalog.json') if r['case']==case)
    driver=(HERE/'inputs/driver.js').read_text(encoding='utf-8')
    config=dict(case=case,N=n,phase=phase)
    for key,value in dict(CONFIG=json.dumps(config),SUITE=json.dumps(row['suite']),INDEX=str(row['index']),BENCHMARK=json.dumps(row['benchmark'])).items():driver=driver.replace('__'+key+'__',value)
    pieces=[(HERE/'inputs/adapter.js').read_bytes()]
    if case.startswith('Crypto.'):pieces.append((HERE/'inputs/crypto_preload.js').read_bytes())
    pieces += [(HERE/'inputs/octane'/f).read_bytes() for f in row['files']]+[driver.encode()]
    p=HERE/'scripts'/case/f'N{n}.{phase}.js';save(p,b'\n;\n'.join(pieces));return p
def invoke(stage,case,c,n,rep,pos,index=None):
    dest=HERE/'raw'/stage/case/f'N{n}.rep{rep:02d}.pos{pos}.{c}.json'
    if dest.exists():return read(dest)
    phase='correctness' if stage in ['correctness','selected_correctness'] else 'measure'
    p=script(case,n,phase);m=read(HERE/'runtime.json');cat=next(r for r in read(HERE/'case_catalog.json') if r['case']==case)
    a=m['quickjs']['binary'] if c==CONDITIONS[0] else m['v8']['binary'];cmd=prefixes()[c]+[str(p)]
    assert environment()==read(HERE/'environment.json')
    r=dict(case=case,condition=c,N=n,rep=rep,order=pos,schedule_index=index,stage=stage,cohort=m['cohort'],mode=MODE,command=cmd,flags=cmd[1:-1],cwd=str(ROOT),input_protocol=cat['input_mode'],seed=cat['seed'],input_manifest_sha256=sha(HERE/'inputs.json'),environment_sha256=sha(HERE/'environment.json'),binary_sha256=a['sha256'],data_dependencies=m['v8']['dependencies'] if c!=CONDITIONS[0] else [],script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),timestamp=stamp(),boot_id=boot(),affinity=sorted(os.sched_getaffinity(0)),valid=False,elapsed_ms=None,elapsed_per_Run_ms=None,checksum=None,failed_reason=None)
    reservation=HERE/'raw/started'/stage/case/dest.name
    if reservation.exists():
        r.update(exit_code=None,stdout='',stderr='',timeout=False,failed_reason='STARTED_INTERRUPTED; not automatically retried',execution_observed=None)
        save(dest,r);return r
    save(reservation,dict(command=cmd,timestamp=r['timestamp'],script_sha256=r['script_sha256']))
    dest.parent.mkdir(parents=True,exist_ok=True);stdoutpath=dest.with_suffix('.stdout');stderrpath=dest.with_suffix('.stderr')
    start=time.perf_counter_ns();timedout=False
    with stdoutpath.open('xb') as out,stderrpath.open('xb') as err:
        process=subprocess.Popen(cmd,cwd=ROOT,env=environment(),stdout=out,stderr=err)
        while True:
            remaining=TIMEOUT-(time.perf_counter_ns()-start)/1e9
            if remaining<=0:process.kill();process.wait();timedout=True;break
            try:process.wait(timeout=min(25,remaining));break
            except subprocess.TimeoutExpired:print('ACTIVE',stage,case,c,'N='+str(n),'seconds='+str(round((time.perf_counter_ns()-start)/1e9)),flush=True)
    stop=time.perf_counter_ns()
    r.update(exit_code=process.returncode if not timedout else None,timeout=timedout,stdout=stdoutpath.read_text(encoding='utf-8',errors='replace'),stderr=stderrpath.read_text(encoding='utf-8',errors='replace'),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,completed_at=stamp())
    timer_check=False
    try:
        assert r['exit_code']==0 and not r['stderr'] and not timedout,'process exit/stderr/timeout'
        found=re.findall(r'^OCTANE_IC_RESULT:(.*)$',r['stdout'],re.M);assert len(found)==1,'payload count'
        payload=json.loads(found[0]);r['payload']=payload
        assert payload['case']==case and payload['N']==n and payload['mode']==MODE and payload['correctness']=='PASS' and payload['warmup_calls']==0,'payload/correctness'
        timer_check=True;begin,end,elapsed=[payload[k] for k in ['start_ms','stop_ms','elapsed_ms']]
        assert all(math.isfinite(t) for t in [begin,end,elapsed]) and end-begin==elapsed and elapsed>=0,'timer arithmetic'
        assert elapsed<=(stop-start)/1e6+5,'duration enclosure'
        if stage in ['pilot','formal']:assert elapsed>0,'zero elapsed'
        r.update(valid=True,elapsed_ms=elapsed,elapsed_per_Run_ms=elapsed/n,checksum=payload['checksum'],timer_duration_enclosed=True,parent_child_absolute_origin_verified=False)
        if case.startswith('Crypto.') and (HERE/'crypto'/f'{case}.N{n}.json').exists():
            gate=read(HERE/'crypto'/f'{case}.N{n}.json');assert gate['status']=='PASS_BOUNDED_INPUT_IDENTITY' and payload['checksum']==gate['final_ciphertext'],'Crypto input/result mismatch'
    except (AssertionError,KeyError,TypeError,ValueError) as e:
        r.update(valid=False,failed_reason=('GLOBAL_TIMER: ' if timer_check and not str(e).startswith('Crypto') else '')+str(e))
    save(dest,r);print(stage,case,c,'N='+str(n),'rep='+str(rep),'PASS' if r['valid'] else 'FAIL',r['elapsed_ms'],flush=True)
    if not r['valid'] and r['failed_reason'].startswith('GLOBAL_TIMER'):
        save(HERE/'GLOBAL_BLOCKED_TIMER.json',dict(status='BLOCKED_TIMER',record=dest.relative_to(HERE).as_posix(),reason=r['failed_reason']));raise RuntimeError('GLOBAL_BLOCKED_TIMER')
    if not r['valid'] and re.search(r'unknown flag|unrecognized flag|unrecognized option',r['stderr'],re.I):raise RuntimeError('GLOBAL_PARAMETER_CONTRADICTION')
    return r
def correctness():
    verify_runtime();assert read(HERE/'gate.json')['status']=='PASS_WITH_OBSERVABILITY_LIMITATION'
    rows=[];this_checks=[]
    for case in CASES:
        for n in [1,2]:
            rr=[invoke('correctness',case,c,n,n,pos) for pos,c in enumerate(CONDITIONS)];rows+=rr
            if not all(r['valid'] for r in rr):block(case,'correctness','N'+str(n)+' process/original correctness failed','BLOCKED_CORRECTNESS');break
        if not blocked(case):
            r=next(r for r in rows if r['case']==case and r['condition']=='V8_IC_ON' and r['N']==1)
            source=r['payload']['run_source'];clean=re.sub(r'/\*.*?\*/|//[^\n]*','',source,flags=re.S)
            safe=not re.search(r'\bthis\b',clean) and '[native code]' not in clean
            this_checks.append(dict(case=case,registered_Run_source=source,source_sha256=hashlib.sha256(source.encode()).hexdigest(),no_entry_this_token=bool(safe),evidence='actual registered V8 function source; same frozen registration/workload for all conditions'))
            if not safe:block(case,'this_review','registered Run source requires explicit this review','BLOCKED_THIS_REVIEW')
        if case.startswith('Crypto.') and not blocked(case):
            from crypto_inputs import validate
            for n in [1,2]:
                if not validate(case,n):break
    csvout(HERE/'correctness.csv',[{k:r[k] for k in ['case','condition','N','valid','exit_code','checksum','script_sha256']} for r in rows])
    save(HERE/'run_this_audit.json',this_checks)
    # Same monotonic clock checks as attempt02, no parent/child origin assumption.
    clock=HERE/'inputs/clock.js';save(clock,(HERE/'inputs/adapter.js').read_bytes()+b'\nvar now=__icoNow,start=now(),last=start;for(var i=0;i<10000;i++){var n=now();if(n<last)throw Error("nonmonotonic");last=n;}var stop=now();console.log("CLOCK:"+JSON.stringify({start:start,stop:stop,elapsed:stop-start}));\n')
    for c in CONDITIONS:
        r=capture(HERE/'raw/capability'/('clock_'+c+'.json'),prefixes()[c]+[str(clock)]);assert r['exit_code']==0 and not r['stderr']
        p=json.loads(re.findall(r'^CLOCK:(.*)$',r['stdout'],re.M)[0]);assert 0<=p['elapsed']<=(r['outer_stop_ns']-r['outer_start_ns'])/1e6+5 and p['elapsed']==p['stop']-p['start']
    save(HERE/'correctness_gate.json',dict(status='PASS' if len(rows)==96 and all(r['valid'] for r in rows) and not any(blocked(c) for c in CASES) else 'PARTIAL_CASES_BLOCKED',expected=96,actual=len(rows),valid=sum(r['valid'] for r in rows),eligible_cases=[c for c in CASES if not blocked(c)],clock_checks=3))
    print('CORRECTNESS_COMPLETE',len(rows),'eligible',len([c for c in CASES if not blocked(c)]),flush=True)
def check_budget():
    p=HERE/'campaign_clock.json'
    if not p.exists():save(p,dict(start_ns=time.perf_counter_ns(),boot_id=boot(),start_UTC=stamp(),limit_seconds=BUDGET))
    t=read(p);assert t['boot_id']==boot(),'GLOBAL_BOOT_CHANGED; never join cohorts across boots'
    if (time.perf_counter_ns()-t['start_ns'])/1e9>=BUDGET:raise RuntimeError('CAMPAIGN_BUDGET_EXHAUSTED')
def pilot_start(case):
    rr=[read(p) for p in (HERE/'raw/correctness'/case).glob('*.json')];est=[r['elapsed_per_Run_ms'] for r in rr if r['valid'] and r['elapsed_per_Run_ms']>0]
    fast,slow=min(est),max(est);old=next(r['old_N_reference'] for r in read(HERE/'case_catalog.json') if r['case']==case)
    target=2**max(0,math.ceil(math.log2(1500/fast)));cap=2**max(0,math.floor(math.log2(70000/slow)))
    start=max(1,min(old,target,cap,131072));save(HERE/'pilot_start'/f'{case}.json',dict(case=case,N=start,old_N_reference=old,fastest_N1_N2_ms_per_Run=fast,slowest_N1_N2_ms_per_Run=slow,target1500ms_pow2=target,slow70000ms_cap_pow2=cap));return start
def calibrate():
    verify_runtime()
    for case in CASES:
        if blocked(case) or (HERE/'selected'/f'{case}.json').exists():continue
        n=pilot_start(case)
        while n<=131072:
            rows=[]
            for rep in range(3):
                for pos,c in enumerate(CONDITIONS[rep:]+CONDITIONS[:rep]):
                    check_budget();r=invoke('pilot',case,c,n,rep,pos);rows.append(r)
                    if not r['valid']:break
                if not all(r['valid'] for r in rows):break
            if not all(r['valid'] for r in rows):block(case,'pilot','common N process failed or timed out','BLOCKED_COMMON_N');break
            if min(r['elapsed_ms'] for r in rows)>=1000:
                if case.startswith('Crypto.'):
                    from crypto_inputs import validate
                    check_budget()
                    if not validate(case,n):break
                checks=[]
                for pos,c in enumerate(CONDITIONS):check_budget();checks.append(invoke('selected_correctness',case,c,n,0,pos))
                if not all(r['valid'] for r in checks):block(case,'selected_correctness','selected N original assertions/process failed','BLOCKED_CORRECTNESS');break
                save(HERE/'selected'/f'{case}.json',dict(case=case,N=n,pilot_records=9,minimum_ms=min(r['elapsed_ms'] for r in rows),selected_correctness=3,input_identity='PASS_BOUNDED_INPUT_IDENTITY' if case.startswith('Crypto.') else 'original assertions',pilot=[dict(condition=r['condition'],rep=r['rep'],elapsed_ms=r['elapsed_ms']) for r in rows]));break
            n*=2
        else:block(case,'pilot','max N without 9 intervals >=1000ms','BLOCKED_COMMON_N')
    rng=random.Random(SEED);orders={case:list(itertools.permutations(CONDITIONS))*5 for case in CASES}
    for case in CASES:rng.shuffle(orders[case])
    schedule=[]
    for rep in range(30):
        cases=CASES.copy();rng.shuffle(cases)
        for case in cases:
            selected=HERE/'selected'/f'{case}.json';n=read(selected)['N'] if selected.exists() else None
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,N=n,rep=rep,order=pos,eligible=n is not None and not bool(blocked(case))))
    save(HERE/'schedule.json',schedule);assert len(schedule)==1440
    files={p.relative_to(HERE).as_posix():sha(p) for p in [HERE/'protocol.json',HERE/'runtime.json',HERE/'inputs.json',HERE/'environment.json',HERE/'common.py',HERE/'run.py',HERE/'crypto_inputs.py',HERE/'analyze.py',HERE/'replay.py',HERE/'schedule.json',*sorted((HERE/'inputs').rglob('*'),key=lambda p:p.as_posix())] if p.is_file()}
    scripts={}
    for case in CASES:
        p=HERE/'selected'/f'{case}.json'
        if p.exists():
            files[p.relative_to(HERE).as_posix()]=sha(p);q=script(case,read(p)['N']);files[q.relative_to(HERE).as_posix()]=sha(q);scripts[case]=dict(path=q.relative_to(HERE).as_posix(),sha256=sha(q))
    save(HERE/'frozen.json',dict(timestamp=stamp(),formal_target=1440,eligible_target=sum(s['eligible'] for s in schedule),formal_scripts=scripts,files=files))
    print('FORMAL_SCHEDULE_FROZEN target=1440 eligible='+str(sum(s['eligible'] for s in schedule)),flush=True)
def formal():
    verify_runtime()
    for p,h in read(HERE/'frozen.json')['files'].items():assert sha(HERE/p)==h,p
    for s in read(HERE/'schedule.json'):
        if not s['eligible'] or blocked(s['case']):continue
        check_budget();r=invoke('formal',s['case'],s['condition'],s['N'],s['rep'],s['order'],s['index'])
        if not r['valid']:block(s['case'],'formal','version-specific process/correctness failure; remaining case positions not run','FAILED_FORMAL')
        print('FORMAL_POSITION',s['index']+1,'/1440',flush=True)
    verify_runtime();m=read(HERE/'runtime.json')
    assert all(sha(Path(m['quickjs']['source'])/p)==h for p,h in m['quickjs']['source_files'].items())
    assert tree(PREVIOUS)==read(HERE/'previous_identity_before.json')
    save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),quickjs_sha256=sha(m['quickjs']['binary']['path']),v8_sha256=sha(m['v8']['binary']['path']),dependencies_verified=True,source_files_checked=77,previous_attempt_unchanged=True))
    print('ACQUISITION_FINISHED; counts must be independently audited',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['correctness','pilot','formal']);a=p.parse_args();globals()[{'pilot':'calibrate'}.get(a.stage,a.stage)]()
