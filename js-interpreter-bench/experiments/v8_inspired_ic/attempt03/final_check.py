"""Portable delivery check: replay equivalence, finite statistics, SVG, file sizes.
Does not run a VM, need old native paths, or edit original raw.
"""
import csv,hashlib,json,math,xml.etree.ElementTree as ET
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent
def read(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def close(a,b):
    if isinstance(a,dict):return a.keys()==b.keys() and all(close(a[k],b[k]) for k in a)
    if isinstance(a,list):return len(a)==len(b) and all(close(x,y) for x,y in zip(a,b))
    if isinstance(a,(int,float)) and not isinstance(a,bool):return math.isfinite(a) and math.isclose(a,b,rel_tol=1e-12,abs_tol=1e-12)
    return a==b
def main():
    results={}
    for filename in ['samples.csv','statistics.csv','comparison.csv','ratios.csv','aggregate.csv']:
        def rows(folder):return list(csv.DictReader((HERE/folder/filename).open(encoding='utf-8')))
        a,b=rows('summary'),rows('replay_windows');assert len(a)==len(b),filename
        for x,y in zip(a,b):
            assert x.keys()==y.keys()
            for k in x:
                if x[k]==y[k]:continue
                assert math.isclose(float(x[k]),float(y[k]),rel_tol=1e-12,abs_tol=1e-12),(filename,k,x[k],y[k])
        results[filename]=dict(rows=len(a),numeric_replay_equal=True,relative_and_absolute_tolerance=1e-12)
    assert close(read(HERE/'summary/aggregate.json'),read(HERE/'replay_windows/aggregate.json'))
    assert read(HERE/'independent_audit.json')['status']==read(HERE/'independent_audit_windows.json')['status']=='PASS_COMPLETE'
    svgs=[]
    for p in sorted((HERE/'plots').glob('*.svg')):
        tree=ET.parse(p);points=tree.findall('.//{http://www.w3.org/2000/svg}circle');assert len(points)==17
        svgs.append(dict(path=p.relative_to(HERE).as_posix(),points=len(points),valid_XML=True))
    assert len(svgs)==3
    public=[]
    for p in HERE.parent.rglob('*'):
        if not p.is_file() or '__pycache__' in p.parts or p.suffix=='.pyc':continue
        n=p.stat().st_size;assert n<100*1024*1024,p
        with p.open('rb') as f:assert f.read(4)!=b'\x7fELF',p
        public.append(dict(path=p.relative_to(HERE.parent).as_posix(),bytes=n))
    raw=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
    assert len(raw)==1530 and all(r['valid'] for r in raw)
    cpu_ratios=[(r['child_user_ms']+r['child_system_ms'])/r['external_wall_ms'] for r in raw]
    result=dict(status='PASS',timestamp=datetime.now(timezone.utc).isoformat(),formal_valid=1530,portable_replay=results,
        aggregate_replay_equal=True,independent_WSL_and_Windows_audits='PASS_COMPLETE',SVG=svgs,
        public_files=len(public),public_total_bytes=sum(p['bytes'] for p in public),largest_files=sorted(public,key=lambda p:p['bytes'],reverse=True)[:8],
        no_ELF_in_experiment_tree=True,no_file_over_100MiB=True,max_whole_child_CPU_over_monotonic_wall=max(cpu_ratios),
        no_VM_executed_in_this_check=True,no_previous_cohort_timing_imported=True)
    dest=HERE/'delivery_audit.json';assert not dest.exists();dest.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
