"""Optional live identity audit, separate from data-only statistics."""
import argparse
from common import *
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--map',action='append',default=[]);a=ap.parse_args()
    mapping=[p.split('=',1) for p in a.map];rows=[]
    for v,x in read(HERE/'manifest.json')['artifacts'].items():
        p=x['path']
        for old,new in mapping:
            if p.startswith(old):p=new+p[len(old):];break
        actual=sha(p) if Path(p).is_file() else None
        rows.append(dict(variant=v,recorded_path=x['path'],mapped_path=p,expected=x['sha256'],actual=actual,status='MATCH' if actual==x['sha256'] else 'MISSING' if actual is None else 'MISMATCH'))
    print(json.dumps(rows,indent=2));assert all(r['status']=='MATCH' for r in rows)
if __name__=='__main__':main()
