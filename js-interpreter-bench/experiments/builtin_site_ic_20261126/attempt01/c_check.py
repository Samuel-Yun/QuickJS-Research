from run import *
os.sched_setaffinity(0,{1});out=next_out(HERE,'c_validation');out.mkdir();executables={};rows=[]
for label in ['A','SPARSE','BODY','SHAM','SITE']:
 for mode in ['release','sanitize']:
  if label in ['A','SPARSE']and mode=='sanitize':continue
  d=Path(binary(label,mode)).parent;obj=next((d/'.obj').rglob('quickjs.o')).parent;dest=out/f'{label}.{mode}'
  flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer']if mode=='sanitize'else[]
  cmd=['gcc','-g','-O2',*flags,'-I'+str(d),str(HERE/'lifecycle.c'),*[str(obj/(n+'.o'))for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',str(dest)];r=subprocess.run(cmd,capture_output=True,text=True);assert not r.returncode,r.stderr
  env=dict(ENV)
  if label in ALIASES:env[ALIASES[label][1]]=ALIASES[label][2]
  blob=out/f'{label}.{mode}.qbc';r=subprocess.run([str(dest),'--write',str(blob)],capture_output=True,text=True,env=env,timeout=90);row=dict(label=label,mode=mode,command=cmd,exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr);save(out/f'{label}.{mode}.json',row);assert not r.returncode,row;rows.append(row);executables[label,mode]=dest;print('C_PASS',label,mode,r.stdout.strip(),flush=True)
for label in ['BODY','SHAM','SITE']:
 blob=out/f'{label}.release.qbc';r=subprocess.run([str(executables['A','release']),'--read',str(blob)],capture_output=True,text=True,env=ENV);save(out/f'A_reads_{label}.json',dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr));assert not r.returncode,r.stderr
steps=[next(l for l in r['stdout'].splitlines()if l.startswith('INTERRUPT_STEPS:'))for r in rows];assert len(set(steps))==1,steps
save(out/'gate.json',dict(status='PASS',cross_engine_A_reads=True,normal_and_ROM=True,ASan_UBSan=True,interrupt_step_equal=True,checks=len(rows)));print('C_VALIDATED',out,flush=True)
