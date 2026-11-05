"""Dual-hash verification/restore of compressed counters. Data only."""
import argparse
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('mode',choices=['verify','restore']);p.add_argument('--destination');a=p.parse_args()
    dest=Path(a.destination).resolve() if a.destination else None
    if a.mode=='restore':assert dest and not dest.exists();dest.mkdir(parents=True)
    rows=[]
    for p in sorted((HERE/'raw/diagnostic').glob('*.gz')):
        meta=read(str(p)+'.metadata.json');assert sha(p)==meta['compressed_sha256'];h=hashlib.sha256();size=0
        with gzip.open(p,'rb') as inp:
            out=(dest/p.stem).open('xb') if dest else None
            try:
                for b in iter(lambda:inp.read(1024*1024),b''):
                    h.update(b);size+=len(b)
                    if out:out.write(b)
            finally:
                if out:out.close()
        assert h.hexdigest()==meta['original_sha256'] and size==meta['original_bytes']
        rows.append(dict(archive=p.relative_to(HERE).as_posix(),original_sha256=h.hexdigest(),compressed_sha256=sha(p),original_bytes=size,compressed_bytes=p.stat().st_size))
    if a.mode=='verify':save(HERE/'analysis/archive_verification.json',dict(status='PASS',files=rows,license='QuickJS MIT; Octane BSD, original notices retained; new changes follow repository license'))
    print('ARCHIVES_VERIFIED',len(rows),flush=True)
if __name__=='__main__':main()
