"""Correctness, common-N pilots, frozen serial 360-process campaign."""
import argparse,itertools
from common import *
def script(case,n,correctness=False):
    assert case in CASES and n*EXPECTED<2**53
    phase='correctness' if correctness else 'measure'
    driver=(HERE/'inputs/micro_driver.js').read_text().replace('__N__',str(n)).replace('__CHECK__','true' if correctness else 'false').replace('__EXPECTED__',str(EXPECTED)).replace('__CASE__',json.dumps(case)).replace('__MODE__',json.dumps(MODE)).replace('__PHASE__',json.dumps(phase))
    data=b'\n;\n'.join([(HERE/'inputs/adapter.js').read_bytes(),f'var CASE_KIND={json.dumps(case)};\n'.encode()+(HERE/'cases/shared.js').read_bytes(),driver.encode()])
    p=HERE/'scripts'/case/f'N{n}.{phase}.js';save(p,data);return p
def invoke(stage,case,c,n,rep,pos,clock=None):
    path=HERE/'raw'/stage/case/f'rep{rep}.N{n}.{c}.pos{pos}.json'
    if path.exists():return read(path)
    started=HERE/'raw/started'/stage/case/path.name;assert not started.exists(),'interrupted position: no automatic retry'
    budget()
    if clock:assert clock['boot_id']==boot() and time.perf_counter_ns()-clock['start_ns']<clock['budget_remaining_seconds']*1e9
    js=script(case,n,stage in ['correctness','selected_correctness']);m=read(HERE/'manifest.json');cmd=prefixes()[c]+[str(js)]
    r=dict(cohort=m['cohort'],mode=MODE,stage=stage,case=case,condition=c,N=n,rep=rep,order=pos,command=cmd,flags=cmd[1:-1],binary_sha256=m['artifacts'][c]['sha256'],dependencies=m['v8_dependencies'] if c=='V8_ON' else [],script_relative=js.relative_to(HERE).as_posix(),script_sha256=sha(js),case_source_sha256=sha(HERE/'cases/shared.js'),boot_id=boot(),valid=False,elapsed_ms=None,elapsed_per_Run_ms=None,checksum=None,failed_reason=None)
    save(started,r)
    r['timestamp']=stamp();start=time.perf_counter_ns()
    try:
        p=subprocess.run(cmd,cwd=ROOT,capture_output=True,text=True,timeout=TIMEOUT);r.update(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as e:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        r.update(exit_code=None,stdout=dec(e.stdout),stderr=dec(e.stderr),timeout=True)
    stop=time.perf_counter_ns();end=stamp();utc=(datetime.fromisoformat(end)-datetime.fromisoformat(r['timestamp'])).total_seconds()*1000
    r.update(outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,completed_at=end,UTC_elapsed_ms=utc,UTC_minus_monotonic_ms=utc-(stop-start)/1e6)
    timer=False
    try:
        lines=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M);assert r['exit_code']==0 and not r['stderr'] and not r['timeout'] and len(lines)==1
        d=json.loads(lines[0]);r['payload']=d
        assert d['case']==case and d['N']==n and d['mode']==MODE and d['correctness']=='PASS' and d['warmup_calls']==0 and d['first_Run_included'] and d['last']==EXPECTED and d['checksum']==n*EXPECTED
        r['checksum']=d['checksum']
        if stage not in ['correctness','selected_correctness']:
            timer=True;e=d['elapsed_ms'];assert math.isfinite(e) and e>0 and d['stop_ms']-d['start_ms']==e and e<=r['outer_wall_ns']/1e6+5
            r.update(elapsed_ms=e,elapsed_per_Run_ms=e/n)
        r['valid']=True
    except (AssertionError,ValueError,TypeError,KeyError):r['failed_reason']='TIMER' if timer else 'TIMEOUT' if r['timeout'] else 'EXIT_STDERR_OR_CORRECTNESS'
    save(path,r);print(stage,case,c,'N='+str(n),'rep='+str(rep),'PASS' if r['valid'] else 'FAIL',r['elapsed_ms'],flush=True)
    if r['failed_reason']=='TIMER':save(HERE/'BLOCKED_TIMER.json',r);raise RuntimeError('timer contradiction')
    return r
def correctness():
    verify();rows=[]
    for case in CASES:
        for n in [1,2]:
            for pos,c in enumerate(CONDS):
                r=invoke('correctness',case,c,n,n,pos);rows.append(dict(case=case,N=n,condition=c,valid=r['valid'],exit_code=r['exit_code']))
    csvout(HERE/'correctness.csv',rows);save(HERE/'correctness_gate.json',dict(status='PASS' if all(r['valid'] for r in rows) else 'FAILED',expected=24,actual=len(rows),valid=sum(r['valid'] for r in rows)))
def timer():
    p=HERE/'scripts/timer_probe.js';save(p,(AUDIT/'inputs/timer_probe.js').read_bytes());rows=[]
    for c in CONDS:
        r=capture('timer_'+c,prefixes()[c]+[p]);assert r['exit_code']==0 and not r['stderr'];d=json.loads(r['stdout']);assert d['changes']>0 and d['min_positive_ms']>0;rows.append(dict(condition=c,**d))
    save(HERE/'timer_gate.json',dict(status='PASS',clocks=rows,absolute_origins_equal=None,durations_only=True))
def campaign():
    verify()
    for gate in ['correctness_gate','timer_gate','mechanism_gate']:assert read(HERE/(gate+'.json'))['status']=='PASS'
    assert not (HERE/'campaign_clock.json').exists(),'do not restart a campaign'
    spent=(datetime.now(timezone.utc)-datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds()
    clock=dict(boot_id=boot(),start_ns=time.perf_counter_ns(),budget_remaining_seconds=BUDGET-spent);save(HERE/'campaign_clock.json',clock)
    eligible=[]
    for case in CASES:
        n=8192
        while n<=MAX_N:
            pilot=[]
            for rep in range(3):
                for pos,c in enumerate(CONDS[rep:]+CONDS[:rep]):pilot.append(invoke('pilot',case,c,n,rep,pos,clock))
            if not all(r['valid'] for r in pilot):save(HERE/'status'/f'{case}.json',dict(status='BLOCKED_PILOT'));break
            if min(r['elapsed_ms'] for r in pilot)>=1000:
                checks=[invoke('selected_correctness',case,c,n,0,pos,clock) for pos,c in enumerate(CONDS)]
                if not all(r['valid'] for r in checks):save(HERE/'status'/f'{case}.json',dict(status='BLOCKED_CORRECTNESS'));break
                save(HERE/'selected'/f'{case}.json',dict(case=case,N=n,pilot_ms=[r['elapsed_ms'] for r in pilot]));eligible.append(case);break
            n*=2
        else:save(HERE/'status'/f'{case}.json',dict(status='BLOCKED_N_LIMIT'))
    rng=random.Random(SEED)
    case_order=list(itertools.permutations(CASES))+[tuple(CASES[k:]+CASES[:k]) for k in [0,1,2,3,0,1]];rng.shuffle(case_order)
    orders={case:list(itertools.permutations(CONDS))*5 for case in CASES}
    for order in orders.values():rng.shuffle(order)
    schedule=[]
    for rep,cases in enumerate(case_order):
        for cp,case in enumerate(cases):
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),rep=rep,case=case,case_order=cp,condition=c,order=pos,N=read(HERE/'selected'/f'{case}.json')['N'] if case in eligible else None,eligible=case in eligible))
    save(HERE/'schedule.json',schedule)
    scripts={case:dict(path=script(case,read(HERE/'selected'/f'{case}.json')['N']).relative_to(HERE).as_posix(),sha256=sha(script(case,read(HERE/'selected'/f'{case}.json')['N']))) for case in eligible}
    fixed=[HERE/'common.py',HERE/'run.py',HERE/'protocol.json',HERE/'manifest.json',HERE/'inputs.json',HERE/'cases/shared.js',*sorted((HERE/'inputs').glob('*'))]
    save(HERE/'frozen.json',dict(files={p.relative_to(HERE).as_posix():sha(p) for p in fixed},scripts=scripts,schedule_sha256=sha(HERE/'schedule.json'),eligible=eligible,timestamp=stamp()))
    r=capture('pre_formal_processes',['ps','-eo','pid,stat,comm,pcpu,args']);assert not any(len(l.split())>=3 and l.split()[2] in ['cc1','cc1plus','collect2','ld','perf'] for l in r['stdout'].splitlines()),'concurrent build/diagnosis'
    verify();stopped=set();print('FORMAL_FROZEN',90*len(eligible),'/360',flush=True)
    for row in schedule:
        if not row['eligible'] or row['case'] in stopped:continue
        r=invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'],clock)
        if not r['valid']:
            stopped.add(row['case']);save(HERE/'status'/f'{row["case"]}.formal.json',dict(status='FAILED_FORMAL',position=row,reason=r['failed_reason']))
        print('FORMAL_POSITION',row['index']+1,'/360',flush=True)
    verify();save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),boot_id=boot()))
    capture('environment_after',['sh','-c','uname -a; uptime; ps -eo pid,stat,comm,pcpu,args; true'])
    print('FORMAL_FINISHED_AWAIT_AUDIT',flush=True)
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['correctness','timer','campaign']);a=p.parse_args();globals()[a.stage]()
