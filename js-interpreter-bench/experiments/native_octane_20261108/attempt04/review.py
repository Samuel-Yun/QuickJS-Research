"""Independent offline extraction and weighted-log verification; no runtime calls."""
import collections
import csv
import gzip
import hashlib
import itertools
import json
import math
from pathlib import Path
import random
import statistics

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
LABELS = ['CHAIN2', 'READ_STORE']


def raw(path):
    packed = (path / 'raw/runs.jsonl.gz').read_bytes()
    data = gzip.decompress(packed)
    manifest = json.loads((path / 'raw/archive.json').read_text())
    assert hashlib.sha256(packed).hexdigest() == manifest['compressed_sha256']
    assert hashlib.sha256(data).hexdigest() == manifest['uncompressed_sha256']
    return [json.loads(line) for line in data.splitlines()]


def main():
    current = raw(H)
    historical = []
    for path in [ROOT / 'experiments/native_octane_20261107/attempt01',
                 ROOT / 'experiments/native_octane_20261107/attempt02', H.parent / 'attempt01']:
        historical += raw(path)
    new = [r for r in current if r['event'] == 'measurement']
    assert len(new) == 170 and all(r['valid'] and r['condition'] in LABELS for r in new)
    expected = json.loads((H / 'schedule.json').read_text())
    assert [dict(rep=r['rep'], case=r['case'], condition=r['condition'], order=r['order']) for r in new] == expected
    values = collections.defaultdict(dict)
    for r in new + [r for r in historical if r['event'] == 'measurement']:
        key = r['condition'], r['case']
        assert r['rep'] not in values[key]
        values[key][r['rep']] = r['payload']['elapsed_ms'] / r['N']
    assert all(set(v) == set(range(5)) for v in values.values())
    med = {key: statistics.median(v.values()) for key, v in values.items()}
    for r in csv.DictReader((H / 'statistics.csv').open()):
        assert float(r['median_ms']) == med[r['condition'], r['case']]
    def aggregate(ratios):
        sizes = collections.Counter(c.split('.')[0] for c in ratios)
        return math.exp(math.fsum(math.log(r) / sizes[c.split('.')[0]] / len(sizes) for c, r in ratios.items()))
    for r in csv.DictReader((H / 'aggregate.csv').open()):
        cases = [c for label, c in med if label == r['condition'] and (r['subset'].startswith('expanded') or c != 'zlib.zlib')]
        ratio = aggregate({c: med[r['condition'], c] / med[r['denominator'], c] for c in cases})
        assert math.isclose(ratio, float(r['ratio']), rel_tol=1e-12)
    rng = random.Random(2026110804)
    draws = [tuple(sorted(rng.choices(range(5), k=5))) for _ in range(10000)]
    pairwise = []
    for numerator, denominator in itertools.combinations(LABELS, 2):
        for subset in ['core16_13suite', 'expanded17_14suite']:
            cases = sorted({r['case'] for r in new if subset.startswith('expanded') or r['case'] != 'zlib.zlib'})
            def estimate(indices=None):
                def middle(label, case):
                    return med[label, case] if indices is None else statistics.median(values[label, case][i] for i in indices)
                return aggregate({c: middle(numerator, c) / middle(denominator, c) for c in cases})
            cache = {i: estimate(i) for i in set(draws)}
            dist = sorted(cache[i] for i in draws)
            pairwise.append(dict(subset=subset, numerator=numerator, denominator=denominator,
                ratio=estimate(), change_pct=100 * (estimate() - 1), low95=dist[249], high95=dist[9749],
                inference='paired whole rounds within current batch; exploratory'))
    with (H / 'new_variants_pairwise.csv').open('w', newline='') as stream:
        writer = csv.DictWriter(stream, list(pairwise[0]), lineterminator='\n')
        writer.writeheader()
        writer.writerows(pairwise)
    report = dict(status='PASS', new_samples=170, new_control_samples=0, archives_hashes=True,
                  raw_medians=True, schedule=True, weighted_log_aggregate_tolerance=1e-12, runtime_executed=False)
    (H / 'independent_statistics_check.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report))


if __name__ == '__main__':
    main()
