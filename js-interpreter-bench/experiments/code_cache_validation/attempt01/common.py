"""Independent, write-once code-cache experiment; frozen inputs are read-only."""
import hashlib, json, math, os, platform, subprocess, time
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
TIMER = ROOT / 'experiments/timer_recovery'
CONDITIONS = ('SOURCE_NO_LAZY', 'CACHE_NO_LAZY_CONSUMER')
CASES = ('controlflow-recursive', 'access-binary-trees', 'Richards.Richards', 'NavierStokes.NavierStokes')

def sha(p):
    h = hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda: f.read(1024 * 1024), b''): h.update(b)
    return h.hexdigest()

def read(p): return json.loads(Path(p).read_text(encoding='utf-8'))
def stamp(): return datetime.now(timezone.utc).isoformat()
def save(p, value):
    p = Path(p)
    data = value if isinstance(value, bytes) else (value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, indent=2)+'\n').encode()
    p.parent.mkdir(parents=True, exist_ok=True)
    if p.exists():
        if p.read_bytes() != data: raise RuntimeError('Refuse overwrite: '+str(p))
        return
    with p.open('xb') as f: f.write(data)

def history():
    paths = [ROOT/'README.md', ROOT/'baseline_manifest.md']
    for name in ('experiments', 'notes', 'results', 'scripts', 'benchmarks', 'patches'):
        paths += [p for p in (ROOT/name).rglob('*') if p.is_file() and '__pycache__' not in p.parts
                  and 'code_cache_validation' not in p.parts]
    return {str(p.relative_to(ROOT)):sha(p) for p in sorted(set(paths)) if p.exists()}

def verify():
    m = read(TIMER/'manifest.json')
    if platform.node() != 'LAPTOP-QPKCPDCB' or platform.machine() != 'x86_64': raise RuntimeError('host/arch mismatch')
    if os.environ.get('LD_PRELOAD') or os.environ.get('LD_AUDIT'): raise RuntimeError('preload present')
    e = m['engines']['v8']
    for x in [e['binary'], *e['dependencies'], *e['dynamic_libraries'], e['archive'], e['build_metadata_artifact'], e['timer_adapter']]:
        if sha(x['path']) != x['sha256']: raise RuntimeError('runtime hash mismatch '+x['path'])
    if e['runtime_flags'] != ['--max-opt=0', '--no-lazy']: raise RuntimeError('flags changed')
    if read(TIMER/'audit.json')['status'] != 'PASS': raise RuntimeError('clock gate failed')
    if (HERE/'input_manifest.json').exists():
        for p,h in read(HERE/'input_manifest.json').items():
            if sha(ROOT/p) != h: raise RuntimeError('input hash changed '+p)
    return m

def command(script=None, extra=(), lazy=False):
    e = read(TIMER/'manifest.json')['engines']['v8']
    args = [x for x in e['command_prefix'] if not (lazy and x == '--no-lazy')] + list(extra)
    if script is not None:
        args += [str(ROOT/'experiments/three_engine_baseline/adapters/v8.js'), e['timer_adapter']['path'], str(script)]
    return args

def capture(label, cmd, timeout=60):
    path = HERE/'probes/logs'/(label+'.json')
    if path.exists():
        r = read(path)
        if r['command'] != cmd: raise RuntimeError('probe command changed')
        return r
    r = {'command':cmd, 'timestamp_utc':stamp(), 'boot_id':Path('/proc/sys/kernel/random/boot_id').read_text().strip()}
    a = time.perf_counter_ns()
    try:
        p = subprocess.run(cmd, capture_output=True, cwd=ROOT, timeout=timeout)
        r.update(exit_code=p.returncode, stdout=p.stdout.decode(errors='replace'), stderr=p.stderr.decode(errors='replace'))
    except subprocess.TimeoutExpired as ex:
        r.update(exit_code=None, stdout=(ex.stdout or b'').decode(errors='replace'), stderr=(ex.stderr or b'').decode(errors='replace'), error='TIMEOUT')
    r['external_wall_ns'] = time.perf_counter_ns()-a
    save(path,r)
    save(path.with_suffix('.stdout.txt'),r['stdout']); save(path.with_suffix('.stderr.txt'),r['stderr'])
    return r

def initialize():
    verify()
    if not (HERE/'preservation_before.json').exists(): save(HERE/'preservation_before.json',history())
    save(HERE/'manifest.json',read(TIMER/'manifest.json'))
    if not (HERE/'environment_before.json').exists():
        data={'time':stamp(),'host':platform.node(),'kernel':platform.release(),'architecture':platform.machine(),
              'distro':os.environ.get('WSL_DISTRO_NAME'),'boot_id':Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
              'python_clock_info':vars(time.get_clock_info('perf_counter')),'temperature':None,'physical_frequency':None,'power_limits':None}
        for k,cmd in {'cpu':['lscpu'],'os':['cat','/etc/os-release'],'load':['cat','/proc/loadavg'],
                      'processes':['ps','-eo','pid,comm,args'],'memory':['free','-b']}.items():
            p=subprocess.run(cmd,capture_output=True,text=True);data[k]={'stdout':p.stdout,'stderr':p.stderr,'exit_code':p.returncode}
        save(HERE/'environment_before.json',data)

