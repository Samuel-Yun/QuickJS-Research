"""Recompute published data with stdlib, no executable access; preserve originals."""
import math,re
from common import *
def equal(a,b):
    if isinstance(a,dict):return isinstance(b,dict) and a.keys()==b.keys() and all(equal(a[k],b[k]) for k in a)
    if isinstance(a,list):return isinstance(b,list) and len(a)==len(b) and all(equal(x,y) for x,y in zip(a,b))
    if isinstance(a,(float,int)) and not isinstance(a,bool):return isinstance(b,(float,int)) and math.isclose(a,b,rel_tol=1e-12,abs_tol=1e-12)
    return a==b
def main():
    dest=HERE/'analysis/portable_replay'
    def output(p,value):save(dest/Path(p).relative_to(HERE),value)
    def csvlf(p,rows):
        out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);output(p,out.getvalue())
    for file,stages in [('analyze.py',['formal']),('diagnostic.py',['summarize']),('supplementary.py',['main'])]:
        ns={'__name__':'portable_replay'};exec(compile((HERE/file).read_text(encoding='utf-8'),str(HERE/file),'exec'),ns);ns.update(save=output,csvout=csvlf)
        for stage in stages:ns[stage]()
    checks=[]
    def convert(v):
        try:return float(v)
        except (ValueError,TypeError):return v
    for p in sorted(dest.rglob('*')):
        if not p.is_file():continue
        old=HERE/p.relative_to(dest);newb,oldb=p.read_bytes(),old.read_bytes();identical=newb==oldb;ok=identical
        if not ok and p.suffix=='.json':ok=equal(json.loads(newb),json.loads(oldb))
        if not ok and p.suffix=='.csv':
            parse=lambda b:[{k:convert(v) for k,v in r.items()} for r in csv.DictReader(io.StringIO(b.decode()))]
            ok=equal(parse(newb),parse(oldb))
        if not ok and p.suffix=='.svg':
            pattern=r'[-+]?\d+(?:\.\d+)?(?:[eE][-+]?\d+)?'
            a,b=newb.decode(),oldb.decode()
            ok=re.sub(pattern,'#',a)==re.sub(pattern,'#',b) and equal(list(map(float,re.findall(pattern,a))),list(map(float,re.findall(pattern,b))))
        assert ok,(p,'replay mismatch')
        checks.append(dict(path=p.relative_to(dest).as_posix(),byte_identical=identical,numeric_match=ok,sha256=digest(newb)))
    save(HERE/'analysis/portable_replay_audit.json',dict(status='PASS',host_platform=platform.platform(),python=platform.python_version(),
      records=2160,selected_diagnostic_runs=48,requires_Linux_or_old_binaries=False,outputs=checks,old_outputs_modified=False,
      relative_tolerance=1e-12,absolute_tolerance=1e-12))
    print('PORTABLE_REPLAY_PASS',len(checks),flush=True)
if __name__=='__main__':main()
