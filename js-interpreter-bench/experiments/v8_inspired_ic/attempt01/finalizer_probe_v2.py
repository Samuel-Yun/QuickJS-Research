"""Correct the test's class-id initialization, retaining the first failed probe.
The tested E binary and all frozen campaign files remain unchanged.
"""
from common import *
out=HERE/'raw/validation/finalizer_store_v2'
out.mkdir(exist_ok=False)
original=HERE/'correctness/finalizer_store.c'
source=original.read_text()
assert source.count('JSClassID id;JS_NewClassID(&id);')==1
source=source.replace('JSClassID id;JS_NewClassID(&id);','JSClassID id=0;JS_NewClassID(&id);')
fixed=HERE/'correctness/finalizer_store_v2.c'
save(fixed,source)
save(out/'source.json',dict(original_sha256=sha(original),fixed_sha256=sha(fixed),change='Initialize JSClassID to 0 as required by JS_NewClassID; v1 A/E exited before the workload.'))
for condition,src,sanitized in [('A',Path(read(HERE/'runtime.json')['artifacts']['A']['path']).parent,False),('E',BUILD/'E',False),('E_san',BUILD/'E_san',True)]:
    exe=BUILD/('finalizer_store_v2_'+condition)
    cmd=['gcc','-O1' if sanitized else '-O2','-g','-fwrapv','-I'+str(src),str(fixed)]
    if sanitized:cmd+=['-fsanitize=address,undefined','-fno-omit-frame-pointer']
    cmd += [str(src/'.obj'/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(exe)]
    build=capture(cmd,condition+'.finalizer_store_v2.build',300);save(out/(condition+'.build.json'),build)
    assert build['exit_code']==0
    result=capture([exe],condition+'.finalizer_store_v2',60);save(out/(condition+'.run.json'),result)
    print(condition,result['exit_code'],result['stdout'],result['stderr'][:4000],flush=True)
