"""Independent RSS method check; frozen uninstrumented binaries only.

Not a replacement for the 30-pair formal execution times. Check small shell
control first; GNU time launches qjs from a small fresh launcher, avoiding a
potential Python pre-exec RSS high-water floor.
"""
import json
from pathlib import Path
import statistics
import subprocess
import time
from datetime import datetime,timezone
from prepare_sources import HERE,ROOT,save,sha
import run

def main():
    m=run.verify();tool=Path('/usr/bin/time')
    if not tool.exists():
        save(HERE/'analysis/rss_method.json',dict(status='UNAVAILABLE',reason='/usr/bin/time absent',formal_RSS='os.wait4 unchanged'));return
    # No workload pre-run: these are separate memory-only processes.
    rows=[]
    for unit in ['shell_control',*run.SUPPORTED]:
        n=1 if unit=='shell_control' else run.read(HERE/'selected'/f'{unit}.json')['N']
        for rep in range(3):
            for pos,v in enumerate(['A','B'] if rep%2==0 else ['B','A']):
                stem=HERE/'raw/memory'/unit/f'rep{rep}.{v}.pos{pos}'
                record=Path(str(stem)+'.json')
                if record.exists():rows.append(run.read(record));continue
                stem.parent.mkdir(parents=True,exist_ok=True)
                memfile=Path(str(stem)+'.time.txt')
                cmd=[str(tool),'-f','%M','-o',str(memfile),'--',m['artifacts'][v]['path']]
                if unit=='shell_control':cmd+=['-e',"console.log('RSS_CONTROL_PASS')"]
                else:cmd+=[str(run.script(unit,n,False))]
                t=time.perf_counter_ns();p=subprocess.run(cmd,cwd=ROOT,capture_output=True,timeout=300)
                elapsed=time.perf_counter_ns()-t;out=p.stdout.decode(errors='replace');err=p.stderr.decode(errors='replace')
                rss=int(memfile.read_text().strip())
                valid=p.returncode==0 and not err and rss>0 and ('RSS_CONTROL_PASS' in out if unit=='shell_control' else 'TEB_RESULT:' in out)
                r=dict(case=unit,variant=v,rep=rep,order=pos,N=n,command=cmd,binary_sha256=m['artifacts'][v]['sha256'],
                    script_sha256=None if unit=='shell_control' else sha(cmd[-1]),valid=valid,exit_code=p.returncode,
                    stdout=out,stderr=err,peak_rss_kib=rss,outer_wall_ns=elapsed,
                    timestamp=datetime.now(timezone.utc).isoformat(),method='GNU time 1 fresh small launcher -> qjs; KiB',
                    performance_sample=False,instrumented_binary=False)
                save(record,r);rows.append(r);assert valid
                print('RSS_CHECK',unit,v,rep,rss,flush=True)
    summary=[]
    for unit in ['shell_control',*run.SUPPORTED]:
        rs={v:[r['peak_rss_kib'] for r in rows if r['case']==unit and r['variant']==v] for v in ['A','B']}
        summary.append(dict(case=unit,A_n=len(rs['A']),B_n=len(rs['B']),A_median_KiB=statistics.median(rs['A']),
            B_median_KiB=statistics.median(rs['B']),A_over_B=statistics.median(rs['A'])/statistics.median(rs['B'])))
    run.csvout(HERE/'analysis/rss_gnutime.csv',summary)
    formal=[run.read(p) for p in (HERE/'raw/formal').glob('*/*.json')]
    save(HERE/'analysis/rss_method.json',dict(status='CHECKED',formal_method='os.wait4 qjs child from Python parent; raw retained',
        formal_min_KiB=min(r['peak_rss_kib'] for r in formal),separate_check=summary[0],
        interpretation='compare GNU time controls before interpreting a fixed wait4 floor as engine memory; independent checks have 3 processes per variant/case, not 30',
        gnutime_sha256=sha(tool),counts=len(rows)))

if __name__=='__main__':main()
