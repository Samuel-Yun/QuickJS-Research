"""Resume missing formal positions without rewriting the original pre_formal snapshot."""
import argparse
from common import *
import run
def main():
    p=argparse.ArgumentParser();p.add_argument('--check-only',action='store_true');a=p.parse_args()
    f=read(HERE/'frozen.json')
    for k,name in [('protocol_sha256','protocol.json'),('measurement_manifest_sha256','measurement_manifest.json'),('schedule_sha256','schedule.json')]:assert sha(HERE/name)==f[k]
    todo=[]
    for row in read(HERE/'schedule.json'):
        path=HERE/'raw/formal'/row['case']/f'rep{row["rep"]}.N{row["N"]}.{row["variant"]}.pos{row["order"]}.json'
        if not path.exists():todo.append(row)
    print('MISSING_POSITIONS',len(todo),'existing records including failures are never retried',flush=True)
    if a.check_only or not todo:return
    run.verify();label=1
    while (HERE/'raw/environment'/f'resume{label}_before.json').exists():label+=1
    environment(f'resume{label}_before')
    for r in todo:run.invoke('formal',r['case'],r['variant'],r['N'],r['rep'],r['order'])
    run.verify();environment(f'resume{label}_after')
    if not (HERE/'raw/environment/post_formal.json').exists():environment('post_formal')
    print('RESUME_COMPLETED',flush=True)
if __name__=='__main__':main()
