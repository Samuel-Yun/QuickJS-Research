"""Append-only call boundary cost study, no production VM modification."""
import csv,gzip,hashlib,io,json,math,os,platform,random,re,resource,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PREV=ROOT/'experiments/function_value_call_path/attempt01'
INHERITED=ROOT/'experiments/inherited_method_opportunity/attempt01'
STORE=Path('/home/mzyx/call_boundary_cost_attempt01')
CASES=['local_function_call','number_value_read','Richards.Richards'];CONDS=['BASE','SHIM_OFF','SHIM_ON'];SEED=20261029
MODE='CALL_BOUNDARY_FIRST_CALL_INCLUSIVE_V1';EXPECTED=8390656;BUDGET=14400
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def read(p):
    with (gzip.open(p,'rt',encoding='utf8') if str(p).endswith('.gz') else Path(p).open(encoding='utf8')) as f:return json.load(f)
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    b=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode('utf8')
    if p.exists():assert p.read_bytes()==b,'refuse overwrite '+str(p)
    else:
        with p.open('xb') as f:f.write(b)
def csvout(p,rows):
    rows=list(rows)
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def capture(label,cmd,cwd=None,timeout=180,env=None,input=None):
    p=HERE/'raw/commands'/f'{label}.json';assert not p.exists()
    t=stamp();start=time.perf_counter_ns()
    try:
        r=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,timeout=timeout,capture_output=True,text=True,env=env,input=input);out=dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,timeout=False)
    except subprocess.TimeoutExpired as r:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        out=dict(exit_code=None,stdout=dec(r.stdout),stderr=dec(r.stderr),timeout=True)
    stop=time.perf_counter_ns();out.update(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=t,completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,boot_id=boot())
    save(p,out);print(label,out['exit_code'],flush=True);return out
def verify():
    m=read(HERE/'manifest.json');assert platform.node()==m['host'] and platform.machine()==m['architecture'] and platform.release()==m['kernel']
    for a in m['artifacts'].values():assert sha(a['path'])==a['sha256'],a['path']
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT');return m
def budget(setup=False):
    s=read(HERE/'started.json');seconds=(datetime.now(timezone.utc)-datetime.fromisoformat(s['timestamp'])).total_seconds()
    assert seconds<BUDGET,'4h task budget'
    if setup:assert seconds<3600,'sampler setup 60min budget'
