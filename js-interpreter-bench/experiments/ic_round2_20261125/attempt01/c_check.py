from run import *
import shutil
out=next_out(HERE,'c_validation');out.mkdir();checks=[]
for label in ['INSTANCE_HOOK','CALL_FIELD','NEST_COMBINED']:
 for mode in ['release','sanitize']:
  exe=Path(binary(label,mode));d=exe.parent;obj=next((d/'.obj').rglob('quickjs.o')).parent
  for src in [HERE/'lifetime.c',OLDROOT/'serialization.c']:
   name=f'{label}.{mode}.{src.stem}';dest=out/name
   flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer']if mode=='sanitize'else[]
   cmd=['gcc','-g','-O2',*flags,'-I'+str(d),str(src),*[str(obj/(n+'.o'))for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-ldl','-lpthread','-o',str(dest)]
   r=subprocess.run(cmd,capture_output=True,text=True);assert not r.returncode,r.stderr
   env=dict(ENV)
   if label in ALIASES:env[ALIASES[label][1]]=ALIASES[label][2]
   r=subprocess.run([str(dest)],capture_output=True,text=True,env=env,timeout=120);save(out/(name+'.json'),dict(command=cmd,environment={k:env[k]for k in env if k.startswith('QJS_')or k in ['ASAN_OPTIONS','UBSAN_OPTIONS']},source_sha256=sha(src),binary_sha256=sha(dest),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr));assert not r.returncode,(name,r.stdout,r.stderr);checks.append(name);print('C_PASS',name,flush=True)
save(out/'gate.json',dict(status='PASS',checks=checks,LSan=False,ASan_UBSan=True))
