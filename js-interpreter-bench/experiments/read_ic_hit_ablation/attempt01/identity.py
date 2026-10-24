"""Optional live artifact verification, separate from data replay."""
import argparse
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('--map',action='append',default=[]);a=p.parse_args();maps=[s.split('=',1) for s in a.map];m=read(HERE/'manifest.json');rows=[]
    for v,item in m['artifacts'].items():
        path=item['path']
        for old,new in maps:
            if path.startswith(old):path=new+path[len(old):];break
        actual=sha(path) if Path(path).is_file() else None;rows.append(dict(condition=v,path=path,expected=item['sha256'],actual=actual,match=actual==item['sha256'] if actual else None,mode_value=item['mode_value']))
    print(json.dumps(dict(status='PASS' if all(r['match'] for r in rows) else 'MISSING_OR_MISMATCH',records=rows),indent=2))
    if not all(r['match'] for r in rows):raise SystemExit(1)
if __name__=='__main__':main()
