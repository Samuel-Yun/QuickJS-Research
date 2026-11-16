"""Shared paths and append-only evidence. Analysis must not call verify_runtime."""
import csv, gzip, hashlib, io, json, os, platform, subprocess, time
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OLD=ROOT/'experiments/legacy_ng_ic/attempt01'
STORE=Path(os.environ.get('IC_SLOT_STORE','/home/mzyx/legacy_ng_ic_slotfix_attempt01'))
VERSIONS=['A','B','C']
SEED=20261023
MODE='LEGACY_NG_IC_SLOTFIX_MONOTONIC_V1'
CASES=['Richards.Richards','DeltaBlue.DeltaBlue','Crypto.Encrypt','Crypto.Decrypt',
 'RayTrace.RayTrace','EarleyBoyer.Earley','EarleyBoyer.Boyer','RegExp.RegExp','Splay.Splay',
 'NavierStokes.NavierStokes','PdfJS.PdfJS','Mandreel.Mandreel','Gameboy.Gameboy',
 'CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery','Typescript.Typescript']
FILES={'Richards':['richards.js'],'DeltaBlue':['deltablue.js'],'Crypto':['crypto.js'],
 'RayTrace':['raytrace.js'],'EarleyBoyer':['earley-boyer.js'],'RegExp':['regexp.js'],'Splay':['splay.js'],
 'NavierStokes':['navier-stokes.js'],'PdfJS':['pdfjs.js'],'Mandreel':['mandreel.js'],
 'Gameboy':['gbemu-part1.js','gbemu-part2.js'],'CodeLoad':['code-load.js'],
 'Typescript':['typescript.js','typescript-input.js','typescript-compiler.js']}
def stamp():return datetime.now(timezone.utc).isoformat()
def read(p):
    p=Path(p)
    with (gzip.open(p,'rt',encoding='utf-8') if p.suffix=='.gz' else p.open(encoding='utf-8')) as f:return json.load(f)
def digest(data):return hashlib.sha256(data).hexdigest()
def sha(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for block in iter(lambda:f.read(1024*1024),b''):h.update(block)
    return h.hexdigest()
def save(p,v):
    p=Path(p);p.parent.mkdir(parents=True,exist_ok=True)
    data=v if isinstance(v,bytes) else (v if isinstance(v,str) else json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data,str(p)
    else:
        with p.open('xb') as f:f.write(data)
def csvout(p,rows):
    assert rows
    out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]));w.writeheader();w.writerows(rows);save(p,out.getvalue())
def capture(label,cmd,cwd=None,timeout=900,env=None):
    folder=HERE/'raw/build';folder.mkdir(parents=True,exist_ok=True)
    k=1
    while (folder/f'{label}.{k}.json').exists():k+=1
    start=time.perf_counter_ns();p=subprocess.run(list(map(str,cmd)),cwd=cwd or ROOT,capture_output=True,timeout=timeout,env=env)
    r=dict(command=list(map(str,cmd)),cwd=str(cwd or ROOT),timestamp=stamp(),exit_code=p.returncode,
      stdout=p.stdout.decode(errors='replace'),stderr=p.stderr.decode(errors='replace'),wall_ns=time.perf_counter_ns()-start)
    save(folder/f'{label}.{k}.json',r);save(folder/f'{label}.{k}.log',r['stdout']+r['stderr'])
    print(label,p.returncode,flush=True)
    if p.returncode:print(r['stderr'][-2500:],flush=True)
    return r
def environment(label):
    r=capture('environment_'+label,['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; df -h /; uptime; ps -eo pid,comm,pcpu,pmem --sort=-pcpu | head -20; true'])
    save(HERE/'raw/environment'/f'{label}.json',dict(**r,boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),loadavg=os.getloadavg()))
def verify_runtime():
    m=read(HERE/'manifest.json')
    assert platform.system()=='Linux' and platform.machine()=='x86_64'
    assert platform.node()==m['host'] and platform.release()==m['kernel']
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    for v,a in m['artifacts'].items():assert sha(a['path'])==a['sha256'],v
    for p,h in m['inputs'].items():assert sha(ROOT/p)==h,p
    return m
def compress(source,dest):
    source,dest=Path(source),Path(dest)
    if not source.exists():return dict(status='MISSING',original_path=str(source))
    dest.parent.mkdir(parents=True,exist_ok=True)
    if not dest.exists():
        with source.open('rb') as inp,dest.open('xb') as out,gzip.GzipFile(filename='',mode='wb',fileobj=out,mtime=0,compresslevel=6) as z:
            for b in iter(lambda:inp.read(1024*1024),b''):z.write(b)
    h=hashlib.sha256();size=0
    with gzip.open(dest,'rb') as f:
        for b in iter(lambda:f.read(1024*1024),b''):h.update(b);size+=len(b)
    assert h.hexdigest()==sha(source) and size==source.stat().st_size
    return dict(status='AVAILABLE_VERIFIED',original_path=str(source),archive=dest.relative_to(HERE).as_posix(),
      original_sha256=h.hexdigest(),compressed_sha256=sha(dest),original_bytes=size,compressed_bytes=dest.stat().st_size)
