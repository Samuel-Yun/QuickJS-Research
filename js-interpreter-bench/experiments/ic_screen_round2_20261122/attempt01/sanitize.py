"""Target the new plan ownership and compact bytecode buffers with sanitizers."""
import json
import os
from pathlib import Path
import shutil
import subprocess

from build import HERE,PACKAGE,save,sha


def main():
    results={}
    for label in ['P2_COLD','D16_STATIC']:
        d=HERE/'work'/(label+'.sanitize');d.mkdir(parents=True,exist_ok=True)
        m=json.loads((HERE/(label+'.release.manifest.json')).read_text())
        src=Path(m['binary']).parent
        for n in m['sources']:
            p=d/n;p.parent.mkdir(parents=True,exist_ok=True)
            if not p.exists() or sha(p)!=sha(src/n):shutil.copyfile(src/n,p)
        command=['make','-j2','-o','repl.c','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs']
        try:
            with (HERE/(label+'.sanitize.build.log')).open('w') as log:
                subprocess.run(command,cwd=d,stdout=log,stderr=subprocess.STDOUT,check=True)
            # LeakSanitizer cannot run under this tool's ptrace supervisor.
            # AddressSanitizer and UBSan remain enabled for every check.
            env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
            checks=[]
            for script in [HERE/'semantics.js',HERE/'d16_cases.js',PACKAGE/'tests/property_reads.js']:
                r=subprocess.run([str(d/'qjs'),str(script)],capture_output=True,text=True,env=env,timeout=120)
                save(HERE/(label+'.sanitize.'+script.stem+'.json'),dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr))
                assert r.returncode==0 and not r.stderr,r.stderr
                checks.append(script.name)
            objects=list((d/'.obj').rglob('quickjs.o'));assert len(objects)==1
            obj=objects[0].parent
            command=['gcc','-g','-O2','-fsanitize=address,undefined','-fno-omit-frame-pointer','-I'+str(d),str(HERE/'lifetime.c'),
                *[str(obj/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-ldl','-lpthread','-o',str(d/'lifetime')]
            r=subprocess.run(command,capture_output=True,text=True);assert r.returncode==0,r.stderr
            r=subprocess.run([str(d/'lifetime')],capture_output=True,text=True,env=env,timeout=120)
            save(HERE/(label+'.sanitize.lifetime.json'),dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr))
            assert r.returncode==0 and r.stdout=='LIFETIME_PASS\n' and not r.stderr,r.stderr
            results[label]=dict(status='PASS',checks=checks+['GC lifetime'])
            print('SANITIZER_PASS',label,flush=True)
        except Exception as e:
            results[label]=dict(status='FAIL',error=str(e));print('SANITIZER_FAIL',label,str(e)[:1600],flush=True)
    save(HERE/'sanitize.json',dict(results=results,ASan=True,UBSan=True,
         LSan=False,LSan_reason='LeakSanitizer reported ptrace supervisor unsupported'))


if __name__=='__main__':main()
