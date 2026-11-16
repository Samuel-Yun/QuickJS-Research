"""Frozen-runtime continuation. No engine builds, diagnostic runs or old writes."""
import argparse,collections,itertools,math,random,statistics,sys,traceback
from common import *
W=load_old('workload')
MATH=load_old('analyze')
BASELINE='6e4e3b2925cbd9925b7bed8e3e725785ba9238e4'

def invoke(stage,case,c,n,rep,pos,block=None):
    a=read(HERE/'runtime_frozen.json')['artifacts'][c]
    check=stage=='selected_correctness';p=W.script(case,n,check)
    identity=read(OLD/'scripts/identities'/case/f'N{START_N[case]}.{"correctness" if check else "measure"}.json')
    original=OLD/'scripts/workloads'/case/f'N{START_N[case]}.{"correctness" if check else "measure"}.js'
    assert sha(original)==identity['script_sha256']
    label=f'{stage}.{case}.r{rep}.{c}.p{pos}.N{n}'
    dest=HERE/'raw'/stage/case/(label+'.json');assert not dest.exists()
    save(HERE/'raw/started'/stage/(label+'.json'),dict(timestamp=stamp(),case=case,condition=c,N=n,rep=rep,position=pos,block=block,command=[a['path'],str(p)],option=option(c)))
    r=capture_qjs([a['path'],p],environment(c))
    r.update(cohort='WSL2_PROTO_ABLATION_'+HERE.name,mode='FIRST_CALL_INCLUSIVE_MONOTONIC',stage=stage,case=case,condition=c,N=n,rep=rep,position=pos,block=block,
      binary_sha256=a['sha256'],flags=[],script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),valid=False,elapsed_ms=None,internal_elapsed_ms=None,elapsed_per_Run_ms=None)
    try:
        d=W.valid_payload(r,case,n,check)
        assert r['boot_id']==r['boot_id_after']==read(HERE/'runtime_frozen.json')['boot_id']
        r.update(valid=True,payload=d,elapsed_ms=d['elapsed_ms'],internal_elapsed_ms=d['elapsed_ms'],elapsed_per_Run_ms=None if check else d['elapsed_ms']/n)
    except (AssertionError,ValueError,TypeError,KeyError) as e:r['failed_reason']=type(e).__name__+': '+str(e)
    save(dest,r);print(stage,case,c,'N',n,'rep',rep,'valid',r['valid'],'ms',r['elapsed_ms'],'CPUms',r['child_cpu_ms'],flush=True)
    assert r['valid'],label+' failed; do not retry'
    return r

def verify_runtime():
    a=read(OLD/'runtime_frozen.json')['artifacts'];records={}
    for c in ['M','H','OFF']:
        p=Path(a[c]['path']);assert sha(p)==a[c]['sha256'],str(p)
        f=subprocess.run(['file',str(p)],capture_output=True,text=True)
        d=subprocess.run(['ldd',str(p)],capture_output=True,text=True)
        assert f.returncode==d.returncode==0 and 'x86-64' in f.stdout and 'not found' not in d.stdout
        deps={}
        for name in re.findall(r'(/[^\s()]+)',d.stdout):
            q=Path(name)
            if q.is_file():deps[name]=dict(realpath=str(q.resolve()),sha256=sha(q))
        records[c]=dict(path=str(p),realpath=str(p.resolve()),sha256=sha(p),size=p.stat().st_size,file=f.stdout,ldd=d.stdout,dependencies=deps)
    records['ON']=records['OFF'];return records

def cpu_snapshot():
    out={}
    for line in Path('/proc/stat').read_text().splitlines():
        fields=line.split()
        if re.fullmatch(r'cpu\d+',fields[0]):out[int(fields[0][3:])]=list(map(int,fields[1:9]))
    return out

def preparation():
    # Rule frozen in protocol before the single observation, not benchmark CPU shopping.
    allowed=sorted(os.sched_getaffinity(0));before=cpu_snapshot();t=time.perf_counter_ns();time.sleep(1);after=cpu_snapshot()
    loads={}
    for cpu in allowed:
        delta=[a-b for a,b in zip(after[cpu],before[cpu])];total=sum(delta)
        loads[cpu]=(total-delta[3]-delta[4])/total if total else 0
    ranked=sorted(allowed,key=lambda c:(loads[c],c));topology={}
    for cpu in allowed:
        td=Path(f'/sys/devices/system/cpu/cpu{cpu}/topology')
        topology[cpu]={name:(td/name).read_text().strip() if (td/name).exists() else 'UNKNOWN' for name in ['thread_siblings_list','core_id','physical_package_id']}
    primary=ranked[0]
    siblings=topology[primary]['thread_siblings_list']
    alternate=next((c for c in ranked if c!=primary and topology[c]['thread_siblings_list']!=siblings),next((c for c in ranked if c!=primary),None))
    ps=subprocess.run(['ps','-eo','pid,ppid,stat,comm,args'],capture_output=True,text=True)
    # We launched no parallel job. Do not kill unrelated jobs; save and refuse conflicts.
    conflicts=[s for s in ps.stdout.splitlines() if len(s.split())>=4 and s.split()[3] in ['qjs','cc1','cc1plus','collect2','ld','perf']]
    save(HERE/'environment.json',dict(timestamp=stamp(),platform=platform.platform(),host=platform.node(),kernel=platform.release(),architecture=platform.machine(),boot_id=boot(),os_release=Path('/etc/os-release').read_text(),cpuinfo=Path('/proc/cpuinfo').read_text(),allowed_cpu_set=allowed,loadavg=Path('/proc/loadavg').read_text(),cpu_observation_ms=(time.perf_counter_ns()-t)/1e6,cpu_busy_fraction=loads,cpu_rank=ranked,primary_cpu=primary,alternate_cpu=alternate,topology=topology,physical_host_SMT_mapping='UNKNOWN: WSL reports virtual topology only',proc_snapshot=ps.stdout,own_parallel_jobs_started=0,conflicting_jobs=conflicts,frequency='UNKNOWN',temperature='UNKNOWN',host_scheduling_control='UNKNOWN',system_configuration_changes=False))
    assert not conflicts,'existing engine/build worker: not killed; pause external worker before a new attempt'
    os.sched_setaffinity(0,{primary})
    save(HERE/'affinity0.json',dict(timestamp=stamp(),cpu=primary,actual=sorted(os.sched_getaffinity(0)),rule='minimum busy fraction in one /proc/stat 1s interval, tie smallest logical CPU',alternate_preselected=alternate))
    return primary,alternate

def short_gate(primary,alternate):
    n=START_N['numeric_control']
    for d in range(3):
        r=invoke('precalibration','numeric_control','H',n,d,0)
        if r['elapsed_ms']>=1000:break
        n*=2
    else:raise RuntimeError('PRECALIBRATION_LIMIT')
    save(HERE/'precalibration.json',dict(N=n,processes=d+1))
    for group,cpu in enumerate([primary,alternate]):
        if cpu is None:break
        if group:
            os.sched_setaffinity(0,{cpu})
            save(HERE/'one_environment_rearrangement.json',dict(timestamp=stamp(),action='move all conditions from first selected virtual CPU to the preselected different-topology alternate',from_cpu=primary,to_cpu=cpu,selection='both fixed from ONE pre-benchmark system-load observation; no benchmark comparison across candidates',system_configuration_changed=False,boot_id=boot()))
        vals=[]
        for rep in range(12):vals.append(invoke('stability'+str(group),'numeric_control','H',n,rep,0)['elapsed_ms'])
        s=MATH.stats(vals);iqr=s['IQR']/s['median'];spread=s['max']/s['min'];passed=iqr<=.1 and spread<=1.25
        save(HERE/'stability'/f'group{group}.json',dict(group=group,N=n,cpu=cpu,boot_id=boot(),cohort=f'{HERE.name}.cpu{cpu}',passed=passed,elapsed_ms_in_time_order=vals,IQR_over_median=iqr,max_over_min=spread,**s))
        print('STABILITY',group,'passed',passed,'IQR/median',iqr,'max/min',spread,flush=True)
        if passed:
            save(HERE/'gates/stability.json',dict(status='PASS',group=group,cpu=cpu,N=n,boot_id=boot()));return n
    save(HERE/'gates/stability.json',dict(status='PERFORMANCE_ENV_UNSTABLE'))
    save(HERE/'performance_stop.json',dict(status='PERFORMANCE_ENV_UNSTABLE',formal_target=384,formal_actual=0,reason='bounded original-H repeated-process stability gate failed; no formal collection',timestamp=stamp()))
    return None

def calibrate(numeric_n):
    for case in CASES:
        n=numeric_n if case=='numeric_control' else START_N[case]
        for doubling in range(3):
            pilots=[]
            for rep in range(2):
                order=CONDS[rep:]+CONDS[:rep]
                for pos,c in enumerate(order):pilots.append(invoke('pilot',case,c,n,rep,pos))
            if min(r['elapsed_ms'] for r in pilots)>=1000:break
            n*=2
        else:raise RuntimeError('CALIBRATION_LIMIT '+case)
        save(HERE/'selected'/f'{case}.json',dict(case=case,N=n,doublings=doubling,pilot_min_ms=min(r['elapsed_ms'] for r in pilots)))
        for pos,c in enumerate(CONDS):invoke('selected_correctness',case,c,n,0,pos)
    csvout(HERE/'selected_n.csv',[read(HERE/'selected'/f'{c}.json') for c in CASES])

def schedule():
    # Reuse archived ordering, NOT archived executions; update N.
    rows=read(OLD/'schedule.json')
    for s in rows:s['N']=read(HERE/'selected'/f'{s["case"]}.json')['N'] if (HERE/'selected'/f'{s["case"]}.json').exists() else START_N[s['case']]
    return rows

def collect():
    assert not (HERE/'started.json').exists(),'immutable attempt; use --new-attempt attemptNN'
    save(HERE/'started.json',dict(timestamp=stamp(),budget_seconds=7200,reference_commit=BASELINE))
    protocol=read(OLD/'protocol.json');protocol.update(reference_commit=BASELINE,task_budget_seconds=7200,preparation_budget_seconds=1200,
      collection_order='runtime identity -> one system CPU observation -> max3 precalibration -> 12 stability, at most one affinity rearrangement +12 -> pilots ->16 correctness ->384 formal',
      cpu_selection_rule='one /proc/stat 1s delta over allowed CPUs, minimum busy fraction/tie minimum index; alternate preselected on different reported sibling set if possible; at most one fail-triggered move, no benchmark CPU sweep',
      child_cpu_measurement='sequential direct subprocess; RUSAGE_CHILDREN utime/stime delta; whole process not internal region')
    save(HERE/'protocol.json',protocol)
    needed=['README.md','results.md','decision.md','protocol.json','runtime_frozen.json','manifest.json','performance.py','analyze.py','completion.json','workload.py','common.py','schedule.json','gates/semantic.json','gates/workload.json','gates/lifecycle.json','gates/mechanism.json','gates/serialization.json','gates/sanitizer.json']
    oldhashes={name:sha(OLD/name) for name in needed}
    save(HERE/'reused_evidence.json',dict(source_attempt='attempt01',reference_commit=BASELINE,files=oldhashes,new_semantic_executions=0,new_diagnostic_executions=0,sanitizer='NOT_COMPLETED_BUILD_INTERRUPTED; unchanged limitation',scope='old semantic64/workload32/diagnostic16/lifecycle/serialization reused only after identical ELF identity; not new processes'))
    try:
        a=verify_runtime();save(HERE/'manifest.json',dict(timestamp=stamp(),artifacts=a,source_manifest=dict(relative='../attempt01/manifest.json',sha256=sha(OLD/'manifest.json')),engine_source_changes=0,builds=0))
        save(HERE/'runtime_frozen.json',dict(timestamp=stamp(),artifacts=a,boot_id=boot(),protocol_sha256=sha(HERE/'protocol.json')))
        # Archive all eight input files and identities before any workload process.
        for case in CASES:
            for check in [False,True]:W.script(case,START_N[case],check)
        primary,alternate=preparation()
        numeric=short_gate(primary,alternate)
        if numeric is not None:
            calibrate(numeric)
            rows=schedule();save(HERE/'schedule.json',rows)
            files=['protocol.json','common.py','run.py','analyze.py','manifest.json','runtime_frozen.json','schedule.json']
            frozen=dict(timestamp=stamp(),boot_id=boot(),affinity=sorted(os.sched_getaffinity(0)),files={f:sha(HERE/f) for f in files},scripts={str(p.relative_to(HERE)):sha(p) for p in (HERE/'scripts').rglob('*.js')})
            save(HERE/'formal_frozen.json',frozen)
            before=verify_runtime()
            for c in CONDS:
                for field in ['path','realpath','sha256','size','dependencies']:assert before[c][field]==a[c][field],'pre-formal identity changed'
            for row in rows:
                assert boot()==frozen['boot_id'] and sorted(os.sched_getaffinity(0))==frozen['affinity'],'cohort changed; do not fill partial block'
                invoke('formal',row['case'],row['condition'],row['N'],row['block'],row['position'],row['block'])
                print('FORMAL_COMPLETED',row['index']+1,'/384',flush=True)
            # ldd has random load addresses; compare stable identity fields below.
        if not (HERE/'schedule.json').exists():save(HERE/'schedule.json',schedule())
        after=verify_runtime()
        for c in CONDS:
            for field in ['path','realpath','sha256','size','dependencies']:assert a[c][field]==after[c][field]
        save(HERE/'identity_after.json',dict(timestamp=stamp(),boot_id=boot(),artifacts=after,status='PASS'))
    except Exception as e:
        if not (HERE/'performance_stop.json').exists():save(HERE/'performance_stop.json',dict(status='BLOCKED_RUNTIME' if not (HERE/'manifest.json').exists() else 'COLLECTION_STOPPED',error=repr(e),traceback=traceback.format_exc(),timestamp=stamp()))
        print(traceback.format_exc(),flush=True)
        if not (HERE/'schedule.json').exists():save(HERE/'schedule.json',schedule())
    for name,digest in oldhashes.items():assert sha(OLD/name)==digest,'old attempt changed'
    save(HERE/'old_identity_after.json',dict(status='PASS',files=oldhashes))
    print('COLLECTION_FINISHED; run raw-only analyzer',flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--new-attempt',help='new unused sibling attemptNN; copies runner only, never overwrite old raw');args=p.parse_args()
    if args.new_attempt:
        assert re.fullmatch(r'attempt\d{2,}',args.new_attempt)
        dest=HERE.parent/args.new_attempt;assert not dest.exists(),'choose an UNUSED attempt'
        for name in ['common.py','run.py','analyze.py','host_record.py','.gitattributes','.gitignore']:save(dest/name,(HERE/name).read_bytes())
        os.execv(sys.executable,[sys.executable,'-B',str(dest/'run.py')])
    collect()
