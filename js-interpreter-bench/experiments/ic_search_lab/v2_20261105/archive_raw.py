"""Archive completed raw losslessly; retain local original, no deletion or runtime launch."""
import gzip,hashlib,json
from pathlib import Path
H=Path(__file__).resolve().parent
def main():
    assert not (H/'final_collector.lock').exists(),'collector still running'
    assert not (H/'raw_archive.json').exists(),'one closed archive, never replace old evidence'
    data=(H/'runs.jsonl').read_bytes();rows=[json.loads(s) for s in data.decode('utf-8').splitlines()]
    starts={r['token'] for r in rows if r['event']=='process_start'};ends={r['token'] for r in rows if r['event']=='process_result'}
    assert starts==ends,'incomplete child process; do not close archive'
    out=gzip.compress(data,compresslevel=9,mtime=0);assert gzip.decompress(out)==data
    with (H/'runs.jsonl.gz').open('xb') as f:f.write(out)
    meta=dict(file='runs.jsonl.gz',compressed_SHA256=hashlib.sha256(out).hexdigest(),uncompressed_SHA256=hashlib.sha256(data).hexdigest(),
        compressed_bytes=len(out),uncompressed_bytes=len(data),raw_newline='UTF-8 LF',original_retained=True,
        restore='gzip -dk runs.jsonl.gz (only if runs.jsonl is absent); analysis/audit read gzip directly if original absent',
        license='Contains this public experiment command/output records; source licenses remain in seed and referenced upstream files')
    (H/'raw_archive.json').write_text(json.dumps(meta,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(json.dumps(meta))
if __name__=='__main__':main()
