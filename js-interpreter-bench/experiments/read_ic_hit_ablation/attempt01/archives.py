"""Verify/restore public compressed counters without live paths."""
import argparse
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['verify','restore']);p.add_argument('--destination');a=p.parse_args();dest=Path(a.destination) if a.destination else None
    if a.mode=='restore':assert dest and not dest.exists();dest.mkdir(parents=True)
    rows=[]
    # pathlib's Windows ordering folds case; use the same filename order on Linux/Windows.
    for f in sorted((HERE/'raw/diagnostic').glob('*.gz'),key=lambda p:p.name):
        meta=read(str(f)+'.metadata.json');assert sha(f)==meta['compressed_sha256'];h=hashlib.sha256();n=0
        with gzip.open(f,'rb') as inp:
            out=(dest/f.stem).open('xb') if dest else None
            try:
                for b in iter(lambda:inp.read(1024*1024),b''):
                    h.update(b);n+=len(b)
                    if out:out.write(b)
            finally:
                if out:out.close()
        assert h.hexdigest()==meta['original_sha256'] and n==meta['original_bytes'];rows.append(dict(path=f.relative_to(HERE).as_posix(),compressed_sha256=sha(f),original_sha256=h.hexdigest(),compressed_bytes=f.stat().st_size,original_bytes=n))
    if a.mode=='verify':save(HERE/'analysis/archives.json',dict(status='PASS',files=rows,license='QuickJS MIT; Octane BSD; original notices retained'))
    print('ARCHIVES_VERIFIED',len(rows),flush=True)
if __name__=='__main__':main()
