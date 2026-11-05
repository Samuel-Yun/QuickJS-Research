"""Recompute public data into NEW output paths; no Linux executable access."""
import importlib.util,math
from common import *
def main():
    dest=HERE/'analysis/portable_replay'
    def output(p,value):save(dest/Path(p).relative_to(HERE),value)
    def csvlf(p,rows):
        out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);output(p,out.getvalue())
    for file,stages in [('analyze.py',['formal','diagnostics']),('supplementary.py',['main'])]:
        ns={'__name__':'portable_replay'};exec(compile((HERE/file).read_text(encoding='utf-8'),str(HERE/file),'exec'),ns)
        ns.update(save=output,csvout=csvlf)
        for stage in stages:ns[stage]()
    checks=[]
    def numeric_equal(a,b):
        if isinstance(a,dict):return isinstance(b,dict) and a.keys()==b.keys() and all(numeric_equal(a[k],b[k]) for k in a)
        if isinstance(a,list):return isinstance(b,list) and len(a)==len(b) and all(numeric_equal(x,y) for x,y in zip(a,b))
        if isinstance(a,(float,int)) and not isinstance(a,bool):return isinstance(b,(float,int)) and math.isclose(a,b,rel_tol=1e-12,abs_tol=1e-12)
        return a==b
    for p in sorted(dest.rglob('*')):
        if not p.is_file():continue
        old=HERE/p.relative_to(dest);newb,oldb=p.read_bytes(),old.read_bytes();equal=newb==oldb
        numeric=equal
        if not equal and p.suffix=='.json':numeric=numeric_equal(json.loads(newb),json.loads(oldb))
        if not equal and p.suffix=='.csv':
            x=list(csv.DictReader(io.StringIO(newb.decode())));y=list(csv.DictReader(io.StringIO(oldb.decode())))
            def convert(v):
                try:return float(v)
                except (ValueError,TypeError):return v
            numeric=numeric_equal([{k:convert(v) for k,v in r.items()} for r in x],[{k:convert(v) for k,v in r.items()} for r in y])
        assert numeric,(p,'replay mismatch')
        checks.append(dict(path=p.relative_to(dest).as_posix(),byte_identical=equal,numeric_match=numeric,sha256=digest(newb)))
    save(HERE/'analysis/portable_replay_audit.json',dict(status='PASS',host_platform=platform.platform(),python=platform.python_version(),
      requires_Linux_or_old_binaries=False,records=1890,diagnostic_campaign_runs=42,output_files=checks,old_outputs_modified=False))
    print('PORTABLE_REPLAY_PASS',len(checks),flush=True)
if __name__=='__main__':main()
