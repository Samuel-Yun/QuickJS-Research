"""Independent offline weighted-log check and candidate pairwise intervals."""
import collections
import csv
import gzip
import hashlib
import io
import itertools
import json
import math
from pathlib import Path
import random
import statistics

H=Path(__file__).resolve().parent


def main():
    packed=(H/'raw/runs.jsonl.gz').read_bytes()
    raw=gzip.decompress(packed)
    archive=json.loads((H/'raw/archive.json').read_text())
    assert hashlib.sha256(packed).hexdigest()==archive['compressed_sha256']
    assert hashlib.sha256(raw).hexdigest()==archive['uncompressed_sha256']
    rows=[json.loads(line) for line in raw.splitlines()]
    values=collections.defaultdict(dict)
    for r in rows:
        if r['event']=='measurement':
            assert r['valid'] and r['performance_sample']
            values[r['condition'],r['case']][r['rep']]=r['payload']['elapsed_ms']/r['N']
    assert len(values)==136 and all(len(v)==5 for v in values.values())
    med={k:statistics.median(v.values()) for k,v in values.items()}
    for r in csv.DictReader((H/'statistics.csv').open()):
        assert float(r['median_ms'])==med[r['condition'],r['case']]
    allcases=sorted({k[1] for k in values})

    def estimate(label,denominator,cases,indices=None):
        suites=collections.Counter(c.split('.')[0] for c in cases)
        weighted=[]
        for case in cases:
            a,b=med[label,case],med[denominator,case]
            if indices is not None:
                a=statistics.median(values[label,case][i] for i in indices)
                b=statistics.median(values[denominator,case][i] for i in indices)
            weighted.append(math.log(a/b)/suites[case.split('.')[0]]/len(suites))
        return math.exp(math.fsum(weighted))

    for r in csv.DictReader((H/'aggregate.csv').open()):
        cases=[c for c in allcases if r['subset'].startswith('expanded') or c!='zlib.zlib']
        assert math.isclose(float(r['ratio']),estimate(r['condition'],r['denominator'],cases),rel_tol=1e-12)
    rng=random.Random(2026110701)
    indices=[tuple(sorted(rng.choices(range(5),k=5))) for _ in range(10000)]
    unique=set(indices)
    candidates=['s001','mx019','d03','B2','P1']
    comparisons=[]
    for subset in ['core16_13suite','expanded17_14suite']:
        cases=[c for c in allcases if subset.startswith('expanded') or c!='zlib.zlib']
        for a,b in itertools.combinations(candidates,2):
            cache={key:estimate(a,b,cases,key) for key in unique}
            dist=sorted(cache[key] for key in indices)
            comparisons.append(dict(subset=subset,numerator=a,denominator=b,ratio=estimate(a,b,cases),
                                    low95=dist[249],high95=dist[9749],interpretation='exploratory paired blocks; no multiplicity correction'))
    out=io.StringIO(newline='')
    writer=csv.DictWriter(out,list(comparisons[0]),lineterminator='\n')
    writer.writeheader();writer.writerows(comparisons)
    (H/'candidate_pairwise.csv').write_text(out.getvalue())
    report=dict(status='PASS',archive_hashes_verified=True,raw_medians_exact_match=True,
                aggregate_weighted_log_recomputation_tolerance=1e-12,
                candidate_pairwise_comparisons=len(comparisons),runtime_executed=False)
    (H/'independent_statistics_check.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report))


if __name__=='__main__':
    main()
