"""After acquisition only: identity/environment and recorded campaign duration."""
from common import *
def main():
    verify_runtime();m=read(HERE/'runtime.json')
    assert all(sha(Path(m['quickjs']['source'])/p)==h for p,h in m['quickjs']['source_files'].items())
    assert tree(PREVIOUS)==read(HERE/'previous_identity_before.json')
    # Data-only summaries can later read this; original ELF checks are separate.
    files=[read(p) for stage in ['pilot','selected_correctness','formal'] for p in (HERE/'raw'/stage).rglob('*.json')]
    files=[r for r in files if 'outer_stop_ns' in r];clock=read(HERE/'campaign_clock.json')
    assert all(r['boot_id']==clock['boot_id'] for r in files)
    crypto=[read(p) for p in (HERE/'raw/crypto').glob('*.json')]
    selected_crypto=[r for r in crypto if r['boot_id']==clock['boot_id'] and r['outer_start_ns']>=clock['start_ns']]
    files+=selected_crypto
    span=(max(r['outer_stop_ns'] for r in files)-clock['start_ns'])/1e9 if files else 0
    save(HERE/'campaign_timing.json',dict(recorded_acquisition_span_seconds=span,budget_seconds=BUDGET,within_budget=span<=BUDGET,all_acquisition_same_boot=True,first_record_UTC=min(r['timestamp'] for r in files) if files else None,last_record_UTC=max(r.get('completed_at',r['timestamp']) for r in files) if files else None,span_basis='stored parent monotonic endpoints, not UTC subtraction; excludes initial N1/N2 checks',postflight_boot=boot(),acquisition_boot=clock['boot_id']))
    libs=[]
    for c,path in [('QJS_ORIGINAL',m['quickjs']['binary']['path']),('V8_SHARED',m['v8']['binary']['path'])]:
        r=capture(HERE/'raw/capability'/('ldd_'+c+'.json'),['ldd',path]);assert r['exit_code']==0
        for line in r['stdout'].splitlines():
            match=re.search(r'(/\S+)\s+\(0x',line)
            if match:libs.append(dict(condition=c,path=match[1],sha256=sha(match[1])))
    save(HERE/'libraries_after.json',libs)
    capture(HERE/'raw/capability/environment_after.json',['sh','-c','uname -a; uptime; free -b; ps -eo pid,comm,pcpu --sort=-pcpu | head -15; true'])
    if not (HERE/'identity_after.json').exists():save(HERE/'identity_after.json',dict(status='PASS',timestamp=stamp(),dependencies_verified=True,source_files_checked=77,previous_attempt_unchanged=True))
    print('POSTFLIGHT_IDENTITIES_AND_DURATION_PASS',span,flush=True)
if __name__=='__main__':main()
