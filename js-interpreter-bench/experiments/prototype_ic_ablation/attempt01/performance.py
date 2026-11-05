"""One bounded performance flow: affinity -> pilots -> stability -> maybe formal."""
import argparse,itertools,math,random,statistics
from common import *
from workload import script,valid_payload

def describe(values):
    a=sorted(values);half=len(a)//2
    med=statistics.median(a);q1=statistics.median(a[:half]);q3=statistics.median(a[-half:])
    return dict(samples=len(a),median_ms=med,Q1_ms=q1,Q3_ms=q3,min_ms=a[0],max_ms=a[-1],IQR_over_median=(q3-q1)/med,max_over_min=a[-1]/a[0])

def invoke(stage,case,c,n,rep,position,block=None):
    a=read(HERE/'runtime_frozen.json')['artifacts'][c];check=stage in ['selected_correctness']
    p=script(case,n,check);label=f'{stage}.{case}.r{rep}.{c}.p{position}.N{n}'
    dest=HERE/'raw'/stage/case/(label+'.json');assert not dest.exists()
    save(HERE/'raw/started'/stage/(label+'.json'),dict(timestamp=stamp(),condition=c,case=case,N=n,rep=rep,position=position,command=[a['path'],str(p)],option=option(c)))
    r=capture(label,[a['path'],p],env=environment(option(c)))
    r.update(cohort='WSL2_PROTO_ABLATION_20261029',mode='FIRST_CALL_INCLUSIVE_MONOTONIC',stage=stage,case=case,condition=c,N=n,rep=rep,position=position,block=block,
      binary_sha256=a['sha256'],flags=[],script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),valid=False,elapsed_ms=None,elapsed_per_Run_ms=None)
    try:
        d=valid_payload(r,case,n,check);r.update(valid=True,payload=d,elapsed_ms=d['elapsed_ms'],elapsed_per_Run_ms=None if check else d['elapsed_ms']/n)
    except (AssertionError,ValueError,TypeError,KeyError) as e:r['failed_reason']=type(e).__name__+': '+str(e)
    save(dest,r);print(stage,case,c,n,rep,'PASS' if r['valid'] else 'FAIL',r['elapsed_ms'],flush=True);return r

def fixed_affinity():
    allowed=sorted(os.sched_getaffinity(0));cpu=allowed[-1]
    try:os.sched_setaffinity(0,{cpu});success=True
    except OSError:success=False
    save(HERE/'affinity.json',dict(timestamp=stamp(),allowed_original=allowed,selection_rule='last allowed CPU, chosen before pilots; no outcome-based selection',selected_cpu=cpu if success else None,applied=success,actual=sorted(os.sched_getaffinity(0)),host=platform.node(),kernel=platform.release(),architecture=platform.machine(),boot_id=boot(),host_frequency_power_control='UNKNOWN',host_Windows_background='UNKNOWN',system_configuration_changed=False))
    return cpu if success else None

def prepare():
    a=artifacts();fixed_affinity()
    save(HERE/'runtime_frozen.json',dict(timestamp=stamp(),artifacts=a,protocol_sha256=sha(HERE/'protocol.json'),affinity_sha256=sha(HERE/'affinity.json'),option_values={c:option(c) for c in CONDS}))
    r=capture('performance_processes_before',['ps','-eo','pid,ppid,stat,comm,pcpu,args'])
    assert not any(len(l.split())>=4 and l.split()[3] in ['cc1','cc1plus','collect2','ld','perf','qjs'] for l in r['stdout'].splitlines()),'own build/diagnostic/benchmark still running'
    for c in CONDS:
        p=HERE/'scripts/timer_probe.js';save(p,(OLD/'scripts/timer_probe.js').read_bytes())
        r=capture('timer.'+c,[a[c]['path'],p],env=environment(option(c)));assert r['exit_code']==0 and not r['stderr']
        d=json.loads(r['stdout']);assert d['changes']>0 and d['min_positive_ms']>0

def calibration():
    selected=[]
    for case in CASES:
        n=START_N[case]
        for doubling in range(3):
            pilots=[]
            for rep in range(2):
                order=CONDS[rep:]+CONDS[:rep]
                for pos,c in enumerate(order):
                    r=invoke('pilot',case,c,n,rep,pos);pilots.append(r)
                    if not r['valid']:
                        save(HERE/'performance_stop.json',dict(status='PILOT_FAILED',case=case,N=n));return False
            if min(x['elapsed_ms'] for x in pilots)>=1000:
                for pos,c in enumerate(CONDS):
                    r=invoke('selected_correctness',case,c,n,0,pos);assert r['valid']
                row=dict(case=case,N=n,doublings=doubling,pilot_min_ms=min(x['elapsed_ms'] for x in pilots),pilot_max_ms=max(x['elapsed_ms'] for x in pilots))
                selected.append(row);save(HERE/'selected'/f'{case}.json',row);break
            n*=2
        else:
            save(HERE/'performance_stop.json',dict(status='CALIBRATION_LIMIT',case=case,max_doublings=2));return False
    csvout(HERE/'selected_n.csv',selected);save(HERE/'gates/calibration.json',dict(status='PASS',pilot_per_condition=2,cases=4,all_selected_pilots_at_least_ms=1000));return True

def schedule():
    rng=random.Random(SEED);cases=[]
    for _ in range(6):
        base=CASES.copy();rng.shuffle(base);cases.extend(base[i:]+base[:i] for i in range(4))
    rng.shuffle(cases);orders={case:list(itertools.permutations(CONDS)) for case in CASES}
    for order in orders.values():rng.shuffle(order)
    rows=[]
    for block,order in enumerate(cases):
        for cp,case in enumerate(order):
            for pos,c in enumerate(orders[case][block]):rows.append(dict(index=len(rows),block=block,case=case,case_position=cp,condition=c,position=pos,N=read(HERE/'selected'/f'{case}.json')['N']))
    return rows

def stability():
    n=read(HERE/'selected/numeric_control.json')['N'];checks=[]
    for group in [0,1]:
        values=[]
        for rep in range(12):
            r=invoke('stability'+str(group),'numeric_control','H',n,rep,0);assert r['valid'];values.append(r['elapsed_ms'])
        d=describe(values);passed=d['IQR_over_median']<=0.10 and d['max_over_min']<=1.25
        result=dict(group=group,N=n,condition='original H',passed=passed,elapsed_ms_in_time_order=values,**d)
        save(HERE/'stability'/f'group{group}.json',result);checks.append(result)
        if passed:
            save(HERE/'gates/stability.json',dict(status='PASS',groups=checks,engineering_not_significance=True));return True
        if group==0:
            # Only one bounded non-source rearrangement; no hidden system tuning.
            before=capture('one_cleanup_process_snapshot',['ps','-eo','pid,ppid,stat,comm,pcpu,args'])
            assert not any(len(l.split())>=4 and l.split()[3] in ['cc1','cc1plus','collect2','ld','perf','qjs'] for l in before['stdout'].splitlines())
            affinity=read(HERE/'affinity.json')
            if affinity['applied']:os.sched_setaffinity(0,{affinity['selected_cpu']})
            begin=time.perf_counter_ns();time.sleep(10)
            save(HERE/'one_environment_rearrangement.json',dict(timestamp=stamp(),action='no own parallel worker found; reapply same fixed affinity; one 10s idle window before final recheck',idle_monotonic_ns=time.perf_counter_ns()-begin,power_WSL_source_changes=False,additional_rechecks_allowed=0))
    save(HERE/'gates/stability.json',dict(status='PERFORMANCE_ENV_UNSTABLE',groups=checks,engineering_not_significance=True))
    save(HERE/'performance_stop.json',dict(status='PERFORMANCE_ENV_UNSTABLE',formal_actual=0,formal_target=384,reason='both 12-process original-H numeric_control groups exceeded preset dispersion limits',next='new quiet window and new cohort, same experiment; no new IC design'))
    return False

def formal(rows):
    frozen=read(HERE/'formal_frozen.json');aff=read(HERE/'affinity.json')
    print('FORMAL_START target384',flush=True)
    for s in rows:
        assert boot()==frozen['boot_id'],'no cross-boot completion'
        if aff['applied']:assert sorted(os.sched_getaffinity(0))==[aff['selected_cpu']]
        r=invoke('formal',s['case'],s['condition'],s['N'],s['block'],s['position'],s['block'])
        print('FORMAL_COMPLETED',s['index']+1,'/384',flush=True)
        if not r['valid']:
            save(HERE/'performance_stop.json',dict(status='FORMAL_FAILED',last=s,reason=r.get('failed_reason')));break

def main():
    for gate in ['semantic','workload','lifecycle','mechanism','serialization']:assert read(HERE/'gates'/(gate+'.json'))['status']=='PASS'
    # New sanitizer is optional in the requested protocol, not a new formal gate.
    assert (HERE/'gates/sanitizer.json').exists()
    prepare()
    if not calibration():return
    rows=schedule();save(HERE/'schedule.json',rows)
    frozen=dict(timestamp=stamp(),boot_id=boot(),target=384,seed=SEED,
      files={name:sha(HERE/name) for name in ['protocol.json','common.py','workload.py','performance.py','manifest.json','runtime_frozen.json','schedule.json']},
      scripts={str(script(case,read(HERE/'selected'/f'{case}.json')['N']).relative_to(HERE)):sha(script(case,read(HERE/'selected'/f'{case}.json')['N'])) for case in CASES})
    save(HERE/'formal_frozen.json',frozen)
    if stability():formal(rows)
    artifacts();save(HERE/'identity_after_performance.json',dict(status='PASS',timestamp=stamp(),boot_id=boot(),performance_boot=frozen['boot_id']))
    print('PERFORMANCE_FLOW_FINISHED',flush=True)

if __name__=='__main__':main()
