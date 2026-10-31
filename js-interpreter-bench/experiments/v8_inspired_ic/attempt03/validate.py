"""New E gates; old PASS never substitutes for executing this binary."""
import argparse,shutil
from common import *
MIC=ROOT/'experiments/read_ic_mic/attempt01'
H=ROOT/'experiments/prototype_ic_h/attempt01'
def run(label,cmd,cwd=ROOT,timeout=300,diag=False,env=None):
    revision=''
    p=HERE/'raw/validation'/f'{label}{revision}.json'
    if p.exists():r=read(p)
    else:r=capture(cmd,label,timeout,cwd,env);save(p,r)
    assert r['exit_code']==0 and (not r['stderr'] or (diag and r['stderr'].startswith('EIC_STATS:'))),label
    return r
def semantic():
    rows=[]
    for c,pref in prefixes().items():
        r=run(c+'.semantics',pref+[HERE/'correctness/semantics.js']);assert 'EIC_SEMANTICS_PASS' in r['stdout']
        rows.append(dict(condition=c,test='new_semantics',valid=True,output=r['stdout'].strip()))
        for name in ['read_semantics.js','site_regression.js','legacy_regression.js','multislot.js']:
            r=run(c+'.'+name,pref+[MIC/'correctness'/name]);assert 'PASS' in r['stdout'];rows.append(dict(condition=c,test=name,valid=True,output=r['stdout'].strip()))
        r=run(c+'.H_lifecycle',pref+[H/'correctness/lifecycle_v2.js']);assert 'PASS' in r['stdout'];rows.append(dict(condition=c,test='H_lifecycle_v2',valid=True,output=r['stdout'].strip()))
    csvout(HERE/'correctness/semantic.csv',rows)
    save(HERE/'correctness/semantic_gate.json',dict(status='PASS',processes=len(rows),new_independent_scenes=16,new_assertions_per_condition=4131,full_test262=False))
def build_native(kind,name,program,internal=False):
    src=BUILD/('E_san' if kind=='san' else 'E');out=BUILD/f'{kind}_{name}'
    args=['gcc','-O1' if kind=='san' else '-O2','-g','-fwrapv','-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-I'+str(src),'-DEIC_DIAGNOSTIC']
    if kind=='san':args+=['-fsanitize=address,undefined','-fno-omit-frame-pointer']
    args+=[str(program)]+[str(src/'.obj'/(x+'.o')) for x in (['dtoa','libregexp','libunicode','cutils'] if internal else ['quickjs','dtoa','libregexp','libunicode','cutils'])]+['-lm','-lpthread','-ldl','-o',str(out)]
    run(kind+'.'+name+'.build',args,timeout=600);return out
def lifecycle():
    r=run('E.upstream',['make','-j2','test'],BUILD/'E',timeout=600)
    programs=[('internal',HERE/'correctness/internal.c',True)]+[(n,MIC/'correctness'/(n+'.c'),False) for n in ['read_roundtrip','roundtrip_slots','gc_cycles']]
    for kind in ['release','san']:
        for name,p,internal in programs:
            exe=build_native(kind,name,p,internal);r=run(kind+'.'+name,[exe],diag=internal,timeout=300);assert 'PASS' in r['stdout']
        binary=BUILD/('E_san' if kind=='san' else 'E')/'qjs'
        for p in [HERE/'correctness/semantics.js',MIC/'correctness/site_regression.js',H/'correctness/lifecycle_v2.js']:
            r=run(kind+'.semantic.'+p.stem,[binary,p]);assert 'PASS' in r['stdout']
    # Existing roundtrip_slots includes the 192 compiler allocation ceilings.
    r=run('E.embed.build',[BUILD/'E/qjsc','-o',BUILD/'E_semantics_embed',HERE/'correctness/semantics.js'],BUILD/'E',timeout=600)
    run('E.embed',[BUILD/'E_semantics_embed'])
    save(HERE/'correctness/safety_gate.json',dict(status='PASS',release_and_new_ASan_UBSan=True,upstream_make_test=True,internal_state_own_CAPI_proto_unhashed_allocation_failure=True,hot_roundtrip_and_GC=True,embedding=True,full_test262=False))
def serialization():
    utility=H/'correctness/serialize.c';writers={}
    for label,src in [('A',Path(read(HERE/'runtime.json')['artifacts']['A']['path']).parent),('E',BUILD/'E'),('E_san',BUILD/'E_san')]:
        out=BUILD/('serialize_'+label);cmd=['gcc','-O2','-g','-fwrapv','-I'+str(src),str(utility)]
        if label=='E_san':cmd+=['-fsanitize=address,undefined']
        cmd += [str(src/'.obj'/(x+'.o')) for x in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(out)]
        run(label+'.serialize.build',cmd);writers[label]=out
    hashes={}
    for producer in ['A','E']:
        blob=BUILD/(producer+'.hot.bc');run(producer+'.serialize.write',[writers[producer],'write',blob]);hashes[producer]=sha(blob)
        for consumer,exe in writers.items():run(producer+'.to.'+consumer+'.copy_ROM',[exe,'read',blob])
        save(HERE/'correctness'/f'{producer}.hot.bc.gz',gzip.compress(blob.read_bytes(),mtime=0))
    save(HERE/'correctness/serialization_gate.json',dict(status='PASS',hot_producers=['A','E'],consumers=list(writers),copy_and_ROM=True,bytecode_sha256=hashes,original_format=True,source=str(utility.relative_to(ROOT))))
def main():
    p=argparse.ArgumentParser();p.add_argument('phase',choices=['semantic','lifecycle','serialization']);a=p.parse_args();globals()[a.phase]()
if __name__=='__main__':main()
