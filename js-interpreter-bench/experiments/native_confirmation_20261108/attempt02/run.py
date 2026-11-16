"""Fixed thirty-round native confirmation: only A, EVAL_COLD and V8_ON."""
import argparse
import collections
import fcntl
import gzip
import hashlib
import importlib.util
import itertools
import json
import math
import os
from pathlib import Path
import random
import subprocess
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OLD = ROOT / 'experiments/native_octane_20261107/attempt01'
CANDIDATE = ROOT / 'experiments/native_octane_20261108/attempt11'
SUN = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/sunspider'
LABELS = ['A', 'EVAL_COLD', 'V8_ON']
ROUNDS, SEED, CPU = 30, 2026110830, 2


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


b = module('confirmation_recorder', OLD / 'run.py')
b.H = HERE
# The original durable recorder is reused. Cache prior events instead of
# re-reading the growing JSONL before every process; no result is discarded.
events = b.records()
original_append = b.append


def append(row):
    original_append(row)
    events.append(row)


b.records = lambda: events
b.append = append


def setup_environment():
    assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
    os.environ.update(TZ='Asia/Shanghai', LC_ALL='C', LANG='C')
    assert CPU in os.sched_getaffinity(0)
    os.sched_setaffinity(0, {CPU})


def inputs():
    return {kind: b.load(HERE / (kind + '.inputs.json')) for kind in ['octane', 'sunspider']}


def plan(infos):
    keys = [(kind, case) for kind, info in infos.items() for case in info['cases']]
    permutations = list(itertools.permutations(LABELS))
    orders = {}
    for kind, case in keys:
        perms = permutations.copy()
        random.Random(str(SEED) + kind + case).shuffle(perms)
        orders[kind, case] = perms
    result = []
    for rep in range(ROUNDS):
        ordered = keys.copy()
        random.Random(SEED + rep).shuffle(ordered)
        for kind, case in ordered:
            for position, label in enumerate(orders[kind, case][rep % 6]):
                result.append(dict(kind=kind, case=case, condition=label, rep=rep, order=position))
    return result


def verify():
    protocol = b.load(HERE / 'protocol.json')
    assert b.sha(HERE / 'protocol.json') == b.load(HERE / 'frozen.json')['protocol_sha256']
    assert b.boot() == b.load(HERE / 'environment.before.json')['boot_id']
    for name, expected in protocol['frozen_files'].items():
        assert b.sha(ROOT / name) == expected, name
    for kind, info in inputs().items():
        for name, expected in info['files'].items():
            assert b.sha(ROOT / name) == expected, name
        for case in info['cases']:
            for item in protocol['scripts'][kind][case].values():
                assert b.sha(item['path']) == item['sha256']
    for runtime in b.load(HERE / 'runtime_manifest.json').values():
        assert b.sha(runtime['path']) == runtime['sha256']
        for dep in runtime.get('dependencies', []) + runtime.get('system_libraries', []):
            assert b.sha(dep['path']) == dep['sha256']
    for tree in protocol['source_trees'].values():
        for name, expected in tree['files'].items():
            assert b.sha(Path(tree['path']) / name) == expected
    assert b.sha(HERE / 'schedule.json') == protocol['schedule_sha256']
    return protocol


def prepare():
    assert not (HERE / 'protocol.json').exists() and not events
    setup_environment()
    infos = dict(octane=b.load(OLD / 'inputs.json'), sunspider=b.load(
        ROOT / 'experiments/ic_search_lab/v7_adaptive_layout/sunspider.inputs.json'))
    assert len(infos['octane']['cases']) == 17 and len(infos['sunspider']['cases']) == 26
    assert infos['sunspider']['contract'] == b.load(SUN / 'checksum_contract.json')
    for kind, info in infos.items():
        for name, expected in info['files'].items():
            assert b.sha(ROOT / name) == expected
        b.save(kind + '.inputs.json', info)
    old_protocol = b.load(OLD / 'protocol.json')
    scripts = {kind: {} for kind in infos}
    for kind, info in infos.items():
        for case in info['cases']:
            scripts[kind][case] = {}
            for phase, n in [('correctness1', 1), ('correctness2', 2), ('measure', info['N'][case])]:
                payload_phase = 'measure' if phase == 'measure' else 'correctness'
                if kind == 'octane':
                    source_phase = 'measure' if phase == 'measure' else 'correctness'
                    source = Path(old_protocol['scripts'][case][source_phase]['path']).read_bytes()
                    if phase == 'correctness2':
                        anchor = b'"N": 1, "phase": "correctness"'
                        assert source.count(anchor) == 1
                        source = source.replace(anchor, b'"N": 2, "phase": "correctness"', 1)
                else:
                    contract = info['contract']
                    body = b'function __tebSunSpiderWorkload(){\n' + (SUN / 'inputs' / (case + '.js')).read_bytes()
                    body += ('\nreturn String(' + contract['expressions'][case] + ');\n}').encode()
                    driver = (SUN / 'inputs/driver.js').read_text().replace('__CONFIG__', json.dumps(
                        dict(case=case, N=n, phase=payload_phase))).replace('__CHECKSUMS__', json.dumps(contract['allowed'][case]))
                    source = b'\n;\n'.join([(SUN / 'inputs/adapter.js').read_bytes(), body, driver.encode()])
                name = 'scripts/' + kind + '.' + case + '.N' + str(n) + '.' + phase + '.js'
                b.save(name, source)
                scripts[kind][case][phase] = dict(path=str(HERE / name), sha256=b.sha(HERE / name), N=n, payload_phase=payload_phase)
    runtimes = {label: b.load(OLD / 'runtime_manifest.json')[label] for label in ['A', 'V8_ON']}
    runtimes['EVAL_COLD'] = b.load(CANDIDATE / 'runtime_manifest.json')['EVAL_COLD']
    for label in LABELS:
        runtime = runtimes[label] = runtimes[label].copy()
        assert b.sha(runtime['path']) == runtime['sha256']
        result = subprocess.run(['ldd', runtime['path']], capture_output=True, text=True, check=True)
        libraries = set()
        for line in result.stdout.splitlines():
            for part in line.split():
                if part.startswith('/') and Path(part).is_file():
                    libraries.add(part)
        runtime['system_libraries'] = [dict(path=p, sha256=b.sha(p)) for p in sorted(libraries)]
        runtime['ldd'] = result.stdout
    b.save('runtime_manifest.json', runtimes)
    source_trees = dict(
        A=dict(path=str(OLD / 'work/A'), files=b.load(OLD / 'source_manifest.json')['A']['files']),
        EVAL_COLD=dict(path=str(CANDIDATE / 'work/EVAL_COLD'), files=b.load(CANDIDATE / 'source_manifest.json')['EVAL_COLD']['files']))
    schedule = plan(infos)
    assert len(schedule) == 3870
    b.save('schedule.json', schedule)
    b.save('environment.before.json', b.environment())
    b.save('repository.before.json', dict(head=subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
        status=subprocess.check_output(['git', 'status', '--short'], cwd=ROOT, text=True)))
    paths = [HERE / n for n in ['run.py', 'analyze.py', 'audit.py', 'runtime_manifest.json', 'octane.inputs.json', 'sunspider.inputs.json']]
    paths += [OLD / n for n in ['run.py', 'protocol.json', 'source_manifest.json', 'runtime_manifest.json']]
    paths += [CANDIDATE / n for n in ['protocol.json', 'source_manifest.json', 'runtime_manifest.json', 'targeted.js', 'targeted_gate.json', 'audit.json']]
    paths += [SUN / 'checksum_contract.json', ROOT / 'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js']
    paths += list((ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto').glob('Crypto.*.N*.json'))
    b.save('protocol.json', dict(cohort_id='native-ubuntu-a-eval-cold-v8-on-30-20261108-attempt02',
        labels=LABELS, repetitions=ROUNDS, seed=SEED, affinity=[CPU], benchmarks=['octane', 'sunspider'],
        samples=dict(octane=1530, sunspider=2340, total=3870), old_performance_samples_reused=0,
        N_policy='fixed prior N, common across all three labels; retain and flag all short samples; no outcome-dependent calibration',
        metric='native monotonic elapsed ms / complete Run; first Run included; no workload warmup; load and Setup outside timed Run',
        estimator='per-case median of 30 fresh processes; Octane within-suite GM then 14 suites equal; SunSpider 26 cases equal GM; also report SunSpider sum of per-case medians as total ms',
        bootstrap='10000 paired whole-round draws across three labels and both benchmarks; fixed seed; percentile 95%; no multiple-testing correction',
        stop_rule='exactly 30 complete rounds; no optional stopping or extra rounds based on significance',
        schedule='all 43 case blocks shuffled each round; three adjacent fresh processes per block; all 6 label permutations repeated 5 times per case',
        flags=dict(V8_ON=['--jitless', '--no-lazy', '--use-ic']),
        environment=dict(TZ='Asia/Shanghai', LC_ALL='C', LANG='C', system_settings_changed=False),
        scripts=scripts, schedule_sha256=b.sha(HERE / 'schedule.json'),
        source_trees=source_trees,
        frozen_files={str(p.relative_to(ROOT)): b.sha(p) for p in paths},
        engine_policy='reuse the exact frozen local A/EVAL_COLD Release ELF and V8 official 15.6.21 ELF; source and prior qualification hashes retained; no engine edits or rebuild',
        failures='preserve invalid/outlier/process_start records; stop on process/identity/correctness failure; never automatically retry failed token',
        correctness='N1 and N2 for every case/label before formal; SunSpider exact existing checksum contract, Octane original validation and Crypto ciphertext',
        safety='existing EVAL_COLD targeted/native/ASan/UBSan evidence reused for unchanged source/ELF; not full test262; no new sanitizer performance binary',
        only_requested_versions=True, V8_OFF=False))
    b.save('frozen.json', dict(protocol_sha256=b.sha(HERE / 'protocol.json')))
    verify()
    print('PREPARED_30_ROUNDS_3870_NEW_SAMPLES', flush=True)


def invocation(label, kind, case, phase):
    protocol = b.load(HERE / 'protocol.json')
    script = protocol['scripts'][kind][case][phase]
    runtime = b.load(HERE / 'runtime_manifest.json')[label]
    command = [runtime['path']]
    if label == 'V8_ON':
        snapshot = next(d['path'] for d in runtime['dependencies'] if d['path'].endswith('snapshot_blob.bin'))
        command += ['--snapshot_blob=' + snapshot, '--jitless', '--no-lazy', '--use-ic']
    elif kind == 'octane' and case == 'zlib.zlib':
        command += ['--std', '-I', str(ROOT / 'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
    return command + [script['path']], script


def execute(label, kind, case, phase, rep, order):
    command, script = invocation(label, kind, case, phase)
    runtime = b.load(HERE / 'runtime_manifest.json')[label]
    identity = dict(condition=label, kind=kind, case=case, N=script['N'], phase=phase, rep=rep, order=order,
                    binary_sha256=runtime['sha256'], script_sha256=script['sha256'])
    result = b.capture(command, phase, f'{rep}/{kind}/{case}/{label}', 300, identity=identity)
    payload, reason = {}, None
    try:
        assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr'], 'exit/timeout/stderr'
        prefix = 'OCTANE_IC_RESULT:' if kind == 'octane' else 'TEB_RESULT:'
        lines = [s[len(prefix):] for s in result['stdout'].splitlines() if s.startswith(prefix)]
        assert len(lines) == 1, 'payload count'
        payload = json.loads(lines[0])
        assert payload['case'] == case and payload['N'] == script['N'] and payload['phase'] == script['payload_phase']
        assert payload['correctness'] == 'PASS' and payload['warmup_calls'] == 0
        if kind == 'sunspider':
            assert payload['checksum'] in b.load(HERE / 'sunspider.inputs.json')['contract']['allowed'][case], 'SunSpider checksum'
        elif case.startswith('Crypto.'):
            gold = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto' / (case + '.N' + str(script['N']) + '.json')
            assert payload['checksum'] == b.load(gold)['final_ciphertext'], 'Crypto ciphertext'
        elapsed = payload['elapsed_ms']
        if elapsed is not None:
            assert math.isfinite(elapsed) and 0 < elapsed <= result['external_wall_ms'] + 5, 'clock enclosure'
            assert elapsed == payload['stop_ms'] - payload['start_ms'], 'elapsed arithmetic'
        else:
            assert kind == 'sunspider' and phase.startswith('correctness')
        assert result['boot_id'] == result['boot_id_after'] == b.load(HERE / 'environment.before.json')['boot_id']
        assert abs(result['raw_minus_monotonic_ms']) <= 5 + .002 * result['external_wall_ms'], 'RAW/monotonic divergence'
        assert abs(result['utc_minus_monotonic_ms']) <= 1000, 'UTC/monotonic divergence'
        assert b.sha(command[0]) == identity['binary_sha256'], 'binary changed'
    except (AssertionError, KeyError, ValueError, TypeError) as exc:
        reason = str(exc)
    row = dict(event='measurement' if phase == 'measure' else 'correctness', token=result['token'],
        valid=reason is None, failed_reason=reason, performance_sample=phase == 'measure', **identity,
        payload=payload, elapsed_per_Run_ms=payload['elapsed_ms'] / script['N'] if payload.get('elapsed_ms') is not None else None,
        below_1000ms=payload.get('elapsed_ms') is not None and payload['elapsed_ms'] < 1000)
    append(row)
    assert row['valid'], 'saved failure, no automatic retry: ' + str(reason)
    return row


def correctness():
    verify()
    done = {r['token']: r for r in events if r['event'] == 'correctness'}
    assert not any(r['event'] == 'measurement' for r in events)
    for kind, info in inputs().items():
        for case in info['cases']:
            for phase in ['correctness1', 'correctness2']:
                for position, label in enumerate(LABELS):
                    token = f'{phase}/0/{kind}/{case}/{label}'
                    if token in done:
                        assert done[token]['valid']
                    else:
                        execute(label, kind, case, phase, 0, position)
            print('CORRECTNESS_PASS', kind, case, 'three labels N1/N2', flush=True)
    b.save('correctness_gate.json', dict(status='PASS', samples=258, all_cases=43, labels=LABELS, N=[1, 2]))
    verify()


def measure():
    verify()
    assert b.load(HERE / 'correctness_gate.json')['status'] == 'PASS'
    schedule = b.load(HERE / 'schedule.json')
    done = {r['token']: r for r in events if r['event'] == 'measurement'}
    for index, item in enumerate(schedule):
        label, kind, case, rep = item['condition'], item['kind'], item['case'], item['rep']
        token = f'measure/{rep}/{kind}/{case}/{label}'
        if token in done:
            assert done[token]['valid']
            continue
        if index % 129 == 0:
            verify()
        sample = execute(label, kind, case, 'measure', rep, item['order'])
        print('SAMPLE', index + 1, len(schedule), 'round', rep + 1, kind, case, label,
              round(sample['elapsed_per_Run_ms'], 6), 'ms/Run', flush=True)
        progress = dict(status='RUNNING', completed=index + 1, total=len(schedule), round=rep + 1,
                        last=item, timestamp=b.stamp())
        temporary = HERE / 'progress.tmp'
        temporary.write_text(json.dumps(progress, indent=2) + '\n')
        temporary.replace(HERE / 'progress.json')
    verify()
    b.save('environment.after.json', b.environment())
    print('MEASURE_COMPLETE_3870', flush=True)


def archive():
    raw = (HERE / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    b.save('raw/runs.jsonl.gz', packed)
    b.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),
                                  uncompressed_sha256=hashlib.sha256(raw).hexdigest()))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('stage', choices=['prepare', 'correctness', 'measure', 'archive', 'all'])
    args = parser.parse_args()
    setup_environment()
    with (HERE / 'run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        try:
            if args.stage in ['prepare', 'all']:
                prepare()
            if args.stage in ['correctness', 'all']:
                correctness()
            if args.stage in ['measure', 'all']:
                measure()
            if args.stage in ['archive', 'all']:
                archive()
        except BaseException as exc:
            b.save('failure.json', dict(type=type(exc).__name__, error=str(exc), timestamp=b.stamp(),
                new_performance_samples=sum(r['event'] == 'measurement' for r in events),
                rule='preserve failure; no automatic retry or altered protocol'))
            if (HERE / 'runs.jsonl').exists():
                archive()
            raise


if __name__ == '__main__':
    main()
