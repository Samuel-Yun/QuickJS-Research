"""Three cases, four fixed conditions, no warmup, balanced serial new processes."""
import argparse,itertools,random
from common import *
def parse_flags(s):
    out={}
    for line in s.splitlines():
        if not line.startswith('--'):continue
        v=line[2:]
        if '=' in v:k,x=v.split('=',1);out[k]=x
        elif v.startswith('no-'):out[v[3:]]=False
        else:out[v]=True
    return out
def init():
    verify_runtime();inputs={}
    pairs=[(MIC/'inputs/adapter.js',HERE/'inputs/adapter.js'),(MIC/'inputs/driver.js',HERE/'inputs/richards_driver.js')]
    pairs += [(MIC/'cases'/f'{c}.js',HERE/'inputs'/f'{c}.js') for c in CASES[:2]]
    pairs += [(V8/'inputs/octane'/n,HERE/'inputs'/n) for n in ['base.js','richards.js']]
    for src,dst in pairs:
        data=src.read_bytes();save(dst,data)
        inputs[dst.relative_to(HERE).as_posix()]=dict(origin=src.relative_to(ROOT).as_posix(),original_sha256=sha(src),LF_sha256=hashlib.sha256(data.replace(b'\r\n',b'\n')).hexdigest(),copied_sha256=sha(dst),pure_line_ending_change=False)
    for n in ['base.js','richards.js']:
        original=ROOT/'benchmarks/octane/upstream'/n
        assert original.read_bytes().replace(b'\r\n',b'\n')==(HERE/'inputs'/n).read_bytes()
        inputs['inputs/'+n]['upstream_raw_sha256']=sha(original)
    save(HERE/'inputs.json',inputs)
    on=parse_flags(read(HERE/'raw/build/V8_ON_flags.json')['stdout']);off=parse_flags(read(HERE/'raw/build/V8_OFF_flags.json')['stdout'])
    diff=[k for k in sorted(on.keys()|off.keys()) if on.get(k)!=off.get(k)]
    assert diff==['use-ic'] and on['use-ic'] is True and off['use-ic'] is False
    for k in ['jitless','regexp-interpret-all']:assert on[k] is True and off[k] is True
    for k in ['lazy','sparkplug','maglev','turbofan','turboshaft','regexp-tier-up']:assert on[k] is False and off[k] is False,k
    csvout(HERE/'effective_flags.csv',[dict(flag=k,ON=on[k],OFF=off[k]) for k in sorted(on)])
    ref=read(V8/'reference_evidence.json')
    for f in ref['source_files']:assert sha(ROOT/ref['source_root_relative']/f['bundle_path'])==f['sha256']
    assert sha(ROOT/ref['source_notes_relative'])==ref['source_notes_sha256']
    for rel,h in ref['ON_evidence']['files'].items():assert sha(ROOT/'experiments/v8_ic_on_off/attempt01'/rel)==h
    save(HERE/'v8_evidence.json',dict(status='PASS_WITH_OBSERVABILITY_LIMITATION',only_effective_difference=diff,OFF_direct_snapshot=None,artifact_exact_source_commit=None,reused=ref))
    protocol=dict(mode=MODE,cases=CASES,conditions=CONDITIONS,formal_target=360,repetitions=30,seed=SEED,timeout=TIMEOUT,max_N=MAX_N,task_budget_seconds=BUDGET,
      first_Run_included=True,warmup_calls=0,micro_inner_iterations=4096,clock='captured native performance.now; duration enclosure only; parent origins not joined',
      driver='reuse read_ic_mic micro driver and its original Richards driver; no workload method hoisting',
      outside='Setup/static loading-compilation/adapter/output/post validation',inside='N original Runs incl first; in-Run GC/helpers/builtins/regexp/dynamic compile/assertions',
      calibration='prior N start, common doubling; 3 rotated four-condition independent pilots all >=1000ms',
      balance='24 permutations once plus 6 cyclic permutations; every condition each position 7 or8 per case; fixed seed shuffle',
      failures='append-only; no retry of started/failed positions; case-specific semantic failure stops that case; timer/identity/boot contradiction stops performance stage',
      statistics='median/mean/n-1 sd/Tukey-halves Q1,Q3,IQR/min/max; 10000 paired complete within-case quadruple bootstrap, seed20261028, linear percentile95 exploration, no multiplicity correction',
      ratios=['A/M','V8_OFF/V8_ON','A/V8_ON','M/V8_ON'],GM=False,no_outlier_removal=True,no_old_timing_import=True)
    save(HERE/'protocol.json',protocol)
    print('INPUTS_FLAGS_AND_PROTOCOL_FROZEN',flush=True)
def script(case,n,correctness=False):
    phase='correctness' if correctness else 'measure'
    if case in CASES[:2]:
        driver=(HERE/'inputs/micro_driver.js').read_text().replace('__N__',str(n)).replace('__CHECK__','true' if correctness else 'false').replace('__EXPECTED__',str(12288 if case==CASES[0] else 8386560)).replace('__CASE__',json.dumps(case)).replace('__MODE__',json.dumps(MODE)).replace('__PHASE__',json.dumps(phase))
        parts=[HERE/'inputs/adapter.js',HERE/'inputs'/f'{case}.js']
    else:
        driver=(HERE/'inputs/richards_driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=case,N=n,phase=phase))).replace('__SUITE__','"Richards"').replace('__INDEX__','0').replace('__BENCHMARK__','"Richards"').replace('MAIN_MONOTONIC_V1',MODE)
        parts=[HERE/'inputs/adapter.js',HERE/'inputs/base.js',HERE/'inputs/richards.js']
    path=HERE/'scripts'/case/f'N{n}.{phase}.js';save(path,b'\n;\n'.join(p.read_bytes() for p in parts)+b'\n;\n'+driver.encode());return path
def invoke(stage,case,condition,n,rep,pos,clock=None):
    path=HERE/'raw'/stage/case/f'rep{rep}.N{n}.{condition}.pos{pos}.json'
    if path.exists():return read(path)
    started=HERE/'raw/started'/stage/case/path.name
    assert not started.exists(),'interrupted started position: no automatic retry '+str(started)
    if clock:
        assert boot()==clock['boot_id'],'acquisition boot changed'
        assert time.perf_counter_ns()-clock['start_ns']<clock['budget_remaining_seconds']*1e9,'task budget'
    js=script(case,n,stage in ['correctness','selected_correctness']);m=read(HERE/'manifest.json');cmd=prefixes()[condition]+[str(js)]
    record=dict(cohort=m['cohort'],mode=MODE,stage=stage,case=case,condition=condition,N=n,rep=rep,order=pos,command=cmd,flags=cmd[1:-1],binary_sha256=m['artifacts'][condition]['sha256'],data_dependencies=m['v8_dependencies'] if condition.startswith('V8') else [],script_relative=js.relative_to(HERE).as_posix(),script_sha256=sha(js),input_manifest_sha256=sha(HERE/'inputs.json'),timestamp=stamp(),boot_id=boot(),valid=False,elapsed_ms=None,elapsed_per_Run_ms=None,failed_reason=None,checksum=None)
    save(started,record)
    start=time.perf_counter_ns()
    try:
        p=subprocess.run(cmd,cwd=ROOT,capture_output=True,text=True,timeout=TIMEOUT)
        record.update(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as p:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        record.update(exit_code=None,stdout=dec(p.stdout),stderr=dec(p.stderr),timeout=True)
    stop=time.perf_counter_ns();record.update(outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,completed_at=stamp())
    timer=False
    try:
        lines=re.findall(r'^TEB_RESULT:(.*)$',record['stdout'],re.M)
        assert record['exit_code']==0 and not record['stderr'] and not record['timeout'] and len(lines)==1
        payload=json.loads(lines[0]);record['payload']=payload
        assert payload['case']==case and payload['N']==n and payload['mode']==MODE and payload['correctness']=='PASS' and payload['warmup_calls']==0
        if case in CASES[:2]:assert payload['checksum']==n*(12288 if case==CASES[0] else 8386560)
        record['checksum']=payload.get('checksum')
        if stage not in ['correctness','selected_correctness']:
            timer=True;e=payload['elapsed_ms'];assert math.isfinite(e) and e>0 and payload['stop_ms']-payload['start_ms']==e and e<=record['outer_wall_ns']/1e6+5
            record.update(elapsed_ms=e,elapsed_per_Run_ms=e/n)
        record['valid']=True
    except (AssertionError,ValueError,TypeError,KeyError):record['failed_reason']='TIMER' if timer else 'TIMEOUT' if record['timeout'] else 'EXIT_STDERR_OR_CORRECTNESS'
    save(path,record);print(stage,case,condition,'N='+str(n),'rep='+str(rep),'PASS' if record['valid'] else 'FAIL',record['elapsed_ms'],flush=True)
    if record['failed_reason']=='TIMER':save(HERE/'BLOCKED_TIMER.json',record);raise RuntimeError('untrusted timer, performance stopped')
    return record
def correctness():
    verify_runtime();rows=[]
    for case in CASES:
        for n in [1,2]:
            for pos,c in enumerate(CONDITIONS):
                r=invoke('correctness',case,c,n,n,pos);rows.append(dict(case=case,N=n,condition=c,valid=r['valid'],exit_code=r['exit_code']))
    csvout(HERE/'correctness.csv',rows);save(HERE/'correctness_gate.json',dict(status='PASS' if all(r['valid'] for r in rows) else 'FAILED',expected=24,actual=len(rows),valid=sum(r['valid'] for r in rows)))
def timer():
    p=HERE/'inputs/timer_probe.js';save(p,(HERE/'inputs/adapter.js').read_bytes()+b'''\nvar a=benchNow(),p=a,min=Infinity,changes=0;for(var i=0;i<100000;i++){var t=benchNow();if(t<p)throw Error('backward');if(t>p){min=Math.min(min,t-p);changes++;}p=t;}if(!changes)throw Error('no progress');console.log(JSON.stringify({changes:changes,min_positive_ms:min,start_ms:a,stop_ms:p}));\n''')
    rows=[]
    for c in CONDITIONS:
        r=capture('timer_'+c,prefixes()[c]+[p]);assert r['exit_code']==0 and not r['stderr'];d=json.loads(r['stdout']);assert d['changes']>0 and d['min_positive_ms']>0;rows.append(dict(condition=c,**d))
    save(HERE/'timer_gate.json',dict(status='PASS',clocks=rows,absolute_origins_equal=None,comparison='durations only'))
def campaign():
    verify_runtime();assert read(HERE/'correctness_gate.json')['status']=='PASS';assert read(HERE/'timer_gate.json')['status']=='PASS';assert read(HERE/'mechanism_gate.json')['status']=='PASS'
    begin=read(HERE/'started.json');spent=(datetime.now(timezone.utc)-datetime.fromisoformat(begin['timestamp'])).total_seconds()
    clock=dict(boot_id=boot(),start_ns=time.perf_counter_ns(),budget_remaining_seconds=max(0,BUDGET-spent),prior_task_elapsed_wall_seconds=spent)
    assert not (HERE/'campaign_clock.json').exists(),'new launch cannot silently replace existing acquisition cohort'
    save(HERE/'campaign_clock.json',clock)
    assert read(HERE/'v8_evidence.json')['status']=='PASS_WITH_OBSERVABILITY_LIMITATION'
    seeds={case:read(MIC/'selected'/f'{case}.json')['N'] for case in CASES};eligible=[]
    for case in CASES:
        n=seeds[case]
        while n<=MAX_N:
            pilots=[]
            for rep in range(3):
                order=CONDITIONS[rep:]+CONDITIONS[:rep]
                for pos,c in enumerate(order):pilots.append(invoke('pilot',case,c,n,rep,pos,clock))
            if not all(r['valid'] for r in pilots):save(HERE/'status'/f'{case}.json',dict(status='BLOCKED_PILOT',reason='failure retained; no retry'));break
            if all(r['elapsed_ms']>=1000 for r in pilots):
                checks=[invoke('selected_correctness',case,c,n,0,pos,clock) for pos,c in enumerate(CONDITIONS)]
                if not all(r['valid'] for r in checks):save(HERE/'status'/f'{case}.json',dict(status='BLOCKED_CORRECTNESS',reason='selected N failed'));break
                save(HERE/'selected'/f'{case}.json',dict(case=case,N=n,pilot_ms=[r['elapsed_ms'] for r in pilots],source_N=seeds[case]));eligible.append(case);break
            n*=2
        else:save(HERE/'status'/f'{case}.json',dict(status='BLOCKED_N_LIMIT',reason='common duration not feasible'))
    rng=random.Random(SEED);cyclic=[CONDITIONS[k:]+CONDITIONS[:k] for k in range(4)]
    orders={case:list(itertools.permutations(CONDITIONS))+[tuple(x) for x in cyclic+cyclic[:2]] for case in CASES}
    for v in orders.values():rng.shuffle(v)
    schedule=[]
    for rep in range(30):
        cases=CASES.copy();rng.shuffle(cases)
        for case in cases:
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,rep=rep,order=pos,N=read(HERE/'selected'/f'{case}.json')['N'] if case in eligible else None,eligible=case in eligible))
    save(HERE/'schedule.json',schedule)
    formal_scripts={case:dict(path=script(case,read(HERE/'selected'/f'{case}.json')['N']).relative_to(HERE).as_posix(),sha256=sha(script(case,read(HERE/'selected'/f'{case}.json')['N']))) for case in eligible}
    files={p.relative_to(HERE).as_posix():sha(p) for p in [HERE/'common.py',HERE/'run.py',HERE/'protocol.json',HERE/'manifest.json',HERE/'inputs.json',*sorted((HERE/'inputs').glob('*'))] if p.is_file()}
    save(HERE/'frozen.json',dict(files=files,schedule_sha256=sha(HERE/'schedule.json'),formal_scripts=formal_scripts,eligible=eligible,timestamp=stamp()))
    verify_runtime();capture('pre_formal_processes',['ps','-eo','pid,stat,comm,pcpu,args'])
    processes=read(HERE/'raw/build/pre_formal_processes.json')['stdout']
    assert not any(len(line.split())>=3 and line.split()[2] in ['cc1','cc1plus','collect2','ld','as'] for line in processes.splitlines()),'concurrent build'
    print('FORMAL_FROZEN',len(eligible)*120,'/',360,flush=True)
    stopped=set()
    for row in schedule:
        if not row['eligible'] or row['case'] in stopped:continue
        r=invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'],clock)
        if not r['valid']:
            stopped.add(row['case']);save(HERE/'status'/f'{row["case"]}.formal.json',dict(status='FAILED_FORMAL',reason=r['failed_reason'],failed_position=row))
        print('FORMAL_POSITION',row['index']+1,'/360',flush=True)
    verify_runtime()
    save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),boot_id=boot(),remaining_budget_seconds=clock['budget_remaining_seconds']-(time.perf_counter_ns()-clock['start_ns'])/1e9))
    capture('environment_after',['sh','-c','uname -a; uptime; ps -eo pid,comm,pcpu --sort=-pcpu | head -15; true'])
    print('ACQUISITION_FINISHED_NOT_YET_AUDITED',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['init','correctness','timer','campaign']);a=p.parse_args();globals()[a.stage]()
