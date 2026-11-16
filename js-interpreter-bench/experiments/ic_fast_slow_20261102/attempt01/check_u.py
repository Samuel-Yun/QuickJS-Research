"""Actual independent release/sanitizer gates, never benchmark timings."""
from common import *
TEST_ROOT=ROOT/'experiments/read_ic_mic/attempt01/correctness'
TESTS=['legacy_regression.js','multislot.js','read_semantics.js','site_regression.js']
def run(label,cmd,cwd=None,contains=None):
    p=HERE/'correctness/raw'/(label+'.json')
    if p.exists():r=read(p)
    else:r=capture(cmd,label,cwd=cwd);save(p,r)
    assert r['exit_code']==0 and not r['timeout'],label+': '+r['stderr'][-2500:]
    if contains:assert contains in r['stdout'] and not r['stderr'],label
    print('CHECK_PASS',label,flush=True);return r
def main():
    pin();u=read(HERE/'U_runtime.json');a=runtime()['artifacts']|{'U':u['U'],'U_san':u['U_san'],'C':read(HERE/'control_runtime.json')['C']}
    tests=[TEST_ROOT/f for f in TESTS]+list(sorted((ROOT/'benchmarks/smoke').glob('*.js')))+[HERE/'correctness/offset_regression.js']
    outputs={}
    for label in ['A','M','U','U_san','C']:
        for p in tests:
            cmd=[a[label]['path'],str(p)]
            # Controller inactive, exact same normal-M semantics outside region.
            if label=='C':
                dest=HERE/'correctness/raw'/(label+'_'+p.stem+'.json')
                if dest.exists():r=read(dest)
                else:r=capture(cmd,label,env=dict(os.environ,QJS_FS_QUOTA='4',QJS_FS_TARGET='0'));save(dest,r)
                assert r['exit_code']==0 and not r['stderr']
            else:r=run(label+'_'+p.stem,cmd)
            assert not r['stderr'],label+' stderr'
            outputs.setdefault(p.name,[]).append(r['stdout'])
    assert all(len(set(values))==1 for values in outputs.values()),'cross-version stdout'
    for label in ['U','U_san']:
        src=Path(u[label]['source']);san=label=='U_san';obj=src/('.obj/asan/ubsan' if san else '.obj')
        flags=['-g','-O2','-fwrapv','-I'+str(src)]+(['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if san else [])
        for name in ['roundtrip_slots','read_roundtrip','gc_cycles','offset_boundary']:
            p=HERE/'correctness/offset_boundary.c' if name=='offset_boundary' else TEST_ROOT/(name+'.c')
            objects=['dtoa','libregexp','libunicode','cutils']+([] if name=='offset_boundary' else ['quickjs'])
            out=src/(name+'_check')
            cmd=['gcc',*flags,'-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"',str(p),*[str(obj/(x+'.o')) for x in objects],'-lm','-lpthread','-ldl','-o',str(out)]
            run(label+'_'+name+'_compile',cmd);run(label+'_'+name,[out],contains='PASS')
    src=Path(u['U']['source'])
    run('U_upstream_test',['make','-j2','test'],src)
    run('U_embed_library',['make','-j2','libquickjs.a'],src)
    out=src/'offset_embedded'
    run('U_qjsc_embedding_build',[src/'qjsc','-o',out,HERE/'correctness/offset_regression.js'],src)
    run('U_qjsc_embedding',[out],contains='PASS')
    save(HERE/'correctness/U_gate.json',dict(status='PASS',release_variants=['A','M','U','C_inactive'],independent_U_ASan_UBSan=True,
      script_files_each=len(tests),stdout_identical=True,serialize_load_warmed=True,GC_cycles=True,OOM=True,qjsc_embedding=True,
      byte_offset_boundaries=6,full_test262=False,assertion_counts='actual per-script stdout in correctness/raw; not independent scenario count'))
    print('U_GATE_PASS',flush=True)
if __name__=='__main__':main()
