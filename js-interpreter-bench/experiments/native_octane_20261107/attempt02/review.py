"""Independent offline check of all combination/control point estimates."""
import collections
import csv
import gzip
import hashlib
import json
import math
from pathlib import Path
import statistics

H=Path(__file__).resolve().parent


def raw(directory):
    packed=(directory/'raw/runs.jsonl.gz').read_bytes()
    payload=gzip.decompress(packed)
    expected=json.loads((directory/'raw/archive.json').read_text())
    assert hashlib.sha256(packed).hexdigest()==expected['compressed_sha256']
    assert hashlib.sha256(payload).hexdigest()==expected['uncompressed_sha256']
    return [json.loads(line) for line in payload.splitlines()]


def main():
    new=raw(H);old=raw(H.parent/'attempt01')
    samples=[r for r in new if r['event']=='measurement']
    assert len(samples)==85 and all(r['condition']=='P1_B2' and r['valid'] for r in samples)
    previous=[r for r in old if r['event']=='measurement']
    values=collections.defaultdict(list)
    for row in samples+previous:values[row['condition'],row['case']].append(row['payload']['elapsed_ms']/row['N'])
    med={key:statistics.median(v) for key,v in values.items()}
    for row in csv.DictReader((H/'statistics.csv').open()):assert float(row['median_ms'])==med['P1_B2',row['case']]
    cases=sorted({r['case'] for r in samples})
    for row in csv.DictReader((H/'aggregate.csv').open()):
        selected=[c for c in cases if row['subset'].startswith('expanded') or c!='zlib.zlib']
        sizes=collections.Counter(c.split('.')[0] for c in selected)
        logs=[math.log(med['P1_B2',c]/med[row['denominator'],c])/sizes[c.split('.')[0]]/len(sizes) for c in selected]
        actual=math.exp(math.fsum(logs))
        assert math.isclose(actual,float(row['ratio']),rel_tol=1e-12)
    report=dict(status='PASS',new_samples=85,old_controls_reexecuted=0,raw_archive_hashes_verified=True,
        medians_and_weighted_log_aggregates_verified=True,tolerance=1e-12,
        scope='point estimates; cross-batch environment drift remains outside bootstrap')
    (H/'independent_statistics_check.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report))


if __name__=='__main__':main()
