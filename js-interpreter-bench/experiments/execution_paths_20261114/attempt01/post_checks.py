"""Exercise read-only bytecode after serializing the new internal opcodes."""
import json
import os
from pathlib import Path
import subprocess
HERE=Path(__file__).resolve().parent
LABELS=['FIELD_RMW_I32','INT_LOOP_KERNEL','FIELD_RMW_UPDATE','INT_LOOP_BITS','TRANSITION_EDGE_STRONG']


def main():
 for label in LABELS:
  for kind in ['release','san']:
   name=label+'.'+kind;m=json.loads((HERE/(name+'.manifest.json')).read_text());w=Path(m['elf']).parent
   core=w/('.obj/asan/ubsan' if kind=='san' else '.obj');binary=w/'serialization_rom'
   flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if kind=='san' else []
   command=['gcc','-O2','-g',*flags,'-I'+str(w),str(HERE/'serialization_rom.c'),*[str(core/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',str(binary)]
   r=subprocess.run(command,capture_output=True,text=True,timeout=60);assert r.returncode==0,r.stderr
   env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
   r=subprocess.run([binary],capture_output=True,text=True,env=env,timeout=60)
   row=dict(command=command,returncode=r.returncode,stdout=r.stdout,stderr=r.stderr)
   f=HERE/'qualification'/(name+'.rom.json');assert not f.exists();f.write_text(json.dumps(row,indent=2)+'\n')
   assert r.returncode==0 and not r.stderr and r.stdout.strip()=='ROM_ROUNDTRIP_PASS 144',row
   print('ROM_PASS',name,flush=True)


if __name__=='__main__':main()
