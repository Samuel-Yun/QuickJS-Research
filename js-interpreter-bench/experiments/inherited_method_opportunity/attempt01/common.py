"""Append-only bounded campaign. Runtime identity separate from raw-only statistics."""
import csv,gzip,hashlib,io,json,math,os,platform,random,re,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PREV=ROOT/'experiments/ic_mechanism_audit/attempt01'
STORE=Path('/home/mzyx/inherited_method_opportunity_attempt01')
CASES=['own_method_control','inherited_method'];CONDS=['QJS_A','QJS_M','V8_ON','V8_OFF']
MODE='INHERITED_METHOD_FIRST_CALL_INCLUSIVE_V1';SEED=20261028
TIMEOUT=180;MAX_N=131072;BUDGET=21600;EXPECTED=4096*4097//2
assert EXPECTED==8390656
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
    data=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode('utf8')
    if p.exists():assert p.read_bytes()==data,'refuse overwrite '+str(p)
    else:
        with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    rows=list(rows)
    if not rows:return
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def capture(label,cmd,cwd=None,timeout=180,env=None):
    p=HERE/'raw/commands'/f'{label}.json';assert not p.exists()
    t=stamp();start=time.perf_counter_ns()
    try:
        r=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,timeout=timeout,capture_output=True,text=True,env=env)
        out=dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,timeout=False)
    except subprocess.TimeoutExpired as r:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        out=dict(exit_code=None,stdout=dec(r.stdout),stderr=dec(r.stderr),timeout=True)
    stop=time.perf_counter_ns();end=stamp()
    out.update(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=t,completed_at=end,outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,boot_id=boot(),UTC_minus_monotonic_ms=(datetime.fromisoformat(end)-datetime.fromisoformat(t)).total_seconds()*1000-(stop-start)/1e6)
    save(p,out);print(label,out['exit_code'],flush=True);return out
def prefixes():return read(HERE/'manifest.json')['commands']
def verify():
    m=read(HERE/'manifest.json');assert platform.node()==m['host'] and platform.machine()==m['architecture'] and platform.release()==m['kernel']
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    for a in [*m['artifacts'].values(),*m['v8_dependencies']]:assert sha(a['path'])==a['sha256'],a['path']
    return m
def budget():
    s=read(HERE/'started.json');assert (datetime.now(timezone.utc)-datetime.fromisoformat(s['timestamp'])).total_seconds()<BUDGET,'6h task budget'
