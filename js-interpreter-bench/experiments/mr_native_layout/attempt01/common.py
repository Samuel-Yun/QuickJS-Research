"""Append-only evidence and shared byte-identical prior workloads."""
import csv,gzip,hashlib,io,json,os,platform,subprocess,time
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent; ROOT=HERE.parents[2]
OLD=ROOT/'experiments/read_ic_dequickening/attempt01'
STORE=Path(os.environ.get('MR_LAYOUT_STORE','/home/mzyx/mr_native_layout_attempt01'))
CASES=['M4.numeric_control','M1.own_integer','M3.own_method','Richards.Richards']
BASE=['M_base','R_base']; LAYOUT=[v+'_p'+str(p).zfill(3) for v in 'MR' for p in [0,16,32,48]]
SEED=20261024; MODE='MR_NATIVE_LAYOUT_MONOTONIC_V1'
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def digest(b):return hashlib.sha256(b).hexdigest()
def read(p):
 p=Path(p)
 with (gzip.open(p,'rt',encoding='utf-8') if p.suffix=='.gz' else p.open(encoding='utf-8')) as f:return json.load(f)
def save(p,x):
 p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
 b=x if isinstance(x,bytes) else (x if isinstance(x,str) else json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
 if p.exists():assert p.read_bytes()==b,str(p)
 else:
  with p.open('xb') as f:f.write(b)
def csvout(p,rows):
 o=io.StringIO(newline='');w=csv.DictWriter(o,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,o.getvalue())
def env():return {k:os.environ[k] for k in ['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR'] if k in os.environ}
def capture(label,cmd,cwd=None,e=None,timeout=900):
 folder=HERE/'raw/build';i=1
 while (folder/f'{label}.{i}.json').exists():i+=1
 start=time.perf_counter_ns();p=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,env=env() if e is None else e,capture_output=True,timeout=timeout)
 r=dict(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=stamp(),exit_code=p.returncode,stdout=p.stdout.decode(errors='replace'),stderr=p.stderr.decode(errors='replace'),wall_ns=time.perf_counter_ns()-start)
 save(folder/f'{label}.{i}.json',r);print(label,p.returncode,flush=True);return r
def compress(src,dst):
 b=Path(src).read_bytes();save(dst,gzip.compress(b,compresslevel=6,mtime=0))
 return dict(archive=Path(dst).relative_to(HERE).as_posix(),compressed_sha256=sha(dst),original_sha256=digest(b),original_bytes=len(b),compressed_bytes=Path(dst).stat().st_size)
def script(c,n,check=False):
 # Import frozen driver implementation under a private name, redirect only output/mode.
 import importlib.util,sys
 old_path=list(sys.path);sys.path.insert(0,str(OLD))
 spec=importlib.util.spec_from_file_location('frozen_layout_driver',OLD/'micros.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
 m.HERE=HERE;m.MICRO_CASES=['M1.own_integer','M2.own_reference','M3.own_method','M4.numeric_control','M5.write_control','M6.poly2','M7.poly4','M8.poly8'];m.MODE=MODE
 if c in CASES[:3]:p=m.make_script(c,n,check)
 else:
  driver=(HERE/'inputs/driver.js').read_text().replace('__CONFIG__',json.dumps(dict(case=c,N=n,phase='correctness' if check else 'measure'))).replace('__SUITE__','"Richards"').replace('__INDEX__','0').replace('__BENCHMARK__','"Richards"').replace('MAIN_MONOTONIC_V1',MODE)
  parts=[(HERE/'inputs/adapter.js').read_bytes()]+[(ROOT/'benchmarks/octane/upstream'/f).read_bytes() for f in ['base.js','richards.js']]
  p=HERE/'generated'/f'{c}.N{n}.{"check" if check else "measure"}.js';save(p,b'\n;\n'.join(parts)+b'\n;\n'+driver.encode())
 sys.path[:]=old_path;return p
def snapshot(label):
 r=capture('environment_'+label,['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu,pmem --sort=-pcpu | head -15; true'])
 save(HERE/'raw/environment'/f'{label}.json',dict(**r,boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),affinity=sorted(os.sched_getaffinity(0)),loadavg=os.getloadavg()))
