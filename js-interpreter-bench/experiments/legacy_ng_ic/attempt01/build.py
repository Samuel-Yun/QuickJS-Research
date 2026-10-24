"""Fresh same-toolchain A/B, with complete build/test command capture."""
import argparse
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import time
from prepare_sources import HERE, ROOT, BASE, save, sha

STORE=Path('/home/mzyx/legacy_ng_ic_attempt01')
A=STORE/'A'
B=STORE/'B_port2'

def capture(label,cmd,cwd=ROOT,timeout=600):
    stem=HERE/'raw/build'/label
    i=1
    while stem.with_suffix('.'+str(i)+'.json').exists(): i+=1
    start=time.perf_counter_ns()
    p=subprocess.run([str(x) for x in cmd],cwd=cwd,capture_output=True,timeout=timeout)
    r=dict(command=[str(x) for x in cmd],cwd=str(cwd),exit_code=p.returncode,
        stdout=p.stdout.decode(errors='replace'),stderr=p.stderr.decode(errors='replace'),
        wall_ns=time.perf_counter_ns()-start,timestamp=datetime.now(timezone.utc).isoformat())
    save(stem.with_suffix('.'+str(i)+'.json'),r)
    save(stem.with_suffix('.'+str(i)+'.log'),r['stdout']+r['stderr'])
    print(label,p.returncode,flush=True)
    if p.returncode: print(r['stderr'][-6000:],flush=True)
    return r

def main():
    assert platform.system()=='Linux' and platform.machine()=='x86_64'
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    ap=argparse.ArgumentParser();ap.add_argument('stage',choices=['release','test']);args=ap.parse_args()
    if args.stage=='release':
        if not A.exists(): shutil.copytree(HERE/'sources/base',A)
        hashes=json.loads((HERE/'source_evidence/base_files.json').read_text())
        assert all(sha(A/p.replace('\\','/'))==h for p,h in hashes.items())
        assert all(sha(B/p)==h for p,h in json.loads((HERE/'source_evidence/port_source_hashes.v2.json').read_text()).items())
        capture('compiler',['gcc','--version']);capture('linker',['ld','--version'])
        capture('host',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu,pmem --sort=-pcpu | head -25; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null; true'])
        for name,p in [('A',A),('B',B)]:
            if not (p/'qjs').exists():
                r=capture(name+'_release',['make','-j2','qjs','qjsc'],p)
                assert r['exit_code']==0, name+' build failed'
            capture(name+'_help',[p/'qjs','--help'],p)
            capture(name+'_ldd',['ldd',p/'qjs'])
            capture(name+'_dispatch_symbols',['nm',p/'.obj/quickjs.o'])
        save(HERE/'build_manifest.json',dict(base_commit=BASE,platform='WSL2 Ubuntu x86_64',
            artifacts={name:{'path':str(p/'qjs'),'sha256':sha(p/'qjs'),'size_bytes':(p/'qjs').stat().st_size,
                'qjsc_sha256':sha(p/'qjsc'),'flags':[],'source':str(p)} for name,p in [('A',A),('B',B)]},
            build_command=['make','-j2','qjs','qjsc'],optimization='-O2',lto=False,pgo=False,
            compiler_path=shutil.which('gcc'),kernel=platform.release(),host=platform.node(),
            runtime_diagnostics=False,boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip()))
    else:
        for name,p in [('A',A),('B',B)]:
            r=capture(name+'_test',['make','-j2','test'],p,600)
            assert r['exit_code']==0, name+' upstream test failed'

if __name__=='__main__':main()
