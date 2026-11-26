"""Idle-only WSL lifetime helper; no workload, configuration change, or VM shutdown."""
import os,sys,time
from pathlib import Path
import run
assert sys.argv[1:]==['IC_SEARCH_V2_FINAL_IDLE']
run.lab.save(run.HERE/'final_idle.json',dict(pid=os.getpid(),uid=os.getuid(),boot_id=run.lab.boot(),
    command=Path('/proc/self/cmdline').read_bytes().decode().split('\0')[:-1],seconds=43200,
    purpose='sleep only, prevent idle WSL shutdown between stages; no compiler or benchmark',
    old_helper_pid=515,old_helper_not_terminated=True))
print('IC_SEARCH_V2_FINAL_IDLE',os.getpid(),run.lab.boot(),flush=True)
time.sleep(43200)
