"""Append-only evidence; analysis never opens historical engine paths."""
import csv,gzip,hashlib,io,json,math,os,platform,re,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
STORE=Path('/home/mzyx/ic_mechanism_audit_attempt01')
MIC=ROOT/'experiments/read_ic_mic/attempt01'
OLD=ROOT/'experiments/legacy_ng_ic/attempt01'
V8=ROOT/'experiments/v8_ic_octane/attempt01'
CASES=['M1.own_integer','M4.numeric_control','Richards.Richards']
CONDITIONS=['QJS_A','QJS_M','V8_ON','V8_OFF']
SEED=20261028;TIMEOUT=180;MAX_N=131072;BUDGET=21600
MODE='IC_MECHANISM_AUDIT_FIRST_CALL_INCLUSIVE_V1'
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def read(p):
    with (gzip.open(p,'rt',encoding='utf-8') if str(p).endswith('.gz') else Path(p).open(encoding='utf-8')) as f:return json.load(f)
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    data=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode('utf-8')
    if p.exists():assert p.read_bytes()==data,'refuse overwrite '+str(p)
    else:
        with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    rows=list(rows);assert rows
    s=io.StringIO(newline='');w=csv.DictWriter(s,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,s.getvalue())
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def capture(label,cmd,cwd=None,timeout=900,env=None):
    path=HERE/'raw/build'/f'{label}.json';assert not path.exists(),path
    start=time.perf_counter_ns();t=stamp()
    try:
        r=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,timeout=timeout,capture_output=True,text=True,env=env)
        out=dict(exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,timeout=False)
    except subprocess.TimeoutExpired as r:
        def dec(v):return v.decode(errors='replace') if isinstance(v,bytes) else v or ''
        out=dict(exit_code=None,stdout=dec(r.stdout),stderr=dec(r.stderr),timeout=True)
    stop=time.perf_counter_ns();out.update(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=t,completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,boot_id=boot())
    save(path,out);print(label,out['exit_code'],flush=True);return out
def tree(folder):return {p.relative_to(folder).as_posix():sha(p) for p in sorted(folder.rglob('*')) if p.is_file() and '__pycache__' not in p.parts}
def environment():
    return {k:os.environ[k] for k in ['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','TZ','LD_LIBRARY_PATH','LD_PRELOAD','LD_AUDIT'] if k in os.environ}
def prefixes():return read(HERE/'manifest.json')['commands']
def verify_runtime():
    m=read(HERE/'manifest.json');assert platform.node()==m['host'] and platform.machine()==m['architecture'] and platform.release()==m['kernel']
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    for a in [*m['artifacts'].values(),*m['v8_dependencies']]:assert sha(a['path'])==a['sha256'],a['path']
    return m
