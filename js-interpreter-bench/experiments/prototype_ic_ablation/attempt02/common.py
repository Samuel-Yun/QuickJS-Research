"""Append-only runner utilities; analysis uses public files only."""
import csv,gzip,hashlib,io,json,os,platform,re,subprocess,time,importlib.util
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OLD=HERE.parent/'attempt01'
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
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def option(c):return '0' if c=='OFF' else '1'
def load_old(name):
    spec=importlib.util.spec_from_file_location('reused_'+name,OLD/(name+'.py'))
    mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);return mod
def environment(c):
    env=os.environ.copy();env['QJS_EXPERIMENT_PROTO_IC']=option(c)
    assert not env.get('LD_PRELOAD') and not env.get('LD_AUDIT');return env
def capture_qjs(cmd,env):
    # No other child is started/reaped in this interval. Runner is single-threaded.
    import resource
    assert (datetime.now(timezone.utc)-datetime.fromisoformat(read(HERE/'started.json')['timestamp'])).total_seconds()<7200,'2h budget'
    started=stamp();b=boot();aff=sorted(os.sched_getaffinity(0))
    cpu0=resource.getrusage(resource.RUSAGE_CHILDREN);t=time.perf_counter_ns()
    try:
        p=subprocess.run(list(map(str,cmd)),cwd=ROOT,env=env,capture_output=True,text=True,timeout=180)
        r=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as p:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        r=dict(exit_code=None,stdout=dec(p.stdout),stderr=dec(p.stderr),timeout=True)
    stop=time.perf_counter_ns();cpu1=resource.getrusage(resource.RUSAGE_CHILDREN)
    u=1000*(cpu1.ru_utime-cpu0.ru_utime);s=1000*(cpu1.ru_stime-cpu0.ru_stime)
    r.update(command=list(map(str,cmd)),cwd=str(ROOT),timestamp=started,completed_at=stamp(),outer_start_ns=t,outer_stop_ns=stop,outer_wall_ns=stop-t,external_wall_ms=(stop-t)/1e6,
      child_user_ms=u,child_system_ms=s,child_cpu_ms=u+s,cpu_scope='whole direct qjs child lifetime, RUSAGE_CHILDREN delta; not timed-region self time',
      boot_id=b,boot_id_after=boot(),parent_affinity=aff,option=env['QJS_EXPERIMENT_PROTO_IC'],
      environment_sha256=hashlib.sha256(json.dumps(env,sort_keys=True).encode()).hexdigest(),
      environment_excluding_option_sha256=hashlib.sha256(json.dumps({k:v for k,v in env.items() if k!='QJS_EXPERIMENT_PROTO_IC'},sort_keys=True).encode()).hexdigest())
    return r
