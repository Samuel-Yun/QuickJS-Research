"""Shared manifest verification, standard workload generation and shell transport."""
from __future__ import annotations
import json
import os
from pathlib import Path
import platform
import re
import subprocess
from datetime import datetime, timezone
from runtime_setup import sha, save, protect

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SUNSPIDER = {
    'bitops-bitwise-and': ('result', ['0']),
    'controlflow-recursive': ('result', ['57775']),
    'regexp-dna': ("dnaOutputString.length + ':' + dnaInput.length", ['249:300056']),
    'string-unpack-code': ('result', ['511508'])
}
OCTANE = {
    'Richards': ('Richards', 'richards.js', 'Richards', 'runRichards'),
    'NavierStokes': ('NavierStokes', 'navier-stokes.js', 'NavierStokes', 'runNavierStokes'),
    'RegExp': ('RegExp', 'regexp.js', 'RegExp', 'RegExpRun'),
    'CodeLoadClosure': ('CodeLoad', 'code-load.js', 'CodeLoadClosure', 'runCodeLoadClosure')
}
ENGINES = ('quickjs', 'v8', 'jsc')

def manifest():
    return json.loads((HERE / 'manifest.json').read_text())

def verify():
    m = manifest()
    if platform.system() != 'Linux' or platform.machine() != m['architecture']:
        raise RuntimeError('wrong OS/architecture; use the selected WSL distro')
    if 'microsoft' not in platform.release().lower():
        raise RuntimeError('this is the frozen WSL2 cohort, not a native Linux cohort')
    if 'VERSION_ID="24.04"' not in Path('/etc/os-release').read_text():
        raise RuntimeError('wrong distro/version')
    for engine in ENGINES:
        e = m['engines'][engine]
        for item in [e['binary'], *e['dependencies'], *e['dynamic_libraries']]:
            if sha(item['path']) != item['sha256']:
                raise RuntimeError('runtime/dependency hash mismatch: ' + item['path'])
        if not os.access(e['binary']['path'], os.X_OK):
            raise RuntimeError('runtime not executable')
    if sha(m['engines']['v8']['archive']['path']) != m['engines']['v8']['archive']['sha256']:
        raise RuntimeError('official archive hash mismatch')
    protect()
    inputs = HERE / 'input_manifest.json'
    if inputs.exists():
        for path, expected in json.loads(inputs.read_text()).items():
            if sha(ROOT / path) != expected:
                raise RuntimeError('workload/harness changed: ' + path)
    return m

def freeze_inputs():
    paths = [HERE / 'manifest.json', HERE / 'adapters/manifest.json', HERE / 'execution_contract.json', HERE / 'sunspider_driver.js', HERE / 'octane_driver.js',
             HERE / 'cohort.py', HERE / 'prepare_cohort.py', HERE / 'run_case.py',
             HERE / 'probes/tier/hot_probe.js', HERE / 'probes/tier/regexp_probe.js', HERE / 'regexp_policy_probe.py', HERE / 'probes/frontend_order/static_probe.js', HERE / 'probes/timer/timer_probe.js',
             *sorted((HERE / 'adapters').glob('*.js'))]
    paths.extend(ROOT / 'benchmarks/sunspider/standalone/sunspider-1.0.2' / (case + '.js') for case in SUNSPIDER)
    upstream = ROOT / 'benchmarks/octane/upstream'
    paths.extend(upstream / name for name in ('base.js', *[o[1] for o in OCTANE.values()]))
    expected_octane = {}
    for line in (ROOT / 'experiments/octane/upstream_sha256.txt').read_text().splitlines():
        h, name = line.split('  ', 1)
        expected_octane[name] = h
    for p in paths:
        if p.parent == upstream and sha(p) != expected_octane[p.name]:
            raise RuntimeError('Octane upstream hash differs')
    # Also match the frozen standalone manifest, rather than trusting filenames.
    frozen_sun = {}
    for line in (ROOT / 'benchmarks/sunspider/SHA256SUMS.standalone.txt').read_text().splitlines():
        h, name = line.split('  ', 1)
        frozen_sun[Path(name).name] = h
    for case in SUNSPIDER:
        p = ROOT / 'benchmarks/sunspider/standalone/sunspider-1.0.2' / (case + '.js')
        if sha(p) != frozen_sun[p.name]:
            raise RuntimeError('SunSpider standalone hash differs')
    save(HERE / 'input_manifest.json', {str(p.relative_to(ROOT)): sha(p) for p in paths})

def generate(benchmark, case, n, mode):
    if type(n) is not int or not 1 <= n <= 65536 or mode not in ('correctness', 'main', 'frontend', 'diagnostic'):
        raise ValueError('invalid N/mode')
    config = json.dumps({'case': case, 'N': n, 'mode': mode}, separators=(',', ':'))
    if benchmark == 'SunSpider':
        expression, allowed = SUNSPIDER[case]
        source = (ROOT / 'benchmarks/sunspider/standalone/sunspider-1.0.2' / (case + '.js')).read_bytes()
        body = b'function __tebSunSpiderWorkload() {\n' + source + ('\nreturn String(' + expression + ');\n}\n').encode()
        driver = (HERE / 'sunspider_driver.js').read_text().replace('__CONFIG__', config).replace('__CHECKSUMS__', json.dumps(allowed))
    elif benchmark == 'Octane':
        suite, filename, subbenchmark, _ = OCTANE[case]
        upstream = ROOT / 'benchmarks/octane/upstream'
        body = b'\n;\n'.join((upstream / name).read_bytes() for name in ('base.js', filename)) + b'\n;\n'
        driver = (HERE / 'octane_driver.js').read_text().replace('__CONFIG__', config)
        driver = driver.replace('__SUITE__', json.dumps(suite)).replace('__INDEX__', '0').replace('__BENCHMARK__', json.dumps(subbenchmark))
    else:
        raise ValueError('unknown benchmark')
    path = HERE / 'generated' / f'{benchmark}.{case}.N{n}.{mode}.js'
    save(path, body + driver.encode())
    return path

def command(engine, script, diagnostics=(), default=False):
    info = manifest()['engines'][engine]
    prefix = info['command_prefix'][:]
    if default:
        prefix = [info['binary']['path']]
        if engine == 'v8':
            snapshot = next(item for item in info['dependencies'] if item['path'].endswith('snapshot_blob.bin'))
            prefix.append('--snapshot_blob=' + snapshot['path'])
    adapter = str(HERE / 'adapters' / (engine + '.js'))
    tail = ['-I', adapter, str(script)] if engine == 'quickjs' else [adapter, str(script)]
    return [*prefix, *diagnostics, *tail]

def run(cmd, timeout=180):
    started = datetime.now(timezone.utc).isoformat()
    try:
        p = subprocess.run(cmd, cwd=ROOT, capture_output=True, timeout=timeout, check=False)
        return {'command': cmd, 'timestamp_utc': started, 'exit_code': p.returncode,
                'stdout': p.stdout.decode('utf-8', errors='replace'),
                'stderr': p.stderr.decode('utf-8', errors='replace')}
    except subprocess.TimeoutExpired as exc:
        return {'command': cmd, 'timestamp_utc': started, 'exit_code': None, 'timeout': True,
                'stdout': (exc.stdout or b'').decode('utf-8', errors='replace'),
                'stderr': (exc.stderr or b'').decode('utf-8', errors='replace')}

def evidence(label, cmd, timeout=180):
    directory = HERE / 'probes' / label
    meta = directory / 'command.json'
    if meta.exists():
        record = json.loads(meta.read_text())
        if record['command'] != cmd:
            raise RuntimeError('existing evidence command differs: ' + label)
        record['stdout'] = (directory / 'stdout.txt').read_text()
        record['stderr'] = (directory / 'stderr.txt').read_text()
        return record
    record = run(cmd, timeout)
    save(directory / 'stdout.txt', record['stdout'])
    save(directory / 'stderr.txt', record['stderr'])
    save(meta, {k: v for k, v in record.items() if k not in ('stdout', 'stderr')})
    return record

def validated_payload(record, benchmark, case, n, mode):
    matches = re.findall(r'^TEB_RESULT:(.+)$', record['stdout'], re.M)
    if record['exit_code'] != 0 or record['stderr'] or len(matches) != 1:
        raise ValueError('nonzero exit, stderr, or missing/duplicate result')
    p = json.loads(matches[0])
    for k, expected in {'benchmark': benchmark, 'case': case, 'N': n, 'mode': mode, 'correctness': 'PASS', 'timer': 'Date.now'}.items():
        if p.get(k) != expected:
            raise ValueError('payload identity mismatch: ' + k)
    if benchmark == 'SunSpider' and p.get('checksum') not in SUNSPIDER[case][1]:
        raise ValueError('unexpected checksum')
    if mode != 'correctness' and (type(p['elapsed_ms']) is not int or p['elapsed_ms'] < 0 or p['elapsed_per_call_ms'] != p['elapsed_ms'] / n):
        raise ValueError('invalid elapsed')
    return p
