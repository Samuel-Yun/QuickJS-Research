"""Instrument all linked VM objects with ASan+UBSan; never time this runtime."""
from pathlib import Path
import shutil
import experiment as e
assert e.DIAGNOSTIC_ONLY
active=e.H/'active';rows=[]
labels=['B2','ID_READ','W1','P1','L1','C1']
e.save('sanitizer_plan.json',dict(conditions=labels,asan=True,ubsan=True,
    standard_makefile=True,performance_samples=False,full_test262=False))
for cid in labels:
    print('SANITIZER_BEGIN',cid,flush=True)
    files=e.candidate_files(cid)
    identity=e.measure.artifact(cid)
    assert {n:e.hashlib.sha256(v.encode()).hexdigest() for n,v in files.items()}==identity['source_sha256']
    for n,text in files.items():(active/n).write_bytes(text.encode())
    build=e.capture(['make','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],
                    'sanitizer_build',cid,300,dict(parent_sha256=identity['sha256'],source_sha256=identity['source_sha256']),active)
    checks=[]
    if build['exit_code']==0:
        target=e.H/'artifacts'/(cid+'.asan_ubsan.qjs')
        assert not target.exists();shutil.copyfile(active/'qjs',target);target.chmod(0o755)
        tests=[e.LAB/'checks.js',e.LAB/'v3_mass_search/semantic.js',e.LAB/'v4_refine_s001/targeted.js',
               e.V5/'targeted.js',e.H/'targeted.js',e.H/'call_targeted.js']
        for test in tests:
            r=e.capture(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1',
                         'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',target,test],
                        'sanitizer_run',cid+'/'+test.name,90,dict(binary_sha256=e.lab.sha(target),test_sha256=e.lab.sha(test)))
            checks.append(dict(test=test.name,pass_=r['exit_code']==0 and not r['stderr'],token=r['token']))
        objects=[active/'.obj/asan/ubsan'/(n+'.o') for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]
        sources=[e.lab.ROOT/'experiments/read_ic_mic/attempt01/correctness'/n for n in ['read_roundtrip.c','roundtrip_slots.c','gc_cycles.c']]
        sources.append(e.H/'native_finalizer.c')
        for src in sources:
            exe=e.H/'artifacts'/(cid+'.asan_ubsan.'+src.stem)
            r=e.capture(['gcc','-O2','-g','-fsanitize=address,undefined','-fno-omit-frame-pointer',
                         '-I'+str(active),src,*objects,'-lm','-lpthread','-ldl','-o',exe],
                        'sanitizer_build',cid+'/'+src.name,60)
            if r['exit_code']==0:
                r=e.capture(['env','ASAN_OPTIONS=detect_leaks=1:abort_on_error=1',
                             'UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1',exe],
                            'sanitizer_run',cid+'/'+src.name,90,dict(binary_sha256=e.lab.sha(exe)))
            checks.append(dict(test=src.name,pass_=r['exit_code']==0 and not r['stderr'],token=r['token']))
        result=dict(condition=cid,status='PASS_TARGETED_ASAN_UBSAN' if all(x['pass_'] for x in checks) else 'BLOCKED_SANITIZER',
                    tests=checks,parent_sha256=identity['sha256'],binary_sha256=e.lab.sha(target),full_test262=False)
    else:
        result=dict(condition=cid,status='BLOCKED_SANITIZER_BUILD',token=build['token'],stderr=build['stderr'])
    e.save('sanitizer.'+cid+'.json',result);rows.append(result)
    print('SANITIZER_END',cid,result['status'],flush=True)
e.save('sanitizer_summary.json',rows)
