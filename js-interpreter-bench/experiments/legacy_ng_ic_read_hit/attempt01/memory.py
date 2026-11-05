"""Separate GNU time small-launcher RSS checks, not formal performance samples."""
from common import *
def main():
    import run
    m=run.verify();assert read(HERE/'analysis/formal_audit.json')['status']=='PASS'
    tool=Path('/usr/bin/time');assert tool.exists(),'GNU time required; do not substitute wait4 floor'
    rows=[]
    for case in OCTANE_CASES:
        n=read(HERE/'selected'/f'{case}.json')['N'];path=run.script(case,n)
        for rep,seq in enumerate(['ACD','CDA','DAC']):
            for pos,v in enumerate(seq):
                stem=HERE/'raw/memory'/case/f'rep{rep}.{v}.pos{pos}';record=Path(str(stem)+'.json')
                if record.exists():rows.append(read(record));continue
                stem.parent.mkdir(parents=True,exist_ok=True);mf=Path(str(stem)+'.rss.txt')
                cmd=[str(tool),'-f','%M','-o',str(mf),'--',m['artifacts'][v]['path'],str(path)]
                start=time.perf_counter_ns();p=subprocess.run(cmd,cwd=ROOT,capture_output=True,timeout=300)
                rss=int(mf.read_text().strip());out=p.stdout.decode(errors='replace');err=p.stderr.decode(errors='replace')
                r=dict(campaign=m['campaign'],case=case,variant=v,rep=rep,order=pos,N=n,command=cmd,
                  binary_sha256=sha(cmd[-2]),script_sha256=sha(path),peak_rss_KiB=rss,
                  stdout=out,stderr=err,exit_code=p.returncode,timestamp=stamp(),outer_wall_ns=time.perf_counter_ns()-start,
                  method='GNU time small launcher, ru_maxrss KiB',performance_sample=False,instrumented=False,
                  valid=p.returncode==0 and not err and 'TEB_RESULT:' in out and rss>0)
                save(record,r);rows.append(r);assert r['valid'];print('MEMORY',case,v,rep,rss,flush=True)
    import statistics as st
    summary=[]
    for case in OCTANE_CASES:
        for v in VERSIONS:
            vals=[r['peak_rss_KiB'] for r in rows if r['case']==case and r['variant']==v]
            summary.append(dict(case=case,variant=v,n=len(vals),median_KiB=st.median(vals),min_KiB=min(vals),max_KiB=max(vals),values_KiB=json.dumps(vals)))
    csvout(HERE/'analysis/memory.csv',summary);print('MEMORY_COMPLETE',len(rows),flush=True)
if __name__=='__main__':main()
