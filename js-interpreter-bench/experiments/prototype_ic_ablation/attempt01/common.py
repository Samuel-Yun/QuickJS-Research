"""Append-only experiment records, separate raw-only analysis and runtime checks."""
import csv,gzip,hashlib,io,json,os,platform,re,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OLD=ROOT/'experiments/prototype_ic_h/attempt01'
STORE=Path('/home/mzyx/prototype_ic_ablation_attempt01')
SEED=20261029
CASES=['prototype_method','own_integer','numeric_control','Richards.Richards']
CONDS=['M','H','OFF','ON']
START_N=dict(prototype_method=8192,own_integer=16384,numeric_control=32768,**{'Richards.Richards':512})

def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def read(p):return json.loads(gzip.decompress(Path(p).read_bytes()) if str(p).endswith('.gz') else Path(p).read_text(encoding='utf-8'))
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    data=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode('utf-8')
    if p.exists():assert p.read_bytes()==data,'refuse overwrite: '+str(p)
    else:
        with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    rows=list(rows)
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def one(s,a,b):assert s.count(a)==1,(a[:90],s.count(a));return s.replace(a,b,1)
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def budget():
    assert (datetime.now(timezone.utc)-datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds()<14400,'4h budget'
def environment(option):
    env=os.environ.copy();env['QJS_EXPERIMENT_PROTO_IC']=str(option)
    assert not env.get('LD_PRELOAD') and not env.get('LD_AUDIT')
    return env
def capture(label,cmd,cwd=None,env=None,timeout=180):
    dest=HERE/'raw/commands'/(label+'.json');assert not dest.exists(),'no automatic repeat: '+label
    budget();started=stamp();t=time.perf_counter_ns()
    try:
        r=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,env=env,timeout=timeout,capture_output=True,text=True)
        out=dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,timeout=False)
    except subprocess.TimeoutExpired as r:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        out=dict(exit_code=None,stdout=dec(r.stdout),stderr=dec(r.stderr),timeout=True)
    stop=time.perf_counter_ns()
    used=env if env is not None else os.environ
    out.update(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=started,completed_at=stamp(),outer_start_ns=t,outer_stop_ns=stop,outer_wall_ns=stop-t,boot_id=boot(),
      parent_affinity=sorted(os.sched_getaffinity(0)),option=used.get('QJS_EXPERIMENT_PROTO_IC'),
      environment_sha256=hashlib.sha256(json.dumps(dict(used),sort_keys=True).encode()).hexdigest(),
      environment_excluding_option_sha256=hashlib.sha256(json.dumps({k:v for k,v in used.items() if k!='QJS_EXPERIMENT_PROTO_IC'},sort_keys=True).encode()).hexdigest())
    save(dest,out);print(label,out['exit_code'],flush=True);return out
def verify_old():
    h=read(OLD/'H_manifest.json');m=read(OLD/'manifest.json')['M']
    assert h['sha256']=='37b1aa9f755e94fb0db61a789d78c97addbff61835b99f3288a3ceb26e8932e4'
    assert m['sha256']=='7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef'
    assert sha(h['binary'])==h['sha256'] and sha(m['path'])==m['sha256']
    for name,digest in h['source_files'].items():assert sha(Path(h['source'])/name)==digest,name
    return h,m
def artifacts():
    h,m=verify_old();s=read(HERE/'manifest.json')['switch'];assert sha(s['path'])==s['sha256']
    return dict(M=m,H=dict(path=h['binary'],sha256=h['sha256']),OFF=s,ON=s)
def option(c):return '0' if c=='OFF' else '1'
