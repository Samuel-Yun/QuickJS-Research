"""Finite owned idle process to keep this WSL boot while experiment stages run."""
import json
import os
from pathlib import Path
import time

h = Path(__file__).resolve().parent
identity = dict(pid=os.getpid(), boot=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
                start=time.time(), limit_seconds=21600)
identity_path = h / ('keeper.' + identity['boot'] + '.json')
assert not identity_path.exists()
identity_path.write_text(json.dumps(identity, indent=2) + '\n')
while time.time() - identity['start'] < identity['limit_seconds']:
    if (h / 'KEEPER_RELEASE').exists():
        break
    time.sleep(5)
