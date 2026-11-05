"""Stop only this round's verified idle helper, never a benchmark or WSL itself."""
import os,signal
from pathlib import Path
import run
H=run.HERE;lab=run.lab
assert lab.load(H/'completion.json')['formal_valid']==4380
assert lab.load(H/'audit.json')['status']=='PASS_COMPLETE_BOUNDED_SEARCH'
assert not (H/'final_collector.lock').exists()
d=lab.load(H/'final_idle.json');pid=d['pid'];proc=Path('/proc')/str(pid)
if not proc.exists():result=dict(status='ALREADY_EXITED',pid=pid)
else:
    actual=proc.joinpath('cmdline').read_bytes().decode().split('\0')[:-1]
    assert pid!=os.getpid() and proc.stat().st_uid==d['uid'] and lab.boot()==d['boot_id']
    assert actual==d['command'] and 'IC_SEARCH_V2_FINAL_IDLE' in actual
    os.kill(pid,signal.SIGTERM)
    result=dict(status='SIGTERM_ONLY_OWN_VERIFIED_IDLE',pid=pid,uid=d['uid'],command=actual,boot_id=lab.boot())
lab.save(H/'idle_cleanup.json',result|dict(WSL_shutdown=False,other_processes_terminated=False,raw_modified=False))
print(result,flush=True)
