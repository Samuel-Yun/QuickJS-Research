"""Fresh-path replay, including old format; no old ELF or cached tables needed."""
import argparse,importlib.util,math,re,statistics as st,sys,tempfile
from common import *
def equal(a,b):
    if isinstance(a,dict):return isinstance(b,dict) and a.keys()==b.keys() and all(equal(a[k],b[k]) for k in a)
    if isinstance(a,list):return isinstance(b,list) and len(a)==len(b) and all(equal(x,y) for x,y in zip(a,b))
    if isinstance(a,(int,float)) and not isinstance(a,bool):return isinstance(b,(int,float)) and math.isclose(a,b,rel_tol=1e-12,abs_tol=1e-12)
    return a==b
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--previous',action='store_true');ap.add_argument('--output-root');a=ap.parse_args()
    source=PREVIOUS if a.previous else HERE;parent=Path(a.output_root) if a.output_root else HERE/'replays';parent.mkdir(parents=True,exist_ok=True)
    dest=Path(tempfile.mkdtemp(prefix='previous_' if a.previous else 'current_',dir=parent));checks=[]
    spec=importlib.util.spec_from_file_location('replay_common_isolated',source/'common.py');cm=importlib.util.module_from_spec(spec);spec.loader.exec_module(cm)
    old_common=sys.modules.get('common');oldpath=sys.path.copy();names=['aggregate_ci','analyze','diagnostic','mechanism','micros','run','supplementary','memory'];saved={k:sys.modules.pop(k,None) for k in names};sys.modules['common']=cm;sys.path.insert(0,str(source))
    def output(p,value):save(dest/Path(p).relative_to(source),value)
    def csvlf(p,rows):
        out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);output(p,out.getvalue())
    def fresh_load(name):
        with (dest/'analysis'/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
    try:
        stages=[('analyze.py','formal' if a.previous else 'main'),('diagnostic.py','summarize')]
        for file,stage in stages:
            ns={'__name__':'replay'};exec(compile((source/file).read_text(encoding='utf-8'),str(source/file),'exec'),ns);ns.update(save=output,csvout=csvlf);ns[stage]()
        # Rebuild RSS from public raw rather than copying cached memory.csv.
        memory=[cm.read(p) for p in (source/'raw/memory').glob('*/*.json')];memoryrows=[]
        cases=cm.OCTANE_CASES if a.previous else ['Richards.Richards','RegExp.RegExp','CodeLoad.CodeLoadClosure']
        for c in cases:
            for v in cm.VERSIONS:
                rr=sorted([r for r in memory if r['case']==c and r['variant']==v],key=lambda r:r['rep']);assert len(rr)==3 and all(r['valid'] for r in rr)
                vals=[r['peak_rss_KiB'] for r in rr];memoryrows.append(dict(case=c,variant=v,n=3,median_KiB=st.median(vals),min_KiB=min(vals),max_KiB=max(vals),values_KiB=json.dumps(vals)))
        csvlf(source/'analysis/memory.csv',memoryrows)
        ns={'__name__':'replay'};exec(compile((source/'supplementary.py').read_text(encoding='utf-8'),str(source/'supplementary.py'),'exec'),ns);ns.update(save=output,csvout=csvlf,load=fresh_load);ns['main']()
    finally:
        sys.path[:]=oldpath
        if old_common is not None:sys.modules['common']=old_common
        for n in names:
            sys.modules.pop(n,None)
            if saved[n] is not None:sys.modules[n]=saved[n]
    def convert(s):
        try:return float(s)
        except (ValueError,TypeError):return s
    for p in sorted((dest/'analysis').glob('*')):
        if not p.is_file():continue
        ref=source/p.relative_to(dest);b,old=p.read_bytes(),ref.read_bytes();identical=b==old;ok=identical
        if not ok and p.suffix=='.json':ok=equal(json.loads(b),json.loads(old))
        if not ok and p.suffix=='.csv':
            parse=lambda data:[{k:convert(v) for k,v in r.items()} for r in csv.DictReader(io.StringIO(data.decode()))]
            ok=equal(parse(b),parse(old))
        if not ok and p.suffix=='.svg':
            pattern=r'[-+]?\d+(?:\.\d+)?(?:[eE][-+]?\d+)?';x,y=b.decode(),old.decode()
            ok=re.sub(pattern,'#',x)==re.sub(pattern,'#',y) and equal(list(map(float,re.findall(pattern,x))),list(map(float,re.findall(pattern,y))))
        assert ok,(str(p),'numerical/structure replay mismatch')
        checks.append(dict(path=p.relative_to(dest).as_posix(),byte_identical=identical,numeric_match=ok,sha256=digest(b)))
    save(dest/'audit.json',dict(status='PASS',source=source.relative_to(ROOT).as_posix(),output_directory=str(dest),host_platform=platform.platform(),python=platform.python_version(),
      rel_tol=1e-12,abs_tol=1e-12,outputs=checks,requires_old_ELF=False,uses_cached_intermediate_tables=False,old_outputs_changed=False))
    print('PORTABLE_REPLAY_PASS',len(checks),str(dest),flush=True)
if __name__=='__main__':main()
