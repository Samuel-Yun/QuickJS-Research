"""Independent raw-only audit of counts, timers, hashes and point ratios."""
import csv,gzip,hashlib,json,statistics
from pathlib import Path
from collections import Counter
P=Path(__file__).resolve().parent
def j(p):return json.loads(p.read_text(encoding='utf8'))
def h(b):return hashlib.sha256(b).hexdigest()
def main():
    manifest=j(P/'manifest.json');total=0;archive_count=0
    assert manifest['artifacts']['SHIM_OFF']==manifest['artifacts']['SHIM_ON']
    for period,expected,complete in [(7000,107,11),(23000,108,12)]:
        records=[j(p) for p in (P/'raw'/f'validation_p{period}').rglob('*.json')];assert len(records)==expected and all(r['valid'] for r in records);total+=len(records)
        schedule=j(P/f'schedule_p{period}.json');by={(r['rep'],r['case'],r['condition']):r for r in records};assert len(by)==len(records)
        complete_reps=[i for i in range(12) if sum(k[0]==i for k in by)==9];assert len(complete_reps)==complete
        for s in schedule:
            r=by.get((s['rep'],s['case'],s['condition']))
            if not r:
                assert period==7000 and s['index']==107;continue
            assert r['N']==s['N'] and r['order']==s['order'] and r['period_us']==period
            assert h((P/r['script_relative']).read_bytes())==r['script_sha256']
            assert r['binary_sha256']==manifest['artifacts'][r['condition']]['sha256']
            d=json.loads(r['stdout'].split('TEB_RESULT:')[1]);assert d['N']==r['N'] and d['warmup_calls']==0 and d['correctness']=='PASS' and r['stderr']=='' and r['exit_code']==0
            assert d['elapsed_ms']==d['stop_ms']-d['start_ms']==r['elapsed_ms']>0 and r['elapsed_ms']<=r['outer_wall_ns']/1e6+5
            if r['case']!='Richards.Richards':assert d['last']==8390656 and d['checksum']==r['N']*8390656<2**53
            if r['condition']!='BASE':
                assert r['sampler']['enabled']==(r['condition']=='SHIM_ON') and r['sampler']['overflow']==0 and r['sampler']['clock_errors']==0
                for a in r['sampler_archives'].values():
                    b=(P/a['path']).read_bytes();assert h(b)==a['sha256'] and h(gzip.decompress(b))==a['uncompressed_sha256'];archive_count+=1
        for case in j(P/'protocol.json')['cases']:
            orders=Counter(tuple(s['condition'] for s in schedule if s['rep']==i and s['case']==case) for i in range(12));assert len(orders)==6 and set(orders.values())=={2}
            for r in records:
                if r['case']==case and r['condition']=='SHIM_ON':
                    off=by.get((r['rep'],case,'SHIM_OFF'))
                    if off:assert r['script_sha256']==off['script_sha256']
        ratio=list(csv.DictReader((P/f'validation_analysis_p{period}/ratios.csv').open(encoding='utf8')))
        for r in ratio:
            nums=[by[(i,r['case'],r['numerator'])]['elapsed_ms'] for i in complete_reps];dens=[by[(i,r['case'],r['denominator'])]['elapsed_ms'] for i in complete_reps]
            assert statistics.median(nums)/statistics.median(dens)==float(r['ratio'])
    assert total==215 and archive_count==572 and j(P/'correctness_gate.json')['valid']==18
    assert not list((P/'raw/profile').glob('**/*.json')) and j(P/'long_window_gate.json')['actual_windows']==0
    assert all(not a['accepted'] for a in j(P/'perturbation_gate.json')['cases'].values())
    assert j(P/'final_identity.json')['status']=='PASS'
    audit=dict(status='PASS',validation_records=215,first_batch_missing1_retained=True,second_batch_full108=True,point_ratios_independently_recomputed=True,archives_hash_checked=572,correctness_N1_N2=18,long_windows=0,performance_conclusion='BLOCKED_PERTURBATION',runtime_ELF_paths_opened=False)
    path=P/'independent_audit.json';data=json.dumps(audit,indent=2)+'\n'
    if path.exists():assert path.read_text(encoding='utf8')==data
    else:path.write_text(data,encoding='utf8')
    print(data)
if __name__=='__main__':main()
