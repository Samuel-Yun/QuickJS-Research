"""Independent data-only count/order/hash/clock/descriptive-statistics audit."""
import collections,statistics as st
from datetime import datetime,timedelta
from pathlib import PurePosixPath
from common import *
def main():
    m=read(HERE/'measurement_manifest.json');schedule=read(HERE/'schedule.json')
    records=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    key=lambda r:(r['case'],r['rep'],r['variant'],r['order'])
    actual={key(r):r for r in records};assert len(actual)==len(records)==len(schedule)==1890
    summary=list(csv.DictReader((HERE/'analysis/summary.csv').open(encoding='utf-8',newline='')))
    summaries={r['case']:r for r in summary};assert set(summaries)==set(CASES)
    script_hashes=read(HERE/'script_hashes.json');last=None;previous_start=None;cross_clock=[];previous_key=None;last_internal_stop=None;internal_intervals=0
    for s in schedule:
        r=actual[key(s)];assert r['valid'] and r['stage']=='formal' and r['exit_code']==0 and not r['stderr'] and not r['timeout']
        assert r['N']==s['N'] and r['script_sha256']==script_hashes[r['case']]
        assert r['cohort']==m['cohort'] and r['mode']==m['mode'] and r['flags']==[]
        assert r['binary_sha256']==m['artifacts'][r['variant']]['sha256']
        assert r['command']==[m['artifacts'][r['variant']]['path'],str(PurePosixPath(r['cwd'])/'experiments'/m['campaign']/r['script_relative'])]
        assert r['payload']['N']==r['N'] and r['payload']['case']==r['case'] and r['payload']['warmup_calls']==0
        assert r['payload']['correctness']=='PASS' and r['payload']['elapsed_ms']==r['elapsed_ms']
        assert r['elapsed_per_call_ms']==r['elapsed_ms']/r['N'] and 0<r['elapsed_ms']<=r['outer_wall_ns']/1e6+5
        t=datetime.fromisoformat(r['timestamp']);assert previous_start is None or t>=previous_start
        if last is not None and t<last:
            cross_clock.append(dict(previous=list(previous_key),current=list(key(r)),UTC_plus_monotonic_end_minus_next_UTC_start_ms=(last-t).total_seconds()*1000))
        previous_start=t;previous_key=key(r)
        last=t+timedelta(microseconds=r['outer_wall_ns']/1000)
        if r['payload'].get('start_ms') is not None:
            start,stop=r['payload']['start_ms'],r['payload']['stop_ms']
            assert last_internal_stop is None or start>=last_internal_stop
            assert stop-start==r['elapsed_ms'];last_internal_stop=stop;internal_intervals+=1
    per_case=[]
    for c in CASES:
        ss=[s for s in schedule if s['case']==c]
        orders=collections.Counter(''.join(r['variant'] for r in ss if r['rep']==rep) for rep in range(30))
        assert len(orders)==6 and set(orders.values())=={5}
        for v in VERSIONS:assert collections.Counter(r['order'] for r in ss if r['variant']==v)=={0:10,1:10,2:10}
        n=read(HERE/'selected'/f'{c}.json')['N']
        pilots=[read(p) for p in (HERE/'raw/pilot'/c).glob(f'*.N{n}.*.json')]
        assert len(pilots)==9 and all(r['valid'] and r['elapsed_ms']>=1000 for r in pilots)
        vals={v:[r['elapsed_per_call_ms'] for r in records if r['case']==c and r['variant']==v] for v in VERSIONS}
        assert all(len(x)==30 for x in vals.values())
        for v in VERSIONS:assert st.median(vals[v])==float(summaries[c]['execution_'+v+'_median'])
        for a,b in [('A','C'),('C','D'),('A','D')]:assert st.median(vals[a])/st.median(vals[b])==float(summaries[c]['execution_'+a+b+'_speedup'])
        per_case.append(dict(case=c,N=n,valid=90,pilot_min_ms=min(r['elapsed_ms'] for r in pilots),orders=dict(orders)))
    csvfiles=list((HERE/'analysis').glob('*.csv'))+list((HERE/'correctness').glob('*.csv'))
    assert all(b'\r\n' not in p.read_bytes() for p in csvfiles)
    result=dict(status='PASS_WITH_CLOCK_METADATA_LIMITATION' if cross_clock else 'PASS',data_only=True,runtime_files_required=False,records=1890,
      Octane_valid=sum(r['case'] in OCTANE_CASES for r in records),micro_valid=sum(r['case'] in MICRO_CASES for r in records),
      UTC_start_timestamps_ordered=True,Octane_absolute_monotonic_intervals_checked=internal_intervals,Octane_timed_regions_nonoverlap=True,
      micro_absolute_monotonic_start_stop_recorded=False,whole_process_absolute_monotonic_endpoints=None,
      serial_runner_evidence='run.py hash in measurement_manifest: blocking subprocess.run inside one schedule loop; no background performance processes',
      mixed_clock_warning='UTC/calendar timestamp + monotonic duration cannot be used to infer exact process end. Cause of divergence UNKNOWN; no sample removed.',
      mixed_clock_inconsistencies=cross_clock,balanced_positions=True,per_case=per_case,CSV_LF_checked=len(csvfiles),
      current_executable_identity='separate identity.py',boot_ids=sorted({r['boot_id'] for r in records}),
      below_threshold_retained=sum(r['elapsed_ms']<1000 for r in records),outliers_removed=0)
    save(HERE/'analysis/independent_audit.json',result);print('INDEPENDENT_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
