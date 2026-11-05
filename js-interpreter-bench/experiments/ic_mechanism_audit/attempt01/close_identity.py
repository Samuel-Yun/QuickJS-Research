"""Final local artifact/source identity, not a performance experiment."""
from common import *
def main():
    m=verify_runtime();sources={}
    for label,folder,files in [('M',m['M_source'],m['M_source_files']),('A',m['A_source'],m['A_source_files'])]:
        got={name:sha(Path(folder)/name) for name in files}
        assert got==files;sources[label]=got
    snapshots=read(HERE/'prepare_snapshot_gate.json');assert snapshots['status']=='PASS'
    assert sha(snapshots['artifact']['path'])==snapshots['artifact']['sha256']
    for x in snapshots['snapshots']:
        data=gzip.decompress((HERE/x['compressed_path']).read_bytes())
        assert hashlib.sha256(data).hexdigest()==x['uncompressed_sha256'] and sha(HERE/x['compressed_path'])==x['compressed_sha256']
    checked=[]
    for p in sorted((HERE/'raw/diagnostic').glob('*.identity.json')):
        d=read(p);archive=p.with_name(p.name.replace('.identity.json','.gz'))
        if not archive.exists():archive=p.with_name(p.name.replace('.identity.json','.json.gz'))
        assert sha(archive)==d['compressed_sha256'],archive
        data=gzip.decompress(archive.read_bytes());want=d.get('uncompressed_sha256',d.get('raw_sha256'))
        assert hashlib.sha256(data).hexdigest()==want
        checked.append(dict(path=archive.relative_to(HERE).as_posix(),sha256=sha(archive),uncompressed_sha256=want))
    save(HERE/'final_identity.json',dict(status='PASS',timestamp=stamp(),source_files=sources,diagnostic_archives=checked,formal_artifacts=m['artifacts'],v8_dependencies=m['v8_dependencies'],current_boot=boot(),note='final validation after post-formal diagnostics; monotonic origins of earlier boots not joined'))
    print('FINAL_ARTIFACT_SOURCE_AND_ARCHIVE_IDENTITY_PASS',flush=True)
if __name__=='__main__':main()
