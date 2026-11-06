"""Bounded idle process retains this WSL boot during controller recovery."""
import json
import os
from pathlib import Path
import time

H = Path(__file__).resolve().parent
boot = Path('/proc/sys/kernel/random/boot_id').read_text().strip()
active = json.loads((H / 'exploration.active_campaign.json').read_text())
assert active['boot_id'] == boot
identity = dict(pid=os.getpid(), boot_id=boot, seconds=21600, started_utc=time.time(),
                purpose='Sleeping keeper only; prevent WSL shutdown during a controller recovery hand-off')
with (H / 'exploration02.idle_keeper.json').open('x', encoding='utf-8') as stream:
    json.dump(identity, stream, indent=2)
print('BOUNDED_IDLE_KEEPER', os.getpid(), boot, flush=True)
deadline = time.monotonic() + 21600
while time.monotonic() < deadline and not (H / 'RELEASE_COHORT_HOLD').exists():
    time.sleep(10)
with (H / 'exploration02.idle_keeper.complete.json').open('x', encoding='utf-8') as stream:
    json.dump(dict(**identity, finished_utc=time.time()), stream, indent=2)
