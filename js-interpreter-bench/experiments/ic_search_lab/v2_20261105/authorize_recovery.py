"""Record the one recovery allowed by drift_check_policy, never remove STOP."""
import json
from pathlib import Path
import run
HERE=run.HERE;lab=run.lab
if __name__=='__main__':
    assert not (HERE/'recovery_authorization.json').exists()
    health=lab.load(HERE/'health_after_drift.json');assert health['status']=='PASS_BOUNDED_START_GATE_ONLY'
    partials={p.name:lab.sha(p) for p in HERE.glob('*.partial.json')};assert set(partials)=={'s003.matched.sunspider.partial.json'}
    lab.save(HERE/'recovery_authorization.json',dict(health=health,known_partials=partials,
       old_campaign='postreboot.s003.matched.sunspider.screen01',old_status='PARTIAL_REPEAT_DRIFT_NO_GM',
       new_campaign='postreboot.s003.matched.recovery01.sunspider.screen01',
       new_result='s003.matched.recovery01.sunspider.screen.json',
       frozen_binary_sha256=run.measure.artifact('s003')['sha256'],old_STOP_retained=True,
       reuse_old_partial_times=False,fresh_complete26=True,
       policy='Exactly one full new recovery campaign, not selecting a favorable repeat; any new partial blocks automatic continuation'))
    print('ONE_NEW_FULL_RECOVERY_AUTHORIZED_NO_OLD_TIMES_MERGED')
