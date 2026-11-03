"""Public QuickJS research utilities; never reads local private references."""
import csv,hashlib,io,json,math,os,platform,re,resource,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
STORE=Path('/home/mzyx/ic_fast_slow_20261102_attempt01')
SEED=20261102
MAX_N=131072
TIMEOUT=300
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def read(path):return json.loads(Path(path).read_text(encoding='utf-8'))
def save(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    data=value if isinstance(value,bytes) else (value if isinstance(value,str) else json.dumps(value,ensure_ascii=False,indent=2)+'\n').encode('utf-8')
    if path.exists():
        assert path.read_bytes()==data,'write-once conflict '+str(path)
    else:
        with path.open('xb') as f:f.write(data)
def csvout(path,rows):
    rows=list(rows);assert rows
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(path,s.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def capture(command,label,cwd=None,timeout=TIMEOUT,env=None):
    cmd=list(map(str,command));start=time.perf_counter_ns();cpu0=resource.getrusage(resource.RUSAGE_CHILDREN);before=boot();ts=stamp()
    try:
        p=subprocess.run(cmd,cwd=cwd or HERE,env=env,capture_output=True,text=True,timeout=timeout)
        result=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as e:
        dec=lambda x:x.decode(errors='replace') if isinstance(x,bytes) else x or ''
        result=dict(exit_code=None,stdout=dec(e.stdout),stderr=dec(e.stderr),timeout=True)
    end=time.perf_counter_ns();cpu1=resource.getrusage(resource.RUSAGE_CHILDREN)
    result.update(command=cmd,cwd=str(cwd or HERE),label=label,timestamp=ts,completed_at=stamp(),
      outer_start_ns=start,outer_stop_ns=end,external_wall_ms=(end-start)/1e6,
      child_user_ms=(cpu1.ru_utime-cpu0.ru_utime)*1000,child_system_ms=(cpu1.ru_stime-cpu0.ru_stime)*1000,
      boot_id=before,boot_id_after=boot(),load_average=os.getloadavg())
    return result
def runtime():return read(HERE/'runtime.json')
def pin():
    os.sched_setaffinity(0,{2});m=runtime()
    assert platform.node()==m['host'] and platform.machine()=='x86_64'
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
def validate_artifacts(items):
    for item in items:assert sha(item['path'])==item['sha256'],'artifact changed '+item['path']
