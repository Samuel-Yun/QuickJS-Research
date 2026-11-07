"""Independent weighted-log recomputation from immutable raw archives."""
import collections
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import random
import statistics

H=Path(__file__).resolve().parent
ROOT=H.parents[2]


def raw(path):
    packed=(path/'raw/runs.jsonl.gz').read_bytes();data=gzip.decompress(packed)
    manifest=json.loads((path/'raw/archive.json').read_text())
    assert hashlib.sha256(packed).hexdigest()==manifest['compressed_sha256']
    assert hashlib.sha256(data).hexdigest()==manifest['uncompressed_sha256']
    return [json.loads(line) for line in data.splitlines()]


def main():
    current=raw(H);parent=raw(ROOT/'experiments/native_octane_20261107/attempt02');baseline=raw(ROOT/'experiments/native_octane_20261107/attempt01')
    new=[r for r in current if r['event']=='measurement']
    assert len(new)==170 and all(r['valid'] and r['condition'] in ['PREP2','SPLIT16'] for r in new)
    values=collections.defaultdict(list)
    for row in new+[r for r in parent+baseline if r['event']=='measurement']:
        values[row['condition'],row['case']].append(row['payload']['elapsed_ms']/row['N'])
    med={key:statistics.median(nums) for key,nums in values.items()}
    for row in csv.DictReader((H/'statistics.csv').open()):assert float(row['median_ms'])==med[row['condition'],row['case']]
    for row in csv.DictReader((H/'aggregate.csv').open()):
        cases=[c for label,c in med if label==row['condition'] and (row['subset'].startswith('expanded') or c!='zlib.zlib')]
        sizes=collections.Counter(c.split('.')[0] for c in cases)
        logs=[math.log(med[row['condition'],c]/med[row['denominator'],c])/sizes[c.split('.')[0]]/len(sizes) for c in cases]
        assert math.isclose(math.exp(math.fsum(logs)),float(row['ratio']),rel_tol=1e-12)
    # The two new versions are interleaved in this batch: use paired rounds.
    rounded=collections.defaultdict(dict)
    for row in new:rounded[row['condition'],row['case']][row['rep']]=row['elapsed_per_Run_ms']
    rng=random.Random(2026110801)
    draws=[tuple(sorted(rng.choices(range(5),k=5))) for _ in range(10000)]
    comparisons=[]
    for subset in ['core16_13suite','expanded17_14suite']:
        cases=sorted({r['case'] for r in new if subset.startswith('expanded') or r['case']!='zlib.zlib'})
        sizes=collections.Counter(c.split('.')[0] for c in cases)
        def estimate(indices=None):
            ratios={}
            for case in cases:
                a,b=med['SPLIT16',case],med['PREP2',case]
                if indices is not None:
                    a=statistics.median(rounded['SPLIT16',case][i] for i in indices)
                    b=statistics.median(rounded['PREP2',case][i] for i in indices)
                ratios[case]=a/b
            return math.exp(math.fsum(math.log(v)/sizes[c.split('.')[0]]/len(sizes) for c,v in ratios.items()))
        cache={i:estimate(i) for i in set(draws)}
        dist=sorted(cache[i] for i in draws)
        comparisons.append(dict(subset=subset,numerator='SPLIT16',denominator='PREP2',ratio=estimate(),
             change_pct=100*(estimate()-1),low95=dist[249],high95=dist[9749],inference='paired whole rounds within current batch, exploratory'))
    with (H/'new_variants_pairwise.csv').open('w',newline='') as stream:
        writer=csv.DictWriter(stream,list(comparisons[0]),lineterminator='\n');writer.writeheader();writer.writerows(comparisons)
    report=dict(status='PASS',new_samples=170,new_control_samples=0,archive_hashes=True,raw_medians=True,
                weighted_log_aggregate_tolerance=1e-12,runtime_executed=False)
    (H/'independent_statistics_check.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report))


if __name__=='__main__':main()
