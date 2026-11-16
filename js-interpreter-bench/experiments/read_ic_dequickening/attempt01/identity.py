"""Optional live source/artifact identity, isolated from public-data statistics."""
import argparse
from common import *
def main():
    p=argparse.ArgumentParser();p.add_argument('--map',action='append',default=[]);p.add_argument('--save-post',action='store_true');a=p.parse_args();maps=[x.split('=',1) for x in a.map]
    remap=lambda path:next((new+path[len(old):] for old,new in maps if path.startswith(old)),path)
    m=read(HERE/'manifest.json');ids=read(HERE/'sources/identities.json')['files'];rows=[]
    for v,item in m['artifacts'].items():
        path=remap(item['path']);source=Path(remap(item['source']));actual=sha(path) if Path(path).is_file() else None
        bad=[n for n,h in ids[v].items() if not (source/n).is_file() or sha(source/n)!=h]
        rows.append(dict(variant=v,path=path,expected=item['sha256'],actual=actual,match=actual==item['sha256'],source_files_checked=len(ids[v]),source_mismatches=bad))
    ok=all(r['match'] and not r['source_mismatches'] for r in rows);r=dict(status='PASS' if ok else 'MISSING_OR_MISMATCH',records=rows)
    if a.save_post:save(HERE/'analysis/post_identity.json',dict(**r,checked_at=stamp()))
    print(json.dumps(r,indent=2));assert ok
if __name__=='__main__':main()
