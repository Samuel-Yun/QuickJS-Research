"""Round-trip the new field2 and bit-loop runtime opcodes through serialization."""
import argparse
import json
import os
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent


def main():
    p=argparse.ArgumentParser();p.add_argument('label');p.add_argument('--kind',default='release');a=p.parse_args()
    m=json.loads((HERE/(a.label+'.'+a.kind+'.manifest.json')).read_text());w=Path(m['elf']).parent
    core=w/('.obj/asan/ubsan' if a.kind=='san' else '.obj');binary=w/'serialization_extra'
    flags=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if a.kind=='san' else []
    command=['gcc','-O2','-g',*flags,'-I'+str(w),str(HERE/'serialization_extra.c'),*[str(core/(n+'.o')) for n in ['quickjs','dtoa','libregexp','libunicode','cutils']],'-lm','-lpthread','-ldl','-o',str(binary)]
    r=subprocess.run(command,capture_output=True,text=True,timeout=60);assert r.returncode==0,r.stderr
    env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
    r=subprocess.run([binary],capture_output=True,text=True,env=env,timeout=60)
    row=dict(command=command,returncode=r.returncode,stdout=r.stdout,stderr=r.stderr)
    path=HERE/'qualification'/(a.label+'.'+a.kind+'.extra_roundtrip.json');assert not path.exists();path.write_text(json.dumps(row,indent=2)+'\n')
    assert r.returncode==0 and not r.stderr and r.stdout.strip()=='EXTRA_ROUNDTRIP_PASS 15',row
    print('EXTRA_CHECK_PASS',a.label,a.kind)


if __name__=='__main__':main()
