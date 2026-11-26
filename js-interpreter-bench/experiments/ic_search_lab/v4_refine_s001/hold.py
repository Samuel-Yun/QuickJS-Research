"""Bounded idle keeper for the active WSL cohort."""
import json
import os
from pathlib import Path
import time

H = Path(__file__).resolve().parent
env = json.loads((H / 'environment.json').read_text())
boot = Path('/proc/sys/kernel/random/boot_id').read_text().strip()
assert boot == env['boot_id']
with (H / 'idle_keeper.json').open('x', encoding='utf-8') as stream:
    json.dump(dict(pid=os.getpid(), boot_id=boot, seconds=14400, started_utc=time.time()), stream)
print('BOUNDED_IDLE_KEEPER', os.getpid(), boot, flush=True)
deadline = time.monotonic() + 14400
while time.monotonic() < deadline and not (H / 'RELEASE_HOLD').exists():
    time.sleep(10)
with (H / 'idle_keeper.complete.json').open('x', encoding='utf-8') as stream:
    json.dump(dict(pid=os.getpid(), boot_id=boot, finished_utc=time.time()), stream)
