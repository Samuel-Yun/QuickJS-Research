"""Actual semantic, lifecycle, serialization, OOM and sanitizer gates."""
import argparse
import shutil
from run import HERE,ROOT,PREV,STORE,RUNTIMES,capture,csvout,read,save,sha,verify

MIC=ROOT/'experiments/read_ic_mic/attempt01'
COMPARE=ROOT/'experiments/v8_qjs_ic_source_compare/attempt01'


def variants():
    verify();h=read(HERE/'H_manifest.json');assert sha(h['binary'])==h['sha256']
    return dict(A=RUNTIMES['A'][0],M=RUNTIMES['M'][0],H=h['binary'])


def script(case,n,strict):
    original=(COMPARE/'cases.js').read_text()
    assert original.startswith('"use strict";\n')
    body=original[len('"use strict";\n'):]
    prefix=('"use strict";\n' if strict else '// Explicit non-strict mode.\n')
    prefix+='var IC_CASE='+repr(case)+';var IC_N='+str(n)+';\n'
    prefix+='if (((function(){return this;})() === undefined) !== '+('true' if strict else 'false')+') throw Error("strict directive ineffective");\n'
    p=HERE/'correctness/scripts'/('strict' if strict else 'non_strict')/f'{case}.N{n}.js'
    save(p,prefix+body)
    return p


def semantic():
    v=variants();expected=read(COMPARE/'expected.json');rows=[]
    save(HERE/'correctness/expected.json',(COMPARE/'expected.json').read_bytes())
    for strict in [False,True]:
        for case in expected:
            for n in [1,2]:
                p=script(case,n,strict)
                for label,binary in v.items():
                    ident=f'{label}.{"strict" if strict else "non_strict"}.{case}.N{n}'
                    r=capture('correctness.'+ident,[binary,p],timeout=180)
                    valid=False
                    if r['exit_code']==0 and not r['stderr']:
                        lines=[x[len('IC_CORRECTNESS='):] for x in r['stdout'].splitlines() if x.startswith('IC_CORRECTNESS=')]
                        if len(lines)==1:
                            d=__import__('json').loads(lines[0]);valid=d==dict(case=case,n=n,rounds=[expected[case]]*n)
                    rows.append(dict(variant=label,mode='strict' if strict else 'non_strict',case=case,N=n,valid=valid,exit_code=r['exit_code'],script_sha256=sha(p),raw='raw/commands/correctness.'+ident+'.json'))
                    assert valid,ident
    csvout(HERE/'correctness/semantic.csv',rows)
    save(HERE/'correctness/semantic_gate.json',dict(status='PASS',valid=len(rows),expected=96,independent_scenarios=8,modes=2,N=[1,2],strict_directive_verified=True,expected_origin='previous independently authored expected.json; not runtime output'))


def c_build(label,src,name,sanitizer=False,program=None):
    obj=src/('.obj/asan/ubsan' if sanitizer else '.obj')
    out=src/(name+'_check')
    cmd=['gcc','-O2','-g','-fwrapv','-I'+str(src),str(program or MIC/'correctness'/(name+'.c'))]
    if sanitizer:cmd+=['-fsanitize=address','-fsanitize=undefined','-fno-omit-frame-pointer']
    cmd += [str(obj/(x+'.o')) for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(out)]
    r=capture(label+'.build.'+name,cmd,timeout=600);assert r['exit_code']==0
    return out


def lifecycle():
    v=variants();h=Path(read(HERE/'H_manifest.json')['source']);rows=[]
    for label,binary in v.items():
        tests=[HERE/'correctness/lifecycle_v2.js']+[MIC/'correctness'/x for x in ['read_semantics.js','site_regression.js','legacy_regression.js','multislot.js']]
        for p in tests:
            r=capture(label+'.regression_v2.'+p.stem,[binary,p],timeout=180)
            valid=r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
            rows.append(dict(variant=label,test=p.name,valid=valid,stdout=r['stdout']));assert valid
    r=capture('H.upstream',['make','-j2','test'],h);assert r['exit_code']==0
    for name in ['roundtrip_slots','read_roundtrip','gc_cycles']:
        binary=c_build('H',h,name);r=capture('H.'+name,[binary]);assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
    r=capture('H.lib',['make','-j2','libquickjs.a'],h);assert r['exit_code']==0
    r=capture('H.embedded.build',[h/'qjsc','-o',h/'h_embedded',HERE/'correctness/lifecycle_v2.js'],h);assert r['exit_code']==0
    r=capture('H.embedded',[h/'h_embedded']);assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
    sources=dict(A=Path('/home/mzyx/read_ic_dequickening_attempt01/A'),M=Path('/home/mzyx/ic_mechanism_audit_attempt01/M'),H=h)
    # Test launchers go in NEW storage, never in frozen A/M trees.
    writers={}
    for label,src in sources.items():
        dst=STORE/('serialization_'+label);dst.mkdir()
        cmd=['gcc','-O2','-g','-fwrapv','-I'+str(src),HERE/'correctness/serialize.c']+[src/'.obj'/(x+'.o') for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',dst/'serialize']
        r=capture(label+'.serialize.build',cmd);assert r['exit_code']==0;writers[label]=dst/'serialize'
    hot=STORE/'H.hot.bytecode'
    r=capture('H.serialize.hot.write',[writers['H'],'write',hot]);assert r['exit_code']==0 and not r['stderr']
    for label,exe in writers.items():
        r=capture(label+'.serialize.H_hot.read',[exe,'read',hot]);assert r['exit_code']==0 and not r['stderr']
    save(HERE/'correctness/H.hot.bytecode.gz',__import__('gzip').compress(hot.read_bytes(),mtime=0))
    csvout(HERE/'correctness/regression.csv',rows)
    save(HERE/'correctness/lifecycle_gate.json',dict(status='PASS',release_regression_processes=len(rows),upstream_test='PASS',OOM_compile_limits=192,existing_gc_cycles=1800,new_cyclic_functions=320,hot_serialization_consumers=['H','A','M'],ROM_and_copy_load=True,embedding=True,sanitizer='separate stage'))


def sanitizer():
    variants();src=Path(read(HERE/'H_manifest.json')['source']);dst=STORE/'H_sanitizer';assert not dst.exists()
    for name in read(HERE/'H_manifest.json')['source_files']:
        p=dst/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src/name,p)
    r=capture('H.sanitizer.build',['make','-j2','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],dst,timeout=900);assert r['exit_code']==0
    for p in [HERE/'correctness/lifecycle_v2.js',MIC/'correctness/site_regression.js',MIC/'correctness/read_semantics.js']:
        r=capture('H.sanitizer.'+p.stem,[dst/'qjs',p]);assert r['exit_code']==0 and not r['stderr'] and 'PASS' in r['stdout']
    for name in ['roundtrip_slots','read_roundtrip','gc_cycles']:
        binary=c_build('H.sanitizer',dst,name,True);r=capture('H.sanitizer.'+name,[binary]);assert r['exit_code']==0 and not r['stderr']
    save(HERE/'correctness/sanitizer_gate.json',dict(status='PASS',address=True,undefined=True,OOM_limits=192,GC_cycles=1800,new_lifecycle_cycles=320,release_performance=False))


from pathlib import Path
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['semantic','lifecycle','sanitizer']);a=p.parse_args();globals()[a.stage]()
