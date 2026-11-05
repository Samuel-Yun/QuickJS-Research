"""Frozen-runtime Octane campaign. Append-only records, no engine writes."""
import csv,gzip,hashlib,io,json,math,os,platform,re,subprocess,time,importlib.util
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
SOURCE=ROOT/'experiments/v8_ic_octane/attempt01'
ABLATION=ROOT/'experiments/prototype_ic_ablation/attempt02'
CONDITIONS=['A','M','H','OFF','ON'];SEED=20261030;CRYPTO_SEED=305419896
TIMEOUT=300;BUDGET=28800;MAX_N=131072
MODE='USE_IC_OCTANE_FIRST_CALL_INCLUSIVE_V1' # preserve archived driver byte identity
BASE_CATALOG=json.loads((SOURCE/'case_catalog.json').read_text(encoding='utf-8'))
BASE_CASES=[r['case'] for r in BASE_CATALOG]
CASES=BASE_CASES+['Box2D.Box2D','zlib.zlib']
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def read(p):return json.loads(Path(p).read_text(encoding='utf-8'))
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    b=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode('utf-8')
    if p.exists():assert p.read_bytes()==b,'refuse overwrite '+str(p)
    else:
        with p.open('xb') as f:f.write(b)
def csvout(p,rows):
    rows=list(rows)
    if not rows:return
    out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,out.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def load_source(name):
    spec=importlib.util.spec_from_file_location('reused_octane_'+name,SOURCE/(name+'.py'))
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
def environment(c='ON'):
    e=os.environ.copy();e['QJS_EXPERIMENT_PROTO_IC']='0' if c=='OFF' else '1'
    assert not e.get('LD_PRELOAD') and not e.get('LD_AUDIT');return e
def prefixes():return {c:[read(HERE/'runtime.json')['artifacts'][c]['path']] for c in CONDITIONS}
def budget():
    d=read(HERE/'started.json');assert boot()==d['boot_id'],'GLOBAL_BOOT_CHANGED'
    assert (time.perf_counter_ns()-d['start_ns'])/1e9<BUDGET,'CAMPAIGN_BUDGET_EXHAUSTED'
def blocked(case):
    records=[read(p) for p in (HERE/'status').glob(case+'.*.json')]
    return records[0] if records else None
def block(case,stage,reason,status='BLOCKED_CASE'):
    save(HERE/'status'/f'{case}.{stage}.json',dict(case=case,stage=stage,status=status,reason=reason,timestamp=stamp()))
    print(status,case,reason,flush=True)
def capture_qjs(command,c,label):
    import resource
    budget();env=environment(c);started=stamp();b=boot();aff=sorted(os.sched_getaffinity(0))
    cpu0=resource.getrusage(resource.RUSAGE_CHILDREN);start=time.perf_counter_ns()
    try:
        p=subprocess.run(list(map(str,command)),cwd=ROOT,env=env,capture_output=True,text=True,timeout=TIMEOUT)
        r=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as p:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        r=dict(exit_code=None,stdout=dec(p.stdout),stderr=dec(p.stderr),timeout=True)
    stop=time.perf_counter_ns();cpu1=resource.getrusage(resource.RUSAGE_CHILDREN)
    u=1000*(cpu1.ru_utime-cpu0.ru_utime);s=1000*(cpu1.ru_stime-cpu0.ru_stime)
    r.update(command=list(map(str,command)),cwd=str(ROOT),timestamp=started,completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,external_wall_ms=(stop-start)/1e6,
      child_user_ms=u,child_system_ms=s,child_cpu_ms=u+s,cpu_scope='whole direct child lifetime, sequential RUSAGE_CHILDREN delta; not JS region self time',boot_id=b,boot_id_after=boot(),affinity=aff,
      option=env['QJS_EXPERIMENT_PROTO_IC'],environment_sha256=hashlib.sha256(json.dumps(env,sort_keys=True).encode()).hexdigest(),
      environment_excluding_option_sha256=hashlib.sha256(json.dumps({k:v for k,v in env.items() if k!='QJS_EXPERIMENT_PROTO_IC'},sort_keys=True).encode()).hexdigest())
    print(label,'exit',r['exit_code'],'wall_ms',round(r['external_wall_ms'],2),flush=True)
    return r
