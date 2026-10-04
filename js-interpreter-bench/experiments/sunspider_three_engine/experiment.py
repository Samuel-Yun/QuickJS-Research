"""Frozen three-engine SunSpider contract; no runtime build/update functions."""
from __future__ import annotations

import csv
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import random
import statistics
import subprocess
import sys
import time
from datetime import datetime, timezone

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PREP = ROOT / 'experiments/three_engine_baseline'
sys.path.insert(0, str(PREP))
sys.path.insert(0, str(ROOT / 'scripts'))
sys.path.insert(0, str(ROOT / 'experiments/frontend_isolation'))
import cohort
import run_sunspider as old
import run_repeated_mode as previous

ENGINES = ('quickjs', 'v8', 'jsc')
CASES = tuple(old.TESTS)
SEED = 20261005
TARGET_MS = 1000
MAX_N = 65536
TIMEOUT = 300
REPS = 30
MODES = ('MAIN', 'DIAGNOSTIC_ONE_EXPLICIT_WARMUP')
DIAGNOSTIC_CASES = ('access-binary-trees', 'date-format-xparb', 'regexp-dna', 'string-unpack-code')
RAW_FIELDS = ('cohort', 'mode', 'stage', 'case', 'engine', 'rep', 'order',
              'round_case_position', 'permutation', 'schedule_index', 'attempt', 'N',
              'elapsed_ms', 'elapsed_per_call', 'outer_wall_ns', 'flags', 'command',
              'binary_sha256', 'script_path', 'script_sha256', 'checksum', 'stdout',
              'stderr', 'exit_code', 'valid', 'status', 'error', 'timestamp_utc',
              'warmup_calls', 'checks_each_call', 'timeout_seconds')

def now():
    return datetime.now(timezone.utc).isoformat()

def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for b in iter(lambda: f.read(1024 * 1024), b''):
            h.update(b)
    return h.hexdigest()

def read(path):
    return json.loads(Path(path).read_text(encoding='utf-8'))

def save(path, value):
    """Write-once evidence. Never overwrite a raw record or frozen input."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    data = value if isinstance(value, bytes) else (
        value.encode('utf-8') if isinstance(value, str) else
        (json.dumps(value, indent=2, ensure_ascii=False) + '\n').encode('utf-8'))
    if path.exists():
        if path.read_bytes() != data:
            raise RuntimeError('refuse to overwrite: ' + str(path))
        return
    with path.open('xb') as f:
        f.write(data)
        f.flush()
        os.fsync(f.fileno())

def export_csv(path, rows, fields=None):
    rows = list(rows)
    if not rows:
        return
    fields = fields or tuple(rows[0])
    import io
    buf = io.StringIO(newline='')
    w = csv.DictWriter(buf, fieldnames=fields, extrasaction='ignore')
    w.writeheader()
    for r in rows:
        w.writerow({k: json.dumps(v, separators=(',', ':'), ensure_ascii=False)
                    if isinstance(v, (list, dict)) else v for k, v in r.items()})
    save(path, buf.getvalue())

def allowed_checksums():
    """Only reuse frozen, previously validated outputs; no new expected values."""
    p = ROOT / 'experiments/frontend_isolation/correctness/repeated.csv'
    if sha(p) != '88c6f0f2725b38f7cde5b15b1b76577f2fcef18aa902eb051780414766157443':
        raise RuntimeError('old checksum evidence changed')
    out = {c: set() for c in CASES}
    with p.open(encoding='utf-8', newline='') as f:
        for r in csv.DictReader(f):
            if r['valid'] != 'True' or not r['stdout'].startswith('CHECKSUM='):
                raise RuntimeError('old correctness invalid')
            out[r['test']].add(r['stdout'][9:])
    if any(not x for x in out.values()) or set(previous.CHECKSUM) != set(CASES):
        raise RuntimeError('checksum coverage mismatch')
    return {c: sorted(v) for c, v in out.items()}

def tags():
    # Mechanism-sensitive labels from executable source, not a performance filter.
    definitions = {
        'crypto-aes': ['RegExp', 'runtime-specialized'],
        'date-format-tofte': ['dynamic-code', 'runtime-specialized'],
        'date-format-xparb': ['dynamic-code', 'RegExp', 'runtime-specialized'],
        'regexp-dna': ['RegExp', 'runtime-specialized'],
        'string-tagcloud': ['RegExp', 'runtime-specialized'],
        'string-unpack-code': ['RegExp', 'runtime-specialized'],
        'string-validate-input': ['RegExp', 'runtime-specialized'],
        '3d-morph': ['runtime-specialized'],
        '3d-raytrace': ['runtime-specialized'],
        'access-nbody': ['runtime-specialized'],
        'math-cordic': ['runtime-specialized'],
        'math-partial-sums': ['runtime-specialized'],
        'math-spectral-norm': ['runtime-specialized'],
        'string-base64': ['runtime-specialized'],
    }
    return {c: definitions.get(c, []) for c in CASES}

def config():
    m = cohort.manifest()
    return {'schema_version': 1, 'cohort': m['cohort_id'],
            'metric': 'first-call-inclusive interpreter-mode execution time',
            'clock': 'Date.now', 'source_version': 'SunSpider 1.0.2',
            'source_commit': old.SOURCE_COMMIT, 'cases': list(CASES),
            'engines': list(ENGINES), 'main_mode': 'MAIN',
            'mode_policies': {'MAIN': {'warmup_calls': 0},
                             MODES[1]: {'warmup_calls': 1, 'cases': list(DIAGNOSTIC_CASES)}},
            'diagnostic_selection_predeclared': True,
            'repetitions': REPS, 'schedule_seed': SEED,
            'order_policy': 'all six engine permutations exactly five times per case; case and permutation assignment shuffled by seed',
            'calibration': {'target_ms_each_engine': TARGET_MS,
                            'N_sequence': '1,2,4,...', 'max_N': MAX_N,
                            'timeout_seconds_per_process': TIMEOUT,
                            'first_common_crossing': True},
            'statistic': 'internal elapsed_ms / N',
            'stddev': 'sample, denominator n-1',
            'IQR': 'Tukey median-of-halves; odd-length central value omitted',
            'GM': 'exp(mean(log(pairwise ratios of medians))); same complete three-engine case intersection',
            'outlier_policy': 'keep all valid samples, including below calibration threshold',
            'correctness': 'old exact checksum set plus unchanged upstream assertions/tolerances; every call checked in independent correctness processes',
            'allowed_checksums': allowed_checksums(), 'checksum_expressions': previous.CHECKSUM,
            'case_tags': tags(), 'old_windows_data_used_for_ratios': False,
            'runtime_manifest_sha256': sha(PREP / 'manifest.json'),
            'execution_contract_sha256': sha(PREP / 'execution_contract.json'),
            'standard_driver_sha256': sha(PREP / 'sunspider_driver.js'),
            'static_frontend_exclusion': 'UNKNOWN',
            'formal_authorization': 'Current user prompt explicitly authorizes correctness, calibration, sampling and independent audit; old preparation-stage authorization fields remain unchanged'}

def verify_inputs():
    m = cohort.verify()
    for p, h in [(old.UPSTREAM_MANIFEST, old.UPSTREAM_MANIFEST_SHA256),
                 (old.STANDALONE_MANIFEST, old.STANDALONE_MANIFEST_SHA256),
                 (old.STANDALONE_PATCH, old.STANDALONE_PATCH_SHA256)]:
        if sha(p) != h:
            raise RuntimeError('frozen benchmark input mismatch: ' + str(p))
    old.verify_directory(old.UPSTREAM_DIRECTORY, old.read_manifest(old.UPSTREAM_MANIFEST), 'upstream')
    old.verify_directory(old.STANDALONE_DIRECTORY, old.read_manifest(old.STANDALONE_MANIFEST), 'standalone')
    a = read(PREP / 'summary/audit.json')
    if a['status'] != 'READY_FIRST_CALL_INCLUSIVE' or not a['execution_mode_gates']['all_mode_gates_pass']:
        raise RuntimeError('runtime mode not ready')
    return m

def setup():
    m = verify_inputs()
    save(HERE / 'config.json', config())
    paths = [HERE / 'experiment.py', HERE / 'run.py', HERE / 'audit.py',
             HERE / 'config.json', PREP / 'manifest.json', PREP / 'execution_contract.json',
             PREP / 'sunspider_driver.js', ROOT / 'experiments/frontend_isolation/run_repeated_mode.py',
             old.UPSTREAM_MANIFEST, old.STANDALONE_MANIFEST, old.STANDALONE_PATCH]
    paths += list(old.UPSTREAM_DIRECTORY.iterdir()) + list(old.STANDALONE_DIRECTORY.iterdir())
    paths += list((PREP / 'adapters').glob('*'))
    save(HERE / 'input_manifest.json', {str(p.relative_to(ROOT)): sha(p) for p in sorted(paths) if p.is_file()})
    save(HERE / 'runtime_manifest.json', (PREP / 'manifest.json').read_bytes())
    save(HERE / 'execution_contract.json', (PREP / 'execution_contract.json').read_bytes())
    save(HERE / 'baseline_environment.txt', (PREP / 'environment.txt').read_bytes())
    return m

def verified():
    m = verify_inputs()
    for path, h in read(HERE / 'input_manifest.json').items():
        if sha(ROOT / path) != h:
            raise RuntimeError('new experiment input changed: ' + path)
    return m

def environment_snapshot(label):
    info = {'timestamp_utc': now(), 'host': platform.node(), 'system': platform.system(),
            'release': platform.release(), 'machine': platform.machine(),
            'python': sys.version, 'WSL_DISTRO_NAME': os.environ.get('WSL_DISTRO_NAME'),
            'TZ_environment': os.environ.get('TZ'), 'wall_localtime': time.strftime('%Y-%m-%d %H:%M:%S %Z'),
            'cpu_count': os.cpu_count(), 'load_average': os.getloadavg(),
            'temperature': None, 'actual_physical_frequency': None,
            'background_isolation': 'UNKNOWN', 'power_limits': None}
    for name, cmd in {'uname': ['uname', '-a'], 'os': ['cat', '/etc/os-release'],
                      'cpu': ['lscpu'], 'memory': ['free', '-b'], 'disk': ['df', '-h', str(HERE)],
                      'load': ['ps', '-eo', 'pid,comm,pcpu,pmem', '--sort=-pcpu']}.items():
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=30, check=False)
        info[name] = {'command': cmd, 'exit_code': p.returncode, 'stdout': p.stdout, 'stderr': p.stderr}
    save(HERE / 'environment' / (label + '.json'), info)
    save(HERE / 'environment' / (label + '.hashes.json'),
         {'timestamp_utc': info['timestamp_utc'], 'runtime_manifest_sha256': sha(PREP / 'manifest.json'),
          'input_manifest_sha256': sha(HERE / 'input_manifest.json'),
          'verification': 'all runtime/dependency/benchmark/new inputs and old protected data verified'})

def script(case, n, mode, correctness=False):
    js_mode = 'correctness' if correctness else ('main' if mode == 'MAIN' else 'diagnostic')
    cfg = json.dumps({'case': case, 'N': n, 'mode': js_mode}, separators=(',', ':'))
    body = b'function __tebSunSpiderWorkload() {\n' + (old.STANDALONE_DIRECTORY / (case + '.js')).read_bytes()
    body += ('\nreturn String(' + previous.CHECKSUM[case] + ');\n}\n').encode()
    driver = (PREP / 'sunspider_driver.js').read_text(encoding='utf-8')
    driver = driver.replace('__CONFIG__', cfg).replace('__CHECKSUMS__', json.dumps(allowed_checksums()[case]))
    if correctness and mode == MODES[1]:
        # Independent DIAGNOSTIC validation reproduces the disclosed one-call warmup.
        driver = driver.replace("if (__tebConfig.mode === 'correctness') {",
                                "if (__tebConfig.mode === 'correctness') {\n    __tebWorkload();")
    path = HERE / 'generated' / mode / f'{case}.N{n}.{js_mode}.js'
    save(path, body + driver.encode('utf-8'))
    return path

def payload(record, correctness=False):
    if record['exit_code'] != 0 or record['stderr']:
        raise ValueError('exit/stderr gate failed')
    lines = record['stdout'].splitlines()
    if len(lines) != 1 or not lines[0].startswith('TEB_RESULT:'):
        raise ValueError('missing/duplicate/unexpected stdout')
    p = json.loads(lines[0][11:])
    js_mode = 'correctness' if correctness else ('main' if record['mode'] == 'MAIN' else 'diagnostic')
    identity = {'benchmark': 'SunSpider', 'case': record['case'], 'N': record['N'],
                'mode': js_mode, 'correctness': 'PASS', 'timer': 'Date.now'}
    for k, v in identity.items():
        if p.get(k) != v:
            raise ValueError('payload identity mismatch: ' + k)
    if p['checksum'] not in allowed_checksums()[record['case']]:
        raise ValueError('checksum not in frozen rules')
    if not correctness:
        if type(p['elapsed_ms']) is not int or p['elapsed_ms'] < 0:
            raise ValueError('invalid interval')
        if p['elapsed_per_call_ms'] != p['elapsed_ms'] / record['N']:
            raise ValueError('invalid normalization')
        if p['warmup_calls'] != (0 if record['mode'] == 'MAIN' else 1):
            raise ValueError('warmup policy mismatch')
    return p

def invoke(stage, mode, case, engine, n, rep=0, order=0, permutation=(),
           schedule_index=0, round_case_position=0, correctness=False):
    """Resume a valid position only; retain every failed attempt as a separate file."""
    location = HERE / 'records' / stage / mode / case
    stem = f'N{n}.rep{rep}.engine-{engine}.order{order}'
    existing = sorted(location.glob(stem + '.attempt*.json')) if location.exists() else []
    for p in existing:
        r = read(p)
        if r['valid']:
            payload(r, correctness)
            if sha(r['script_path']) != r['script_sha256']:
                raise RuntimeError('stored script changed')
            return r
    path = script(case, n, mode, correctness)
    cmd = cohort.command(engine, path)
    m = cohort.manifest()
    r = {'cohort': m['cohort_id'], 'mode': mode, 'stage': stage, 'case': case,
         'engine': engine, 'N': n, 'rep': rep, 'order': order,
         'round_case_position': round_case_position, 'permutation': list(permutation),
         'schedule_index': schedule_index, 'attempt': len(existing) + 1,
         'command': cmd, 'flags': m['engines'][engine]['runtime_flags'],
         'binary_sha256': m['engines'][engine]['binary']['sha256'],
         'script_path': str(path), 'script_sha256': sha(path), 'timestamp_utc': now(),
         'elapsed_ms': None, 'elapsed_per_call': None, 'checksum': None,
         'warmup_calls': 0 if mode == 'MAIN' else 1,
         'checks_each_call': correctness, 'timeout_seconds': TIMEOUT}
    started = time.perf_counter_ns()
    try:
        p = subprocess.run(cmd, cwd=ROOT, capture_output=True, timeout=TIMEOUT, check=False)
        r.update(exit_code=p.returncode, stdout=p.stdout.decode('utf-8', errors='replace'),
                 stderr=p.stderr.decode('utf-8', errors='replace'))
    except subprocess.TimeoutExpired as exc:
        r.update(exit_code=None, stdout=(exc.stdout or b'').decode('utf-8', errors='replace'),
                 stderr=(exc.stderr or b'').decode('utf-8', errors='replace'), error='TIMEOUT')
    except OSError as exc:
        r.update(exit_code=None, stdout='', stderr=str(exc), error='OSERROR')
    r['outer_wall_ns'] = time.perf_counter_ns() - started
    try:
        result = payload(r, correctness)
        r.update(checksum=result['checksum'], elapsed_ms=result['elapsed_ms'],
                 elapsed_per_call=result['elapsed_per_call_ms'], valid=True, status='PASS', error='')
        if not correctness and r['elapsed_ms'] == 0 and stage == 'formal':
            r.update(valid=False, status='FAIL', error='zero elapsed interval; no epsilon')
    except (ValueError, KeyError, TypeError) as exc:
        r.update(valid=False, status='TIMEOUT' if r.get('error') == 'TIMEOUT' else 'FAIL',
                 error=r.get('error') or str(exc))
    save(location / (stem + f'.attempt{r["attempt"]:03}.json'), r)
    return r

def all_records(stage, mode=None):
    p = HERE / 'records' / stage
    if mode:
        p /= mode
    return [read(f) for f in sorted(p.rglob('*.json'))] if p.exists() else []

def complete_correctness(mode, cases, selected=None, stage='correctness'):
    rows = []
    for case in cases:
        ns = (selected[case]['N'],) if selected else (1, 2)
        for n in ns:
            for engine in ENGINES:
                r = invoke(stage, mode, case, engine, n, correctness=True)
                rows.append(r)
                print(f'{stage} {mode} {case} N={n} {engine}: {r["status"]}', flush=True)
    export_csv(HERE / 'raw' / f'{stage}.{mode}.csv', all_records(stage, mode), RAW_FIELDS)
    return rows

def compatibility(rows):
    output = []
    for c in CASES:
        record = {'case': c}
        for e in ENGINES:
            subset = [r for r in rows if r['case'] == c and r['engine'] == e]
            record[e + '_status'] = 'PASS' if len(subset) == 2 and all(r['valid'] for r in subset) else 'FAIL'
        record['included'] = all(record[e + '_status'] == 'PASS' for e in ENGINES)
        record['reason'] = '' if record['included'] else '; '.join(
            f'{r["engine"]} N={r["N"]}: {r["error"]}' for r in rows if r['case'] == c and not r['valid'])
        record['tags'] = tags()[c]
        output.append(record)
    export_csv(HERE / 'compatibility.csv', output)
    save(HERE / 'compatibility.json', output)
    return [r['case'] for r in output if r['included']]

def calibrate(mode, cases):
    selected = {}
    for c in cases:
        n = 1
        while n <= MAX_N:
            trial = [invoke('calibration', mode, c, e, n, order=i + 1)
                     for i, e in enumerate(ENGINES)]
            print(f'calibration {mode} {c} N={n}: ' + ', '.join(
                f'{r["engine"]}={r["elapsed_ms"]}ms/{r["status"]}' for r in trial), flush=True)
            if not all(r['valid'] for r in trial):
                raise RuntimeError('calibration failed: ' + c + ' ' + mode)
            if all(r['elapsed_ms'] >= TARGET_MS for r in trial):
                chosen = {'case': c, 'mode': mode, 'N': n,
                          'script_sha256': trial[0]['script_sha256'],
                          **{r['engine'] + '_elapsed_ms': r['elapsed_ms'] for r in trial}}
                save(HERE / 'calibration' / mode / (c + '.selected.json'), chosen)
                selected[c] = chosen
                break
            n *= 2
        else:
            raise RuntimeError('MAX_N exceeded: ' + c)
    export_csv(HERE / 'raw' / f'calibration.{mode}.csv', all_records('calibration', mode), RAW_FIELDS)
    export_csv(HERE / 'selected_n' / (mode + '.csv'), selected.values())
    return selected

def schedule(cases, mode):
    from itertools import permutations
    rng = random.Random(SEED + (0 if mode == 'MAIN' else 1))
    per_case = {}
    for c in cases:
        orders = list(permutations(ENGINES)) * 5
        rng.shuffle(orders)
        per_case[c] = orders
    rows = []
    for rep in range(1, REPS + 1):
        shuffled = list(cases)
        rng.shuffle(shuffled)
        for case_position, c in enumerate(shuffled, 1):
            perm = per_case[c][rep - 1]
            for order, e in enumerate(perm, 1):
                rows.append({'case': c, 'engine': e, 'rep': rep, 'order': order,
                             'round_case_position': case_position,
                             'permutation': list(perm), 'schedule_index': len(rows) + 1})
    save(HERE / 'schedule' / (mode + '.json'), rows)
    export_csv(HERE / 'schedule' / (mode + '.csv'), rows)
    return rows

def measure(mode, cases, selected):
    rows = schedule(cases, mode)
    for item in rows:
        r = invoke('formal', mode, item['case'], item['engine'], selected[item['case']]['N'],
                   rep=item['rep'], order=item['order'], permutation=item['permutation'],
                   schedule_index=item['schedule_index'], round_case_position=item['round_case_position'])
        if not r['valid']:
            raise RuntimeError('invalid formal position retained; rerun to resume: ' + str(item))
        if item['order'] == 3:
            print(f'formal {mode}: {item["schedule_index"]}/{len(rows)} '
                  f'rep={item["rep"]} {item["case"]}', flush=True)
    export_csv(HERE / 'raw' / f'formal.{mode}.csv', all_records('formal', mode), RAW_FIELDS)

def statistics_for(values):
    x = sorted(values)
    mid = len(x) // 2
    q1 = statistics.median(x[:mid])
    q3 = statistics.median(x[mid:] if len(x) % 2 == 0 else x[mid + 1:])
    return {'median_ms': statistics.median(x), 'mean_ms': statistics.mean(x),
            'sample_stddev_ms': statistics.stdev(x), 'IQR_ms': q3 - q1,
            'min_ms': x[0], 'max_ms': x[-1]}

def summarize(mode, cases):
    records = all_records('formal', mode)
    grouped = {}
    for r in records:
        if r['valid']:
            key = (r['case'], r['engine'], r['rep'])
            if key in grouped:
                raise RuntimeError('duplicate valid formal position')
            grouped[key] = r
    per_case = []
    complete = []
    for c in cases:
        medians = {}
        for e in ENGINES:
            subset = [grouped[(c, e, rep)] for rep in range(1, REPS + 1)
                      if (c, e, rep) in grouped]
            if len(subset) != REPS:
                continue
            row = {'mode': mode, 'case': c, 'engine': e, 'samples': len(subset),
                   'N': subset[0]['N'], 'script_sha256': subset[0]['script_sha256'],
                   **statistics_for([r['elapsed_per_call'] for r in subset]),
                   'below_target_count': sum(r['elapsed_ms'] < TARGET_MS for r in subset),
                   'tags': tags()[c]}
            per_case.append(row)
            medians[e] = row['median_ms']
        if len(medians) == 3:
            complete.append({'mode': mode, 'case': c, 'tags': tags()[c],
                             'V8/QJS': medians['v8'] / medians['quickjs'],
                             'JSC/QJS': medians['jsc'] / medians['quickjs'],
                             'JSC/V8': medians['jsc'] / medians['v8']})
    export_csv(HERE / 'summary' / f'per_case.{mode}.csv', per_case)
    export_csv(HERE / 'summary' / f'pairwise.{mode}.csv', complete)
    subsets = {'all_complete': complete}
    if mode == 'MAIN':
        for tag in ('RegExp', 'dynamic-code', 'runtime-specialized'):
            subsets['tag:' + tag] = [r for r in complete if tag in r['tags']]
            subsets['without:' + tag] = [r for r in complete if tag not in r['tags']]
    gms = []
    for name, rows in subsets.items():
        for ratio in ('V8/QJS', 'JSC/QJS', 'JSC/V8'):
            gms.append({'mode': mode, 'subset': name, 'pair': ratio, 'case_count': len(rows),
                        'cases': [r['case'] for r in rows],
                        'GM': math.exp(statistics.mean(math.log(r[ratio]) for r in rows)) if rows else None,
                        'numerator_lower_count': sum(r[ratio] < 1 for r in rows),
                        'numerator_higher_count': sum(r[ratio] > 1 for r in rows),
                        'ties': sum(r[ratio] == 1 for r in rows)})
    export_csv(HERE / 'summary' / f'pairwise_summary.{mode}.csv', gms)
    return {'mode': mode, 'complete_cases': [r['case'] for r in complete],
            'excluded': [c for c in CASES if c not in [r['case'] for r in complete]],
            'per_case': per_case, 'ratios': complete, 'GM': gms}
