"""Extension of v8_ic_on_off/attempt02: append-only records, portable analysis."""
import csv,gzip,hashlib,io,json,math,os,platform,re,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
PREVIOUS=ROOT/'experiments/v8_ic_on_off/attempt02'
LEGACY=ROOT/'experiments/read_ic_dequickening/attempt01'
CONDITIONS=['QJS_ORIGINAL','V8_IC_ON','V8_IC_OFF']
CASES=['Richards.Richards','DeltaBlue.DeltaBlue','Crypto.Encrypt','Crypto.Decrypt','RayTrace.RayTrace','EarleyBoyer.Earley','EarleyBoyer.Boyer','RegExp.RegExp','Splay.Splay','NavierStokes.NavierStokes','PdfJS.PdfJS','Mandreel.Mandreel','Gameboy.Gameboy','CodeLoad.CodeLoadClosure','CodeLoad.CodeLoadJQuery','Typescript.Typescript']
FILES={'Richards':['richards.js'],'DeltaBlue':['deltablue.js'],'Crypto':['crypto.js'],'RayTrace':['raytrace.js'],'EarleyBoyer':['earley-boyer.js'],'RegExp':['regexp.js'],'Splay':['splay.js'],'NavierStokes':['navier-stokes.js'],'PdfJS':['pdfjs.js'],'Mandreel':['mandreel.js'],'Gameboy':['gbemu-part1.js','gbemu-part2.js'],'CodeLoad':['code-load.js'],'Typescript':['typescript.js','typescript-input.js','typescript-compiler.js']}
SEED=20261025;CRYPTO_SEED=305419896;TIMEOUT=180;BUDGET=28800
MODE='USE_IC_OCTANE_FIRST_CALL_INCLUSIVE_V1'
def stamp():return datetime.now(timezone.utc).isoformat()
def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''):h.update(b)
    return h.hexdigest()
def read(path):return json.loads(Path(path).read_text(encoding='utf-8'))
def save(path,value):
    p=Path(path);p.parent.mkdir(parents=True,exist_ok=True)
    b=value if isinstance(value,bytes) else (value if isinstance(value,str) else json.dumps(value,ensure_ascii=False,indent=2)+'\n').encode('utf-8')
    if p.exists():assert p.read_bytes()==b,'refuse overwrite '+str(p)
    else:
        with p.open('xb') as f:f.write(b)
def csvout(path,rows):
    rows=list(rows);assert rows
    out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);save(path,out.getvalue())
def environment():
    keys=['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR','LD_LIBRARY_PATH','LD_PRELOAD','LD_AUDIT']
    return {k:os.environ[k] for k in keys if k in os.environ}
def prefixes():
    m=read(HERE/'runtime.json');v=m['v8'];base=[v['binary']['path'],'--snapshot_blob='+v['dependencies'][0]['path'],'--jitless','--no-lazy']
    return dict(QJS_ORIGINAL=[m['quickjs']['binary']['path']],V8_IC_ON=base+['--use-ic'],V8_IC_OFF=base+['--no-use-ic'])
def boot():return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def capture(path,command,timeout=TIMEOUT):
    path=Path(path)
    if path.exists():return read(path)
    start=time.perf_counter_ns();started=stamp()
    try:
        p=subprocess.run(list(map(str,command)),cwd=ROOT,env=environment(),capture_output=True,text=True,timeout=timeout);r=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as p:
        def text(x):return x.decode(errors='replace') if isinstance(x,bytes) else x or ''
        r=dict(exit_code=None,stdout=text(p.stdout),stderr=text(p.stderr),timeout=True)
    stop=time.perf_counter_ns();r.update(command=list(map(str,command)),cwd=str(ROOT),timestamp=started,completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,boot_id=boot());save(path,r);return r
def parse_flags(text):
    result={}
    for line in text.splitlines():
        if not line.startswith('--'):continue
        name=line[2:]
        if '=' in name:k,v=name.split('=',1);result[k]=v
        elif name.startswith('no-'):result[name[3:]]=False
        else:result[name]=True
    return result
def lf(b):return b.replace(b'\r\n',b'\n')
def restore(b,expected):
    for label,data in [('as_found',b),('LF',lf(b)),('CRLF',lf(b).replace(b'\n',b'\r\n'))]:
        if hashlib.sha256(data).hexdigest()==expected:return label,data
    raise AssertionError('frozen input hash mismatch')
def tree(path):return {p.relative_to(path).as_posix():sha(p) for p in sorted(path.rglob('*'),key=lambda p:p.as_posix()) if p.is_file() and '__pycache__' not in p.parts}
def verify_runtime():
    m=read(HERE/'runtime.json');assert platform.node()==m['host'] and platform.release()==m['kernel'] and platform.machine()=='x86_64'
    for a in [m['quickjs']['binary'],m['v8']['binary'],*m['v8']['dependencies'],m['v8']['build_metadata_artifact']]:assert sha(a['path'])==a['sha256'],a['path']
    assert environment()==read(HERE/'environment.json'),'environment changed'
    return m
def blocked(case):
    rows=[read(p) for p in (HERE/'status').glob(case+'.*.json')]
    return next((r for r in rows if r['status'].startswith(('BLOCKED','FAILED'))),None)
def block(case,stage,reason,status='BLOCKED_CASE'):
    p=HERE/'status'/f'{case}.{stage}.json';save(p,dict(case=case,stage=stage,status=status,reason=reason,timestamp=stamp()));print(status,case,reason,flush=True)
