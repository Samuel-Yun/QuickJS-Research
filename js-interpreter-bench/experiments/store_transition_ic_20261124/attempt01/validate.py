import json,os,subprocess
from pathlib import Path
from build import HERE,PACKAGE,LABELS,sha,save
from run import ENV,binary,capture

def directory(label,mode):return Path(binary(label,mode)).parent

def fixture(label,mode):
 d=directory(label,mode);obj=list((d/'.obj').rglob('quickjs.o'))[0].parent
 out=HERE/'validation';out.mkdir(exist_ok=True);name=f'{label}.{mode}.fixture';exe=out/name
 flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='sanitize' else []
 cmd=['gcc','-g','-O2','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"',*flags,'-I'+str(d),str(HERE/'fixture.c'),*[str(obj/(n+'.o')) for n in ['dtoa','libregexp','libunicode','cutils']],'-lm','-ldl','-lpthread','-o',str(exe)]
 r=subprocess.run(cmd,capture_output=True,text=True);save(out/(name+'.compile.json'),dict(command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr));assert r.returncode==0,r.stderr
 env=dict(ENV)
 if mode=='counts':env['ST_OUTPUT']=str(out/(name+'.counts.json'))
 r=subprocess.run([str(exe)],capture_output=True,text=True,env=env,timeout=180);row=dict(label=label,mode=mode,command=[str(exe)],exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,binary_sha256=sha(exe));save(out/(name+'.run.json'),row)
 assert r.returncode==0 and 'STORE_FIXTURE_PASS' in r.stdout and not r.stderr,row
 print('FIXTURE_PASS',label,mode,flush=True);return row

def main():
 os.sched_setaffinity(0,{2});rows=[]
 for script in [HERE/'semantics.js',PACKAGE/'tests/property_reads.js',PACKAGE/'tests/safety.js']:
  ref=capture('A','release',script,[],'validation_js02',script.stem)
  for l,m in [('SPARSE','release'),('SPARSE','counts'),('STORE_TRANSITION_IC','release'),('STORE_TRANSITION_IC','counts'),('STORE_TRANSITION_IC','sanitize')]:
   r=capture(l,m,script,[],'validation_js02',script.stem);assert r['stdout']==ref['stdout'];rows.append(dict(label=l,mode=m,script=str(script),matches_A=True));print('SEMANTIC_PASS',l,m,script.stem,flush=True)
 for l,m in [('A','release'),('SPARSE','release'),('STORE_TRANSITION_IC','counts'),('STORE_TRANSITION_IC','sanitize')]:fixture(l,m)
 save(HERE/'gate.json',dict(status='PASS',comparisons=rows,fixture=True,ASan=True,UBSan=True,LSan=False,LSan_note='detect_leaks=0 under ptrace, QuickJS FreeRuntime assertions enabled'))
if __name__=='__main__':main()
