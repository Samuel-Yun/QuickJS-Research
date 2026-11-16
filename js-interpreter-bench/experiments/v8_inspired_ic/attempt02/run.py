"""Serial A/E/V8_ON campaign. Append-only raw; no engine/source changes here."""
import argparse,itertools,random
from common import *
def pin():
    m=runtime();os.sched_setaffinity(0,set(m['affinity']));verify_runtime()
def script(case,n,phase='measure'):
    row=next(r for r in read(HERE/'case_catalog.json') if r['case']==case)
    driver=(HERE/'inputs/driver.js').read_text()
    for key,value in dict(CONFIG=json.dumps(dict(case=case,N=n,phase=phase)),SUITE=json.dumps(row['suite']),INDEX=str(row['index']),BENCHMARK=json.dumps(row['benchmark'])).items():driver=driver.replace('__'+key+'__',value)
    pieces=[(HERE/'inputs/adapter.js').read_bytes()]
    if case.startswith('Crypto.'):pieces.append((HERE/'inputs/crypto_preload.js').read_bytes())
    pieces += [(HERE/'inputs/octane'/f).read_bytes() for f in row['files']]+[driver.encode()]
    p=HERE/'scripts'/case/f'N{n}.{phase}.js';save(p,b'\n;\n'.join(pieces))
    if case in BASE_CASES:
        old=SOURCE/'scripts'/case/p.name
        if old.exists():assert old.read_bytes()==p.read_bytes(),'GLOBAL_WORKLOAD_IDENTITY'
    return p
def invoke(stage,case,c,n,rep,pos,index=None):
    dest=HERE/'raw'/stage/case/f'N{n}.rep{rep:02d}.pos{pos}.{c}.json'
    if dest.exists():return read(dest)
    phase='correctness' if stage in ['correctness','selected_correctness','compatibility'] else 'measure'
    p=script(case,n,phase);pref=prefixes()[c];cmd=list(pref)
    if case=='zlib.zlib' and c!='V8_ON':cmd+=['--std','-I',str(HERE/'inputs/zlib_read.js')]
    cmd+=[str(p)]
    marker=HERE/'raw/started'/stage/case/dest.name
    assert not marker.exists(),'UNKNOWN prior started process; never silently retry'
    save(marker,dict(command=cmd,timestamp=stamp(),case=case,condition=c,N=n,rep=rep,order=pos,index=index,boot_id=boot(),script_sha256=sha(p)))
    r=capture(cmd,f'{stage} {case} {c} N{n} rep{rep}')
    a=runtime();r.update(case=case,condition=c,N=n,rep=rep,order=pos,schedule_index=index,stage=stage,cohort=a['cohort'],mode=MODE,flags=cmd[1:-1],binary_sha256=a['artifacts'][c]['sha256'],script_relative=p.relative_to(HERE).as_posix(),script_sha256=sha(p),input_manifest_sha256=sha(HERE/'inputs.json'),elapsed_ms=None,elapsed_per_Run_ms=None,checksum=None,valid=False,failed_reason=None)
    try:
        assert r['boot_id']==r['boot_id_after']==a['boot_id'],'GLOBAL_BOOT_CHANGED'
        assert r['exit_code']==0 and not r['stderr'] and not r['timeout'],'exit/stderr/timeout'
        matches=re.findall(r'^OCTANE_IC_RESULT:(.*)$',r['stdout'],re.M);assert len(matches)==1,'payload'
        d=json.loads(matches[0]);r['payload']=d
        assert d['case']==case and d['N']==n and d['mode']==MODE and d['phase']==phase and d['correctness']=='PASS' and d['warmup_calls']==0,'result gate'
        start,stop,t=[d[k] for k in ['start_ms','stop_ms','elapsed_ms']]
        assert all(math.isfinite(x) for x in [start,stop,t]) and stop-start==t and 0<=t<=r['external_wall_ms']+5,'GLOBAL_TIMER'
        if stage in ['pilot','formal']:assert t>0,'GLOBAL_TIMER_ZERO'
        crypto=HERE/'crypto'/f'{case}.N{n}.json'
        if case.startswith('Crypto.') and crypto.exists():assert d['checksum']==read(crypto)['final_ciphertext'],'Crypto checksum'
        r.update(valid=True,elapsed_ms=t,elapsed_per_Run_ms=t/n,checksum=d['checksum'])
    except (AssertionError,KeyError,ValueError,TypeError) as e:r['failed_reason']=str(e)
    save(dest,r);print('VALID',r['valid'],'elapsed',r['elapsed_ms'],flush=True)
    if not r['valid'] and (str(r['failed_reason']).startswith('GLOBAL_') or re.search(r'unknown flag|unrecognized option|unrecognized flag',r['stderr'],re.I)):raise RuntimeError('GLOBAL_CONTRADICTION '+str(dest))
    return r
def clocks():
    pin();p=HERE/'scripts/clock.js';save(p,(HERE/'inputs/adapter.js').read_bytes()+b'\nvar a=__icoNow(),last=a,min=Infinity,changes=0;for(var i=0;i<50000;i++){var b=__icoNow();if(b<last)throw Error("clock");if(b>last){min=Math.min(min,b-last);changes++;}last=b;}console.log(JSON.stringify({elapsed:last-a,min:min,changes:changes}));\n')
    for c,cmd in prefixes().items():
        r=capture(cmd+[p],'clock '+c);assert r['exit_code']==0 and not r['stderr']
        d=json.loads(r['stdout']);assert 0<d['min'] and d['changes']>0 and 0<=d['elapsed']<=r['external_wall_ms']+5
        save(HERE/'raw/capability'/f'clock_{c}.json',dict(**r,payload=d))
    # Reuse actual same artifact flags evidence; a fresh effective dump is read-only.
    r=capture(prefixes()['V8_ON']+['--print-flag-values','-e','console.log("FLAG_PASS")'],'V8 flags')
    save(HERE/'raw/capability/V8_flags.json',r);assert r['exit_code']==0 and not r['stderr']
    def flag(k):return '--'+k in r['stdout'].splitlines()
    assert flag('jitless') and flag('no-lazy') and flag('use-ic')
    assert all(flag('no-'+x) for x in ['sparkplug','maglev','turbofan','turboshaft','regexp-tier-up']) and flag('regexp-interpret-all')
    save(HERE/'clock_gate.json',dict(status='PASS',native_monotonic=True,strict_jitless_effective=True,trace_in_formal=False))
def compatibility():
    pin();rows=[invoke('compatibility','Box2D.Box2D',c,1,0,pos) for pos,c in enumerate(CONDITIONS)]
    save(HERE/'coverage.json',[dict(case=k,status='PENDING_CORRECTNESS',included=True) for k in CASES]+[dict(case='Box2D.Box2D',status='RUNS_NO_TRUSTED_OUTPUT_GATE' if all(r['valid'] for r in rows) else 'COMPATIBILITY_FAILED',included=False,reason='original runBox2D keeps world local, steps20, exposes no final result; only internal assertions available; no independent final-output oracle established',processes=len(rows)),dict(case='Splay.latency/Mandreel.latency',status='NOT_THIS_METRIC',included=False)])
def correctness():
    pin();rows=[]
    from crypto_inputs import validate
    for case in CASES:
        rr=[invoke('correctness',case,c,n,n,pos) for n in [1,2] for pos,c in enumerate(CONDITIONS)];rows+=rr
        if not all(r['valid'] for r in rr):block(case,'correctness','N1/N2 original gate failed');continue
        if case.startswith('Crypto.'):
            for n in [1,2]:
                if not validate(case,n):break
    csvout(HERE/'correctness/workload.csv',[{k:r[k] for k in ['case','condition','N','valid','exit_code','checksum','script_sha256']} for r in rows])
    save(HERE/'correctness/workload_gate.json',dict(expected=len(CASES)*6,actual=len(rows),valid=sum(r['valid'] for r in rows)))
def calibrate():
    pin();from crypto_inputs import validate
    for case in CASES:
        if blocked(case) or (HERE/'selected'/f'{case}.json').exists():continue
        checks=[read(p) for p in (HERE/'raw/correctness'/case).glob('*.json')];per=[r['elapsed_per_Run_ms'] for r in checks if r['valid'] and r['elapsed_per_Run_ms']>0]
        old=read(PROTO/'selected'/f'{case}.json')['N']
        target=2**max(0,math.ceil(math.log2(1500/min(per))))
        cap=2**max(0,math.floor(math.log2(30000/max(per))))
        n=max(1,min(old,target,cap,MAX_N))
        save(HERE/'pilot_start'/f'{case}.json',dict(case=case,N=n,old_N=old,N1N2_min_ms=min(per),N1N2_max_ms=max(per),target1500ms=target,cap30000ms=cap))
        while n<=MAX_N:
            rr=[invoke('pilot',case,c,n,rep,pos) for rep in range(2) for pos,c in enumerate(CONDITIONS[rep:]+CONDITIONS[:rep])]
            if not all(r['valid'] for r in rr):block(case,'pilot','process/gate/timeout failed');break
            if min(r['elapsed_ms'] for r in rr)>=1000:
                if case.startswith('Crypto.') and not validate(case,n):break
                cc=[invoke('selected_correctness',case,c,n,0,pos) for pos,c in enumerate(CONDITIONS)]
                if not all(r['valid'] for r in cc):block(case,'selected','result failed');break
                save(HERE/'selected'/f'{case}.json',dict(case=case,N=n,pilot_n=6,minimum_ms=min(r['elapsed_ms'] for r in rr),correctness_n=3));break
            n*=2
        else:block(case,'pilot','N bound exceeded')
    csvout(HERE/'selected_n.csv',[read(p) for p in sorted((HERE/'selected').glob('*.json'))])
def freeze():
    pin();verify_runtime()
    assert read(HERE/'correctness/semantic_gate.json')['status']=='PASS' and read(HERE/'correctness/safety_gate.json')['status']=='PASS'
    assert read(HERE/'correctness/serialization_gate.json')['status']=='PASS'
    assert read(HERE/'correctness/additional_gate.json')['status']=='PASS'
    assert read(HERE/'clock_gate.json')['status']=='PASS'
    rng=random.Random(SEED);orders={}
    for case in CASES:
        seq=list(itertools.permutations(CONDITIONS))*5;rng.shuffle(seq);orders[case]=seq
    schedule=[]
    for rep in range(30):
        cases=CASES.copy();rng.shuffle(cases)
        for cp,case in enumerate(cases):
            sel=HERE/'selected'/f'{case}.json';n=read(sel)['N'] if sel.exists() else None
            for pos,c in enumerate(orders[case][rep]):schedule.append(dict(index=len(schedule),case=case,condition=c,rep=rep,order=pos,case_position=cp,N=n,eligible=n is not None and not bool(blocked(case))))
    save(HERE/'schedule.json',schedule)
    files={p.relative_to(HERE).as_posix():sha(p) for p in [HERE/'common.py',HERE/'run.py',HERE/'protocol.json',HERE/'runtime.json',HERE/'campaign_runtime.json',HERE/'inputs.json',HERE/'schedule.json',*list((HERE/'engine').glob('*')),*list((HERE/'inputs').rglob('*')),*list((HERE/'selected').glob('*'))] if p.is_file()}
    for case in CASES:
        sel=HERE/'selected'/f'{case}.json'
        if sel.exists():p=script(case,read(sel)['N']);files[p.relative_to(HERE).as_posix()]=sha(p)
    for name in ['campaign.py','stage_engine.py','validate.py','extra_gates.py','source_manifest.json','attempt01_to_attempt02_safety.patch']:
        files[name]=sha(HERE/name)
    save(HERE/'frozen.json',dict(timestamp=stamp(),boot_id=boot(),files=files,formal_target=len(CASES)*90,core_target=1440))
def formal():
    pin();f=read(HERE/'frozen.json');assert boot()==f['boot_id'],'GLOBAL_BOOT_CHANGED'
    for p,h in f['files'].items():assert sha(HERE/p)==h,'GLOBAL_FROZEN_FILE '+p
    # No builder/diagnostic process may overlap formal sampling.
    ps=subprocess.check_output(['ps','-eo','pid,comm,args'],text=True)
    conflicts=[x for x in ps.splitlines() if len(x.split())>=2 and x.split()[1] in ['cc1','cc1plus','collect2','ld','qjs','perf']]
    assert not conflicts,'GLOBAL_PARALLEL_PROCESS '+str(conflicts)
    save(HERE/'formal_started.json',dict(timestamp=stamp(),boot_id=boot(),target=f['formal_target'],ps=ps))
    for r in read(HERE/'schedule.json'):
        if not r['eligible'] or blocked(r['case']):continue
        assert boot()==f['boot_id'],'GLOBAL_BOOT_CHANGED'
        result=invoke('formal',r['case'],r['condition'],r['N'],r['rep'],r['order'],r['index'])
        if not result['valid']:block(r['case'],'formal',result['failed_reason'],'REGRESSION_OR_CASE_FAILURE')
    verify_runtime();save(HERE/'collection_end.json',dict(timestamp=stamp(),boot_id=boot(),identity_unchanged=True))
def main():
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['clocks','compatibility','correctness','calibrate','freeze','formal']);a=p.parse_args();globals()[a.stage]()
if __name__=='__main__':main()
