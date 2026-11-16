"""Owned single source/build directory; immutable binary snapshots and patches."""
import difflib
import hashlib
import json
from pathlib import Path
import shutil
import tarfile
import sys
import importlib
r=sys.modules.get('__main__')
if not r or not hasattr(r,'H') or Path(r.__file__).resolve().name!='run.py':
    r=importlib.import_module('run')

e, H = r.e, r.H
variants=e.load_module('v7_source_variants',H/'variants.py')


def files(label):
    return variants.render(label, e.seed_module.seed('s001'))


def build(label):
    e.gate()
    _, active = r.inventory()
    assert not active, active
    assert not (H/'identities'/(label+'.json')).exists()
    e.os.sched_setaffinity(0,{2})
    seed=e.seed_module.seed('s001')
    material=files(label)
    destination=H/'active'
    destination.mkdir(exist_ok=True)
    prior=H/'active.identity.json'
    if prior.exists():
        identity=e.lab.load(prior)
        assert all(e.lab.sha(destination/n)==v for n,v in identity['source_sha256'].items()),'Unrecorded active source edits'
    for n,text in material.items():
        (destination/n).write_bytes(text.encode())
    with tarfile.open(H.parent/'v3_mass_search/build_support.tar.gz') as archive:
        e.lab.save(destination/'compat/test-closefrom.c',archive.extractfile('compat/test-closefrom.c').read())
    source={n:e.lab.sha(destination/n) for n in material}
    (H/'active.identity.json').write_text(json.dumps(dict(label=label,source_sha256=source),indent=2)+'\n')
    def diff(parent):
        return ''.join(''.join(difflib.unified_diff(parent.get(n,'').splitlines(True),text.splitlines(True),
             fromfile='a/'+n,tofile='b/'+n)) for n,text in material.items() if text!=parent.get(n,''))
    r.save('patches/'+label+'.from_s001.patch',diff(seed))
    parent=variants.PARENTS[label]
    r.save('patches/'+label+'.patch',diff(seed if parent=='s001' else files(parent)))
    clean=e.capture(['make','clean'],'build_clean',label,30,cwd=destination)
    assert clean['exit_code']==0
    result=e.capture(['make','-j1','qjs','qjsc'],'build',label,300,dict(source_sha256=source),destination)
    r.save('raw/build.'+label+'.json',result)
    assert result['exit_code']==0,result['stderr'][-4000:]
    commands=[s for s in result['stdout'].splitlines() if s.startswith('gcc ')]
    compileline=next(s for s in commands if ' -c -o .obj/quickjs.o ' in s)
    assert all(s in compileline for s in ['-O2','-g','-fwrapv','-DHAVE_CLOSEFROM'])
    assert not any(s in compileline for s in ['-O3','-DNDEBUG','-flto','-fprofile'])
    for ext in ['qjs','qjsc']:
        target=H/'artifacts'/(label+'.'+ext)
        assert not target.exists()
        shutil.copyfile(destination/ext,target);target.chmod(0o755)
    art=H/'artifacts'/(label+'.qjs')
    identity=dict(id=label,parent=parent,path=str(art),sha256=e.lab.sha(art),size=art.stat().st_size,
         source_sha256=source,patch_base='s001',patch_sha256=e.lab.sha(H/'patches'/(label+'.from_s001.patch')),
         compiler=e.lab.load(H/'environment.json')['compiler'],commands=commands,boot_id=e.lab.boot(),
         performance_instrumentation=label=='IO_DIAG' or label.endswith('_STATS'))
    r.save('identities/'+label+'.json',identity)
    if label=='IO_DIAG' or label.endswith('_STATS'):
        print('DIAGNOSTIC_BUILT',label,flush=True)
        return
    checks=[]
    for test in [H/'targeted.js',H.parent/'checks.js',H.parent/'v3_mass_search/semantic.js']:
        result=e.capture([art,test],'correctness',label+'/'+test.name,60,
                         dict(binary_sha256=identity['sha256'],script_sha256=e.lab.sha(test)))
        checks.append(dict(test=str(test),pass_=result['exit_code']==0 and not result['stderr'],token=result['token']))
    r.save('correctness.'+label+'.json',dict(status='PASS' if all(x['pass_'] for x in checks) else 'FAIL',checks=checks))
    assert all(x['pass_'] for x in checks),checks
    print('BUILT_CHECKED',label,identity['sha256'],flush=True)


def safety(label):
    e.gate()
    _, active=r.inventory()
    assert not active,active
    e.os.sched_setaffinity(0,{2})
    art=e.lab.load(H/'identities'/(label+'.json'))
    source=H/'active'
    assert all(e.lab.sha(source/n)==v for n,v in art['source_sha256'].items())
    b=e.capture(['make','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],
                 'sanitizer_build',label,300,dict(source_sha256=art['source_sha256']),source)
    assert b['exit_code']==0,b['stderr'][-4000:]
    target=H/'artifacts'/(label+'.sanitized.qjs')
    assert not target.exists()
    shutil.copyfile(source/'qjs',target);target.chmod(0o755)
    checks=[]
    prefix=['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1','UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1']
    for test in [H/'targeted.js',H.parent/'checks.js']:
        result=e.capture([*prefix,target,test],'sanitizer_run',label+'/'+test.name,90,
                         dict(binary_sha256=e.lab.sha(target),script_sha256=e.lab.sha(test)))
        checks.append(dict(test=str(test),pass_=result['exit_code']==0 and not result['stderr'],token=result['token']))
    objects=[source/'.obj/asan/ubsan'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
    old=e.lab.ROOT/'experiments/read_ic_mic/attempt01/correctness'
    for test in [old/'read_roundtrip.c',old/'gc_cycles.c',r.V6/'native_finalizer.c']:
        exe=H/'artifacts'/(label+'.sanitized.'+test.stem)
        b=e.capture(['gcc','-O2','-g','-fsanitize=address,undefined','-fno-omit-frame-pointer',
              '-I'+str(source),test,*objects,'-lm','-lpthread','-ldl','-o',exe],
              'sanitizer_build',label+'/'+test.name,60)
        assert b['exit_code']==0,b['stderr'][-3000:]
        result=e.capture([*prefix,exe],'sanitizer_run',label+'/'+test.name,90)
        checks.append(dict(test=str(test),pass_=result['exit_code']==0 and not result['stderr'],token=result['token']))
    status='PASS' if all(x['pass_'] for x in checks) else 'FAIL'
    tag='IO' if label.startswith('IO') else label[:2]
    target=H/'artifacts'/(label+'.internal')
    built=e.capture(['gcc','-O2','-g','-fwrapv','-DHAVE_CLOSEFROM',
        '-D_GNU_SOURCE','-DCONFIG_VERSION="2026-06-04"','-DV7_TEST_'+tag,
        '-I'+str(source),H/'internal.c',
        *[p for p in objects if p.name!='quickjs.o'],
        '-fsanitize=address,undefined','-fno-omit-frame-pointer','-lm','-lpthread','-ldl','-o',target],
        'sanitizer_build',label+'/internal',300)
    if built['exit_code']==0:
        tested=e.capture([*prefix,target],'sanitizer_run',label+'/internal',90)
        checks.append(dict(test='internal.c',pass_=tested['exit_code']==0 and not tested['stderr'],token=tested['token']))
    else:
        checks.append(dict(test='internal.c',pass_=False,token=built['token']))
    status='PASS' if all(x['pass_'] for x in checks) else 'FAIL'
    r.save('sanitizer.'+label+'.json',dict(status=status,checks=checks,full_test262=False,
           release_sha256=art['sha256'],sanitizer_sha256=e.lab.sha(target)))
    assert status=='PASS',checks
    print('SANITIZER_PASS',label,flush=True)
