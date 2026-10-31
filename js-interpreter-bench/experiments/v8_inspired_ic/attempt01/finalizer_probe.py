"""Additional independent native regression; does not change frozen artifacts."""
from common import *
out=HERE/'raw/validation/finalizer_store'
out.mkdir(exist_ok=False)
for condition,src,sanitized in [('A',Path(read(HERE/'runtime.json')['artifacts']['A']['path']).parent,False),('E',BUILD/'E',False),('E_san',BUILD/'E_san',True)]:
    exe=BUILD/('finalizer_store_'+condition)
    cmd=['gcc','-O1' if sanitized else '-O2','-g','-fwrapv','-I'+str(src),str(HERE/'correctness/finalizer_store.c')]
    if sanitized:cmd+=['-fsanitize=address,undefined','-fno-omit-frame-pointer']
    cmd += [str(src/'.obj'/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(exe)]
    build=capture(cmd,condition+'.finalizer_store.build',300);save(out/(condition+'.build.json'),build)
    assert build['exit_code']==0,build
    result=capture([exe],condition+'.finalizer_store',60);save(out/(condition+'.run.json'),result)
    print(condition,result['exit_code'],result['stdout'],result['stderr'][-5000:],flush=True)
