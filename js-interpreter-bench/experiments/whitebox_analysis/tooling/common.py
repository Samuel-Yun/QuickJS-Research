"""Independent stage configuration and write-once evidence; no old runners edited."""
from pathlib import Path
import csv, hashlib, json, os, platform, subprocess, sys, time
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parents[3]
BASE = ROOT / 'experiments/whitebox_analysis'
sys.path.insert(0, str(ROOT / 'experiments/timer_recovery'))
import campaign as baseline
from runtime_setup import save, sha

ENGINES = ('quickjs', 'v8', 'jsc')
ATTEMPT = BASE / 'attempt01'
MODE = 'MAIN_MONOTONIC_V1_DERIVED'

def read(path):
    return json.loads(Path(path).read_text(encoding='utf-8'))

def stamp():
    return datetime.now(timezone.utc).isoformat()

def manifest():
    return read(ATTEMPT / 'manifest.json')

def command(engine, script, extra=()):
    m = manifest()['runtime']['engines'][engine]
    adapters = manifest()['adapters'][engine]
    prefix = m['command_prefix'] + list(extra)
    paths = [a['path'] for a in adapters]
    return prefix + (['-I', paths[0], '-I', paths[1], str(script)] if engine == 'quickjs' else paths + [str(script)])

def inventory():
    paths = [ROOT / 'README.md', ROOT / 'baseline_manifest.md']
    for directory in ('experiments', 'results', 'notes', 'scripts', 'benchmarks', 'patches'):
        paths += [p for p in (ROOT / directory).rglob('*') if p.is_file()
                  and 'whitebox_analysis' not in p.parts and '__pycache__' not in p.parts]
    return {str(p.relative_to(ROOT)): sha(p) for p in sorted(set(paths))}

def verify(check_preservation=False):
    m = baseline.verify()
    if ATTEMPT.joinpath('manifest.json').exists():
        ours = manifest()
        if ours['runtime'] != read(ROOT / 'experiments/timer_recovery/manifest.json'):
            raise RuntimeError('runtime manifest differs; use a new cohort/attempt')
        if platform.node() != ours['host'] or platform.release() != ours['kernel']:
            raise RuntimeError('host/kernel changed')
        for adapters in ours['adapters'].values():
            for a in adapters:
                if sha(a['path']) != a['sha256']: raise RuntimeError('adapter changed')
    if check_preservation and read(ATTEMPT / 'preservation_before.json') != inventory():
        raise RuntimeError('historical data/input modified')
    return m

def capture(label, cmd, timeout=90, cwd=None, env=None):
    target = ATTEMPT / 'raw' / (label + '.json')
    if target.exists(): return read(target)
    start = time.perf_counter_ns()
    try:
        p = subprocess.run(cmd, cwd=cwd or ROOT, env=env, capture_output=True, timeout=timeout, check=False)
        r = {'exit_code': p.returncode, 'stdout': p.stdout.decode(errors='replace'), 'stderr': p.stderr.decode(errors='replace')}
    except subprocess.TimeoutExpired as e:
        r = {'exit_code': None, 'stdout': (e.stdout or b'').decode(errors='replace'),
             'stderr': (e.stderr or b'').decode(errors='replace'), 'error': 'TIMEOUT'}
    except OSError as e:
        r = {'exit_code': None, 'stdout': '', 'stderr': str(e), 'error': 'NOT_AVAILABLE'}
    r.update(command=list(cmd), cwd=str(cwd or ROOT), timestamp_utc=stamp(),
             outer_start_ns=start, outer_stop_ns=time.perf_counter_ns(),
             boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip())
    r['outer_wall_ns'] = r['outer_stop_ns'] - start
    save(target, r)
    return r

def export(path, records):
    import io
    rows = list(records)
    if not rows: return
    out = io.StringIO(newline='')
    w = csv.DictWriter(out, fieldnames=list(rows[0])); w.writeheader()
    for row in rows:
        w.writerow({k: json.dumps(v, separators=(',', ':')) if isinstance(v, (list, dict)) else v for k,v in row.items()})
    save(path, out.getvalue())
