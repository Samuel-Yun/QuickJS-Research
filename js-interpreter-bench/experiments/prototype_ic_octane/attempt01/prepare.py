"""Reuse exact public input/driver and four ELF identities. No builds/downloads."""
from common import *
EXPECTED={'A':'584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1','M':'7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef','H':'37b1aa9f755e94fb0db61a789d78c97addbff61835b99f3288a3ceb26e8932e4','OFF':'e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d','ON':'e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d'}
def verify_runtime():
    arts=read(ABLATION/'runtime_frozen.json')['artifacts']
    arts['A']=dict(path='/home/mzyx/read_ic_dequickening_attempt01/A/qjs',sha256=EXPECTED['A'])
    result={}
    for c in ['A','M','H','OFF']:
        p=Path(arts[c]['path']);assert sha(p)==EXPECTED[c],'GLOBAL_ELF_IDENTITY '+str(p)
        f=subprocess.run(['file',str(p)],capture_output=True,text=True)
        d=subprocess.run(['ldd',str(p)],capture_output=True,text=True)
        assert f.returncode==d.returncode==0 and 'x86-64' in f.stdout and 'not found' not in d.stdout,'GLOBAL_ELF_DEPENDENCY'
        deps={}
        for path in re.findall(r'(/[^\s()]+)',d.stdout):
            q=Path(path)
            if q.is_file():deps[path]=dict(realpath=str(q.resolve()),sha256=sha(q))
        result[c]=dict(path=str(p),realpath=str(p.resolve()),sha256=sha(p),size=p.stat().st_size,file=f.stdout,ldd=d.stdout,dependencies=deps)
    result['ON']=result['OFF'];return result

def prepare():
    assert not (HERE/'started.json').exists(),'new unused attempt required'
    save(HERE/'started.json',dict(timestamp=stamp(),start_ns=time.perf_counter_ns(),boot_id=boot(),budget_seconds=BUDGET,reference_commit='f87dbff4536f6eb471f8d4e4a656b1e052604b17'))
    a=verify_runtime();save(HERE/'runtime.json',dict(timestamp=stamp(),host=platform.node(),kernel=platform.release(),architecture=platform.machine(),cohort='WSL2_PROTO_OCTANE_20261030_'+HERE.name,boot_id=boot(),artifacts=a,A_upstream_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',builds=0,flags='frozen GCC13.3 -O2 -g -fwrapv; no rebuild',switch_sanitizer='NOT_COMPLETED_BUILD_INTERRUPTED; inherited limitation'))
    refs={}
    for directory,names in [(SOURCE,['case_catalog.json','inputs.json','correctness_contract.md','common.py','run.py','crypto_inputs.py','summary/coverage.csv']), (ROOT/'experiments/read_ic_mic/attempt01',['protocol.json','aggregate_ci.py']), (ROOT/'experiments/prototype_ic_ablation/attempt01',['manifest.json','completion.json','protocol.json','gates/semantic.json','gates/workload.json','gates/mechanism.json','gates/serialization.json','gates/sanitizer.json']), (ABLATION,['runtime_frozen.json','results.md','common.py','completion.json'])]:
        for name in names:refs[(directory/name).relative_to(ROOT).as_posix()]=sha(directory/name)
    save(HERE/'reused_evidence.json',dict(files=refs,old_times_used_as_new_samples=False,old_semantic_diagnostic_executions_not_repeated=True))
    inputs=read(SOURCE/'inputs.json')
    for item in inputs['files']:
        p=SOURCE/item['frozen'];assert sha(p)==item['LF_sha256'];save(HERE/item['frozen'],p.read_bytes())
    for name,key in [('adapter.js','adapter_sha256'),('driver.js','driver_sha256'),('crypto_preload.js','crypto_preload_sha256')]:
        p=SOURCE/'inputs'/name;assert sha(p)==inputs[key];save(HERE/'inputs'/name,p.read_bytes())
    save(HERE/'correctness_contract.md',(SOURCE/'correctness_contract.md').read_bytes())
    historical=read(ROOT/'experiments/read_ic_mic/attempt01/protocol.json')['input_hashes']
    for name in ['box2d.js','zlib.js','zlib-data.js']:
        p=ROOT/'benchmarks/octane/upstream'/name;raw=p.read_bytes();expected=historical[p.relative_to(ROOT).as_posix()]
        possibilities=[raw,raw.replace(b'\r\n',b'\n'),raw.replace(b'\r\n',b'\n').replace(b'\n',b'\r\n')]
        original=next((b for b in possibilities if hashlib.sha256(b).hexdigest()==expected),None);assert original is not None,name
        lf=original.replace(b'\r\n',b'\n');save(HERE/'inputs/octane'/name,lf)
        inputs['files'].append(dict(source=p.relative_to(ROOT).as_posix(),as_found_sha256=sha(p),historical_raw_sha256=expected,LF_sha256=hashlib.sha256(lf).hexdigest(),frozen='inputs/octane/'+name,restore='matched fixed historical byte hash, then LF'))
    save(HERE/'inputs.json',inputs)
    catalog=BASE_CATALOG+[dict(case='Box2D.Box2D',suite='Box2D',benchmark='Box2D',index=0,files=['base.js','box2d.js'],old_N_reference=1,input_mode='FROZEN_ORIGINAL_COMPATIBILITY',seed=None),dict(case='zlib.zlib',suite='zlib',benchmark='zlib',index=0,files=['base.js','zlib.js','zlib-data.js'],old_N_reference=1,input_mode='FROZEN_ORIGINAL_WITH_SHARED_READ_HOST_ADAPTER',seed=None)]
    save(HERE/'case_catalog.json',catalog)
    save(HERE/'inputs/zlib_read.js','''// Same shell API for all five conditions; does not preload files or move Run I/O.
globalThis.read=function(path,mode){
 if(mode!==undefined&&mode!=="binary")throw Error("unsupported read mode");
 var file=std.open(path,"rb");if(file===null)throw Error("read failed: "+path);
 try{if(mode!=="binary")return file.readAsString();
 var size=file.seek(0,std.SEEK_END);if(size<0)throw Error("seek failed");size=file.tell();file.seek(0,std.SEEK_SET);
 var bytes=new Uint8Array(size),got=file.read(bytes.buffer,0,size);if(got!==size)throw Error("short read");return bytes;
 }finally{file.close();}
};
''')
    allowed=sorted(os.sched_getaffinity(0));cpu=2 if 2 in allowed else allowed[0];os.sched_setaffinity(0,{cpu})
    ps=subprocess.run(['ps','-eo','pid,ppid,stat,comm,args'],capture_output=True,text=True)
    conflicts=[s for s in ps.stdout.splitlines() if len(s.split())>=4 and s.split()[3] in ['qjs','cc1','cc1plus','collect2','ld','perf']]
    save(HERE/'environment.json',dict(timestamp=stamp(),host=platform.node(),platform=platform.platform(),kernel=platform.release(),architecture=platform.machine(),boot_id=boot(),cpuinfo=Path('/proc/cpuinfo').read_text(),os_release=Path('/etc/os-release').read_text(),allowed_cpus=allowed,affinity=sorted(os.sched_getaffinity(0)),affinity_rule='CPU2 fixed before all workloads (same allowed logical CPU as prior campaign), otherwise first allowed; no CPU benchmark search',loadavg=Path('/proc/loadavg').read_text(),processes=ps.stdout,conflicting_workers=conflicts,frequency='UNKNOWN',temperature='UNKNOWN',physical_host_SMT_mapping='UNKNOWN',host_background_control='UNKNOWN',system_setting_changes=False))
    assert not conflicts,'GLOBAL_PARALLEL_WORKER: do not kill unrelated jobs'
    save(HERE/'protocol.json',dict(reference_commit='f87dbff4536f6eb471f8d4e4a656b1e052604b17',conditions=CONDITIONS,base_cases=BASE_CASES,extensions=['Box2D.Box2D','zlib.zlib'],crypto_protocol='BENCH_ONLY_XORSHIFT32_PRELOAD_V1',crypto_seed=CRYPTO_SEED,mode=MODE,first_Run_included=True,performance_warmup_calls=0,clock='captured native performance.now/CLOCK_MONOTONIC',outside='static loading/compilation, required Setup, post-validation/TearDown/output',inside='N original Run calls including dynamic compile/I-O/helpers/GC/regexp/original assertions',timeout_seconds=TIMEOUT,max_N=MAX_N,budget_seconds=BUDGET,pilot_per_condition=2,pilot_min_ms=1000,pilot_rule='N1/N2 estimates and old N capped start; common power-of-two doubling; no outcome selection',formal_repetitions=30,seed=SEED,schedule='six independent shuffled bases, their five rotations, shuffle30 per case; each condition each position6, not all120 permutations',statistics='median/mean/n-1 sd/Tukey sorted halves Q1 Q3/IQR/min/max',ratios=['M/A','H/A','ON/A','H/M','ON/M','ON/OFF','ON/H','OFF/M'],bootstrap='10000 complete 5-condition same-case round resamples; suite aggregate uses common full round blocks; seed20261030; ratio of medians; 95% linear percentile, exploratory not multiplicity corrected',aggregate='within-suite geomean case ratios then equal-weight suites; fixed16 with deterministic Crypto primary; no-Crypto historical sensitivity; expanded only complete comparable coverage; no official score',case_failure='record all conditions; block invalid case, continue others; variant-only failure retained as regression',global_stop='identity, timer, boot or budget contradiction',no_outlier_deletion=True,no_automatic_failure_retry=True,numeric_control='descriptive environment record only, NOT stability gate',engine_changes=0))
    print('PREPARED',len(catalog),'catalog rows; four exact ELF',flush=True)
