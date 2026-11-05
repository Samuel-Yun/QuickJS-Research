"""Raw-only early site selection by maintenance counts, not a time ranking."""
import csv,gzip,hashlib,io,json,re
from pathlib import Path
HERE=Path(__file__).resolve().parent
def load(p):return json.loads(gzip.decompress(p.read_bytes()))
def put(p,x):
    p.parent.mkdir(parents=True,exist_ok=True);b=(json.dumps(x,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==b
    else:p.write_bytes(b)
def main():
    rows=[];functions=[]
    for name in ['Splay.Splay','Richards.Richards']:
        p=HERE/'diagnostic/raw'/f'{name}.M.N2.json.gz';d=load(p)
        for f in d['functions']:
            source=bytes.fromhex(f['source_hex']);fn=bytes.fromhex(f['function_hex']).decode(errors='replace')
            if b'dummy = left = right' in source:fn='SplayTree.prototype.splay_'
            for op in f['opcodes']:
                for st in op['phases']:
                    if st['phase']==2 and '_rdi' in op['before_op']:
                        rows.append(dict(case=name,function=fn,source_sha256=hashlib.sha256(source).hexdigest(),instance_id=f['instance_id'],pc=op['pc'],atom=bytes.fromhex(op['atom_hex']).decode(errors='replace'),**st))
            if b'dummy = left = right' in source:functions.append(f)
    splay=sorted([r for r in rows if r['case']=='Splay.Splay'],key=lambda x:x['replacements'],reverse=True)
    rich=sorted([r for r in rows if r['case']=='Richards.Richards'],key=lambda x:x['operations'],reverse=True)
    target=[r for r in splay if r['function']=='SplayTree.prototype.splay_' and r['atom'] in ['key','left','right']][:3]
    assert len(target)==3,target
    put(HERE/'diagnostic/focus_plan.json',dict(selection='three highest Run replacement counts within original splay_ key/left/right, not a timing ranking',targets=target,splay_top=splay[:12],richards_top=rich[:12]))
    put(HERE/'diagnostic/splay_final_dump.json',functions)
    print(json.dumps(dict(targets=target,splay_top=splay[:8],richards_top=rich[:8]),ensure_ascii=False,indent=2))
if __name__=='__main__':main()
