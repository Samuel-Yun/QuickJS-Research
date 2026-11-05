"""Optional actual-artifact audit; separate from portable statistics."""
import argparse
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('--map',action='append',default=[],help='oldprefix=newprefix; path mapping only, hashes remain frozen');a=p.parse_args()
    maps=[x.split('=',1) for x in a.map];rows=[]
    m=read(HERE/'manifest.json')
    for v,art in m['artifacts'].items():
        path=art['path']
        for old,new in maps:
            if path.startswith(old):path=new+path[len(old):];break
        exists=Path(path).is_file();actual=sha(path) if exists else None
        rows.append(dict(variant=v,original_path=art['path'],checked_path=path,available=exists,expected_sha256=art['sha256'],actual_sha256=actual,match=actual==art['sha256'] if exists else None))
    print(json.dumps(dict(status='PASS' if all(r['match'] for r in rows) else 'MISSING_OR_MISMATCH',artifacts=rows),indent=2))
    if not all(r['match'] for r in rows):raise SystemExit(1)
if __name__=='__main__':main()
