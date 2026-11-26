"""Native Windows read-only Git status, avoiding a blocked DrvFS Git walk."""
from common import *
def main():
    git=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    rows=[]
    for args in [['rev-parse','HEAD'],['branch','--show-current'],['status','--short']]:
        p=subprocess.run(git+args,capture_output=True,text=True,timeout=60,check=True)
        rows.append(dict(command=git+args,stdout=p.stdout,stderr=p.stderr,exit_code=p.returncode,timestamp=stamp()))
    save(HERE/'raw/host_git_status.json',dict(platform=platform.platform(),commands=rows,initial_status_before_new_attempt='clean (first read-only tool check)',purpose='Git-only client; runtimes/builds/measurements remain Linux WSL2'))
    save(HERE/'raw/build/git_status_interruption.json',dict(status='INTERRUPTED_READ_ONLY_DIAGNOSTIC',linux_process=548,parent_prepare_process=511,observed_state='D',observed_elapsed='07:05',operation='git status --short on /mnt/c repository',action='SIGTERM own prepare PID511; SIGKILL own git PID548; pending D-state exit not forcibly assumed complete',reason='avoid blocking independent work; native Windows Git records preserved instead',timestamp=stamp(),performance_started=False))
    print('NATIVE_GIT_STATUS_RECORDED',flush=True)
if __name__=='__main__':main()
