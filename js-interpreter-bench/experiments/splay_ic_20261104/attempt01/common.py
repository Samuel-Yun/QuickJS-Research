"""Public-source, write-once research campaign. No private-source dependency."""
import csv,hashlib,io,json,math,os,platform,re,resource,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PREV=ROOT/'experiments/ic_fast_slow_20261102/attempt01'
STORE=Path('/home/mzyx/splay_ic_20261104_attempt01')
SEED=20261104
MAX_N=131072
TIMEOUT=300
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def read(p):return json.loads(Path(p).read_text(encoding='utf-8'))
def save(p,x):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    b=x if isinstance(x,bytes) else (x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==b,'write-once conflict '+str(p)
    else:
        with p.open('xb') as f:f.write(b)
def csvout(p,rows):
    rows=list(rows);assert rows
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def capture(cmd,label,cwd=None,env=None,timeout=300):
    a=time.perf_counter_ns();u=resource.getrusage(resource.RUSAGE_CHILDREN);b=boot();ts=stamp();cmd=list(map(str,cmd))
    try:
        p=subprocess.run(cmd,cwd=cwd or ROOT,env=env,capture_output=True,text=True,timeout=timeout)
        r=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as e:
        dec=lambda v:v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        r=dict(exit_code=None,stdout=dec(e.stdout),stderr=dec(e.stderr),timeout=True)
    z=time.perf_counter_ns();v=resource.getrusage(resource.RUSAGE_CHILDREN)
    r.update(command=cmd,label=label,cwd=str(cwd or ROOT),timestamp=ts,completed_at=stamp(),
      outer_start_ns=a,outer_stop_ns=z,external_wall_ms=(z-a)/1e6,
      child_user_ms=(v.ru_utime-u.ru_utime)*1000,child_system_ms=(v.ru_stime-u.ru_stime)*1000,
      boot_id=b,boot_id_after=boot(),load_average=os.getloadavg())
    return r
def one(s,a,b):assert s.count(a)==1,(a[:90],s.count(a));return s.replace(a,b,1)
def pin():os.sched_setaffinity(0,{2})
def runtime():return read(HERE/'runtime.json')
def validate_artifacts(items):
    for x in items:assert sha(x['path'])==x['sha256'],'artifact changed '+x['path']
