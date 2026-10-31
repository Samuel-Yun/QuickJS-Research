"""Optional artifact identity audit, separated from portable data analysis.

--map OLD_PREFIX=NEW_PREFIX is explicit path remapping, not silent hash relaxation.
"""
import argparse
from common import *
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--map',action='append',default=[]);a=ap.parse_args()
    mapping=[s.split('=',1) for s in a.map];out=[]
    for v,artifact in read(HERE/'manifest.json')['artifacts'].items():
        path=artifact['path']
        for old,new in mapping:
            if path.startswith(old):path=new+path[len(old):];break
        p=Path(path);actual=sha(p) if p.exists() else None
        out.append(dict(variant=v,original_path=artifact['path'],checked_path=path,expected_sha256=artifact['sha256'],actual_sha256=actual,
          status='MISSING' if actual is None else ('MATCH' if actual==artifact['sha256'] else 'MISMATCH')))
    print(json.dumps(out,ensure_ascii=False,indent=2))
    raise SystemExit(0 if all(r['status']=='MATCH' for r in out) else 1)
if __name__=='__main__':main()
