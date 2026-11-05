"""Verify fixed-source reuse and the one safety correction; no networking."""
from pathlib import Path
import json,hashlib,difflib
HERE=Path(__file__).resolve().parent;OLD=HERE.parent/'attempt01'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):return json.loads(p.read_text(encoding='utf-8'))
files=[]
for row in read(OLD/'source_manifest.json')['files']:
    if row.get('sha256') and (OLD/row.get('local',row['path'])).exists():
        path=row.get('local',row['path']);assert sha(HERE/path)==row['sha256']
        files.append(dict(path=path,sha256=sha(HERE/path),url=row['url'],origin='../attempt01/source_manifest.json'))
for row in read(OLD/'source_headers_network_allowed.json'):
    path='source_reference/v8/'+row['upstream_path'];assert sha(HERE/path)==row['sha256']
    files.append(dict(path=path,sha256=sha(HERE/path),url=row['url'],origin='../attempt01/source_headers_network_allowed.json'))
license_path=HERE/'source_reference/v8/LICENSE'
assert sha(license_path)==read(OLD/'source_manifest.json')['license_sha256']
out=HERE/'source_manifest.json';assert not out.exists();out.write_text(json.dumps(dict(reference_commit='37fb84941c9be9f9914ee50b1ad366f06a1bd764',actual_d8_build_commit=None,files=files,license_sha256=sha(license_path),network_requests=0),indent=2)+'\n')
diff=''
for p in sorted((HERE/'engine').glob('eic_*')):
    old=OLD/'engine'/p.name
    if p.read_bytes()!=old.read_bytes():diff+=''.join(difflib.unified_diff(old.read_text().splitlines(True),p.read_text().splitlines(True),fromfile='attempt01/'+p.name,tofile='attempt02/'+p.name))
assert 'eic_opcodes.inc' in diff and 'eic_runtime.inc' not in diff
out=HERE/'attempt01_to_attempt02_safety.patch';assert not out.exists();out.write_text(diff)
print('Verified',len(files),'fixed V8 reference source records; no download',flush=True)
