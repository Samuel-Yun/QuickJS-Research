"""Re-run the additional native regression on this attempt's actual objects."""
from common import *
def main():
    rows=[];source=HERE/'correctness/finalizer_store.c'
    for condition,src,sanitized in [('A',Path(read(HERE/'runtime.json')['artifacts']['A']['path']).parent,False),('E',BUILD/'E',False),('E_san',BUILD/'E_san',True)]:
        exe=BUILD/('finalizer_store_'+condition)
        cmd=['gcc','-O1' if sanitized else '-O2','-g','-fwrapv','-I'+str(src),str(source)]
        if sanitized:cmd+=['-fsanitize=address,undefined','-fno-omit-frame-pointer']
        cmd += [str(src/'.obj'/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']]+['-lm','-lpthread','-ldl','-o',str(exe)]
        build=capture(cmd,condition+'.extra.build',300);save(HERE/'raw/validation'/f'{condition}.finalizer.build.json',build);assert build['exit_code']==0
        result=capture([exe],condition+'.finalizer',60);save(HERE/'raw/validation'/f'{condition}.finalizer.run.json',result)
        assert result['exit_code']==0 and not result['stderr'] and 'FINALIZER_STORE_PASS' in result['stdout'],result
        if condition!='A':assert 'mutations=512 ' in result['stdout'],result
        rows.append(dict(condition=condition,stdout=result['stdout'],source_sha256=sha(source)))
    save(HERE/'correctness/additional_gate.json',dict(status='PASS',native_finalizer_no_JS=True,conditions=rows,old_failure_retained='../attempt01/raw/validation/finalizer_store_v2'))
if __name__=='__main__':main()
