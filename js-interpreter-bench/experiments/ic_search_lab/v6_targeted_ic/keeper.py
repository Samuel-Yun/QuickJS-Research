"""Keep this owned WSL session alive. Never run a benchmark or compiler."""
import json
import os
from pathlib import Path
import sys
import time

home = Path(__file__).resolve().parent
tag=sys.argv[1] if len(sys.argv)>1 else ''
assert not tag or tag.replace('_','').isalnum()
release = home / ('KEEPER_RELEASE'+('.'+tag if tag else ''))
assert not release.exists(), 'Explicit release already requested'
boot = Path('/proc/sys/kernel/random/boot_id').read_text().strip()
path = home / ('keeper.' + boot + ('.'+tag if tag else '') + '.json')
with path.open('x', encoding='utf-8') as stream:
    json.dump(dict(pid=os.getpid(), boot_id=boot, purpose='owned idle WSL lifetime only'), stream)
print('KEEPER_READY', os.getpid(), boot, flush=True)
try:
    while not release.exists():
        time.sleep(1)
finally:
    print('KEEPER_RELEASED', flush=True)
