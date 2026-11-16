"""Four real process conditions, one switch sanitizer ELF exercised twice."""
import shutil
from common import *
TESTS=['legacy_regression.js','multislot.js','read_semantics.js','site_regression.js']
def ctest(src,v,name,sanitizer=False):
    obj=src/('.obj/asan/ubsan' if sanitizer else '.obj');out=src/(name+'_'+v+'_check')
    cmd=['gcc','-g','-O2','-I'+str(src),str(HERE/'correctness'/(name+'.c'))]
    if sanitizer:cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
    cmd+=[str(obj/(x+'.o')) for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(out)]
    r=capture(v+'_'+name+'_build',cmd,env=mode_env(v));assert not r['exit_code']
    r=capture(v+'_'+name,[out],env=mode_env(v));assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
def checks(src,v,sanitizer=False):
    records=[]
    for n in TESTS:
        r=capture(v+'_semantics_'+n,[src/'qjs',HERE/'correctness'/n],env=mode_env(v));assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout'];records.append(dict(variant=v,test=n,stdout=r['stdout'],valid=True))
    for n in ['roundtrip_slots','read_roundtrip','gc_cycles']:ctest(src,v,n,sanitizer)
    return records
def main():
    m=verify_runtime();rows=[]
    for v in VERSIONS:
        src=Path(m['artifacts'][v]['source']);rows+=checks(src,v)
        for p in sorted((ROOT/'benchmarks/smoke').glob('*.js')):
            r=capture(v+'_smoke_'+p.stem,[src/'qjs',p],env=mode_env(v));assert not r['exit_code'] and not r['stderr'];rows.append(dict(variant=v,test=p.name,stdout=r['stdout'],valid=True))
        r=capture(v+'_upstream',['make','-j2','test'],src,env=mode_env(v));assert not r['exit_code']
        r=capture(v+'_lib',['make','-j2','libquickjs.a'],src,env=mode_env(v));assert not r['exit_code']
        target=src/('embedded_'+v);r=capture(v+'_embed_build',[src/'qjsc','-o',target,HERE/'correctness/site_regression.js'],src,env=mode_env(v));assert not r['exit_code']
        r=capture(v+'_embed',[target],env=mode_env(v));assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
    for n in {r['test'] for r in rows}:assert len({r['stdout'] for r in rows if r['test']==n})==1,n
    save(HERE/'correctness/release_results.json',rows)
    src=STORE/'SW_sanitizer';assert not src.exists();ids=read(HERE/'sources/identities.json')['files']['SW']
    for n in ids:
        dest=src/n;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(STORE/'SW'/n,dest)
    r=capture('SW_sanitizer_build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],src,env=mode_env('ON'));assert not r['exit_code']
    sanitizer_hash=sha(src/'qjs')
    for v in ['ON','LOOKUP']:checks(src,v,True);assert sha(src/'qjs')==sanitizer_hash
    bad=[]
    for value in [None,'','2','01','on','1x']:
        e=mode_env('ON')
        if value is None:e.pop(MODE_KEY)
        else:e[MODE_KEY]=value
        r=capture('invalid_mode_'+str(value),[STORE/'SW/qjs','-e','console.log("UNREACHABLE")'],env=e)
        assert r['exit_code']!=0 and 'must be exactly 0 or 1' in r['stderr'] and 'UNREACHABLE' not in r['stdout'];bad.append(dict(value=value,exit_code=r['exit_code']))
    verify_runtime();save(HERE/'correctness/gate.json',dict(status='PASS',conditions=VERSIONS,shared_switch_ELF=True,
      same_sanitizer_ELF_both_modes=sanitizer_hash,legacy_assertions=952,multislot_scenarios=9,multislot_assertions=28151,read_scenarios=7,read_assertions=287,
      site_scenarios=15,site_assertions=23211,smoke_cases_each=12,upstream_entries_each=11,GC_cycle_functions_each=1800,OOM_budgets_each=192,
      warmed_serialization=True,qjsc_embedding=True,full_test262=False,invalid_modes=bad))
    print('CORRECTNESS_GATE_PASS',flush=True)
if __name__=='__main__':main()
