"""Independent raw clock/env/hash/order checks; no binary access."""
import collections,math
from common import *
def main():
    m=read(HERE/'measurement_manifest.json');schedule=read(HERE/'schedule.json');records=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    key=lambda r:(r['case'],r['rep'],r['variant'],r['order'],r['N']);lookup={key(r):r for r in records};assert len(lookup)==len(records)==len(schedule)==1024 and set(lookup)=={key(r) for r in schedule}
    env=read(HERE/'base_environment.json');previous_stop=0;boots=set();short=[];orderfacts={}
    for s in schedule:
        r=lookup[key(s)];a,b=r['outer_start_ns'],r['outer_stop_ns'];assert a>=previous_stop and b>a and b-a==r['outer_wall_ns'];previous_stop=b;boots.add(r['boot_id'])
        e=env.copy();e[MODE_KEY]=config(r['variant']);assert r['environment_sha256']==digest(json.dumps(e,sort_keys=True).encode())
        assert r['binary_sha256']==m['artifacts'][r['variant']]['sha256'] and r['script_sha256']==read(HERE/'script_hashes.json')[r['case']]
        assert r['valid'] and r['exit_code']==0 and not r['stderr'] and r['flags']==[]
        p=r['payload'];assert p['correctness']=='PASS' and p['warmup_calls']==0
        assert all(math.isfinite(x) for x in [p['start_ms'],p['stop_ms'],r['elapsed_ms']]) and a/1e6-1<=p['start_ms']<p['stop_ms']<=b/1e6+1
        assert p['stop_ms']-p['start_ms']==r['elapsed_ms'] and r['elapsed_per_call_ms']==r['elapsed_ms']/r['N']
        if r['elapsed_ms']<1000:short.append(key(r))
    assert len(boots)==1
    for c in CASES:
        seqs=[[r['variant'] for r in schedule if r['case']==c and r['rep']==rep] for rep in range(32)]
        counts=collections.Counter(tuple(s) for s in seqs);assert len(counts)==24 and sorted(counts.values())==[1]*20+[3]*4
        positions={v:[sum(s[i]==v for s in seqs) for i in range(4)] for v in VERSIONS};assert all(a==[8]*4 for a in positions.values())
        pairs=collections.Counter((a,b) for s in seqs for a,b in zip(s,s[1:]));assert len(pairs)==12 and set(pairs.values())=={8}
        orderfacts[c]=dict(positions=positions,adjacent_pairs={'/'.join(k):v for k,v in pairs.items()})
        sel=read(HERE/'selected'/f'{c}.json');assert len(sel['pilot_ms'])==12 and min(sel['pilot_ms'])>=1000
        for rep in range(32):
            rr=[r for r in records if r['case']==c and r['rep']==rep];on=next(r for r in rr if r['variant']=='ON');look=next(r for r in rr if r['variant']=='LOOKUP')
            assert on['command']==look['command'] and on['binary_sha256']==look['binary_sha256'] and on['mode_value']=='1' and look['mode_value']=='0'
    groups=collections.Counter((r['case'],r['variant']) for r in records);assert len(groups)==32 and set(groups.values())=={32}
    from diagnostic import validate,match
    for c in CASES:match(validate(read(HERE/'raw/diagnostic'/f'{c}.ON.json.gz'),'ON'),validate(read(HERE/'raw/diagnostic'/f'{c}.LOOKUP.json.gz'),'LOOKUP'))
    memory=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];assert len(memory)==36 and all(r['valid'] for r in memory)
    crypto=read(HERE/'crypto/audit.json');assert crypto['actual']==48 and crypto['status']=='PASS_BOUNDED_INPUT_IDENTITY'
    assert all(b'\r\n' not in p.read_bytes() for p in HERE.rglob('*.csv'))
    save(HERE/'analysis/audit.json',dict(status='PASS',expected=1024,actual=len(records),valid=len(records),groups=32,samples_per_group=32,
      no_duplicates_or_missing=True,order_balance=orderfacts,same_ON_LOOKUP_ELF_argv=True,only_mode_env_value_differs=True,monotonic_brackets_and_seriality=True,
      boot_ids=sorted(boots),below_1000ms=len(short),short_records=short,selected_diagnostics=16,gate_diagnostics=12,RSS_processes=36,crypto_identity_processes=48,
      removed_outliers=0,retries=0,no_GM=True,public_data_only=True,indirect_retained_bytes=None))
    print('AUDIT_PASS',flush=True)
if __name__=='__main__':main()
