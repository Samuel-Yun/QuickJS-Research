from common import *
def prepare():
    assert not (HERE/'runtime.json').exists(),'use unused attempt'
    m=read(SOURCE/'runtime.json');a=m['quickjs']['binary'];v=m['v8']
    assert sha(a['path'])=='584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1'
    assert sha(v['binary']['path'])=='83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133'
    for item in v['dependencies']:assert sha(item['path'])==item['sha256']
    e=BUILD/'E/qjs';assert read(HERE/'raw/build/E.json')['binary_sha256']==sha(e)
    arts={'A':dict(path=a['path'],sha256=sha(a['path'])),'E':dict(path=str(e),sha256=sha(e)),'V8_ON':dict(path=v['binary']['path'],sha256=sha(v['binary']['path']))}
    deps={}
    for c,item in arts.items():
        item['size_bytes']=Path(item['path']).stat().st_size
        r=capture(['ldd',item['path']],'ldd '+c);save(HERE/'raw/capability'/f'ldd_{c}.json',r)
        assert r['exit_code']==0 and 'not found' not in r['stdout']
        for p in re.findall(r'(/[^\s()]+)',r['stdout']):
            if Path(p).is_file():deps[str(Path(p).resolve())]=sha(p)
    allowed=sorted(os.sched_getaffinity(0));cpu=2 if 2 in allowed else allowed[0];os.sched_setaffinity(0,{cpu})
    save(HERE/'runtime.json',dict(timestamp=stamp(),cohort='WSL2_V8_INSPIRED_IC_20261031_'+HERE.name,host=platform.node(),kernel=platform.release(),architecture=platform.machine(),boot_id=boot(),affinity=[cpu],artifacts=arts,v8=v,dynamic_dependencies=[dict(path=p,sha256=h) for p,h in deps.items()],E_build=read(HERE/'raw/build/E.json'),actual_V8_build_commit=None,V8_reference_commit='37fb84941c9be9f9914ee50b1ad366f06a1bd764'))
    env=capture(['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu --sort=-pcpu | head -15'],'environment')
    save(HERE/'environment.json',dict(record=env,cohort=read(HERE/'runtime.json')['cohort'],WSL2=True,affinity=[cpu],governor='UNKNOWN',frequency='UNKNOWN',temperature='UNKNOWN',power='see host_windows_before.json if available',system_configuration_changed=False,background_load_control='observed only, not guaranteed isolated'))
    srcinputs=read(PROTO/'inputs.json')
    for item in srcinputs['files']:
        p=PROTO/item['frozen'];assert sha(p)==item['LF_sha256'];save(HERE/item['frozen'],p.read_bytes())
    for name,key in [('adapter.js','adapter_sha256'),('driver.js','driver_sha256'),('crypto_preload.js','crypto_preload_sha256')]:
        p=SOURCE/'inputs'/name;assert sha(p)==srcinputs[key];save(HERE/'inputs'/name,p.read_bytes())
    # Do not overwrite d8's native read; qjs std wrapper defines equivalent text/binary service.
    save(HERE/'inputs/zlib_read.js',(PROTO/'inputs/zlib_read.js').read_bytes())
    save(HERE/'inputs.json',dict(**srcinputs,zlib_qjs_host_adapter_sha256=sha(HERE/'inputs/zlib_read.js'),zlib_d8_host_adapter='native read(path,mode); same in-Run request, not preloading',original_sources_unchanged=True))
    save(HERE/'case_catalog.json',read(PROTO/'case_catalog.json'))
    save(HERE/'correctness_contract.md',(SOURCE/'correctness_contract.md').read_bytes())
    save(HERE/'protocol.json',dict(conditions=CONDITIONS,core16=BASE_CASES,mandatory_extension='zlib.zlib',Box2D='attempt gate; otherwise RUNS_NO_TRUSTED_OUTPUT_GATE',mode=MODE,clock='captured native monotonic performance.now; elapsed/N',first_Run_included=True,warmup_calls=0,inside='N original Run including dynamic compilation/I-O/GC/helpers/builtin/RegExp/assertions',outside='static loading/compilation, required Setup, final validation/TearDown/output',timeout_seconds=TIMEOUT,max_N=MAX_N,pilot_per_condition=2,pilot_min_ms=1000,repetitions=30,seed=SEED,schedule='six ABC permutations each5, case order shuffled every rep, three adjacent fresh processes',failure='record, do not automatically retry; case-specific continue; global identity/timer/boot stop',bootstrap='10000 complete triplet rep resamples, ratio of medians, seed20261031; overall common rep blocks; linear percentile95%, exploratory',aggregate='case GM within suite, suite equal-weight GM; fixed16/13 main,17/14 expanded; includes Crypto, not official score',ratios=['E/A','E/V8_ON','A/V8_ON'],no_outlier_deletion=True,no_historical_times=True,source_research_limitations='actual d8 commit/toolchain UNKNOWN; reference commit only'))
    save(HERE/'crypto_source_reuse.json',dict(path=str((SOURCE/'crypto_inputs.py').relative_to(ROOT)),sha256=sha(SOURCE/'crypto_inputs.py')))
    print('PREPARED A/E/V8_ON',flush=True)
if __name__=='__main__':prepare()
