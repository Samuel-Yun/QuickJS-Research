"""Standard-library replay into a new directory each time; no old ELF/cached CSV dependency."""
import argparse,math,re,statistics as st,tempfile
from common import *
def equal(a,b):
    if isinstance(a,dict):return isinstance(b,dict) and a.keys()==b.keys() and all(equal(a[k],b[k]) for k in a)
    if isinstance(a,list):return isinstance(b,list) and len(a)==len(b) and all(equal(x,y) for x,y in zip(a,b))
    if isinstance(a,(int,float)) and not isinstance(a,bool):return isinstance(b,(int,float)) and math.isclose(a,b,rel_tol=1e-12,abs_tol=1e-12)
    return a==b
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output-root');a=ap.parse_args();parent=Path(a.output_root) if a.output_root else HERE/'replays';parent.mkdir(parents=True,exist_ok=True)
    dest=Path(tempfile.mkdtemp(prefix='replay_',dir=parent))
    protected=[*sorted((HERE/'raw').rglob('*')),*sorted((HERE/'analysis').glob('*')),HERE/'manifest.json',HERE/'measurement_manifest.json',HERE/'protocol.json',HERE/'frozen.json']
    before={p:sha(p) for p in protected if p.is_file()};checks=[]
    def output(p,v):save(dest/Path(p).relative_to(HERE),v)
    def csvlf(p,rows):
        out=io.StringIO(newline='');w=csv.DictWriter(out,list(rows[0]),lineterminator='\n');w.writeheader();w.writerows(rows);output(p,out.getvalue())
    def fresh_load(name):
        with (dest/'analysis'/name).open(encoding='utf-8',newline='') as f:return list(csv.DictReader(f))
    for file,stage in [('analyze.py','formal'),('diagnostic.py','summarize'),('lifetime_sites.py','main')]:
        ns={'__name__':'replay'};exec(compile((HERE/file).read_text(encoding='utf-8'),str(HERE/file),'exec'),ns);ns.update(save=output,csvout=csvlf);ns[stage]()
    memory=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];rows=[]
    for c in OCTANE_CASES:
        for v in VERSIONS:
            rr=sorted([r for r in memory if r['case']==c and r['variant']==v],key=lambda r:r['rep']);assert len(rr)==3 and all(r['valid'] for r in rr)
            vals=[r['peak_rss_KiB'] for r in rr];rows.append(dict(case=c,variant=v,n=3,median_KiB=st.median(vals),min_KiB=min(vals),max_KiB=max(vals),values_KiB=json.dumps(vals)))
    csvlf(HERE/'analysis/memory.csv',rows)
    correct=[read(p) for p in (HERE/'raw/correctness').glob('*/*.json')]
    correctness_rows=[dict(case=r['case'],variant=r['variant'],N=r['N'],valid=str(r['valid']),exit_code=r['exit_code']) for r in correct]
    ns={'__name__':'replay'};exec(compile((HERE/'supplementary.py').read_text(encoding='utf-8'),str(HERE/'supplementary.py'),'exec'),ns);ns.update(save=output,csvout=csvlf,load=fresh_load,load_correctness=lambda:correctness_rows);ns['main']()
    def convert(s):
        try:return float(s)
        except (ValueError,TypeError):return s
    for p in sorted((dest/'analysis').iterdir(),key=lambda p:p.name):
        if not p.is_file():continue
        ref=HERE/p.relative_to(dest);b,old=p.read_bytes(),ref.read_bytes();identical=b==old;ok=identical
        if not ok and p.suffix=='.json':ok=equal(json.loads(b),json.loads(old))
        if not ok and p.suffix=='.csv':
            parse=lambda raw:[{k:convert(v) for k,v in row.items()} for row in csv.DictReader(io.StringIO(raw.decode()))];ok=equal(parse(b),parse(old))
        if not ok and p.suffix=='.svg':
            pattern=r'[-+]?\d+(?:\.\d+)?(?:[eE][-+]?\d+)?';x,y=b.decode(),old.decode();ok=re.sub(pattern,'#',x)==re.sub(pattern,'#',y) and equal(list(map(float,re.findall(pattern,x))),list(map(float,re.findall(pattern,y))))
        assert ok,('replay mismatch',str(p));checks.append(dict(path=p.relative_to(dest).as_posix(),byte_identical=identical,numeric_match=ok,sha256=sha(p)))
    assert all(sha(p)==h for p,h in before.items()),'protected raw/published file changed'
    save(dest/'audit.json',dict(status='PASS',output_directory=str(dest),host_platform=platform.platform(),python=platform.python_version(),rel_tol=1e-12,abs_tol=1e-12,outputs=checks,
      requires_old_ELF=False,uses_cached_intermediate_tables=False,protected_files=len(before),protected_snapshot_sha256=digest(json.dumps({p.relative_to(HERE).as_posix():h for p,h in before.items()},sort_keys=True).encode()),original_raw_and_outputs_unchanged=True))
    print('PORTABLE_REPLAY_PASS',len(checks),str(dest),flush=True)
if __name__=='__main__':main()
