"""Independent offline audit of COLD_ENTRY, schedule and suite weights."""
import collections
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import statistics

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def archive(path):
    packed = (path / 'raw/runs.jsonl.gz').read_bytes()
    raw = gzip.decompress(packed)
    manifest = json.loads((path / 'raw/archive.json').read_text())
    assert hashlib.sha256(packed).hexdigest() == manifest['compressed_sha256']
    assert hashlib.sha256(raw).hexdigest() == manifest['uncompressed_sha256']
    return [json.loads(line) for line in raw.splitlines()]


def main():
    protocol = json.loads((HERE / 'protocol.json').read_text())
    current = archive(HERE)
    samples = [r for r in current if r['event'] == 'measurement']
    assert len(samples) == 85 and all(r['valid'] and r['condition'] in protocol['labels'] for r in samples)
    actual = [dict(rep=r['rep'], case=r['case'], condition=r['condition'], order=r['order']) for r in samples]
    assert actual == json.loads((HERE / 'schedule.json').read_text())
    correct = [r for r in current if r['event'] == 'correctness']
    assert len(correct) == 17 and all(r['valid'] for r in correct)
    values = collections.defaultdict(dict)
    prior = []
    for path in [ROOT / 'experiments/native_octane_20261107/attempt01',
                 HERE.parent / 'attempt01', HERE.parent / 'attempt04', HERE.parent / 'attempt08']:
        prior.extend(r for r in archive(path) if r['event'] == 'measurement'
                     and r['condition'] in protocol['controls_reused'])
    for r in samples + prior:
        key = r['condition'], r['case']
        assert r['N'] == protocol['N'][r['case']] and r['rep'] not in values[key]
        assert r['payload']['warmup_calls'] == 0 and r['payload']['correctness'] == 'PASS'
        values[key][r['rep']] = r['payload']['elapsed_ms'] / r['N']
    assert all(set(v) == set(range(5)) for v in values.values())
    medians = {key: statistics.median(v.values()) for key, v in values.items()}
    for row in csv.DictReader((HERE / 'statistics.csv').open()):
        key = row['condition'], row['case']
        assert float(row['median_ms']) == medians[key]
        assert math.isclose(float(row['sample_stddev']), statistics.stdev(values[key].values()), rel_tol=1e-12)
    for row in csv.DictReader((HERE / 'per_case_comparisons.csv').open()):
        ratio = medians[row['condition'], row['case']] / medians[row['denominator'], row['case']]
        assert float(row['ratio']) == ratio
    for row in csv.DictReader((HERE / 'aggregate.csv').open()):
        cases = [c for c in protocol['cases'] if row['subset'].startswith('expanded') or c != 'zlib.zlib']
        sizes = collections.Counter(c.split('.')[0] for c in cases)
        logs = [math.log(medians[row['condition'], c] / medians[row['denominator'], c])
                / sizes[c.split('.')[0]] / len(sizes) for c in cases]
        ratio = math.exp(math.fsum(logs))
        assert math.isclose(float(row['ratio']), ratio, rel_tol=1e-12)
    for name, expected in protocol['frozen_files'].items():
        assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected
    result = dict(status='PASS_OFFLINE', new_performance_samples=85, new_control_samples=0,
        workload_correctness=17, archives_hashes=True, schedule=True, raw_medians=True,
        source_inputs_runtime_protocol_checked_by_run_audit=True,
        independent_weighted_log_aggregate_tolerance=1e-12, runtime_executed=False)
    (HERE / 'independent_statistics_check.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()
