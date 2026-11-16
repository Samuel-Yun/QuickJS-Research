"""Bounded correctness, perturbation verification and nine profiling windows."""
import argparse,itertools,struct
from common import *
def init():
    verify();items={}
    sources={'adapter.js':PREV/'inputs/adapter.js','micro_driver.js':PREV/'inputs/micro_driver.js','shared.js':PREV/'cases/shared.js','base.js':INHERITED/'inputs/base.js','richards.js':INHERITED/'inputs/richards.js','richards_driver.js':INHERITED/'inputs/richards_driver.js'}
    for name,p in sources.items():save(HERE/'inputs'/name,p.read_bytes());items[name]=dict(origin=p.relative_to(ROOT).as_posix(),sha256=sha(p))
    save(HERE/'inputs.json',items)
    save(HERE/'protocol.json',dict(mode=MODE,cases=CASES,conditions=CONDS,seed=SEED,warmup_calls=0,first_Run_included=True,period_initial_us=7000,period_fallback_us=23000,reps=12,target_validation=108,pilot_reps_per_condition=3,pilot_threshold_ms=3000,N_micro_start=16384,N_richards_start=512,N_micro_max=131072,N_richards_max=4096,timeout_seconds=180,relink_gate=dict(point_max=1.05,CI95_high_max=1.10),sampling_gate=dict(point_max=1.03,CI95_high_max=1.05),bootstrap=10000,bootstrap_unit='complete nine-process round',long_periods_if_initial_pass=[7,13,23],long_periods_if_fallback_pass=[23,31,43],long_target_seconds=30,long_micro_N_max=1048576,long_richards_N_max=16384,no_auto_retries=True,diagnostic_hooks='only before complete timed region and after; no per-call/opcode instrumentation',clock='existing native performance.now duration and enclosing perf_counter_ns; UTC metadata only'))
def script(case,n,shim,correctness=False):
    phase='correctness' if correctness else 'measure';assert n*EXPECTED<2**53
    if case!='Richards.Richards':
        d=(HERE/'inputs/micro_driver.js').read_text().replace('__N__',str(n)).replace('__CHECK__','true' if correctness else 'false').replace('__EXPECTED__',str(EXPECTED)).replace('__CASE__',json.dumps(case)).replace('__MODE__',json.dumps(MODE)).replace('__PHASE__',json.dumps(phase))
        if shim:
            if correctness:d=d.replace('if(true){','if(true){__cbBegin();').replace('else{start=','else{start=');d=d.replace('checksum+=last;}}','checksum+=last;}__cbEnd();}')
            else:d=d.replace('else{start=benchNow();','else{__cbBegin();start=benchNow();').replace('stop=benchNow();microValidate(last);','stop=benchNow();__cbEnd();microValidate(last);')
            assert d.count('__cbBegin();')==1 and d.count('__cbEnd();')==1
        data=b'\n;\n'.join([(HERE/'inputs/adapter.js').read_bytes(),f'var CASE_KIND={json.dumps(case)};\n'.encode()+(HERE/'inputs/shared.js').read_bytes(),d.encode()])
    else:
        d=(HERE/'inputs/richards_driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=case,N=n,phase=phase))).replace('__SUITE__','"Richards"').replace('__INDEX__','0').replace('__BENCHMARK__','"Richards"').replace('MAIN_MONOTONIC_V1',MODE)
        if shim:
            d=d.replace("  if (__tebConfig.phase === 'correctness') {","  if (__tebConfig.phase === 'correctness') {\n    __cbBegin();")
            d=d.replace('  } else {\n    __tebStarted = benchNow();','    __cbEnd();\n  } else {\n    __cbBegin();\n    __tebStarted = benchNow();')
            d=d.replace('    __tebStopped = benchNow();','    __tebStopped = benchNow();\n    __cbEnd();')
        data=b'\n;\n'.join([(HERE/'inputs'/x).read_bytes() for x in ['adapter.js','base.js','richards.js']]+[d.encode()])
    p=HERE/'scripts'/case/f'N{n}.{phase}.{"shim" if shim else "base"}.js';save(p,data);return p
def invoke(stage,case,c,n,rep,pos,period=7000,correctness=False):
    p=HERE/'raw'/stage/case/f'rep{rep}.{c}.N{n}.p{period}.json'
    if p.exists():return read(p)
    reservation=HERE/'raw/started'/p.relative_to(HERE/'raw');assert not reservation.exists(),'no automatic retry';budget()
    m=read(HERE/'manifest.json');js=script(case,n,c!='BASE',correctness);cmd=[m['artifacts'][c]['path'],str(js)];env=os.environ.copy()
    report=STORE/'reports'/stage/case/p.stem;report.parent.mkdir(parents=True,exist_ok=True)
    if c!='BASE':env.update(CALL_BOUNDARY_REPORT=str(report),CALL_BOUNDARY_ON='1' if c=='SHIM_ON' else '0',CALL_BOUNDARY_PERIOD_US=str(period))
    r=dict(stage=stage,case=case,condition=c,N=n,rep=rep,order=pos,period_us=period,mode=MODE,cohort=m['cohort'],command=cmd,script_relative=js.relative_to(HERE).as_posix(),script_sha256=sha(js),binary_sha256=m['artifacts'][c]['sha256'],input_sha256=sha(HERE/'inputs'/('richards.js' if case=='Richards.Richards' else 'shared.js')),sample_prefix=str(report) if c!='BASE' else None,boot_id=boot(),valid=False)
    save(reservation,r);r['timestamp']=stamp();usage_before=resource.getrusage(resource.RUSAGE_CHILDREN);start=time.perf_counter_ns()
    try:
        proc=subprocess.run(cmd,cwd=ROOT,env=env,capture_output=True,text=True,timeout=180);r.update(exit_code=proc.returncode,stdout=proc.stdout,stderr=proc.stderr,timeout=False)
    except subprocess.TimeoutExpired as e:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        r.update(exit_code=None,stdout=dec(e.stdout),stderr=dec(e.stderr),timeout=True)
    stop=time.perf_counter_ns();usage_after=resource.getrusage(resource.RUSAGE_CHILDREN)
    r.update(completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,child_user_seconds=usage_after.ru_utime-usage_before.ru_utime,child_system_seconds=usage_after.ru_stime-usage_before.ru_stime,child_voluntary_switches=usage_after.ru_nvcsw-usage_before.ru_nvcsw,child_involuntary_switches=usage_after.ru_nivcsw-usage_before.ru_nivcsw)
    try:
        assert r['exit_code']==0 and not r['stderr'] and not r['timeout'];ls=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M);assert len(ls)==1;d=json.loads(ls[0]);r['payload']=d
        assert d['correctness']=='PASS' and d['N']==n and d['case']==case and d['mode']==MODE and d['warmup_calls']==0
        if case!='Richards.Richards':assert d['last']==EXPECTED and d['checksum']==n*EXPECTED
        if not correctness:assert math.isfinite(d['elapsed_ms']) and d['elapsed_ms']>0 and d['elapsed_ms']==d['stop_ms']-d['start_ms'] and d['elapsed_ms']<=r['outer_wall_ns']/1e6+5
        r['elapsed_ms']=d['elapsed_ms'];r['elapsed_per_Run_ms']=None if correctness else d['elapsed_ms']/n
        if c!='BASE':
            meta=read(str(report)+'.meta.json');assert meta['threads_before']==meta['threads_after']==1 and meta['atomics_lock_free'] and meta['old_handler_default'] and meta['old_timer_zero'] and meta['overflow']==meta['clock_errors']==0
            assert meta['enabled']==(c=='SHIM_ON') and meta['period_us']==period
            if not correctness:assert d['elapsed_ms']<=(meta['window_stop_ns']-meta['window_start_ns'])/1e6+5
            r['sampler']=meta;ar={}
            for ext in ['meta.json','samples.bin','begin.maps','end.maps']:
                source=Path(str(report)+'.'+ext);out=HERE/'raw/samples'/stage/case/(p.stem+'.'+ext+'.gz');data=source.read_bytes();save(out,gzip.compress(data,mtime=0));ar[ext]=dict(path=out.relative_to(HERE).as_posix(),sha256=sha(out),uncompressed_sha256=hashlib.sha256(data).hexdigest(),bytes=len(data))
            r['sampler_archives']=ar
        r['valid']=True
    except (AssertionError,ValueError,KeyError,TypeError,OSError) as e:r['failure_reason']=str(e) or 'exit/correctness/timer/sampler assertion'
    save(p,r);print(stage,case,c,n,rep,'PASS' if r['valid'] else 'FAIL',r.get('elapsed_ms'),flush=True);return r
def correctness():
    verify();rows=[]
    for case in CASES:
        for n in [1,2]:
            for pos,c in enumerate(CONDS):
                r=invoke('correctness',case,c,n,n,pos,correctness=True);rows.append(dict(case=case,N=n,condition=c,valid=r['valid']))
    csvout(HERE/'correctness.csv',rows);save(HERE/'correctness_gate.json',dict(status='PASS' if all(r['valid'] for r in rows) else 'FAIL',expected=18,valid=sum(r['valid'] for r in rows)))
    budget(setup=True);save(HERE/'checkpoints/02_sampler_usable.json',dict(status='SAMPLER_CORRECTNESS_PASS' if all(r['valid'] for r in rows) else 'BLOCKED',timestamp=stamp()))
def validate(period):
    verify();assert read(HERE/'correctness_gate.json')['status']=='PASS';batch='validation_p'+str(period);assert not (HERE/(batch+'_clock.json')).exists()
    save(HERE/(batch+'_clock.json'),dict(timestamp=stamp(),boot_id=boot(),start_ns=time.perf_counter_ns()))
    selected={}
    for case in CASES:
        n=512 if case=='Richards.Richards' else 16384;limit=4096 if case=='Richards.Richards' else 131072
        while n<=limit:
            pilot=[]
            for rep in range(3):
                for pos,c in enumerate(CONDS[rep:]+CONDS[:rep]):pilot.append(invoke('pilot_p'+str(period),case,c,n,rep,pos,period))
            assert all(r['valid'] for r in pilot),'pilot failure; do not auto retry'
            if min(r['elapsed_ms'] for r in pilot)>=3000:
                checks=[invoke('selected_correctness_p'+str(period),case,c,n,0,pos,period,True) for pos,c in enumerate(CONDS)];assert all(r['valid'] for r in checks)
                selected[case]=dict(N=n,pilot_elapsed_ms=[r['elapsed_ms'] for r in pilot]);break
            n*=2
        assert case in selected,'N/time gate reached cap'
    save(HERE/f'selected_p{period}.json',selected)
    rng=random.Random(SEED);case_orders=list(itertools.permutations(CASES))*2;rng.shuffle(case_orders);orders={case:list(itertools.permutations(CONDS))*2 for case in CASES}
    for a in orders.values():rng.shuffle(a)
    sched=[]
    for rep,case_order in enumerate(case_orders):
        for cp,case in enumerate(case_order):
            for pos,c in enumerate(orders[case][rep]):sched.append(dict(index=len(sched),rep=rep,case=case,case_order=cp,condition=c,order=pos,N=selected[case]['N'],period_us=period))
    save(HERE/f'schedule_p{period}.json',sched)
    frozen=[HERE/'common.py',HERE/'run.py',HERE/'sampler.c',HERE/'protocol.json',HERE/'manifest.json',*sorted((HERE/'inputs').glob('*'))]
    save(HERE/f'frozen_p{period}.json',dict(files={p.relative_to(HERE).as_posix():sha(p) for p in frozen},script_hashes={f'{case}.{c}':sha(script(case,selected[case]['N'],c!='BASE')) for case in CASES for c in CONDS}))
    capture('processes_before_'+batch,['ps','-eo','pid,stat,comm,pcpu,args'])
    for s in sched:
        r=invoke(batch,s['case'],s['condition'],s['N'],s['rep'],s['order'],period);assert r['valid'],'validation failed, preserve location'
        print('VALIDATION_POSITION',s['index']+1,'/108',flush=True)
    verify();save(HERE/(batch+'_done.json'),dict(status='COLLECTED',timestamp=stamp(),boot_id=boot()))
def profile():
    verify();gate=read(HERE/'perturbation_gate.json');assert not (HERE/'profile_clock.json').exists();save(HERE/'profile_clock.json',dict(timestamp=stamp(),boot_id=boot()))
    periods=[7,13,23] if gate['accepted_period_us']==7000 else [23,31,43];rng=random.Random(SEED+1);case_orders=[CASES[i:]+CASES[:i] for i in range(3)];rng.shuffle(case_orders);schedule=[];selected={}
    for case in CASES:
        info=gate['cases'][case]
        if not info['accepted']:continue
        records=[read(p) for p in (HERE/'raw'/('validation_p'+str(gate['accepted_period_us']))/case).glob('*.json')];minimum=min(r['elapsed_ms'] for r in records);n=math.ceil(info['N']*30000/minimum);cap=16384 if case=='Richards.Richards' else 1048576;n=min(n,cap);assert n*EXPECTED<2**53
        selected[case]=dict(N=n,minimum_validation_ms=minimum,validation_N=info['N'],rule='ceil(N_validation*30000/min(all3conditions validation internal elapsed)); no new duration pilot',cap=cap)
    save(HERE/'long_selected.json',selected)
    for rep,co in enumerate(case_orders):
        for pos,case in enumerate(co):
            if case in selected:schedule.append(dict(rep=rep,case=case,order=pos,period_us=periods[rep]*1000,N=selected[case]['N']))
    save(HERE/'long_schedule.json',schedule)
    for s in schedule:
        r=invoke('profile',s['case'],'SHIM_ON',s['N'],s['rep'],s['order'],s['period_us']);assert r['valid'],'failed long location, no retry'
    verify();save(HERE/'profile_done.json',dict(status='COLLECTED',timestamp=stamp(),windows=len(schedule)))
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['init','correctness','validate','profile']);p.add_argument('--period-us',type=int,default=7000);a=p.parse_args();validate(a.period_us) if a.stage=='validate' else globals()[a.stage]()
