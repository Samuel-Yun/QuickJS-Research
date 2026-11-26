"""Single serial WSL worker; an idle worker also preserves the cohort boot."""
from common import *
def main():
    pin();STORE.mkdir(parents=True,exist_ok=True)
    dest=HERE/'worker_started.json'
    if dest.exists():dest=HERE/'worker_restarts'/(boot()+'.json')
    save(dest,dict(pid=os.getpid(),boot_id=boot(),timestamp=stamp()))
    while not (HERE/'STOP_WORKER').exists():
        for p in sorted((HERE/'queue').glob('*.json')):
            done=HERE/'jobs'/(p.stem+'.done.json');started=HERE/'jobs'/(p.stem+'.started.json')
            if done.exists() or started.exists():continue
            job=read(p)
            if any(not (HERE/'jobs'/(dep+'.done.json')).exists() or read(HERE/'jobs'/(dep+'.done.json'))['exit_code']!=0 for dep in job.get('requires',[])):continue
            save(started,dict(timestamp=stamp(),boot_id=boot(),job=job))
            cmd=['python3',str(HERE/job['script']),*job.get('args',[])]
            print('START',p.name,cmd,flush=True)
            r=capture(cmd,p.stem,cwd=HERE,timeout=job.get('timeout',36000))
            save(done,r);print('DONE',p.name,r['exit_code'],r['stdout'][-1000:],r['stderr'][-2500:],flush=True)
            if r['exit_code']!=0:print('JOB_FAILED_RETAINED_IDLE_FOR_EXPLICIT_NEXT_JOB',flush=True)
        time.sleep(1)
    save(HERE/'worker_stopped.json',dict(timestamp=stamp(),boot_id=boot()))
if __name__=='__main__':main()
