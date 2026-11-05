"""Second check: recompute exported summary from exported raw, not run/audit code."""
import csv, hashlib, json, math, statistics
from collections import Counter
from pathlib import Path
BASE=Path(__file__).resolve().parents[1]
def csv_read(name):
    with (BASE/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
raw=csv_read('raw/formal.csv');summary=csv_read('summary/per_condition.csv');ratios=csv_read('summary/ratios.csv')
assert len(raw)==240 and len(csv_read('raw/producer.csv'))==120
assert all(r['valid']=='True' and r['exit_code']=='0' for r in raw)
positions=[(r['case'],r['condition'],r['rep']) for r in raw]
assert len(set(positions))==240
for s in summary:
    rr=[r for r in raw if (r['case'],r['condition'])==(s['case'],s['condition'])]
    assert len(rr)==30 and Counter(r['order'] for r in rr)=={'1':15,'2':15}
    values=[]
    for r in rr:
        elapsed=float(r['elapsed_ms']);n=int(r['N']);v=float(r['elapsed_per_call_ms'])
        assert elapsed>0 and math.isfinite(elapsed) and math.isclose(elapsed/n,v,rel_tol=1e-14)
        segments=json.loads(r['segments']);assert all(x['valid'] and x['payload']['correctness']=='PASS' for x in segments)
        assert segments[-1]['payload']['elapsed_per_call_ms']==v
        if r['condition']=='CACHE_NO_LAZY_CONSUMER':assert [p['role'] for p in segments]==['producer','consumer']
        else:assert [p['role'] for p in segments]==['source']
        values.append(v)
    ordered=sorted(values)
    expected={'median_ms':statistics.median(values),'mean_ms':statistics.mean(values),
        'sample_stddev_ms':statistics.stdev(values),'IQR_ms':statistics.median(ordered[15:])-statistics.median(ordered[:15]),
        'min_ms':min(values),'max_ms':max(values)}
    for k,v in expected.items():assert math.isclose(float(s[k]),v,rel_tol=1e-13,abs_tol=1e-14),(s['case'],k)
for r in ratios:
    a=next(s for s in summary if s['case']==r['case'] and s['condition']=='SOURCE_NO_LAZY')
    b=next(s for s in summary if s['case']==r['case'] and s['condition']=='CACHE_NO_LAZY_CONSUMER')
    assert math.isclose(float(r['CACHE_CONSUMER/SOURCE']),float(b['median_ms'])/float(a['median_ms']),rel_tol=1e-13)
gm=math.exp(statistics.mean(math.log(float(r['CACHE_CONSUMER/SOURCE'])) for r in ratios))
audit=json.loads((BASE/'audit.json').read_text())
assert math.isclose(gm,audit['median_ratio_gm'],rel_tol=1e-13)
result={'status':'PASS','raw_targets':240,'separate_producers':120,'groups':8,'per_group':30,
        'six_statistics_recomputed_from_raw_csv':True,'ratios_and_geomean_recomputed':True,'segmented_payloads_checked':True,
        'consumer_source_gm':gm,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
path=BASE/'summary/exports_audit.json';data=json.dumps(result,indent=2)+'\n'
if path.exists():assert path.read_text()==data
else:
    with path.open('x') as f:f.write(data)
print(json.dumps(result,indent=2))
