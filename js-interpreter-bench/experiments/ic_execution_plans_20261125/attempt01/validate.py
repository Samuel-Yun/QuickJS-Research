import argparse
from run import *

def ctest(label,mode,source,out):
 exe=binary(label,mode);d=Path(exe).parent;objects=list((d/'.obj').rglob('quickjs.o'));assert len(objects)==1;od=objects[0].parent
 name=f'{label}.{mode}.{source.stem}';dest=out/name
 flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='sanitize' else []
 cmd=['gcc','-g','-O2',*flags]+(['-DFIXTURE_DIAG'] if mode=='counts' and source.stem=='ownership' else [])+['-I'+str(d),str(source),*[str(od/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-ldl','-lpthread','-o',str(dest)]
 r=subprocess.run(cmd,capture_output=True,text=True,env=ENV);save(out/(name+'.compile.json'),dict(command=cmd,source_sha256=sha(source),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr));assert r.returncode==0,r.stderr
 r=subprocess.run([str(dest)],capture_output=True,text=True,env=ENV,timeout=180);save(out/(name+'.run.json'),dict(command=[str(dest)],exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,binary_sha256=sha(dest)))
 assert r.returncode==0,(name,r.stdout,r.stderr);print('C_PASS',name,flush=True)
def main():
 os.sched_setaffinity(0,{2});ap=argparse.ArgumentParser();ap.add_argument('group',choices=['numeric','compare','coalloc']);ap.add_argument('--output',default='validation01');a=ap.parse_args()
 labels={'numeric':['SPARSE','OLD_FORWARD','NUMERIC_PLAN','NUMERIC_OFF'],'compare':['COMPARE_FIRST','COMPARE_FULL'],'coalloc':['COALLOC','COALLOC_OFF']}[a.group]
 dest=folder(labels[-1]) if a.group!='coalloc' else HERE/'03_ctor_coalloc';out=dest/a.output;out.mkdir(exist_ok=False)
 scripts=[dest/'semantics.js',TESTS/'property_reads.js',TESTS/'safety.js'];checks=[]
 if a.group=='compare':scripts.insert(1,dest/'entry_semantics.js')
 for script in scripts:
  ref=capture('A',script,[],out,script.stem)
  for label in labels:
   for mode in ['release','counts','sanitize']:
    actual='NUMERIC_PLAN' if label=='NUMERIC_OFF' else 'COALLOC' if label=='COALLOC_OFF' else label
    if not (folder(actual)/f'{actual}.{mode}.manifest.json').exists():continue
    row=capture(label,script,[],out,script.stem,mode=mode);assert row['stdout']==ref['stdout'],(label,mode,script,row)
    checks.append(dict(label=label,mode=mode,script=str(script),matches_A=True));print('JS_PASS',label,mode,script.stem,flush=True)
 for label in labels:
  actual='NUMERIC_PLAN' if label=='NUMERIC_OFF' else 'COALLOC' if label=='COALLOC_OFF' else label
  if label.endswith('_OFF'):continue
  for mode in ['release','sanitize']:
   if not (folder(actual)/f'{actual}.{mode}.manifest.json').exists():continue
   ctest(label,mode,HERE/'serialization.c',out)
   if a.group=='coalloc':ctest(label,mode,dest/'ownership.c',out)
 if a.group=='coalloc':ctest('COALLOC','counts',dest/'ownership.c',out)
 save(out/'gate.json',dict(status='PASS',checks=checks,ASan_UBSan=True,LSan=False,LSan_note='ptrace environment; runtime release assertions enabled'))
 print('GROUP_PASS',a.group,flush=True)
if __name__=='__main__':main()
