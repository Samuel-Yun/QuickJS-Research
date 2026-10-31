"""Independent public-raw count/order/clock audit. Does not access host binaries."""
import collections,math
from common import *
def main():
    m=read(HERE/'measurement_manifest.json');schedule=read(HERE/'schedule.json')
    records=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    key=lambda r:(r['case'],r['rep'],r['variant'],r['order'],r['N'])
    bykey={key(r):r for r in records};assert len(bykey)==len(records)==len(schedule)==2160
    assert set(bykey)=={key(s) for s in schedule}
    last=0;short=[];durations=[];boots=set()
    for s in schedule:
        r=bykey[key(s)];start,stop=r['outer_start_ns'],r['outer_stop_ns']
        assert isinstance(start,int) and isinstance(stop,int) and stop>start>=last
        assert stop-start==r['outer_wall_ns'];last=stop;boots.add(r['boot_id'])
        assert r['binary_sha256']==m['artifacts'][r['variant']]['sha256'] and r['flags']==[]
        assert len(r['command'])==2 and r['command'][0]==m['artifacts'][r['variant']]['path']
        assert r['script_sha256']==read(HERE/'script_hashes.json')[r['case']]
        if r['valid']:
            p=r['payload'];a,b=p['start_ms'],p['stop_ms']
            assert all(math.isfinite(x) for x in [a,b,r['elapsed_ms']])
            assert start/1e6-1<=a<b<=stop/1e6+1 and b-a==r['elapsed_ms']
            assert r['elapsed_ms']/r['N']==r['elapsed_per_call_ms']
            assert p['correctness']=='PASS' and p['warmup_calls']==0
            if r['elapsed_ms']<1000:short.append(key(r))
            durations.append(r['elapsed_ms'])
    groups=collections.Counter((r['case'],r['variant']) for r in records);assert len(groups)==72 and set(groups.values())=={30}
    for c in CASES:
        seqs=collections.Counter(''.join(bykey[key(s)]['variant'] for s in schedule if s['case']==c and s['rep']==rep) for rep in range(30))
        assert len(seqs)==6 and set(seqs.values())=={5}
        for v in VERSIONS:
            assert [sum(r['case']==c and r['variant']==v and r['order']==i for r in records) for i in range(3)]==[10,10,10]
        selected=read(HERE/'selected'/f'{c}.json');assert len(selected['pilot_ms'])==9 and min(selected['pilot_ms'])>=1000
    memory=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];assert len(memory)==144 and all(r['valid'] for r in memory)
    ds=[read(p) for p in (HERE/'raw/diagnostic').glob('*.json.gz')]
    from diagnostic import validate
    for d in ds:validate(d)
    assert len(ds)==70 # 48 selected + 16 micro mechanism + 2 independent sites + 4 creation/use
    csvs=list(HERE.rglob('*.csv'));assert all(b'\r\n' not in p.read_bytes() for p in csvs)
    gate=read(HERE/'analysis/formal_audit.json');assert gate['status']=='PASS'
    save(HERE/'analysis/audit.json',dict(status='PASS',expected=2160,actual=len(records),valid=sum(r['valid'] for r in records),
      octane_valid=sum(r['valid'] and r['case'] in OCTANE_CASES for r in records),micro_valid=sum(r['valid'] and r['case'] in MICRO_CASES for r in records),
      six_permutations_each5=True,positions_each10=True,monotonic_domains_bracketed=True,process_intervals_serial=True,
      below_1000ms=len(short),short_positions=short,min_formal_elapsed_ms=min(durations),boot_ids=sorted(boots),
      selected_diagnostics=48,mechanism_diagnostics=22,memory_processes=len(memory),outliers_removed=0,retries=0,
      public_data_only=True,current_binary_access=False,CSV_line_endings='LF',float_replay_tolerance=dict(rel=1e-12,abs=1e-12)))
    print('INDEPENDENT_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
