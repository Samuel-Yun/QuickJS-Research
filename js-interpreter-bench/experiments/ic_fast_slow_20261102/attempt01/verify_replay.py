"""Compare published Linux analysis with actual Windows raw-only replay."""
import csv,json,math
from pathlib import Path
HERE=Path(__file__).resolve().parent
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def main():
    differences=[];maximum=0;summary=[]
    for kind in ['mechanism','sunspider','micro','octane']:
        original=HERE/kind/'analysis';replay=HERE/kind/'replay_windows_01'
        for field in ['actual','expected','valid','errors','status']:
            assert load(original/'audit.json')[field]==load(replay/'audit.json')[field],(kind,field)
        assert load(original/'raw_hashes.json')==load(replay/'raw_hashes.json'),'raw bytes changed'
        for name in ['statistics.csv','comparison.csv','ratios.csv']:
            def rows(p):
                with p.open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
            a,b=rows(original/name),rows(replay/name);assert len(a)==len(b)
            for i,(x,y) in enumerate(zip(a,b)):
                assert x.keys()==y.keys()
                for k in x:
                    if x[k]==y[k]:continue
                    try:
                        u,v=float(x[k]),float(y[k]);delta=abs(u-v);maximum=max(maximum,delta)
                        if not math.isclose(u,v,rel_tol=1e-12,abs_tol=1e-12):differences.append((kind,name,i,k,u,v))
                    except ValueError:differences.append((kind,name,i,k,x[k],y[k]))
        if (original/'aggregate.json').exists():
            a,b=load(original/'aggregate.json'),load(replay/'aggregate.json');assert len(a)==len(b)
            for x,y in zip(a,b):
                for k in x:
                    if k in ['point','CI95_low','CI95_high']:
                        maximum=max(maximum,abs(x[k]-y[k]));assert math.isclose(x[k],y[k],rel_tol=1e-12,abs_tol=1e-12)
                    else:assert x[k]==y[k],(kind,k)
        summary.append(dict(campaign=kind,valid=load(replay/'audit.json')['valid'],raw_hashes_identical=True))
    dest=HERE/'replay_verification.json';assert not dest.exists()
    result=dict(status='PASS' if not differences else 'FAIL',campaigns=summary,differences=differences,
      maximum_numeric_absolute_difference=maximum,numeric_comparison_tolerance='1e-12 relative/absolute for cross-libm statistics only, NOT workload correctness',
      executed_on='Windows native Python',engines_started=0,private_source_required=False,
      byte_format_note='Windows replay text output may use CRLF; compare parsed numeric records, original raw SHA256 must match exactly')
    dest.write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8');assert not differences
    print('WINDOWS_RAW_ONLY_REPLAY_PASS',sum(x['valid'] for x in summary),'max numeric delta',maximum)
if __name__=='__main__':main()
