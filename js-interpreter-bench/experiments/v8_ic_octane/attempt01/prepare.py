"""Verify frozen identities and references; do not build/download any runtime."""
import copy
from common import *
def main():
    if (HERE/'gate.json').exists():verify_runtime();print('PREPARATION_ALREADY_VERIFIED');return
    save(HERE/'previous_identity_before.json',tree(PREVIOUS))
    git=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    for name,args in [('HEAD',['rev-parse','HEAD']),('branch',['branch','--show-current']),('worktree',['status','--short'])]:capture(HERE/'raw/capability'/('git_'+name+'.json'),git+args)
    assert read(HERE/'raw/capability/git_branch.json')['stdout'].strip()=='myx'
    previous=read(PREVIOUS/'gate.json');assert previous['status']=='PASS_WITH_OBSERVABILITY_LIMITATION'
    m=copy.deepcopy(read(PREVIOUS/'runtime.json'));m.update(cohort='WSL2-'+platform.node()+'-x86_64-v8-ic-octane-'+datetime.now().strftime('%Y%m%d')+'-attempt01',started_at=stamp(),campaign_type='16 Octane Run units; use_ic configuration switch')
    save(HERE/'runtime.json',m);save(HERE/'environment.json',environment());verify_runtime()
    assert all(sha(Path(m['quickjs']['source'])/p)==h for p,h in m['quickjs']['source_files'].items())
    bundle=PREVIOUS/'materials/V8_IC_Resume_Materials_20261025';refs=read(bundle/'source_manifest.json')
    for item in refs['files']:assert sha(bundle/item['bundle_path'])==item['sha256']
    origin=ROOT/'experiments/v8_ic_on_off/attempt01'
    evidence=read(PREVIOUS/'on_evidence_reused.json')
    for p,h in evidence['files'].items():assert sha(origin/p)==h
    assert evidence['same_binary_sha256']==m['v8']['binary']['sha256']
    save(HERE/'reference_evidence.json',dict(status='PASS_REUSED',prior_gate_sha256=sha(PREVIOUS/'gate.json'),source_reference_commit=refs['reference_commit'],source_manifest_sha256=sha(bundle/'source_manifest.json'),source_files=refs['files'],source_root_relative=bundle.relative_to(ROOT).as_posix(),source_notes_relative=(PREVIOUS/'source_notes.md').relative_to(ROOT).as_posix(),source_notes_sha256=sha(PREVIOUS/'source_notes.md'),ON_evidence=evidence,OFF_direct_snapshot_verified=None,artifact_source_commit=None))
    d=m['v8']['binary']['path']
    for name,cmd in [('version',[d,'--version']),('help',[d,'--help'])]:
        r=capture(HERE/'raw/capability'/(name+'.json'),cmd);assert r['exit_code']==0 and not r['stderr']
    save(HERE/'inputs/basic.js',b'console.log("FLAG_PROBE_PASS "+(3+4));\n')
    flags={}
    for c in CONDITIONS[1:]:
        r=capture(HERE/'raw/capability'/(c+'_flags.json'),prefixes()[c]+['--print-flag-values',str(HERE/'inputs/basic.js')])
        assert r['exit_code']==0 and not r['stderr'] and 'FLAG_PROBE_PASS 7' in r['stdout']
        f=flags[c]=parse_flags(r['stdout']);assert f['jitless'] and not f['lazy'] and f['regexp-interpret-all']
        assert all(f[k] is False for k in ['sparkplug','maglev','turbofan','turboshaft','regexp-tier-up'])
    differences=[k for k in flags[CONDITIONS[1]] if flags[CONDITIONS[1]][k]!=flags[CONDITIONS[2]][k]]
    assert differences==['use-ic'] and flags[CONDITIONS[1]]['use-ic'] and not flags[CONDITIONS[2]]['use-ic']
    csvout(HERE/'effective_flags.csv',[dict(flag=k,ON=flags[CONDITIONS[1]][k],OFF=flags[CONDITIONS[2]][k]) for k in sorted(flags[CONDITIONS[1]])])
    expected=read(LEGACY/'measurement_manifest.json')['inputs'];origins=[]
    names=['base.js','LICENSE']+list(dict.fromkeys(name for case in CASES for name in FILES[case.split('.')[0]]))
    for name in names:
        src=ROOT/'benchmarks/octane/upstream'/name;key=src.relative_to(ROOT).as_posix();how,b=restore(src.read_bytes(),expected[key]);new=lf(b)
        save(HERE/'inputs/octane'/name,new);origins.append(dict(source=key,as_found_sha256=sha(src),historical_raw_sha256=expected[key],restore=how,LF_sha256=hashlib.sha256(new).hexdigest(),frozen='inputs/octane/'+name))
    save(HERE/'inputs.json',dict(octane_revision='570ad1ccfe86e3eecba0636c8f932ac08edec517',files=origins,crypto_protocol='BENCH_ONLY_XORSHIFT32_PRELOAD_V1',crypto_seed=CRYPTO_SEED,static_source_load='common bytes, LF normalized; originals and LF identities distinct',adapter_sha256=sha(HERE/'inputs/adapter.js'),driver_sha256=sha(HERE/'inputs/driver.js'),crypto_preload_sha256=sha(HERE/'inputs/crypto_preload.js')))
    catalog=[]
    for case in CASES:
        suite,bench=case.split('.');index=1 if case in ['Crypto.Decrypt','EarleyBoyer.Boyer','CodeLoad.CodeLoadJQuery'] else 0
        old=read(LEGACY/'selected'/f'{case}.json')['N']
        catalog.append(dict(case=case,suite=suite,benchmark=bench,index=index,files=['base.js']+FILES[suite],old_N_reference=old,input_mode='BENCH_ONLY_XORSHIFT32_PRELOAD_V1' if suite=='Crypto' else 'FROZEN_ORIGINAL_STRICT',seed=CRYPTO_SEED if suite=='Crypto' else None))
    save(HERE/'case_catalog.json',catalog)
    save(HERE/'aliases.json',dict(canonical_ids=CASES,historical_names={'Richards':'Richards.Richards'},note='Typescript spelling matches original suite; no silent case renaming'))
    capture(HERE/'raw/capability/environment.json',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu --sort=-pcpu | head -15; true'])
    save(HERE/'identity_before.json',dict(status='PASS',timestamp=stamp(),quickjs_sha256=sha(m['quickjs']['binary']['path']),v8_sha256=sha(m['v8']['binary']['path']),source_files_checked=len(m['quickjs']['source_files']),all_runtime_dependencies_verified=True))
    save(HERE/'gate.json',dict(status='PASS_WITH_OBSERVABILITY_LIMITATION',timestamp=stamp(),formal_authorized=True,only_effective_flag_difference=differences,strict_jitless_effective=True,reference_sources_reverified=True,ON_positive_evidence_reused=True,selected_OFF_no_cache_state_verified=None,artifact_build_source_commit=None,no_all_caches_removed_claim=True))
    print('PREPARED_16_CASES; identical original binaries; no performance data yet',flush=True)
if __name__=='__main__':main()
