import json,os,subprocess
from pathlib import Path
from build import HERE,PACKAGE,LABELS,sha,save
from run import ENV,binary,capture

def fixture(label,mode):
 d=Path(binary(label,mode)).parent;obj=list((d/'.obj').rglob('quickjs.o'))[0].parent
 folder=HERE/'validation';folder.mkdir(exist_ok=True);name=f'{label}.{mode}.fixture';exe=folder/name
 flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='sanitize' else []
 cmd=['gcc','-g','-O2','-fwrapv','-D_GNU_SOURCE','-DHAVE_CLOSEFROM','-DCONFIG_VERSION="2026-06-04"',*flags]
 if label!='A':cmd+=['-DOG_METHOD=1']
 cmd+=['-I'+str(d),str(HERE/'fixture.c'),*[str(obj/(n+'.o')) for n in ['dtoa','libregexp','libunicode','cutils']],'-lm','-ldl','-lpthread','-o',str(exe)]
 r=subprocess.run(cmd,capture_output=True,text=True);save(folder/(name+'.compile.json'),dict(command=cmd,source_sha256=sha(HERE/'fixture.c'),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr));assert r.returncode==0,r.stderr
 env=dict(ENV)
 if mode=='counts':env['OG_OUTPUT']=str(folder/(name+'.counts.json'))
 r=subprocess.run([str(exe)],capture_output=True,text=True,env=env,timeout=180);row=dict(label=label,mode=mode,command=[str(exe)],exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,binary_sha256=sha(exe));save(folder/(name+'.run.json'),row)
 assert r.returncode==0 and 'NUMERIC_AND_DETACH_AND_GC_PASS' in r.stdout,row
 assert all(x.startswith('OG_LAYOUT ') for x in r.stderr.splitlines()),row
 print('FIXTURE_PASS',label,mode,flush=True);return row

def main():
 os.sched_setaffinity(0,{2});rows=[]
 for script in [HERE/'semantics.js',PACKAGE/'tests/property_reads.js',PACKAGE/'tests/safety.js']:
  ref=capture('A','release',script,[],'validation_js',script.stem)
  for l in LABELS:
   for m in (['release','counts'] if l=='SPARSE' else ['release','counts','sanitize']):
    row=capture(l,m,script,[],'validation_js',script.stem);assert row['stdout']==ref['stdout'];rows.append(dict(label=l,mode=m,script=str(script),matches_A=True));print('SEMANTIC_PASS',l,m,script.stem,flush=True)
 for l,m in [('A','release'),('SPARSE','release'),('RELAX_CLASS','sanitize'),('SHAPE_ONLY','sanitize')]:fixture(l,m)
 save(HERE/'gate.json',dict(status='PASS',comparisons=rows,internal_cross_class_numeric_detach=True,ASan=True,UBSan=True,LSan=False,LSan_note='ptrace: detect_leaks=0; QuickJS runtime shutdown assertions enabled'))
if __name__=='__main__':main()
