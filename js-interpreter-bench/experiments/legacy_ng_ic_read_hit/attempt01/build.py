"""Clean A/C/D optimized builds and correctness; never changes previous campaign."""
import argparse,shutil
from common import *
def release():
    assert platform.machine()=='x86_64'
    compiler=capture('compiler',['gcc','--version']);capture('linker',['ld','--version']);environment('build')
    identities=read(HERE/'sources/identities.json')['files']
    for v in VERSIONS:
        src=STORE/v
        assert all(sha(src/p)==h for p,h in identities[v].items())
        assert not (src/'qjs').exists(),'clean builds only'
        r=capture(v+'_release',['make','-j2','qjs','qjsc'],src);assert r['exit_code']==0
        capture(v+'_ldd',['ldd',src/'qjs'])
    actual_cohort=os.environ.get('IC_READ_COHORT',('wsl2' if 'microsoft' in platform.release().lower() else 'linux')+'-'+platform.node()+'-'+platform.machine())
    m=dict(campaign=HERE.relative_to(ROOT/'experiments').as_posix(),cohort=actual_cohort,
      mode=MODE,host=platform.node(),kernel=platform.release(),architecture=platform.machine(),
      created_at=stamp(),base='04be246001599f5995fa2f2d8c91a0f198d3f34c',ng_source='e1b5978775f75f9637c624fc45e69b92d2c15f42',
      compiler=compiler['stdout'].splitlines()[0],build_command=['make','-j2','qjs','qjsc'],
      optimization='-O2',NDEBUG=False,LTO=False,PGO=False,formal_instrumentation=False,
      artifacts={v:dict(path=str(STORE/v/'qjs'),source=str(STORE/v),sha256=sha(STORE/v/'qjs'),size=(STORE/v/'qjs').stat().st_size,
         qjsc_sha256=sha(STORE/v/'qjsc'),flags=[]) for v in VERSIONS},
      inputs={p.relative_to(ROOT).as_posix():sha(p) for p in [HERE/'inputs/adapter.js',HERE/'inputs/driver.js',HERE/'patches/C_to_D.patch']},
      power='UNKNOWN',per_sample_frequency='UNKNOWN',background='uncontrolled, snapshots recorded')
    for line in (ROOT/'experiments/octane/upstream_sha256.txt').read_text().splitlines():
        h,p=line.split('  ',1);f=ROOT/'benchmarks/octane/upstream'/p
        b=f.read_bytes();actual=sha(f)
        # raw source hashes are checked against frozen previous campaign at prepare time;
        # current checkout line endings may normalize, so disclose rather than overwrite old hashes.
        old=read(OLD/'manifest.json')['inputs'].get(f.relative_to(ROOT).as_posix())
        assert h==old,(p,h,old)
        if actual!=old:
            # A fresh Linux submodule checkout is commonly LF, unlike this
            # campaign's Windows-origin CRLF. Only a NEW campaign may record
            # those distinct raw bytes after checking the exact normalized text.
            index=read(HERE/'recovery/workload_line_endings.json')
            assert digest(b.replace(b'\r\n',b'\n'))==index[f.relative_to(ROOT).as_posix()]['LF_normalized_sha256'],p
            m.setdefault('new_campaign_line_ending_differences',[]).append(f.relative_to(ROOT).as_posix())
        m['inputs'][f.relative_to(ROOT).as_posix()]=actual
    save(HERE/'manifest.json',m);print('RELEASE_BUILDS_PASS',flush=True)
def correctness():
    m=verify_runtime();records=[]
    for v in VERSIONS:
        src=STORE/v
        for name in ['legacy_regression.js','multislot.js','read_semantics.js']:
            r=capture(v+'_'+name,[src/'qjs',HERE/'correctness'/name]);assert r['exit_code']==0 and 'PASS' in r['stdout'] and not r['stderr']
            records.append(dict(variant=v,scenario=name,valid=True,stdout=r['stdout']))
        for p in sorted((ROOT/'benchmarks/smoke').glob('*.js')):
            r=capture(v+'_smoke_'+p.stem,[src/'qjs',p]);assert r['exit_code']==0 and not r['stderr']
            records.append(dict(variant=v,scenario=p.stem,valid=True,stdout=r['stdout']))
        r=capture(v+'_upstream_test',['make','-j2','test'],src);assert r['exit_code']==0
        r=capture(v+'_timer',[src/'qjs',HERE/'correctness/legacy_timer.js']);assert r['exit_code']==0 and not r['stderr']
    for scene in {r['scenario'] for r in records}:
        assert len({r['stdout'] for r in records if r['scenario']==scene})==1,scene
    save(HERE/'correctness/results.json',records)
    # D sanitizer only; independent tree, never a formal timing binary.
    dst=STORE/'D_sanitizer';assert not dst.exists();shutil.copytree(STORE/'A',dst,ignore=shutil.ignore_patterns('.obj','qjs','qjsc','repl.c','libquickjs.a','run-test262','*.so'))
    for name in ['quickjs.c','quickjs-opcode.h','LICENSE.NG']:shutil.copyfile(STORE/'D'/name,dst/name)
    r=capture('D_sanitizer_build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],dst);assert r['exit_code']==0
    for name in ['legacy_regression.js','multislot.js','read_semantics.js']:
        r=capture('D_sanitizer_'+name,[dst/'qjs',HERE/'correctness'/name]);assert r['exit_code']==0 and 'PASS' in r['stdout'] and not r['stderr']
    for v,src,flavor in [(v,STORE/v,'release') for v in VERSIONS]+[('D',dst,'sanitizer')]:
        objs=src/('.obj/asan/ubsan' if flavor=='sanitizer' else '.obj');out=src/'roundtrip_slots'
        cmd=['gcc','-g','-O2','-I'+str(src),str(HERE/'correctness/roundtrip_slots.c')]
        if flavor=='sanitizer':cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
        cmd+=[str(objs/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(out)]
        r=capture(v+'_'+flavor+'_roundtrip_build',cmd);assert r['exit_code']==0
        r=capture(v+'_'+flavor+'_roundtrip',[out]);assert r['exit_code']==0 and 'PASS' in r['stdout'] and not r['stderr']
        if flavor=='release':
            r=capture(v+'_embedding_library',['make','-j2','libquickjs.a'],src);assert r['exit_code']==0
            r=capture(v+'_embedding_build',[src/'qjsc','-o',src/'multislot_embedded',HERE/'correctness/multislot.js'],src);assert r['exit_code']==0
            r=capture(v+'_embedding_run',[src/'multislot_embedded']);assert r['exit_code']==0 and 'PASS' in r['stdout']
    save(HERE/'correctness/gate.json',dict(status='PASS',legacy_assertions_each=952,new_scenario_groups=9,
      new_assertion_count='see multislot stdout; assertions are not scenario count',upstream_tests_each=11,
      D_ASan_UBSan=True,multi_shape_warmed_serialize_load=True,embedding_all=True,OOM_192_limits=True,full_test262=False))
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['release','correctness']);a=ap.parse_args();globals()[a.stage]()
