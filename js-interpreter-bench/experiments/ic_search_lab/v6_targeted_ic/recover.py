"""Recover one public candidate into a new directory, no runtime execution."""
import argparse
import hashlib
import json
from pathlib import Path
import experiment as e
from variants import patch_apply

p=argparse.ArgumentParser();p.add_argument('id');p.add_argument('--destination',required=True);a=p.parse_args()
identity=json.loads((e.H/'identities'/(a.id+'.json')).read_text(encoding='utf-8'))
patch=(e.H/'patches'/(a.id+'.patch')).read_bytes()
assert hashlib.sha256(patch).hexdigest()==identity['patch_sha256']
files=patch_apply(e.seed_module.seed('s001'),patch.decode())
assert {n:hashlib.sha256(v.encode()).hexdigest() for n,v in files.items()}==identity['source_sha256']
destination=Path(a.destination)
assert not destination.exists(),'New destination required; no overwrite'
destination.mkdir(parents=True)
for name,text in files.items():(destination/name).write_bytes(text.encode())
print('RESTORE_SOURCE_PASS',a.id,len(files))
