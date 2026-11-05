"""Bounded foreground host recorder; does not restart/configure WSL."""
import datetime,hashlib,json,os,shutil,subprocess,sys,time,threading
from pathlib import Path
HERE=Path(__file__).resolve().parent
def stamp():return datetime.datetime.now(datetime.timezone.utc).isoformat()
def append(row):
    with (HERE/'host_runs.jsonl').open('a',encoding='utf-8') as f:
        f.write(json.dumps(row,ensure_ascii=False)+'\n');f.flush();os.fsync(f.fileno())
def decode(b):
    if b.startswith(b'w\0s\0l\0') and b'\n\0' in b:
        end=b.index(b'\n\0')+2;return b[:end].decode('utf-16-le',errors='replace')+b[end:].decode('utf-8',errors='replace')
    return b.decode('utf-16-le' if b.count(b'\0')>len(b)//10 else 'utf-8',errors='replace')
def main():
    stage=sys.argv[1];timeout=float(sys.argv[2]);extra=sys.argv[3:]
    filename='regressions.py' if stage=='regressions' else ('health.py' if stage=='health' else ('refine.py' if stage in ['single','refine'] else ('measure.py' if stage in ['screen','recheck','formal','analyze'] else 'lab.py')))
    linux='/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/'+filename
    command=[shutil.which('wsl.exe') or 'wsl.exe','-d','Ubuntu','--cd','/','--exec','python3',linux,stage,*extra]
    start=time.perf_counter_ns();row=dict(event='host_start',timestamp=stamp(),command=command,host_pid=os.getpid(),timeout_s=timeout,
         disk={p:shutil.disk_usage(p)._asdict() for p in ['C:/','F:/'] if Path(p).exists()})
    append(row);p=subprocess.Popen(command,stdout=subprocess.PIPE,stderr=subprocess.PIPE);timed=False
    buffers=[[],[]]
    def collect(stream,destination):
        while True:
            data=stream.readline()
            if not data:break
            destination.append(data)
    readers=[threading.Thread(target=collect,args=(stream,buffers[i]),daemon=True) for i,stream in enumerate([p.stdout,p.stderr])]
    for reader in readers:reader.start()
    try:
        seen=0
        while True:
            remaining=timeout-(time.perf_counter_ns()-start)/1e9
            if remaining<=0:raise subprocess.TimeoutExpired(command,timeout)
            try:
                p.wait(timeout=min(25,remaining));break
            except subprocess.TimeoutExpired as update:
                partial=list(buffers[0])
                if len(partial)>seen:
                    tail=decode(b''.join(partial[seen:])).splitlines()
                    print(json.dumps({'event':'host_progress','stage':stage,'elapsed_s':round((time.perf_counter_ns()-start)/1e9,1),'latest':tail[-2:]},ensure_ascii=True),flush=True)
                    seen=len(partial)
    except subprocess.TimeoutExpired:
        timed=True;p.kill();p.wait(timeout=10)
    for reader in readers:reader.join(timeout=10)
    out,err=[b''.join(b) for b in buffers]
    row.update(event='host_result',completed_at=stamp(),wsl_pid=p.pid,wsl_exit_code=p.returncode,host_terminated_own_client=timed,
         wall_ms=(time.perf_counter_ns()-start)/1e6,stdout=decode(out),stderr=decode(err),stdout_sha256=hashlib.sha256(out).hexdigest(),stderr_sha256=hashlib.sha256(err).hexdigest())
    append(row)
    # Preserve exact bytes, including mixed WSL warning/child encodings.
    tag=row['timestamp'].replace(':','').replace('.','')
    for name,data in [('stdout',out),('stderr',err)]:
        with (HERE/f'host_{tag}_{name}.bin').open('xb') as f:f.write(data)
    print(json.dumps(row,ensure_ascii=True,indent=2),flush=True)
    return 0 if p.returncode==0 and not timed else 1
if __name__=='__main__':raise SystemExit(main())
