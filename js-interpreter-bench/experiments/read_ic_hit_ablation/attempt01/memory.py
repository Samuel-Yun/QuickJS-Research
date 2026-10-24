"""36 separate GNU time RSS processes; no data added to formal timing."""
import statistics as st
from common import *
MEMORY_CASES=['Richards.Richards','RegExp.RegExp','CodeLoad.CodeLoadClosure']
ORDERS=[['A','M','ON','LOOKUP'],['M','LOOKUP','A','ON'],['ON','A','LOOKUP','M']]
def summarize():
    rows=[read(p) for p in (HERE/'raw/memory').glob('*/*.json')];out=[]
    for c in MEMORY_CASES:
        for v in VERSIONS:
            rr=sorted([r for r in rows if r['case']==c and r['variant']==v],key=lambda r:r['rep']);assert len(rr)==3 and all(r['valid'] for r in rr)
            vals=[r['peak_rss_KiB'] for r in rr];out.append(dict(case=c,variant=v,n=3,median_KiB=st.median(vals),min_KiB=min(vals),max_KiB=max(vals),values_KiB=json.dumps(vals)))
    csvout(HERE/'analysis/memory.csv',out)
def main():
    import run
    m=run.verify();assert read(HERE/'analysis/formal_audit.json')['status']=='PASS'
    for c in MEMORY_CASES:
        n=read(HERE/'selected'/f'{c}.json')['N'];script=run.script(c,n)
        for rep,seq in enumerate(ORDERS):
            for pos,v in enumerate(seq):
                stem=HERE/'raw/memory'/c/f'rep{rep}.{v}.pos{pos}';record=Path(str(stem)+'.json')
                if record.exists():continue
                stem.parent.mkdir(parents=True,exist_ok=True);rsspath=Path(str(stem)+'.rss.txt');a=m['artifacts'][v]
                cmd=['/usr/bin/time','-f','%M','-o',str(rsspath),'--',a['path'],str(script)];start=time.perf_counter_ns();p=subprocess.run(cmd,cwd=ROOT,env=mode_env(v),capture_output=True,timeout=300);stop=time.perf_counter_ns()
                out,err=p.stdout.decode(errors='replace'),p.stderr.decode(errors='replace');rss=int(rsspath.read_text())
                r=dict(case=c,variant=v,N=n,rep=rep,order=pos,command=cmd,binary_sha256=sha(a['path']),script_sha256=sha(script),mode_value=config(v),timestamp=stamp(),outer_start_ns=start,outer_stop_ns=stop,peak_rss_KiB=rss,stdout=out,stderr=err,exit_code=p.returncode,valid=p.returncode==0 and not err and 'TEB_RESULT:' in out and rss>0,performance_sample=False)
                save(record,r);assert r['valid'];print('MEMORY',c,v,rep,rss,flush=True)
    summarize();print('MEMORY_36_COMPLETE',flush=True)
if __name__=='__main__':main()
