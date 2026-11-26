"""Independent public raw audit; no access to frozen host ELF paths."""
import collections,math
from common import *
def main():
    m=read(HERE/'measurement_manifest.json');sched=read(HERE/'schedule.json');rs=[read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    key=lambda r:(r['case'],r['rep'],r['variant'],r['order'],r['N']);by={key(r):r for r in rs}
    assert len(by)==len(rs)==len(sched)==2160 and set(by)=={key(r) for r in sched}
    env=read(HERE/'base_environment.json');assert 'QJS_READ_IC_MODE' not in env;envsha=digest(json.dumps(env,sort_keys=True).encode())
    previous=0;short=[];boots=set()
    for s in sched:
        r=by[key(s)];a,b=r['outer_start_ns'],r['outer_stop_ns'];assert previous<=a<b and b-a==r['outer_wall_ns'];previous=b;boots.add(r['boot_id'])
        assert r['valid'] and r['exit_code']==0 and not r['stderr'] and not r['timeout'] and not r['flags']
        assert r['binary_sha256']==m['artifacts'][r['variant']]['sha256'] and r['command'][0]==m['artifacts'][r['variant']]['path']
        assert r['environment_sha256']==envsha and not r['mode_variable_present'] and r['source_identity_sha256']==m['source_identity_sha256'][r['variant']]
        assert r['input_manifest_sha256']==sha(HERE/'measurement_manifest.json') and r['script_sha256']==read(HERE/'script_hashes.json')[r['case']]
        p=r['payload'];assert p['correctness']=='PASS' and p['warmup_calls']==0 and a/1e6-1<=p['start_ms']<p['stop_ms']<=b/1e6+1
        assert math.isfinite(r['elapsed_ms']) and p['stop_ms']-p['start_ms']==r['elapsed_ms'] and r['elapsed_ms']/r['N']==r['elapsed_per_call_ms']
        if r['elapsed_ms']<1000:short.append(key(r))
    groups=collections.Counter((r['case'],r['variant']) for r in rs);assert len(groups)==72 and set(groups.values())=={30}
    for c in CASES:
        seq=collections.Counter(''.join(s['variant'] for s in sched if s['case']==c and s['rep']==rep) for rep in range(30));assert len(seq)==6 and set(seq.values())=={5}
        for v in VERSIONS:assert [sum(r['case']==c and r['variant']==v and r['order']==i for r in rs) for i in range(3)]==[10]*3
        sel=read(HERE/'selected'/f'{c}.json');assert len(sel['pilot_ms'])==9 and min(sel['pilot_ms'])>=1000
    from diagnostic import validate
    diag=list((HERE/'raw/diagnostic').glob('*.json.gz'));assert len(diag)==66
    for p in diag:validate(read(p),'R' if p.name.endswith('.R.json.gz') else 'M')
    mem=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];assert len(mem)==144 and all(r['valid'] for r in mem)
    assert read(HERE/'bridge_check/audit.json')['actual']==48 and read(HERE/'analysis/formal_audit.json')['status']=='PASS'
    assert all(b'\r\n' not in p.read_bytes() for p in HERE.rglob('*.csv'))
    save(HERE/'analysis/audit.json',dict(status='PASS',expected=2160,actual=len(rs),valid=len(rs),octane_valid=sum(r['case'] in OCTANE_CASES for r in rs),micro_valid=sum(r['case'] in MICRO_CASES for r in rs),six_permutations_each5=True,positions_each10=True,no_duplicates_or_missing=True,mode_variable_absent=True,source_command_input_hashes=True,monotonic_brackets_and_seriality=True,boot_ids=sorted(boots),below_1000ms=len(short),short_positions=short,selected_diagnostics=48,mechanism_diagnostics=18,RSS_processes=144,bridge_separate=48,removed_outliers=0,retries=0,public_data_only=True,indirect_retained_bytes=None))
    print('INDEPENDENT_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
