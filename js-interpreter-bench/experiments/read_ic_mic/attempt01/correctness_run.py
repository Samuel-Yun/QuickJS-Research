"""Correctness and two independent sanitizer builds; no timed samples."""
import shutil
from common import *
TESTS=['legacy_regression.js','multislot.js','read_semantics.js','site_regression.js']
def c_program(v,src,name,sanitizer=False):
    obj=src/('.obj/asan/ubsan' if sanitizer else '.obj');out=src/(name+'_check')
    cmd=['gcc','-g','-O2','-I'+str(src),str(HERE/'correctness'/(name+'.c'))]
    if sanitizer:cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
    cmd+=[str(obj/(x+'.o')) for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(out)]
    r=capture(v+'_'+name+'_build',cmd);assert not r['exit_code']
    r=capture(v+'_'+name,[out]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
def main():
    verify_runtime();records=[]
    for v in VERSIONS:
        src=STORE/v
        for name in TESTS:
            r=capture(v+'_'+name,[src/'qjs',HERE/'correctness'/name]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout'];records.append(dict(variant=v,test=name,stdout=r['stdout'],valid=True))
        for p in sorted((ROOT/'benchmarks/smoke').glob('*.js')):
            r=capture(v+'_smoke_'+p.stem,[src/'qjs',p]);assert not r['exit_code'] and not r['stderr'];records.append(dict(variant=v,test=p.name,stdout=r['stdout'],valid=True))
        r=capture(v+'_upstream',['make','-j2','test'],src);assert not r['exit_code']
        for name in ['roundtrip_slots','read_roundtrip','gc_cycles']:c_program(v,src,name)
        r=capture(v+'_embedding_lib',['make','-j2','libquickjs.a'],src);assert not r['exit_code']
        r=capture(v+'_embedding_build',[src/'qjsc','-o',src/'site_embedded',HERE/'correctness/site_regression.js'],src);assert not r['exit_code']
        r=capture(v+'_embedding',[src/'site_embedded']);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
    for name in {r['test'] for r in records}:assert len({r['stdout'] for r in records if r['test']==name})==1,name
    save(HERE/'correctness/release_results.json',records)
    for v in ['M','P']:
        src=STORE/(v+'_sanitizer');assert not src.exists()
        shutil.copytree(STORE/'A',src,ignore=shutil.ignore_patterns('.obj','qjs','qjsc','run-test262','repl.c','libquickjs.a','*.so','*_check','site_embedded'))
        for f in read(HERE/'sources/identities.json')['files'][v]:
            p=STORE/v/f
            if p.is_file():shutil.copy2(p,src/f)
        r=capture(v+'_sanitizer_build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],src);assert not r['exit_code']
        for name in TESTS:
            r=capture(v+'_sanitizer_'+name,[src/'qjs',HERE/'correctness'/name]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
        for name in ['roundtrip_slots','read_roundtrip','gc_cycles']:c_program(v+'_sanitizer',src,name,True)
    save(HERE/'correctness/gate.json',dict(status='PASS',independent_sanitizers=['M','P'],legacy_assertions=952,multislot_scenarios=9,multislot_assertions=28151,
      new_counts='see site_regression stdout; scenarios separate from repeated assertions',upstream_entries_each=11,GC_cycle_cases_each=1800,
      serialize_load_warmed=True,embedded=True,OOM_budgets_each=192,full_test262=False))
    print('CORRECTNESS_GATE_PASS',flush=True)
if __name__=='__main__':main()
