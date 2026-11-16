"""Three conditions only; append-only records and data-only analysis support."""
import csv,gzip,hashlib,io,json,os,platform,re,subprocess,time
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
CONDITIONS=['QJS_ORIGINAL','V8_IC_ON','V8_IC_OFF'];CASES=['Richards','own_integer','numeric_control'];SEED=20261025
OLD=ROOT/'experiments/read_ic_dequickening/attempt01';NATIVE=ROOT/'experiments/mr_native_layout/attempt01'
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def read(p):
 p=Path(p)
 with (gzip.open(p,'rt',encoding='utf-8') if p.suffix=='.gz' else p.open(encoding='utf-8')) as f:return json.load(f)
def save(p,v):
 p=Path(p);p.parent.mkdir(parents=True,exist_ok=True);b=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode()
 if p.exists():assert p.read_bytes()==b,str(p)
 else:
  with p.open('xb') as f:f.write(b)
def env():return {k:os.environ[k] for k in ['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR'] if k in os.environ}
def csvout(p,rows):
 o=io.StringIO(newline='');w=csv.DictWriter(o,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,o.getvalue())
def capture(label,cmd,cwd=None,timeout=60,e=None):
 folder=HERE/'raw/capability';i=1
 while (folder/f'{label}.{i}.json').exists():i+=1
 t0=time.perf_counter_ns()
 try:
  p=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,env=env() if e is None else e,capture_output=True,text=True,timeout=timeout)
  r=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
 except subprocess.TimeoutExpired as p:r=dict(exit_code=None,stdout=(p.stdout or b'').decode(errors='replace'),stderr=(p.stderr or b'').decode(errors='replace'),timeout=True)
 r.update(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=stamp(),outer_start_ns=t0,outer_stop_ns=time.perf_counter_ns(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip() if platform.system()=='Linux' else None);save(folder/f'{label}.{i}.json',r);print(label,r['exit_code'],flush=True);return r
def prefixes():
 m=read(HERE/'runtime.json');q=m['quickjs']['binary']['path'];v=m['v8']['binary']['path'];dep='--snapshot_blob='+m['v8']['dependencies'][0]['path']
 return dict(QJS_ORIGINAL=[q],V8_IC_ON=[v,dep,'--jitless','--no-lazy','--use-ic'],V8_IC_OFF=[v,dep,'--jitless','--no-lazy','--no-use-ic'])
