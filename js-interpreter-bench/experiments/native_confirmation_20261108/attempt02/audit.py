"""Independent offline schedule, process, integrity and statistic checks."""
import collections
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import statistics as st

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text())


def main():
    protocol = read(HERE / 'protocol.json')
    assert sha(HERE / 'protocol.json') == read(HERE / 'frozen.json')['protocol_sha256']
    for name, expected in protocol['frozen_files'].items():
        assert sha(ROOT / name) == expected, name
    assert sha(HERE / 'schedule.json') == protocol['schedule_sha256']
    packed = (HERE / 'raw/runs.jsonl.gz').read_bytes()
    raw = gzip.decompress(packed)
    archive = read(HERE / 'raw/archive.json')
    assert hashlib.sha256(packed).hexdigest() == archive['compressed_sha256']
    assert hashlib.sha256(raw).hexdigest() == archive['uncompressed_sha256']
    rows = [json.loads(line) for line in raw.splitlines()]
    starts = {r['token']: r for r in rows if r['event'] == 'process_start'}
    ends = {r['token']: r for r in rows if r['event'] == 'process_result'}
    assert len(starts) == sum(r['event'] == 'process_start' for r in rows)
    assert len(ends) == sum(r['event'] == 'process_result' for r in rows)
    assert len(starts) == 4128 and starts.keys() == ends.keys()
    runtime = read(HERE / 'runtime_manifest.json')
    infos = {kind: read(HERE / (kind + '.inputs.json')) for kind in ['octane', 'sunspider']}
    for info in infos.values():
        for name, expected in info['files'].items():
            assert sha(ROOT / name) == expected
    for tree in protocol['source_trees'].values():
        for name, expected in tree['files'].items():
            assert sha(Path(tree['path']) / name) == expected
    boot = read(HERE / 'environment.before.json')['boot_id']
    for item in runtime.values():
        assert sha(Path(item['path'])) == item['sha256']
        for dep in item.get('dependencies', []) + item.get('system_libraries', []):
            assert sha(Path(dep['path'])) == dep['sha256']
    for token, result in ends.items():
        assert result['command'] == starts[token]['command']
        assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr']
        assert result['boot_id'] == result['boot_id_after'] == boot
    ordered = sorted(ends.values(), key=lambda r: r['outer_start_ns'])
    assert all(a['outer_stop_ns'] <= b['outer_start_ns'] for a, b in zip(ordered, ordered[1:]))
    samples = [r for r in rows if r['event'] == 'measurement']
    correct = [r for r in rows if r['event'] == 'correctness']
    assert len(samples) == 3870 and len(correct) == 258 and all(r['valid'] for r in samples + correct)
    schedule = read(HERE / 'schedule.json')
    fields = ['kind', 'case', 'condition', 'rep', 'order']
    assert [{k: r[k] for k in fields} for r in samples] == schedule
    values = collections.defaultdict(dict)
    positions = collections.defaultdict(collections.Counter)
    for sample in samples + correct:
        phase, kind, case, label = (sample[k] for k in ['phase', 'kind', 'case', 'condition'])
        script = protocol['scripts'][kind][case][phase]
        assert sha(Path(script['path'])) == script['sha256'] == sample['script_sha256']
        assert sample['binary_sha256'] == runtime[label]['sha256']
        assert sample['N'] == script['N']
        result = ends[sample['token']]
        command = [runtime[label]['path']]
        if label == 'V8_ON':
            snapshot = next(d['path'] for d in runtime[label]['dependencies'] if d['path'].endswith('snapshot_blob.bin'))
            command += ['--snapshot_blob=' + snapshot, '--jitless', '--no-lazy', '--use-ic']
        elif kind == 'octane' and case == 'zlib.zlib':
            command += ['--std', '-I', str(ROOT / 'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
        assert result['command'] == command + [script['path']]
        payload = sample['payload']
        assert payload['N'] == sample['N'] and payload['correctness'] == 'PASS' and payload['warmup_calls'] == 0
        assert payload['case'] == case and payload['phase'] == script['payload_phase']
        if kind == 'sunspider':
            assert payload['checksum'] in infos[kind]['contract']['allowed'][case]
        elif case.startswith('Crypto.'):
            gold = ROOT / 'experiments/ic_fast_slow_20261102/attempt01/octane/crypto' / (case + '.N' + str(sample['N']) + '.json')
            assert payload['checksum'] == read(gold)['final_ciphertext']
        if phase == 'measure':
            assert sample['elapsed_per_Run_ms'] == payload['elapsed_ms'] / sample['N']
            assert payload['elapsed_ms'] == payload['stop_ms'] - payload['start_ms']
            assert 0 < payload['elapsed_ms'] <= result['external_wall_ms'] + 5
            key = kind, label, case
            assert sample['rep'] not in values[key]
            values[key][sample['rep']] = sample['elapsed_per_Run_ms']
            positions[key][sample['order']] += 1
    assert len(values) == 129 and all(set(v) == set(range(30)) for v in values.values())
    assert all(v == collections.Counter({0: 10, 1: 10, 2: 10}) for v in positions.values())
    medians = {key: st.median(value.values()) for key, value in values.items()}
    for row in csv.DictReader((HERE / 'statistics.csv').open()):
        key = row['kind'], row['condition'], row['case']
        assert float(row['median_ms']) == medians[key]
        assert math.isclose(float(row['sample_stddev']), st.stdev(values[key].values()), rel_tol=1e-12)
    for row in csv.DictReader((HERE / 'per_case_comparisons.csv').open()):
        k, c = row['kind'], row['case']
        assert float(row['ratio']) == medians[k, row['condition'], c] / medians[k, row['denominator'], c]
    for row in csv.DictReader((HERE / 'aggregate.csv').open()):
        kind, label, control = row['kind'], row['condition'], row['denominator']
        cases = read(HERE / (kind + '.inputs.json'))['cases']
        if row['metric'] == 'suite_GM':
            groups = collections.Counter(c.split('.')[0] if kind == 'octane' else c for c in cases)
            logs = [math.log(medians[kind, label, c] / medians[kind, control, c]) /
                groups[c.split('.')[0] if kind == 'octane' else c] / len(groups) for c in cases]
            ratio = math.exp(math.fsum(logs))
        else:
            ratio = math.fsum(medians[kind, label, c] for c in cases) / math.fsum(medians[kind, control, c] for c in cases)
        assert math.isclose(float(row['ratio']), ratio, rel_tol=1e-12)
    result = dict(status='PASS_COMPLETE_OFFLINE', new_performance_samples=3870,
        samples_by_benchmark=dict(collections.Counter(r['kind'] for r in samples)), correctness_records=258,
        samples_per_case_and_label=30, labels=protocol['labels'], old_performance_samples=0,
        serial_nonoverlap=True, balanced_position_counts=[10, 10, 10],
        raw_hashes=True, protocol_inputs_sources_runtime_hashes=True, independent_medians_and_GM=True,
        short_samples_retained=sum(r['below_1000ms'] for r in samples), runtime_executed_by_audit=False,
        outlier_filter=False, V8_OFF=False)
    (HERE / 'audit.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()
