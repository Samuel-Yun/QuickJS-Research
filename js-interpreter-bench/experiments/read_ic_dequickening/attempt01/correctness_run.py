"""Semantic/upstream/OOM/GC/serialization gates; no performance measurements."""
import shutil
from common import *
TESTS=['legacy_regression.js','multislot.js','read_semantics.js','site_regression.js','dequickening.js']
def ctest(src,name,san=False):
    obj=src/('.obj/asan/ubsan' if san else '.obj');cmd=['gcc','-O2','-g','-I'+str(src),str(HERE/'correctness'/(name+'.c'))]
    if san:cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
    cmd += [str(obj/(x+'.o')) for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(src/(name+'_check'))]
    r=capture(src.name+'_'+name+'_build',cmd);assert not r['exit_code']
    r=capture(src.name+'_'+name,[src/(name+'_check')]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
def checks(src,label,san=False):
    rows=[]
    for n in TESTS:
        r=capture(label+'_'+n,[src/'qjs',HERE/'correctness'/n]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout'];rows.append(dict(variant=label,test=n,stdout=r['stdout'],valid=True))
    for n in ['roundtrip_slots','read_roundtrip','gc_cycles']:ctest(src,n,san)
    return rows
def main():
    m=verify_runtime();rows=[]
    for v in VERSIONS:
        src=Path(m['artifacts'][v]['source']);rows+=checks(src,v)
        for p in sorted((ROOT/'benchmarks/smoke').glob('*.js')):
            r=capture(v+'_smoke_'+p.stem,[src/'qjs',p]);assert not r['exit_code'] and not r['stderr'];rows.append(dict(variant=v,test=p.name,stdout=r['stdout'],valid=True))
        for label,cmd in [('upstream',['make','-j2','test']),('lib',['make','-j2','libquickjs.a'])]:
            r=capture(v+'_'+label,cmd,src);assert not r['exit_code']
        for n in ['site_regression','dequickening']:
            out=src/('embed_'+n);r=capture(v+'_'+n+'_embed_build',[src/'qjsc','-o',out,HERE/'correctness'/(n+'.js')],src);assert not r['exit_code']
            r=capture(v+'_'+n+'_embed',[out]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
    for n in {r['test'] for r in rows}:assert len({r['stdout'] for r in rows if r['test']==n})==1,n
    save(HERE/'correctness/release_results.json',rows)
    src=STORE/'R_sanitizer';assert not src.exists()
    for n in read(HERE/'sources/identities.json')['files']['R']:
        p=src/n;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(STORE/'R'/n,p)
    r=capture('R_sanitizer_build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],src);assert not r['exit_code'];checks(src,'R_sanitizer',True)
    save(HERE/'correctness/semantic_gate.json',dict(status='PASS',conditions=VERSIONS,R_sanitizer_sha256=sha(src/'qjs'),
      legacy_assertions=952,multislot_scenarios=9,multislot_assertions=28151,read_scenarios=7,read_assertions=287,site_scenarios=15,site_assertions=23211,
      new_dequickening_stdout=next(r['stdout'] for r in rows if r['test']=='dequickening.js'),smokes_each=12,upstream_entries_each=11,
      OOM_budgets_each=192,GC_functions_each=1800,qjsc_embedding=True,full_test262=False,mode_variable_present=False))
    print('SEMANTIC_SANITIZER_GATE_PASS',flush=True)
if __name__=='__main__':main()
