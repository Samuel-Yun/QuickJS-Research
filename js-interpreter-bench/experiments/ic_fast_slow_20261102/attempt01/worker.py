"""Serial local research job worker. Keeps the WSL cohort alive; no network/service."""
from common import *
import traceback
def main():
    save(HERE/'worker_started.json',dict(pid=os.getpid(),boot_id=boot(),timestamp=stamp()))
    jobs=HERE/'jobs';jobs.mkdir(exist_ok=True)
    print('WORKER_STARTED',boot(),flush=True)
    while True:
        for p in sorted(jobs.glob('*.request.json')):
            identifier=p.name.removesuffix('.request.json')
            done=jobs/(identifier+'.done.json');started=jobs/(identifier+'.started.json')
            if done.exists():continue
            if started.exists():
                save(jobs/(identifier+'.orphan.json'),dict(status='ORPHAN_STARTED_NOT_RETRIED',boot_id=boot()));continue
            req=read(p);cmd=req['command'];assert cmd[0]=='python3'
            assert Path(cmd[1]).resolve().is_relative_to(HERE.resolve())
            save(started,dict(boot_id=boot(),timestamp=stamp(),command=cmd))
            print('JOB_START',identifier,flush=True)
            with (jobs/(identifier+'.stdout.log')).open('xb') as out,(jobs/(identifier+'.stderr.log')).open('xb') as err:
                result=subprocess.run(cmd,cwd=HERE,stdout=out,stderr=err)
            save(done,dict(exit_code=result.returncode,boot_id=boot(),timestamp=stamp()))
            print('JOB_END',identifier,result.returncode,flush=True)
        if (HERE/'STOP_WORKER').exists():
            save(HERE/'worker_stopped.json',dict(timestamp=stamp(),boot_id=boot()));return
        time.sleep(2)
if __name__=='__main__':main()
