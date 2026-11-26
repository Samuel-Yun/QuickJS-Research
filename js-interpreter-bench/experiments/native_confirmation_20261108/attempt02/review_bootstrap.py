"""Independent weighted order-statistic implementation of all frozen bootstrap CIs."""
import collections
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import random

HERE = Path(__file__).resolve().parent


def close(a, b):
    assert math.isclose(a, b, rel_tol=1e-12, abs_tol=1e-12), (a, b)


def weighted_median(sorted_samples, counts):
    accumulated, lower = 0, None
    for value, rep in sorted_samples:
        accumulated += counts[rep]
        if lower is None and accumulated >= 15:
            lower = value
        if accumulated >= 16:
            return (lower + value) / 2
    raise AssertionError('missing weighted median')


def main():
    protocol = json.loads((HERE / 'protocol.json').read_text())
    raw = gzip.decompress((HERE / 'raw/runs.jsonl.gz').read_bytes())
    assert hashlib.sha256(raw).hexdigest() == json.loads((HERE / 'raw/archive.json').read_text())['uncompressed_sha256']
    samples = [r for line in raw.splitlines() if (r := json.loads(line))['event'] == 'measurement']
    assert len(samples) == 3870 and all(r['valid'] for r in samples)
    ordered = collections.defaultdict(list)
    for r in samples:
        ordered[r['kind'], r['condition'], r['case']].append((r['elapsed_per_Run_ms'], r['rep']))
    for values in ordered.values():
        values.sort()
        assert len(values) == 30 and {r for _, r in values} == set(range(30))
    cases = {kind: json.loads((HERE / (kind + '.inputs.json')).read_text())['cases'] for kind in ['octane', 'sunspider']}
    weights = {}
    for kind, selected in cases.items():
        group = collections.Counter(c.split('.')[0] if kind == 'octane' else c for c in selected)
        weights[kind] = {c: 1 / (len(group) * group[c.split('.')[0] if kind == 'octane' else c]) for c in selected}
    pairs = [('EVAL_COLD', 'A'), ('V8_ON', 'A'), ('EVAL_COLD', 'V8_ON')]
    distributions = collections.defaultdict(list)
    aggregates = collections.defaultdict(list)
    rng = random.Random(protocol['seed'])
    for _ in range(10000):
        counts = collections.Counter(rng.choices(range(30), k=30))
        draw = {key: weighted_median(value, counts) for key, value in ordered.items()}
        for kind, selected in cases.items():
            for label, control in pairs:
                ratios = {c: draw[kind, label, c] / draw[kind, control, c] for c in selected}
                for c, ratio in ratios.items():
                    distributions[kind, label, control, c].append(ratio)
                ratio = math.exp(math.fsum(weights[kind][c] * math.log(ratios[c]) for c in selected))
                aggregates[kind, label, control, 'suite_GM'].append(ratio)
                if kind == 'sunspider':
                    ratio = math.fsum(draw[kind, label, c] for c in selected) / math.fsum(draw[kind, control, c] for c in selected)
                    aggregates[kind, label, control, 'total_ms'].append(ratio)
    checked = 0
    for row in csv.DictReader((HERE / 'per_case_comparisons.csv').open()):
        dist = sorted(distributions[row['kind'], row['condition'], row['denominator'], row['case']])
        close(float(row['low95']), dist[249])
        close(float(row['high95']), dist[9749])
        checked += 1
    for row in csv.DictReader((HERE / 'aggregate.csv').open()):
        dist = sorted(aggregates[row['kind'], row['condition'], row['denominator'], row['metric']])
        close(float(row['low95']), dist[249])
        close(float(row['high95']), dist[9749])
        checked += 1
    result = dict(status='PASS_INDEPENDENT_BOOTSTRAP', rows_checked=checked, draws=10000,
        implementation='frequency-weighted order statistics instead of expanding/sorting each resampled array; direct weighted log sum',
        paired_round_indices=True, relative_absolute_tolerance=1e-12, runtime_executed=False,
        reviewer_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    (HERE / 'independent_bootstrap_check.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()
