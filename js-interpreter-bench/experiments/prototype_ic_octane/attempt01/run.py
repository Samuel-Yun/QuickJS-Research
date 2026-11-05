"""Serial five-condition full Octane campaign, preserving original driver and algorithms."""
import argparse,itertools,random,traceback
from common import *
from prepare import prepare,verify_runtime

def script(case,n,phase='measure',read_adapter=True):
    row=next(r for r in read(HERE/'case_catalog.json') if r['case']==case)
    driver=(HERE/'inputs/driver.js').read_text(encoding='utf-8')
    for key,value in dict(CONFIG=json.dumps(dict(case=case,N=n,phase=phase)),SUITE=json.dumps(row['suite']),INDEX=str(row['index']),BENCHMARK=json.dumps(row['benchmark'])).items():driver=driver.replace('__'+key+'__',value)
    pieces=[(HERE/'inputs/adapter.js').read_bytes()]
    if case.startswith('Crypto.'):pieces.append((HERE/'inputs/crypto_preload.js').read_bytes())
    if case=='zlib.zlib' and read_adapter:pieces.append((HERE/'inputs/zlib_read.js').read_bytes())
    pieces += [(HERE/'inputs/octane'/f).read_bytes() for f in row['files']]+[driver.encode()]
    suffix='.read' if case=='zlib.zlib' and read_adapter else ''
    p=HERE/'scripts'/case/f'N{n}.{phase}{suffix}.js';data=b'\n;\n'.join(pieces);save(p,data)
    old=SOURCE/'scripts'/case/f'N{n}.{phase}.js'
    if case in BASE_CASES and old.exists():assert data==old.read_bytes(),'GLOBAL_SCRIPT_IDENTITY '+case
    return p

def invoke(stage,case,c,n,rep,pos,index=None,read_adapter=True):
    suffix='.read' if case=='zlib.zlib' and read_adapter else ''
    dest=HERE/'raw'/stage/case/f'N{n}.rep{rep:02d}.pos{pos}.{c}{suffix}.json'
    assert not dest.exists(),'no re-run of an executed position'
    phase='correctness' if stage in ['correctness','selected_correctness','compatibility'] else 'measure'
    p=script(case,n,phase,read_adapter);rt=read(HERE/'runtime.json');a=rt['artifacts'][c]
    flags=['--std'] if case=='zlib.zlib' and read_adapter else []
    cmd=[a['path'],*flags,str(p)]
    label=f'{stage} {case} {c} N{n} rep{rep}'
    save(HERE/'raw/started'/stage/case/dest.name,dict(command=cmd,timestamp=stamp(),script_sha256=sha(p),case=case,condition=c,N=n,rep=rep,order=pos,schedule_index=index))
    r=capture_qjs(cmd,c,label)
    r.update(case=case,condition=c,N=n,rep=rep,order=pos,schedule_index=index,stage=stage,cohort=rt['cohort'],mode=MODE,flags=flags,input_manifest_sha256=sha(HERE/'inputs.json'),binary_sha256=a['sha256'],script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),valid=False,elapsed_ms=None,internal_elapsed_ms=None,elapsed_per_Run_ms=None,checksum=None,failed_reason=None)
    timer_check=False
    try:
        assert r['boot_id']==r['boot_id_after']==rt['boot_id'],'GLOBAL_BOOT_CHANGED'
        assert r['affinity']==read(HERE/'environment.json')['affinity'],'GLOBAL_AFFINITY_CHANGED'
        assert r['exit_code']==0 and not r['stderr'] and not r['timeout'],'process exit/stderr/timeout'
        found=re.findall(r'^OCTANE_IC_RESULT:(.*)$',r['stdout'],re.M);assert len(found)==1,'payload count'
        d=json.loads(found[0]);r['payload']=d
        assert d['case']==case and d['N']==n and d['mode']==MODE and d['phase']==phase and d['correctness']=='PASS' and d['warmup_calls']==0,'payload/correctness'
        timer_check=True;start,stop,elapsed=[d[k] for k in ['start_ms','stop_ms','elapsed_ms']]
        assert all(math.isfinite(t) for t in [start,stop,elapsed]) and elapsed>=0 and stop-start==elapsed,'GLOBAL_TIMER arithmetic'
        assert elapsed<=r['external_wall_ms']+5,'GLOBAL_TIMER enclosure'
        if stage in ['pilot','formal']:assert elapsed>0,'GLOBAL_TIMER zero elapsed'
        if case.startswith('Crypto.') and (HERE/'crypto'/f'{case}.N{n}.json').exists():
            gate=read(HERE/'crypto'/f'{case}.N{n}.json');assert gate['status']=='PASS_BOUNDED_INPUT_IDENTITY' and d['checksum']==gate['final_ciphertext'],'Crypto final ciphertext mismatch'
        r.update(valid=True,elapsed_ms=elapsed,internal_elapsed_ms=elapsed,elapsed_per_Run_ms=elapsed/n,checksum=d['checksum'],timer_duration_enclosed=True,parent_child_absolute_origin_verified=False)
    except (AssertionError,ValueError,KeyError,TypeError) as e:r['failed_reason']=str(e)
    save(dest,r);print('RESULT',label,r['valid'],r['elapsed_ms'],flush=True)
    if not r['valid'] and (r['failed_reason'].startswith('GLOBAL_') or re.search(r'unknown flag|unrecognized option|unrecognized flag',r['stderr'],re.I)):raise RuntimeError('GLOBAL_CONTRADICTION '+str(dest))
    return r

def clock_and_control():
    clock=HERE/'inputs/clock_probe.js'
    save(clock,(HERE/'inputs/adapter.js').read_bytes()+b'\nvar begin=__icoNow(),last=begin,changes=0,min=Infinity;for(var i=0;i<50000;i++){var now=__icoNow();if(now<last)throw Error("nonmonotonic");if(now>last){changes++;min=Math.min(min,now-last);}last=now;}console.log("CLOCK:"+JSON.stringify({begin:begin,end:last,elapsed:last-begin,changes:changes,min_positive_ms:min}));\n')
    for c in CONDITIONS:
        cmd=prefixes()[c]+[str(clock)];r=capture_qjs(cmd,c,'clock '+c)
        assert r['exit_code']==0 and not r['stderr'],'GLOBAL_CLOCK process'
        d=json.loads(re.findall(r'^CLOCK:(.*)$',r['stdout'],re.M)[0]);assert 0<=d['elapsed']<=r['external_wall_ms']+5 and d['changes']>0 and d['min_positive_ms']>0,'GLOBAL_CLOCK precision'
        save(HERE/'raw/capability'/f'clock_{c}.json',dict(**r,payload=d))
    source=ABLATION/'scripts/workloads/numeric_control/N32768.measure.js';dest=HERE/'scripts/numeric_control.js';save(dest,source.read_bytes())
    # Three original-H processes only; no stability threshold or cancellation.
    for rep in range(3):
        r=capture_qjs(prefixes()['H']+[str(dest)],'H','descriptive numeric control '+str(rep))
        assert r['exit_code']==0 and not r['stderr'],'GLOBAL_CONTROL process'
        d=json.loads(re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M)[0]);assert d['last']==8386560 and d['checksum']==32768*8386560 and d['elapsed_ms']>0,'GLOBAL_CONTROL correctness/timer'
        save(HERE/'raw/environment_control'/f'H.rep{rep}.json',dict(**r,payload=d,performance_sample=False,gate=False))

def compatibility():
    started=time.perf_counter_ns();rows=[]
    for c in CONDITIONS:rows.append(invoke('compatibility','Box2D.Box2D',c,1,0,CONDITIONS.index(c)))
    # Original Run returns no result, local world is inaccessible afterwards; do not fabricate an oracle.
    box_ok=all(r['valid'] for r in rows)
    box=dict(case='Box2D.Box2D',status='RUNS_NO_TRUSTED_OUTPUT_GATE' if box_ok else 'COMPATIBILITY_FAILED',formal_included=False,reason='original runBox2D creates local world and steps20 times; no final output/checksum assertion, teardown nulls globals; successful internal assertions/exit alone not a whole-result gate',actual_records=5,valid_process_records=sum(r['valid'] for r in rows))
    # Confirm the old read() failure on the actual binaries, then a shared host adapter.
    original=[invoke('compatibility_original','zlib.zlib',c,1,0,CONDITIONS.index(c),read_adapter=False) for c in CONDITIONS]
    adapted=[]
    if (time.perf_counter_ns()-started)/1e9<1500:
        for c in CONDITIONS:
            if (time.perf_counter_ns()-started)/1e9>1800:break
            adapted.append(invoke('compatibility','zlib.zlib',c,1,0,CONDITIONS.index(c)))
    z_ok=len(adapted)==5 and all(r['valid'] for r in adapted)
    # Admission needs original validation evidence, reviewed in extension_validation.md before collection.
    review=read(HERE/'extension_review.json')
    z_included=z_ok and review['zlib_original_validation_trusted'] is True
    z=dict(case='zlib.zlib',status='PASS_ORIGINAL_VALIDATION_WITH_READ_ADAPTER' if z_included else 'NO_TRUSTED_OUTPUT_GATE' if z_ok else 'COMPATIBILITY_FAILED',formal_included=z_included,reason=review['zlib_reason'],actual_records=len(original)+len(adapted),valid_process_records=sum(r['valid'] for r in original+adapted),flags=['--std'],read_adapter='inputs/zlib_read.js',Run_IO_dynamic_compile_not_moved=True)
    save(HERE/'extension_compatibility.json',dict(timestamp=stamp(),elapsed_seconds=(time.perf_counter_ns()-started)/1e9,budget_seconds=1800,Box2D=box,zlib=z))
    coverage=[dict(case=k,status='PENDING_CORRECTNESS',formal_included=True,reason='existing canonical Run and frozen correctness contract') for k in BASE_CASES]+[box,z]+[dict(case=k,status='NOT_THIS_METRIC',formal_included=False,reason='official adaptive latency, not complete Run execution time') for k in ['Splay.latency','Mandreel.latency']]
    save(HERE/'coverage_frozen.json',coverage)
    csvout(HERE/'coverage_frozen.csv',[{k:r.get(k) for k in ['case','status','formal_included','reason']} for r in coverage])
    formal_cases=BASE_CASES+(['zlib.zlib'] if z_included else [])
    save(HERE/'formal_cases.json',formal_cases)
    print('COVERAGE_FROZEN',len(formal_cases),'formal cases',flush=True)

def correctness():
    rows=[];this_audit=[]
    for case in read(HERE/'formal_cases.json'):
        rr=[]
        for n in [1,2]:
            for pos,c in enumerate(CONDITIONS):rr.append(invoke('correctness',case,c,n,n,pos))
        rows+=rr
        if not all(r['valid'] for r in rr):block(case,'correctness','N1/N2 original result/process failed; all five conditions preserved','BLOCKED_CORRECTNESS');continue
        source=rr[0]['payload']['run_source'];clean=re.sub(r'/\*.*?\*/|//[^\n]*','',source,flags=re.S)
        safe=not re.search(r'\bthis\b',clean) and '[native code]' not in clean
        this_audit.append(dict(case=case,registered_Run_source=source,sha256=hashlib.sha256(source.encode()).hexdigest(),no_this_token=safe,source='actual QuickJS A function; frozen registration/driver same for all five conditions'))
        if not safe:block(case,'this','Run entry receiver needs review','BLOCKED_THIS_REVIEW');continue
        if case.startswith('Crypto.'):
            from crypto_inputs import validate
            for n in [1,2]:
                budget()
                if not validate(case,n):break
    csvout(HERE/'correctness.csv',[{k:r[k] for k in ['case','condition','N','valid','exit_code','checksum','script_sha256']} for r in rows])
    save(HERE/'run_this_audit.json',this_audit)
    save(HERE/'correctness_gate.json',dict(expected=len(read(HERE/'formal_cases.json'))*10,actual=len(rows),valid=sum(r['valid'] for r in rows),base_expected=160,base_valid=sum(r['valid'] and r['case'] in BASE_CASES for r in rows),eligible=[k for k in read(HERE/'formal_cases.json') if not blocked(k)]))
    print('N1N2_CORRECTNESS_DONE',len(rows),flush=True)

def pilot_start(case):
    rr=[read(p) for p in (HERE/'raw/correctness'/case).glob('*.json')];est=[r['elapsed_per_Run_ms'] for r in rr if r['valid'] and r['elapsed_per_Run_ms']>0]
    fast,slow=min(est),max(est);row=next(r for r in read(HERE/'case_catalog.json') if r['case']==case)
    old=read(SOURCE/'selected'/f'{case}.json')['N'] if (SOURCE/'selected'/f'{case}.json').exists() else row['old_N_reference']
    target=2**max(0,math.ceil(math.log2(1500/fast)));cap=2**max(0,math.floor(math.log2(30000/slow)))
    start=max(1,min(old,target,cap,MAX_N));save(HERE/'pilot_start'/f'{case}.json',dict(N=start,old_N=old,fast_N1N2_ms_per_Run=fast,slow_N1N2_ms_per_Run=slow,target1500ms_pow2=target,slow30000ms_cap_pow2=cap))
    return start

def calibrate():
    for case in read(HERE/'formal_cases.json'):
        if blocked(case):continue
        n=pilot_start(case)
        while n<=MAX_N:
            rows=[]
            for rep in range(2):
                order=CONDITIONS[rep:]+CONDITIONS[:rep]
                for pos,c in enumerate(order):rows.append(invoke('pilot',case,c,n,rep,pos))
            if not all(r['valid'] for r in rows):block(case,'pilot','common-N process failure/timeout','BLOCKED_COMMON_N');break
            if min(r['elapsed_ms'] for r in rows)>=1000:
                if case.startswith('Crypto.'):
                    from crypto_inputs import validate
                    if not validate(case,n):break
                checks=[invoke('selected_correctness',case,c,n,0,pos) for pos,c in enumerate(CONDITIONS)]
                if not all(r['valid'] for r in checks):block(case,'selected','selected N correctness failed','BLOCKED_CORRECTNESS');break
                save(HERE/'selected'/f'{case}.json',dict(case=case,N=n,pilot_records=10,minimum_ms=min(r['elapsed_ms'] for r in rows),selected_correctness=5,crypto_identity='PASS_BOUNDED_INPUT_IDENTITY' if case.startswith('Crypto.') else None))
                break
            n*=2
        else:block(case,'pilot','N limit without all ten pilot intervals >=1000ms','BLOCKED_COMMON_N')
    csvout(HERE/'selected_n.csv',[read(p) for p in (HERE/'selected').glob('*.json')])

def freeze():
    cases=read(HERE/'formal_cases.json');rng=random.Random(SEED);orders={}
    for case in cases:
        seq=[]
        for _ in range(6):
            base=CONDITIONS.copy();rng.shuffle(base);seq.extend(base[i:]+base[:i] for i in range(5))
        rng.shuffle(seq);orders[case]=seq
    rows=[]
    for rep in range(30):
        order=cases.copy();rng.shuffle(order)
        for cp,case in enumerate(order):
            selected=HERE/'selected'/f'{case}.json';n=read(selected)['N'] if selected.exists() else None
            for pos,c in enumerate(orders[case][rep]):rows.append(dict(index=len(rows),case=case,condition=c,N=n,rep=rep,order=pos,case_position=cp,eligible=n is not None and not bool(blocked(case))))
    save(HERE/'schedule.json',rows)
    a=verify_runtime();before=read(HERE/'runtime.json')['artifacts']
    for c in CONDITIONS:
        for f in ['path','realpath','sha256','size','dependencies']:assert a[c][f]==before[c][f],'GLOBAL_PRE_FORMAL_IDENTITY'
    files={p.relative_to(HERE).as_posix():sha(p) for p in [HERE/'protocol.json',HERE/'runtime.json',HERE/'inputs.json',HERE/'environment.json',HERE/'coverage_frozen.json',HERE/'formal_cases.json',HERE/'case_catalog.json',HERE/'extension_review.json',HERE/'common.py',HERE/'run.py',HERE/'prepare.py',HERE/'crypto_inputs.py',HERE/'schedule.json',*list((HERE/'inputs').rglob('*')),*list((HERE/'selected').glob('*.json'))] if p.is_file()}
    scripts={}
    for case in cases:
        p=HERE/'selected'/f'{case}.json'
        if p.exists():
            q=script(case,read(p)['N']);files[q.relative_to(HERE).as_posix()]=sha(q);scripts[case]=dict(path=q.relative_to(HERE).as_posix(),sha256=sha(q))
    save(HERE/'frozen.json',dict(timestamp=stamp(),boot_id=boot(),affinity=sorted(os.sched_getaffinity(0)),formal_target=len(cases)*150,eligible_target=sum(r['eligible'] for r in rows),base_target=2400,files=files,formal_scripts=scripts))
    print('FORMAL_FROZEN target',len(rows),'eligible',sum(r['eligible'] for r in rows),flush=True)

def formal():
    frozen=read(HERE/'frozen.json');actual=0
    for s in read(HERE/'schedule.json'):
        if not s['eligible'] or blocked(s['case']):continue
        budget();assert boot()==frozen['boot_id'] and sorted(os.sched_getaffinity(0))==frozen['affinity'],'GLOBAL_COHORT_CHANGED'
        r=invoke('formal',s['case'],s['condition'],s['N'],s['rep'],s['order'],s['index']);actual+=1
        if not r['valid']:block(s['case'],'formal','version-specific failure; remaining positions for this case not run','FAILED_FORMAL')
        print('FORMAL_COMPLETED',actual,'planned_position',s['index']+1,'/',frozen['formal_target'],flush=True)
    after=verify_runtime();before=read(HERE/'runtime.json')['artifacts']
    for c in CONDITIONS:
        for f in ['path','realpath','sha256','size','dependencies']:assert after[c][f]==before[c][f],'GLOBAL_POST_FORMAL_IDENTITY'
    for name,digest in frozen['files'].items():assert sha(HERE/name)==digest,'GLOBAL_SCRIPT_CONFIG_CHANGED '+name
    save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),boot_id=boot(),artifacts=after,frozen_inputs_scripts_configs_unchanged=True))

def main():
    prepare()
    try:
        clock_and_control();compatibility();correctness();calibrate();freeze();formal()
    except Exception as e:
        save(HERE/'campaign_stop.json',dict(timestamp=stamp(),status='STOPPED',reason=repr(e),traceback=traceback.format_exc(),boot_id=boot()))
        print(traceback.format_exc(),flush=True)
    for p,h in read(HERE/'reused_evidence.json')['files'].items():assert sha(ROOT/p)==h,'old evidence changed '+p
    save(HERE/'collection_closed.json',dict(timestamp=stamp(),boot_id=boot(),elapsed_seconds=(time.perf_counter_ns()-read(HERE/'started.json')['start_ns'])/1e9,old_evidence_unchanged=True))
    print('COLLECTION_CLOSED',flush=True)

if __name__=='__main__':main()
