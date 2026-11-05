import csv,gzip,hashlib,io,json,math,os,platform,re,resource,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
SOURCE=ROOT/'experiments/v8_ic_octane/attempt01'
PROTO=ROOT/'experiments/prototype_ic_octane/attempt01'
BUILD=Path('/home/mzyx/v8_inspired_ic_attempt01')
CONDITIONS=['A','E','V8_ON'];SEED=20261031;CRYPTO_SEED=305419896
TIMEOUT=300;MAX_N=131072;MODE='USE_IC_OCTANE_FIRST_CALL_INCLUSIVE_V1'
BASE_CASES=[r['case'] for r in json.loads((SOURCE/'case_catalog.json').read_text())]
CASES=BASE_CASES+['zlib.zlib']
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def read(p):return json.loads(Path(p).read_text(encoding='utf-8'))
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    b=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==b,'refuse overwrite '+str(p)
    else:
        with p.open('xb') as f:f.write(b)
def csvout(p,rows):
    rows=list(rows)
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def runtime():
    p=HERE/'campaign_runtime.json'
    return read(p if p.exists() else HERE/'runtime.json')
def environment():
    keys=['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR','LD_LIBRARY_PATH']
    assert not os.getenv('LD_PRELOAD') and not os.getenv('LD_AUDIT')
    return {k:os.environ[k] for k in keys if k in os.environ}
def prefixes():
    m=runtime();a=m['artifacts'];v=m['v8']
    return dict(A=[a['A']['path']],E=[a['E']['path']],V8_ON=[a['V8_ON']['path'],'--snapshot_blob='+v['dependencies'][0]['path'],'--jitless','--no-lazy','--use-ic'])
def capture(command,label,timeout=TIMEOUT,cwd=ROOT,env=None):
    started=stamp();b=boot();start=time.perf_counter_ns();c0=resource.getrusage(resource.RUSAGE_CHILDREN)
    try:
        r=subprocess.run(list(map(str,command)),cwd=cwd,env=environment() if env is None else env,capture_output=True,text=True,timeout=timeout)
        row=dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,timeout=False)
    except subprocess.TimeoutExpired as r:
        def dec(s):return s.decode(errors='replace') if isinstance(s,bytes) else s or ''
        row=dict(exit_code=None,stdout=dec(r.stdout),stderr=dec(r.stderr),timeout=True)
    stop=time.perf_counter_ns();c1=resource.getrusage(resource.RUSAGE_CHILDREN)
    row.update(command=list(map(str,command)),cwd=str(cwd),timestamp=started,completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,external_wall_ms=(stop-start)/1e6,child_user_ms=1000*(c1.ru_utime-c0.ru_utime),child_system_ms=1000*(c1.ru_stime-c0.ru_stime),cpu_scope='whole child, sequential RUSAGE_CHILDREN delta, not timed-region CPU',boot_id=b,boot_id_after=boot(),affinity=sorted(os.sched_getaffinity(0)),environment_sha256=hashlib.sha256(json.dumps(environment(),sort_keys=True).encode()).hexdigest())
    print(label,row['exit_code'],round(row['external_wall_ms'],1),'ms',flush=True);return row
def block(case,stage,reason,status='BLOCKED_CASE'):
    save(HERE/'status'/f'{case}.{stage}.json',dict(case=case,stage=stage,reason=reason,status=status,timestamp=stamp()))
def blocked(case):return list((HERE/'status').glob(case+'.*.json'))
def verify_runtime():
    m=runtime()
    for c,a in m['artifacts'].items():assert sha(a['path'])==a['sha256'],'GLOBAL_IDENTITY '+c
    for a in m['v8']['dependencies']+m['dynamic_dependencies']:assert sha(a['path'])==a['sha256'],'GLOBAL_DEPENDENCY '+a['path']
    assert boot()==m['boot_id'],'GLOBAL_BOOT_CHANGED'
    return m
