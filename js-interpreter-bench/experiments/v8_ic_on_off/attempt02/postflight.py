"""Post-collection host snapshot and recorded monotonic campaign duration."""
from common import *
def main():
    assert read(HERE/'identity_after.json')['status']=='PASS'
    formal=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
    pilots=[read(p) for p in (HERE/'raw/pilot').rglob('*.json')]
    assert len(formal)==270 and all(r['valid'] for r in formal)
    clock=read(HERE/'campaign_clock.json');assert all(r['boot_id']==clock['boot_id'] for r in formal+pilots)
    first=min(formal,key=lambda r:r['outer_start_ns']);last=max(formal,key=lambda r:r['outer_stop_ns'])
    span=(last['outer_stop_ns']-clock['start_ns'])/1e9;assert span<7200
    save(HERE/'campaign_timing.json',dict(status='PASS',first_pilot_UTC=min(r['timestamp'] for r in pilots),first_formal_UTC=first['timestamp'],last_formal_completed_UTC=last['completed_at'],formal_span_seconds=(last['outer_stop_ns']-first['outer_start_ns'])/1e9,pilot_selected_correctness_and_formal_span_seconds=span,budget_seconds=7200,formal_valid=270,formal_failed=0,pilot_records=len(pilots),all_acquisition_same_boot=True,no_performance_samples_in_this_script=True))
    capture(HERE/'raw/capability/environment_after.json',['sh','-c','uname -a; uptime; free -b; for p in /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq; do if test -r "$p"; then head -c 200 "$p"; fi; done; true'])
    print('POSTFLIGHT_PASS; 270 valid; campaign seconds',span,flush=True)
if __name__=='__main__':main()
