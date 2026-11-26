"""Read-only final runtime/input/archive verification, no new workloads."""
from common import *
def main():
    m=verify();checked=[]
    for p in sorted((HERE/'raw/diagnostic').glob('*.identity.json')):
        d=read(p);arc=HERE/d['compressed'];raw=gzip.decompress(arc.read_bytes())
        assert sha(arc)==d['compressed_sha256'] and hashlib.sha256(raw).hexdigest()==d['uncompressed_sha256']
        checked.append(dict(path=d['compressed'],compressed_sha256=sha(arc),uncompressed_sha256=d['uncompressed_sha256']))
    for name,identity in read(HERE/'inputs.json').items():assert sha(HERE/'inputs'/name)==identity['sha256']
    for f in read(HERE/'source_reference/manifest.json')['files']:
        if f['status']=='AVAILABLE':assert sha(HERE/'source_reference'/f['path'])==f['sha256']
    for f in read(HERE/'source_reference/reused_identity.json')['files']:assert sha(ROOT/f['path'])==f['sha256']
    save(HERE/'final_identity.json',dict(status='PASS',timestamp=stamp(),artifacts=m['artifacts'],dependencies=m['v8_dependencies'],archives=checked,inputs_unchanged=True,fixed_source_verified=True,no_runtime_rebuild=True,current_boot=boot(),note='formal single boot independently checked; post-run verification does not join different boot clocks'))
    print('FINAL_RUNTIME_INPUT_ARCHIVE_IDENTITY_PASS',flush=True)
if __name__=='__main__':main()
