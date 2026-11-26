"""Freeze small public replay fixtures byte-for-byte; no engine/private access."""
import hashlib,json
from pathlib import Path
HERE=Path(__file__).resolve().parent
PREV=HERE.parents[1]/'ic_fast_slow_20261102/attempt01/octane'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
    files=[]
    for src,name in [(PREV/'case_catalog.json','case_catalog.json'),(PREV/'inputs/octane/splay.js','splay.js'),(PREV/'inputs/octane/richards.js','richards.js')]:
        dst=HERE/'inputs'/name;dst.parent.mkdir(parents=True,exist_ok=True)
        if dst.exists():assert dst.read_bytes()==src.read_bytes()
        else:
            with dst.open('xb') as f:f.write(src.read_bytes())
        files.append(dict(path='inputs/'+name,sha256=sha(dst),source=str(src.relative_to(HERE.parents[2]))))
    out=HERE/'inputs/replay_manifest.json'
    with out.open('x',encoding='utf-8') as f:json.dump(dict(files=files,private_source=False),f,indent=2)
    print('PUBLIC_REPLAY_FIXTURES_FROZEN')
if __name__=='__main__':main()
