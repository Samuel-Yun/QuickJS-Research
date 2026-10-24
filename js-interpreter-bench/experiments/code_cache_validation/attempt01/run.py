"""Two-condition V8-only comparison. All outputs belong to this attempt."""
import argparse, csv, io, random, re, sys
sys.dont_write_bytecode = True
from common import *
sys.path.insert(0,str(TIMER))
import campaign as frozen

SEED=2026100517
TARGET=1000.0
MAX_N=65536
TIMEOUT=120
REPS=30
GEN={name:frozen.Campaign(name) for name in ('SunSpider','Octane')}

def benchmark(case): return 'Octane' if '.' in case else 'SunSpider'
def script(case,n,correctness=False):
    p=HERE/'generated'/f'{case}.N{n}.{"correctness" if correctness else "measure"}.js'
    save(p,GEN[benchmark(case)].source(case,n,correctness))
    return p

def sections(stdout,condition):
    if condition==CONDITIONS[0]:
        if 'Run: Produce code cache' in stdout or 'Run: Consume code cache' in stdout: raise ValueError('unexpected cache headings in source')
        return [('source',stdout)]
    a='============ Run: Produce code cache ============'
    b='============ Run: Consume code cache ============'
    if stdout.count(a)!=1 or stdout.count(b)!=1: raise ValueError('cache segmentation failed')
    first,second=stdout.split(b)
    if a not in first:raise ValueError('producer/consumer order failed')
    return [('producer',first.split(a)[1]),('consumer',second)]

def parse(stdout,condition,case,n,correctness,outer_ns):
    out=[]
    for role,part in sections(stdout,condition):
        lines=re.findall(r'^TEB_RESULT:(.*)$',part,re.M)
        if len(lines)!=1:raise ValueError('one payload required for '+role)
        p=json.loads(lines[0])
        for key,value in {'benchmark':benchmark(case),'case':case,'mode':'MAIN_MONOTONIC_V1',
            'phase':'correctness' if correctness else 'measure','N':n,'correctness':'PASS','timer':'benchNow','warmup_calls':0}.items():
            if p.get(key)!=value:raise ValueError('identity mismatch '+role+' '+key)
        if benchmark(case)=='SunSpider' and p['checksum'] not in GEN['SunSpider'].checksums[case]:raise ValueError('frozen checksum mismatch')
        if not correctness:
            a,z,t,v=(p[k] for k in ('start_ms','stop_ms','elapsed_ms','elapsed_per_call_ms'))
            if not all(type(x) in (int,float) and math.isfinite(x) for x in (a,z,t,v)):raise ValueError('clock nonfinite')
            if t<=0 or z<a or not math.isclose(z-a,t,abs_tol=1e-8) or not math.isclose(t/n,v,abs_tol=1e-8):raise ValueError('clock chain')
            if t>outer_ns/1e6+5:raise ValueError('inner exceeds outer')
        else:
            if any(p[k] is not None for k in ('start_ms','stop_ms','elapsed_ms','elapsed_per_call_ms')):raise ValueError('unexpected correctness clock')
        out.append({'role':role,'payload':p,'valid':True,'clock_consistency':None if correctness else True,
                    'outer_enclosure_strength':'WEAK_BOTH_PASSES' if condition==CONDITIONS[1] else 'PROCESS_ENCLOSURE'})
    return out

def invoke(stage,case,condition,n,rep=0,order=0,schedule_index=None):
    correctness=stage in ('correctness','selected_correctness')
    p=script(case,n,correctness)
    cache='none' if condition==CONDITIONS[0] else 'code'
    cmd=command(p,['--cache='+cache])
    folder=HERE/'records'/stage/case
    stem=f'{condition}.N{n}.rep{rep}.order{order}'
    existing=sorted(folder.glob(stem+'.attempt*.json'))
    for f in existing:
        r=read(f)
        if r['valid']:
            if r['command']!=cmd or r['script_sha256']!=sha(p) or r['protocol_sha256']!=sha(HERE/'protocol.md'):raise RuntimeError('resume identity changed')
            return r
    e=read(HERE/'manifest.json')['engines']['v8']
    r={'cohort':read(HERE/'manifest.json')['cohort_id'],'experiment':'CODE_CACHE_EXECUTION_COMPARISON_V1',
       'condition':condition,'stage':stage,'case':case,'engine':'V8','shell':'d8','N':n,'rep':rep,'order':order,'schedule_index':schedule_index,
       'timestamp_utc':stamp(),'flags':e['runtime_flags']+['--cache='+cache],'command':cmd,'cwd':str(ROOT),
       'binary_sha256':e['binary']['sha256'],'dependency_hashes':{x['path']:x['sha256'] for x in e['dependencies']},
       'adapter_hashes':{str(x):sha(x) for x in (ROOT/'experiments/three_engine_baseline/adapters/v8.js',Path(e['timer_adapter']['path']))},
       'script_path':str(p),'script_sha256':sha(p),'protocol_sha256':sha(HERE/'protocol.md'),
       'cache_identity':{'origin':str(p),'source_sha256':sha(p),'same_source_both_passes':True,'version':e['version'],'flags':e['runtime_flags']},
       'cache_serialized_sha256':None,'cache_bytes_per_invocation':None,'cache_rejected_field':None,
       'cache_acceptance_this_invocation':'UNKNOWN_NOT_TRACED' if cache=='code' else 'NOT_REQUESTED',
       'cache_path_evidence':None if cache=='none' else f'probes/cache_proof/{case}.N{n}.json',
       'boot_id':Path('/proc/sys/kernel/random/boot_id').read_text().strip(),'load_average':os.getloadavg(),
       'warmup_calls':0,'diagnostic_flags':[],'LD_PRELOAD':None,'timeout_seconds':TIMEOUT,'attempt':len(existing)+1}
    a=time.perf_counter_ns();r['outer_start_ns']=a
    try:
        result=subprocess.run(cmd,cwd=ROOT,capture_output=True,timeout=TIMEOUT)
        r.update(exit_code=result.returncode,stdout=result.stdout.decode(errors='replace'),stderr=result.stderr.decode(errors='replace'))
    except subprocess.TimeoutExpired as ex:
        r.update(exit_code=None,stdout=(ex.stdout or b'').decode(errors='replace'),stderr=(ex.stderr or b'').decode(errors='replace'),failure='TIMEOUT')
    r['outer_stop_ns']=time.perf_counter_ns();r['external_wall_ns']=r['outer_stop_ns']-a
    try:
        if r['exit_code']!=0 or r['stderr']:raise ValueError('exit/stderr gate')
        r['segments']=parse(r['stdout'],condition,case,n,correctness,r['external_wall_ns'])
        r['target_role']='consumer' if cache=='code' else 'source'
        target=r['segments'][-1]['payload']
        r.update(elapsed_ms=target['elapsed_ms'],elapsed_per_call_ms=target['elapsed_per_call_ms'],checksum=target.get('checksum'),valid=True)
    except Exception as ex:r.update(valid=False,failure=r.get('failure',str(ex)),segments=r.get('segments',[]))
    f=folder/(stem+f'.attempt{r["attempt"]:02}.json');save(f,r)
    if not r['valid']:raise RuntimeError('preserved failure; stop affected experiment: '+str(f)+' '+r['failure'])
    return r

def proof(case,n):
    p=script(case,n)
    path=HERE/'probes/cache_proof'/f'{case}.N{n}.json'
    if path.exists():return read(path)
    diag=['--trace-serializer','--profile-deserialization','--print-bytecode']
    labels={}
    for condition,cache in zip(CONDITIONS,('none','code')):
        label=f'workload.{case}.N{n}.{cache}'
        r=capture(label,command(p,['--cache='+cache]+diag),TIMEOUT)
        if r['exit_code']!=0:raise RuntimeError('diagnostic failed '+label)
        parse(r['stdout'],condition,case,n,False,r['external_wall_ns'])
        labels[cache]=r
    s=labels['code']['stdout'];a,b=sections(s,CONDITIONS[1]);prod=a[1];consumer=b[1]
    events=re.findall(r'\[Serializing from[^\n]*"([^"\n]+)"[^\n]*\]|\[Serializing to (\d+) bytes took ([\d.]+) ms\]',prod)
    current=None;serialized=[]
    for name,size,elapsed in events:
        if name:current=name
        else:serialized.append({'origin':current,'size_bytes':int(size),'diagnostic_serialization_ms':float(elapsed)})
    restored=[{'size_bytes':int(size),'diagnostic_deserialization_ms':float(t)} for size,t in re.findall(r'\[Deserializing from (\d+) bytes took ([\d.]+) ms\]',consumer)]
    target=[x for x in serialized if x['origin']==str(p)]
    if len(target)!=1 or len(serialized)!=3 or len(restored)!=3:raise RuntimeError('target-script cache match missing '+case)
    if [x['size_bytes'] for x in serialized]!=[x['size_bytes'] for x in restored]:raise RuntimeError('cache size/order mismatch')
    direct=labels['none']['stdout']
    if '[Deserializing from ' in direct or '[Serializing from' in direct:raise RuntimeError('source consumed target cache')
    if '[generated bytecode for function:' in consumer:raise RuntimeError('unexpected consumer bytecode compile; investigate')
    result={'case':case,'N':n,'script_path':str(p),'script_sha256':sha(p),'evidence_level':'PROVEN_TARGET_SERIALIZATION_DESERIALIZATION',
            'basis':'explicit target origin in serialization; ordered three-script byte sizes match actual consumer deserialization; no consumer generated-bytecode event; payloads valid',
            'cache_rejected_field':None,'per_formal_invocation_acceptance_observation':None,'target_cache_size_bytes':target[0]['size_bytes'],
            'serialization_events':serialized,'deserialization_events':restored,'source_target_deserialization_observed':False,
            'diagnostic_log_code':f'probes/logs/workload.{case}.N{n}.code.stdout.txt',
            'diagnostic_log_source':f'probes/logs/workload.{case}.N{n}.none.stdout.txt',
            'diagnostic_flags':diag,'timing_scope_of_profile_deserialization':'UNKNOWN; diagnostic only, not primary stage metric',
            'function_coverage':'named static functions and bytecode observed in log; exhaustive dynamic/runtime coverage UNKNOWN'}
    save(path,result);return result

def prepare():
    initialize()
    for c in CASES:proof(c,1)
    save(HERE/'capabilities.json',{
        'status':'READY_VERIFIED_CACHE_PATH','binary_source_commit':None,'version_reference_commit':'37fb84941c9be9f9914ee50b1ad366f06a1bd764',
        'version_reference_source_retrieval':'FAILED_TIMEOUT_TLS; actual binary disassembly and runtime trace used instead',
        'interfaces':{k:{'supported':read(HERE/'probes/logs'/('cache_'+k+'.json'))['exit_code']==0,'evidence':'probes/logs/cache_'+k+'.json'} for k in ('none','code','after-execute','full-code-cache')},
        'cache_path':'IN_PROCESS_CROSS_ISOLATE','cache_storage':'Shell::cached_code_map_; serialized CachedData heap-owned buffer, not persistent file',
        'producer_position':'temporary fresh producer isolate via Shell::Main lambda; disposed; consumer uses distinct original main isolate',
        'isolation_evidence':'actual binary Shell::Main lambda Isolate::New/Dispose; CC_TOP globals and heap object undefined and calls=1 in both passes',
        'code_serialization_time':'before Script::Run/top-level execution; trace and ExecuteSource disassembly',
        'after_execute_serialization_time':'after Script::Run (separate diagnostic mode only)',
        'target_script_cache_acceptance_evidence':'PROVEN_TARGET_SERIALIZATION_DESERIALIZATION for all four N1 targets; selected-N proof required before sampling',
        'explicit_rejected_field':None,'per_formal_invocation_trace_enabled':False,'per_formal_invocation_acceptance_direct_observation':None,
        'persistent_save_load_cli_verified':None,'cross_process_cache_verified':None,'persisted_cache_files_created':False,
        'source_compile_metric_ms':None,'cache_validation_deserialization_metric_ms':None,'cache_only_startup_metric_ms':None,
        'profile_deserialization_intervals':'retained diagnostic values only; unverified boundaries, not parser/bytecode-generation metrics',
        'static_function_preparation_proven':['cacheStaticWorkload','cacheStaticCallee'],
        'exhaustive_static_and_dynamic_function_coverage':None,
        'default_lazy_probe':'bytecode generation for two named functions occurs after CC_TIMER_START',
        'no_lazy_probe':'two named function generation events occur before CC_TOP and CC_TIMER_START',
        'cached_probe':'target deserialization before CC_TOP; no new generated-bytecode event in consumer',
        'source_no_cache_control':'no Deserializing from target-code-cache event; snapshot deserialization distinct',
        'producer_cpu_os_cache_power_confound':True,'consumer_performance_warmup_calls':0,
        'timing':'frozen benchNow internal interval, isolate-local; producer/consumer not subtracted',
        'formal_conditions':list(CONDITIONS),'mechanism_budget_minutes':30})
    paths=[TIMER/'manifest.json',TIMER/'execution_contract.json',TIMER/'audit.json',TIMER/'campaign.py',
           TIMER/'drivers/sunspider.js',TIMER/'drivers/octane.js',TIMER/'adapters/v8.js',ROOT/'experiments/three_engine_baseline/adapters/v8.js']
    paths+=list((ROOT/'benchmarks/octane/upstream').glob('*.js'))
    paths+=list(frozen.baseline.STANDALONE_DIRECTORY.glob('*.js'))
    paths+=[Path(frozen.__file__),Path(frozen.repeated.__file__),Path(frozen.baseline.__file__),
            ROOT/'experiments/frontend_isolation/correctness/repeated.csv']
    paths+=list(HERE.glob('*.py'))+[HERE/'protocol.md']
    save(HERE/'input_manifest.json',{str(p.relative_to(ROOT)):sha(p) for p in sorted(set(paths))})
    print('PREPARED: four exact frozen target scripts cache path proven',flush=True)

def correctness():
    verify()
    for c in CASES:
        for n in (1,2):
            for cond in CONDITIONS:invoke('correctness',c,cond,n)
        print('CORRECTNESS',c,'N1/N2 PASS, source and both cached passes',flush=True)

def calibrate():
    verify()
    for c in CASES:
        selected=HERE/'selected_n'/f'{c}.json'
        if selected.exists():continue
        n=1
        while n<=MAX_N:
            rows=[invoke('calibration',c,cond,n) for cond in CONDITIONS]
            print('CALIBRATE',c,n,[round(r['elapsed_ms'],3) for r in rows],flush=True)
            if all(r['elapsed_ms']>=TARGET for r in rows):
                save(selected,{'case':c,'N':n,'source_ms':rows[0]['elapsed_ms'],'consumer_ms':rows[1]['elapsed_ms'],
                    'script_sha256':rows[0]['script_sha256'],'rule':'first power of two with A and B consumer >=1000ms'});break
            n*=2
        else:raise RuntimeError('N cap '+c)
        proof(c,n)
        for cond in CONDITIONS:invoke('selected_correctness',c,cond,n)

def schedule():
    rng=random.Random(SEED);alloc={}
    for c in CASES:
        alloc[c]=[list(CONDITIONS),list(reversed(CONDITIONS))]*15;rng.shuffle(alloc[c])
    result=[]
    for rep in range(1,31):
        cases=list(CASES);rng.shuffle(cases)
        for c in cases:
            n=read(HERE/'selected_n'/f'{c}.json')['N']
            for order,cond in enumerate(alloc[c][rep-1],1):result.append({'case':c,'condition':cond,'rep':rep,'order':order,'N':n,'index':len(result)+1})
    save(HERE/'schedule.json',{'seed':SEED,'rows':result});return result

def measure():
    verify()
    if read(HERE/'capabilities.json')['status']!='READY_VERIFIED_CACHE_PATH':raise RuntimeError('cache not proven')
    for c in CASES:
        n=read(HERE/'selected_n'/f'{c}.json')['N'];proof(c,n)
        for cond in CONDITIONS:
            r=invoke('selected_correctness',c,cond,n)
            if not r['valid']:raise RuntimeError('correctness gate')
    if not (HERE/'pre_sampling_processes.json').exists():capture_state()
    for row in schedule():
        r=invoke('formal',row['case'],row['condition'],row['N'],row['rep'],row['order'],row['index'])
        print(f"FORMAL {row['index']}/240 {row['case']} {row['condition']} {r['elapsed_ms']:.3f}ms",flush=True)
    verify()
    print('FORMAL COMPLETE; run independent audit/report',flush=True)

def capture_state():
    p=subprocess.run(['ps','-eo','pid,comm,args'],capture_output=True,text=True)
    lines=p.stdout.splitlines()
    competing=[x for x in lines if re.search(r'\b(d8|qjs|jsc|perf)\b',x) and 'code_cache_validation/attempt01/run.py' not in x]
    if competing:raise RuntimeError('competing engine/profiling process '+str(competing))
    save(HERE/'pre_sampling_processes.json',{'timestamp':stamp(),'stdout':p.stdout,'stderr':p.stderr,'competing_observed':competing})

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('stage',choices=('prepare','correctness','calibrate','measure','all'));args=parser.parse_args()
    if args.stage=='all':
        prepare();correctness();calibrate();measure()
    else:globals()[args.stage]()
