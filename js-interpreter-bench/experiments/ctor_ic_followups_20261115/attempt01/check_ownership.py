import json,subprocess,os
from pathlib import Path
H=Path(__file__).resolve().parent
for name in ['01_forward_ctor','02_proto_ticket','03_sparse_ctor']:
 out=H/name/'qualification';results=[]
 for mode in ['release','san']:
  m=json.loads((H/name/(mode+'.manifest.json')).read_text());w=Path(m['elf']).parent;o=w/('.obj/asan/ubsan' if mode=='san' else '.obj');target=out/(mode+'.ownership.elf');flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if mode=='san' else []
  cmd=['gcc','-O2','-g',*flags,'-I'+str(w),str(H/'ownership_realms.c'),*[str(o/(s+'.o')) for s in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',str(target)]
  subprocess.run(cmd,check=True,capture_output=True)
  z=subprocess.run([target],text=True,capture_output=True,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1'))
  results.append(dict(mode=mode,command=cmd,exit_code=z.returncode,stdout=z.stdout,stderr=z.stderr));(out/'ownership_realms.json').write_text(json.dumps(results,indent=2));assert z.returncode==0 and not z.stderr,results[-1]
 print('GC_TWO_REALMS_PASS',name,flush=True)
