"""New independent AMR campaign; immutable evidence and data-only replay helpers."""
import csv,gzip,hashlib,io,json,os,platform,subprocess,time
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PREVIOUS=ROOT/'experiments/read_ic_mic/attempt01'
ABLATION=ROOT/'experiments/read_ic_hit_ablation/attempt01'
BASE_MATERIALS=ROOT/'experiments/legacy_ng_ic_slotfix/attempt01'
STORE=Path(os.environ.get('IC_DEQUICKEN_STORE','/home/mzyx/read_ic_dequickening_attempt01'))
VERSIONS=['A','M','R'];SEED=20261024;MODE='READ_IC_DEQUICKEN_MONOTONIC_V1'
OCTANE_CASES=['Richards.Richards','DeltaBlue.DeltaBlue','Crypto.Encrypt','Crypto.Decrypt',
 'RayTrace.RayTrace','EarleyBoyer.Earley','EarleyBoyer.Boyer','RegExp.RegExp','Splay.Splay',
 'NavierStokes.NavierStokes','PdfJS.PdfJS','Mandreel.Mandreel','Gameboy.Gameboy',
 'CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery','Typescript.Typescript']
MICRO_CASES=['M1.own_integer','M2.own_reference','M3.own_method','M4.numeric_control','M5.write_control','M6.poly2','M7.poly4','M8.poly8']
CASES=OCTANE_CASES+MICRO_CASES
FILES={'Richards':['richards.js'],'DeltaBlue':['deltablue.js'],'Crypto':['crypto.js'],
 'RayTrace':['raytrace.js'],'EarleyBoyer':['earley-boyer.js'],'RegExp':['regexp.js'],'Splay':['splay.js'],
 'NavierStokes':['navier-stokes.js'],'PdfJS':['pdfjs.js'],'Mandreel':['mandreel.js'],
 'Gameboy':['gbemu-part1.js','gbemu-part2.js'],'CodeLoad':['code-load.js'],
 'Typescript':['typescript.js','typescript-input.js','typescript-compiler.js']}
def stamp():return datetime.now(timezone.utc).isoformat()
def read(p):
    p=Path(p)
    with (gzip.open(p,'rt',encoding='utf-8') if p.suffix=='.gz' else p.open(encoding='utf-8')) as f:return json.load(f)
def digest(b):return hashlib.sha256(b).hexdigest()
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    data=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data,str(p)
    else:
        with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    assert rows;out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(p,out.getvalue())
def clean_env():
    return {k:os.environ[k] for k in ['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR'] if k in os.environ}
def capture(label,cmd,cwd=None,env=None,timeout=900):
    folder=HERE/'raw/build';folder.mkdir(parents=True,exist_ok=True);i=1
    while (folder/f'{label}.{i}.json').exists():i+=1
    e=clean_env() if env is None else env;start=time.perf_counter_ns()
    p=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,capture_output=True,timeout=timeout,env=e)
    r=dict(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=stamp(),exit_code=p.returncode,
      stdout=p.stdout.decode(errors='replace'),stderr=p.stderr.decode(errors='replace'),wall_ns=time.perf_counter_ns()-start,
      mode_variable_present='QJS_READ_IC_MODE' in e,relevant_env={k:e[k] for k in ['QJS_READ_IC_MODE','READ_IC_REPORT'] if k in e})
    save(folder/f'{label}.{i}.json',r);save(folder/f'{label}.{i}.log',r['stdout']+r['stderr']);print(label,p.returncode,flush=True)
    if p.returncode:print(r['stderr'][-2500:],flush=True)
    return r
def environment(label):
    r=capture('environment_'+label,['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu,pmem --sort=-pcpu | head -20; true'])
    save(HERE/'raw/environment'/f'{label}.json',dict(**r,boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),loadavg=os.getloadavg(),affinity=sorted(os.sched_getaffinity(0))))
def verify_runtime():
    m=read(HERE/'manifest.json');assert platform.system()=='Linux' and platform.machine()=='x86_64'
    assert platform.node()==m['host'] and platform.release()==m['kernel']
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    for v,a in m['artifacts'].items():assert sha(a['path'])==a['sha256'],v
    for p,h in m['inputs'].items():assert sha(ROOT/p)==h,p
    return m
def compress(src,dest):
    src,dest=Path(src),Path(dest);dest.parent.mkdir(parents=True,exist_ok=True)
    if not dest.exists():
        with src.open('rb') as i,dest.open('xb') as o,gzip.GzipFile(filename='',mode='wb',fileobj=o,mtime=0,compresslevel=6) as z:
            for b in iter(lambda:i.read(1048576),b''):z.write(b)
    h=hashlib.sha256();n=0
    with gzip.open(dest,'rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b);n+=len(b)
    assert h.hexdigest()==sha(src) and n==src.stat().st_size
    return dict(archive=dest.relative_to(HERE).as_posix(),original_path=str(src),original_sha256=h.hexdigest(),compressed_sha256=sha(dest),original_bytes=n,compressed_bytes=dest.stat().st_size)
