"""One bounded, read-only WSL availability retry. Never shuts down the distro."""
import datetime
import json
from pathlib import Path
import subprocess
import time

H=Path(__file__).resolve().parent
target=H/'wsl_retry.accept01.json'
assert not target.exists(), 'At most one retry; preserve old result'
cmd=['wsl.exe','-d','Ubuntu','--exec','/bin/sh','-c',
     'cat /proc/sys/kernel/random/boot_id; uptime; ps -eo pid,comm,args']
begin=time.perf_counter_ns()
start=datetime.datetime.now(datetime.timezone.utc).isoformat()
try:
    result=subprocess.run(cmd,capture_output=True,timeout=60)
    code=result.returncode
    out,err=result.stdout,result.stderr
    timed_out=False
except subprocess.TimeoutExpired as exc:
    code=None
    out,err=exc.stdout or b'',exc.stderr or b''
    timed_out=True

def decode(data):
    if data.count(b'\x00')>len(data)//10:
        return data.decode('utf-16-le',errors='replace')
    return data.decode('utf-8',errors='replace')

row=dict(status='AVAILABLE_REQUIRES_NEW_PREFLIGHT' if code==0 else 'BLOCKED_WSL_AVAILABILITY',
         command=cmd,started=start,completed=datetime.datetime.now(datetime.timezone.utc).isoformat(),
         elapsed_ms=(time.perf_counter_ns()-begin)/1e6,exit_code=code,timeout=timed_out,
         stdout=decode(out),stderr=decode(err),stdout_hex=out.hex(),stderr_hex=err.hex(),
         no_distro_shutdown=True,no_service_configuration_change=True,maximum_retry_count=1)
with target.open('x',encoding='utf-8') as stream:
    json.dump(row,stream,ensure_ascii=False,indent=2)
    stream.write('\n')
print(json.dumps(row,ensure_ascii=False,indent=2))
raise SystemExit(0 if code==0 else 2)
