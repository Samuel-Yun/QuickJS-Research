"""Retire the paused, now-failed E campaign without replacing any artifact."""
from common import *
import signal
pause=read(HERE/'safety_pause.json');pid=pause['pid']
argv=Path(f'/proc/{pid}/cmdline').read_bytes().split(b'\0')
assert b'campaign.py' in argv and boot()==pause['boot_id']
assert sha(BUILD/'E/qjs')==runtime()['artifacts']['E']['sha256']
assert read(HERE/'raw/validation/finalizer_store_v2/A.run.json')['exit_code']==0
assert read(HERE/'raw/validation/finalizer_store_v2/E.run.json')['exit_code']!=0
assert 'heap-use-after-free' in read(HERE/'raw/validation/finalizer_store_v2/E_san.run.json')['stderr']
files=list((HERE/'raw/formal').rglob('*.json'))
save(HERE/'campaign_stop.json',dict(status='BLOCKED_CORRECTNESS',timestamp=stamp(),boot_id=boot(),formal_completed=len(files),planned=1530,
    reason='Additional finalizer/C-API regression passes A, fails frozen E, ASan reports stale JSProperty pointer at own-store miss after cached shape release. Earlier PASS gates were incomplete.',
    formal_results_admissible=False,next_attempt='attempt02',original_binary_unchanged=True))
os.kill(pid,signal.SIGTERM);os.kill(pid,signal.SIGCONT)
print('Stopped paused collector PID',pid,'retained records',len(files),flush=True)
