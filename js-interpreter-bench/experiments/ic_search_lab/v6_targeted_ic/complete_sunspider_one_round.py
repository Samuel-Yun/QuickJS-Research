"""Record post-run identities after the owned one-round controller has stopped."""
from pathlib import Path

import experiment as e
from accept_performance import verify_frozen


assert e.EPOCH == 'expand01'
record = e.lab.load(e.H / 'sunspider_one_round_stop.expand01.json')
assert record['accepted_first_round'] == 260 and record['boot_id'] == e.lab.boot()
parent = Path('/proc', str(record['parent_pid']), 'status')
assert not parent.exists() or '\nState:\tZ' in parent.read_text(), 'Controller still active'
for child in record['cancelled_next_round_children']:
    status = Path('/proc', str(child['pid']), 'status')
    assert not status.exists() or '\nState:\tZ' in status.read_text(), 'Cancelled child still active'
checked = verify_frozen()
name = 'full_expand01_sunspider.one_round'
e.save(name + '.identity_after.json', dict(status='PASS', artifacts=checked,
       boot_id=e.lab.boot(), completion_scope='User-requested first round only'))
e.save(name + '.completed.json', dict(status='COMPLETE_USER_ONE_ROUND', valid=260,
       expected=260, original_requested=780, boot_id=e.lab.boot(),
       source_protocol='full_expand01_sunspider.protocol.json'))
print('ONE_ROUND_POST_IDENTITY_PASS', len(checked), flush=True)
