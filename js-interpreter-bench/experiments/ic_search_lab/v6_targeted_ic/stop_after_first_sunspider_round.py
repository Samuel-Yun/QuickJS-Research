"""Honor the user's one-round limit for this already-running owned controller."""
import json
import os
from pathlib import Path
import signal
import time

import experiment as e


CAMPAIGN = 'full_expand01_sunspider'
assert e.EPOCH == 'expand01'
e.gate()
plan = e.lab.load(e.H / (CAMPAIGN + '.protocol.json'))
assert plan['boot_id'] == e.lab.boot()
expected = {(group['case'], label, 0)
            for group in plan['order'] if group['rep'] == 0
            for label in group['conditions']}
assert len(expected) == 260
observed = set()
controller = None
with (e.H / 'runs.jsonl').open(encoding='utf-8') as stream:
    while observed != expected:
        line = stream.readline()
        if not line:
            time.sleep(0.05)
            continue
        if CAMPAIGN not in line:
            continue
        row = json.loads(line)
        identity = row.get('identity') or {}
        if row['event'] == 'process_start' and identity.get('campaign') == CAMPAIGN:
            if controller is None:
                controller = row['parent_pid']
            assert controller == row['parent_pid']
        if row['event'] != 'measurement' or row.get('campaign') != CAMPAIGN or row['rep'] != 0:
            continue
        key = row['case'], row['condition'], row['rep']
        assert row['valid'] and key in expected and key not in observed
        observed.add(key)
        if len(observed) % 10 == 0:
            print('ONE_ROUND_PROGRESS', len(observed), 'of260', flush=True)

assert controller and controller != os.getpid()
command = Path('/proc', str(controller), 'cmdline').read_bytes().replace(b'\0', b' ').decode()
assert 'accept_performance.py full --name full_expand01_sunspider ' in command
os.kill(controller, signal.SIGSTOP)
time.sleep(0.02)
children_path = Path('/proc', str(controller), 'task', str(controller), 'children')
children = [int(value) for value in children_path.read_text().split()]
cancelled = []
for child in children:
    child_path = Path('/proc', str(child), 'cmdline')
    try:
        args = child_path.read_bytes().split(b'\0')
    except FileNotFoundError:
        continue
    binary = args[0].decode()
    allowed = {e.measure.artifact(label)['path'] for label in plan['labels']}
    assert binary in allowed, 'Unexpected owned child requires review'
    cancelled.append(dict(pid=child, command=[value.decode() for value in args if value]))
    os.kill(child, signal.SIGTERM)

record = dict(event='user_requested_round_stop', campaign=CAMPAIGN,
              timestamp=e.lab.stamp(), boot_id=e.lab.boot(), parent_pid=controller,
              accepted_first_round=260, original_requested=780,
              reason='User requested SunSpider one round to save time',
              cancelled_next_round_children=cancelled,
              cancellation_is_candidate_failure=False)
e.lab.append(record)
e.save('sunspider_one_round_stop.expand01.json', record)
os.kill(controller, signal.SIGTERM)
os.kill(controller, signal.SIGCONT)
print('USER_ONE_ROUND_COMPLETE', len(observed), 'cancelled_extra_children', len(cancelled), flush=True)
