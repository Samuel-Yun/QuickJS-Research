"""Append-only campaign utilities. Analysis imports require no Linux runtime."""
import csv,hashlib,io,json,math,os,platform,re,subprocess,time
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PREVIOUS=HERE.parent/'attempt01'
CONDITIONS=['QJS_ORIGINAL','V8_IC_ON','V8_IC_OFF']
CASES=['Richards','own_integer','numeric_control']
SEED=20261025
MODE='USE_IC_CONFIGURATION_FIRST_CALL_INCLUSIVE_V1'
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
    keep=['PATH','HOME','USER','LOGNAME','LANG','LC_ALL','LC_CTYPE','TZ','TMPDIR','LD_LIBRARY_PATH','LD_PRELOAD','LD_AUDIT']
    return {k:os.environ[k] for k in keep if k in os.environ}
def prefixes():
    m=read(HERE/'runtime.json');v=m['v8'];dep='--snapshot_blob='+v['dependencies'][0]['path']
    base=[v['binary']['path'],dep,'--jitless','--no-lazy']
    return dict(QJS_ORIGINAL=[m['quickjs']['binary']['path']],V8_IC_ON=base+['--use-ic'],V8_IC_OFF=base+['--no-use-ic'])
def capture(path,command,timeout=60):
    path=Path(path)
    if path.exists():return read(path)
    start=time.perf_counter_ns();started=stamp()
    try:
        p=subprocess.run(list(map(str,command)),cwd=ROOT,env=environment(),capture_output=True,text=True,timeout=timeout)
        r=dict(exit_code=p.returncode,stdout=p.stdout,stderr=p.stderr,timeout=False)
    except subprocess.TimeoutExpired as p:
        def text(x):return x.decode(errors='replace') if isinstance(x,bytes) else x or ''
        r=dict(exit_code=None,stdout=text(p.stdout),stderr=text(p.stderr),timeout=True)
    stop=time.perf_counter_ns()
    r.update(command=list(map(str,command)),cwd=str(ROOT),timestamp=started,completed_at=stamp(),outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip())
    save(path,r);return r
def parse_flags(text):
    result={}
    for line in text.splitlines():
        if not line.startswith('--'):continue
        name=line[2:]
        if '=' in name:k,v=name.split('=',1);result[k]=v
        elif name.startswith('no-'):result[name[3:]]=False
        else:result[name]=True
    return result
def lf(data):return data.replace(b'\r\n',b'\n')
def restore(data,expected):
    for label,b in [('as_found',data),('LF',lf(data)),('CRLF',lf(data).replace(b'\n',b'\r\n'))]:
        if hashlib.sha256(b).hexdigest()==expected:return label,b
    raise AssertionError('source does not match frozen raw or newline-normalized identity')
def verify_runtime():
    m=read(HERE/'runtime.json')
    assert platform.node()==m['host'] and platform.release()==m['kernel'] and platform.machine()=='x86_64'
    for item in [m['quickjs']['binary'],m['v8']['binary'],*m['v8']['dependencies'],m['v8']['build_metadata_artifact']]:assert sha(item['path'])==item['sha256'],item['path']
    assert environment()==read(HERE/'environment.json'),'environment changed'
    return m
