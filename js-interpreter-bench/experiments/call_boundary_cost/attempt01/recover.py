"""Explicit user-authorized continuation; never retry the incomplete validation round."""
from common import *
import run
def guard(setup=False):
    r=read(HERE/'recovery_clock.json')
    # Task budget only, never performance: WSL may shut down between stages.
    # Do not compare absolute CLOCK_MONOTONIC values from different boots.
    assert (datetime.now(timezone.utc)-datetime.fromisoformat(r['timestamp'])).total_seconds()<r['remaining_active_budget_seconds'],'90-minute bounded continuation exhausted'
def seal():
    verify();records=[read(p) for p in (HERE/'raw/validation_p7000').rglob('*.json')];schedule=read(HERE/'schedule_p7000.json');keys={(r['rep'],r['case'],r['condition']) for r in records};missing=[s for s in schedule if (s['rep'],s['case'],s['condition']) not in keys]
    assert len(records)==107 and len(missing)==1 and all(r['valid'] for r in records)
    s=missing[0];marker=HERE/'raw/started/validation_p7000'/s['case']/f'rep{s["rep"]}.{s["condition"]}.N{s["N"]}.p7000.json';assert not marker.exists()
    save(HERE/'recovery_protocol.json',dict(timestamp=stamp(),reason='user explicitly requested continuation after interrupted turn',original_start=read(HERE/'started.json'),validation_policy='retain107/108, do not run never-started last position; all valid descriptive, complete11 nine-process rounds for paired bootstrap; engineering thresholds unchanged',missing_positions=missing,UTC_discontinuity='one retained record spans about3h51 UTC but about7.2s internal/parent monotonic/CPU; cause UNKNOWN',budget='do not reset old start or claim wall elapsed<4h; exclude externally interrupted/inactive interval, cap this continuation at90 active monotonic minutes; prior sampler setup finished within60min',remaining_active_budget_seconds=5400))
    save(HERE/'recovery_clock.json',dict(timestamp=stamp(),boot_id=boot(),start_ns=time.perf_counter_ns(),remaining_active_budget_seconds=5400))
    save(HERE/'validation_p7000_done.json',dict(status='INTERRUPTED_CLOSED_NOT_COMPLETE',actual=107,target=108,missing=missing,timestamp=stamp(),no_missing_position_retried=True))
    capture('recovery_environment',['sh','-c','uname -a; uptime; ps -eo pid,stat,comm,pcpu,args; true'])
    print('SEALED_107_NO_RETRY',flush=True)
if __name__=='__main__':
    import argparse
    p=argparse.ArgumentParser();p.add_argument('stage',choices=['seal','fallback','profile']);a=p.parse_args()
    if a.stage=='seal':seal()
    else:
        guard();run.budget=guard
        if a.stage=='fallback':run.validate(23000)
        else:run.profile()
