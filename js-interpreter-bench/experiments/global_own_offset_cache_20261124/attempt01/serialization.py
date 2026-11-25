"""Run the package's existing prepared-bytecode and ROM round trip."""
import subprocess

from build import HERE,PACKAGE,save
from validate import directory,ENV


def main():
    rows=[];(HERE/'validation').mkdir(exist_ok=True)
    for label,mode in [('A','release'),('SPARSE','release'),('GLOBAL_OWN_OFFSET_CACHE','release'),('GLOBAL_OWN_OFFSET_CACHE','sanitize')]:
        d=directory(label,mode);obj=list((d/'.obj').rglob('quickjs.o'))[0].parent
        exe=HERE/'validation'/f'{label}.{mode}.serialization'
        flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='sanitize' else []
        cmd=['gcc','-g','-O2',*flags,'-I'+str(d),str(PACKAGE/'tests/serialization.c'),
             *[str(obj/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-ldl','-lpthread','-o',str(exe)]
        r=subprocess.run(cmd,capture_output=True,text=True);assert r.returncode==0,r.stderr
        r=subprocess.run([str(exe)],capture_output=True,text=True,env=ENV)
        row=dict(label=label,mode=mode,compile_command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr)
        rows.append(row);save(HERE/'serialization.json',dict(runs=rows))
        assert r.returncode==0 and r.stdout=='PREPARED_SERIALIZATION_ROM_PASS\n' and not r.stderr,row
        print('SERIALIZATION_PASS',label,mode,flush=True)
    save(HERE/'serialization.json',dict(status='PASS',runs=rows))


if __name__=='__main__':main()
