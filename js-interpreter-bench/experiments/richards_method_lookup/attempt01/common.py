"""New write-once experiment; never edits historical data or frozen runtimes."""
import csv, hashlib, io, json, os, platform, subprocess, time
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ENGINES = ('quickjs', 'v8', 'jsc')
MODE = 'FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_DERIVED_METHOD_LOOKUP_V1'

def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def read(p):
    return json.loads(Path(p).read_text(encoding='utf-8'))

def save(p, value):
    p=Path(p); p.parent.mkdir(parents=True, exist_ok=True)
    data = value if isinstance(value, bytes) else (value if isinstance(value,str) else json.dumps(value, indent=2, ensure_ascii=False)+'\n').encode('utf-8')
    if p.exists():
        if p.read_bytes()!=data: raise RuntimeError('write-once conflict: '+str(p))
    else: p.write_bytes(data)

def stamp(): return datetime.now(timezone.utc).isoformat()
def boot(): return Path('/proc/sys/kernel/random/boot_id').read_text().strip()
def manifest(): return read(HERE/'manifest.json')

def capture(label, command, timeout=180, env=None, cwd=None):
    path=HERE/'diagnostics/records'/(label+'.json')
    if path.exists(): return read(path)
    start=time.perf_counter_ns(); date=stamp()
    try:
        p=subprocess.run(command,cwd=cwd or ROOT,env=env,capture_output=True,timeout=timeout)
        result={'exit_code':p.returncode,'stdout':p.stdout.decode(errors='replace'),'stderr':p.stderr.decode(errors='replace')}
    except subprocess.TimeoutExpired as e:
        result={'exit_code':None,'stdout':(e.stdout or b'').decode(errors='replace'),'stderr':(e.stderr or b'').decode(errors='replace'),'error':'TIMEOUT'}
    except OSError as e:
        result={'exit_code':None,'stdout':'','stderr':str(e),'error':'NOT_AVAILABLE'}
    stop=time.perf_counter_ns()
    result.update(command=list(command),cwd=str(cwd or ROOT),timestamp_utc=date,outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start,boot_id=boot(),load_average=os.getloadavg(),LD_PRELOAD=(env or os.environ).get('LD_PRELOAD'))
    save(path,result); return result

def command(e, script, extra=(), diagnostic_binary=None):
    m=manifest(); prefix=m['runtime']['engines'][e]['command_prefix']+list(extra)
    if diagnostic_binary: prefix[0]=str(diagnostic_binary)
    a=[x['path'] for x in m['adapters'][e]]
    return prefix+(['-I',a[0],'-I',a[1],str(script)] if e=='quickjs' else a+[str(script)])

def inventory():
    paths=[ROOT/'README.md',ROOT/'baseline_manifest.md']
    for name in ('experiments','results','notes','scripts','benchmarks','patches'):
        paths.extend(p for p in (ROOT/name).rglob('*') if p.is_file() and 'richards_method_lookup' not in p.parts and '__pycache__' not in p.parts)
    return {str(p.relative_to(ROOT)):sha(p) for p in sorted(set(paths))}

def verify(preserve=False):
    m=manifest(); errors=[]
    if (platform.node(),platform.release(),platform.machine())!=(m['host'],m['kernel'],'x86_64'): errors.append('host/kernel/architecture changed')
    for e,r in m['runtime']['engines'].items():
        for f in [r['binary']]+r['dependencies']+r['dynamic_libraries']+m['adapters'][e]:
            if sha(f['path'])!=f['sha256']: errors.append('artifact changed '+f['path'])
    if preserve and inventory()!=read(HERE/'source_evidence/preservation_before.json'): errors.append('historical files changed')
    if errors: raise RuntimeError(str(errors))
    return m

def export(p, rows):
    rows=list(rows)
    if not rows: return
    out=io.StringIO(newline='');w=csv.DictWriter(out,fieldnames=list(rows[0]));w.writeheader()
    for r in rows: w.writerow({k:json.dumps(v,separators=(',',':')) if isinstance(v,(dict,list,tuple)) else v for k,v in r.items()})
    save(p,out.getvalue())
