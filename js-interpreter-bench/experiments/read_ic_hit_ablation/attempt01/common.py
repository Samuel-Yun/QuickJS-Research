"""Append-only evidence; data-only analysis must not verify live runtime paths."""
import csv,gzip,hashlib,io,json,os,platform,subprocess,time
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PREVIOUS=ROOT/'experiments/read_ic_mic/attempt01'
BASE_MATERIALS=ROOT/'experiments/legacy_ng_ic_slotfix/attempt01'
STORE=Path(os.environ.get('IC_ABLATION_STORE','/home/mzyx/read_ic_hit_ablation_attempt01'))
VERSIONS=['A','M','ON','LOOKUP'];SOURCES=['A','M','SW'];SEED=20261024
MODE='READ_IC_HIT_ABLATION_MONOTONIC_V1';MODE_KEY='QJS_READ_IC_MODE'
MICRO_CASES=['M1.own_integer','M2.own_reference','M4.numeric_control','M6.poly2']
OCTANE_CASES=['Richards.Richards','RegExp.RegExp','RayTrace.RayTrace','CodeLoad.CodeLoadClosure']
CASES=MICRO_CASES+OCTANE_CASES
FILES={'Richards':['richards.js'],'RegExp':['regexp.js'],'RayTrace':['raytrace.js'],'CodeLoad':['code-load.js']}
def stamp():return datetime.now(timezone.utc).isoformat()
def read(p):
    p=Path(p)
    with (gzip.open(p,'rt',encoding='utf-8') if p.suffix=='.gz' else p.open(encoding='utf-8')) as f:return json.load(f)
def digest(b):return hashlib.sha256(b).hexdigest()
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
    return h.hexdigest()
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    data=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data,str(p)
    else:
        with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    assert rows;out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,out.getvalue())
def config(v):return '0' if v=='LOOKUP' else '1'
def mode_env(v):
    # Reproducible relevant environment, not a dump of possible session secrets.
    keys=['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR']
    e={k:os.environ[k] for k in keys if k in os.environ};e[MODE_KEY]=config(v);return e
def capture(label,cmd,cwd=None,timeout=900,env=None):
    folder=HERE/'raw/build';folder.mkdir(parents=True,exist_ok=True);i=1
    while (folder/f'{label}.{i}.json').exists():i+=1
    start=time.perf_counter_ns();p=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,capture_output=True,timeout=timeout,env=env)
    r=dict(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=stamp(),exit_code=p.returncode,
      stdout=p.stdout.decode(errors='replace'),stderr=p.stderr.decode(errors='replace'),wall_ns=time.perf_counter_ns()-start,
      relevant_env={k:env[k] for k in [MODE_KEY,'READ_IC_REPORT'] if env and k in env})
    save(folder/f'{label}.{i}.json',r);save(folder/f'{label}.{i}.log',r['stdout']+r['stderr']);print(label,p.returncode,flush=True)
    if p.returncode:print(r['stderr'][-2000:],flush=True)
    return r
def environment(label):
    r=capture('environment_'+label,['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu,pmem --sort=-pcpu | head -20; true'])
    save(HERE/'raw/environment'/f'{label}.json',dict(**r,boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),loadavg=os.getloadavg(),affinity=sorted(os.sched_getaffinity(0))))
def verify_runtime():
    m=read(HERE/'manifest.json');assert platform.system()=='Linux' and platform.machine()=='x86_64'
    assert platform.node()==m['host'] and platform.release()==m['kernel']
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    for v,a in m['artifacts'].items():assert sha(a['path'])==a['sha256'],v
    assert m['artifacts']['ON']['path']==m['artifacts']['LOOKUP']['path'] and m['artifacts']['ON']['sha256']==m['artifacts']['LOOKUP']['sha256']
    for p,h in m['inputs'].items():assert sha(ROOT/p)==h,p
    return m
def compress(src,dest):
    src,dest=Path(src),Path(dest);dest.parent.mkdir(parents=True,exist_ok=True)
    if not dest.exists():
        with src.open('rb') as i,dest.open('xb') as out,gzip.GzipFile(filename='',mode='wb',fileobj=out,mtime=0,compresslevel=6) as z:
            for b in iter(lambda:i.read(1024*1024),b''):z.write(b)
    h=hashlib.sha256();n=0
    with gzip.open(dest,'rb') as f:
        for b in iter(lambda:f.read(1024*1024),b''):h.update(b);n+=len(b)
    assert h.hexdigest()==sha(src) and n==src.stat().st_size
    return dict(archive=dest.relative_to(HERE).as_posix(),original_path=str(src),original_sha256=h.hexdigest(),compressed_sha256=sha(dest),original_bytes=n,compressed_bytes=dest.stat().st_size)
