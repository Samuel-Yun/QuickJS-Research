"""Pause the collector, let any current child finish, preserve the cohort.
No runtime/source changes; a subsequent resume must explicitly signal this PID.
"""
import json, os, signal, time
from pathlib import Path
HERE=Path(__file__).resolve().parent
matches=[]
for d in Path('/proc').iterdir():
    if not d.name.isdigit(): continue
    try:
        argv=(d/'cmdline').read_bytes().split(b'\0')
        if any(x==b'campaign.py' for x in argv): matches.append(int(d.name))
    except (OSError,ValueError): pass
assert len(matches)==1,matches
pid=matches[0]
os.kill(pid,signal.SIGSTOP)
deadline=time.monotonic()+350
while True:
    running=[]
    for d in Path('/proc').iterdir():
        if not d.name.isdigit():continue
        try:
            stat=(d/'stat').read_text().split(') ',1)[1].split()
            if int(stat[1])==pid and stat[0]!='Z':running.append((int(d.name),stat[0]))
        except (OSError,ValueError):pass
    if not running:break
    assert time.monotonic()<deadline,running
    time.sleep(.25)
record=dict(pid=pid,timestamp=time.time(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
    state='PAUSED_PENDING_EXTRA_C_API_SAFETY_PROBE',reason='Investigate release of retained prototype graphs before an own-store commit; not a proven defect yet.',
    no_live_direct_child=True,formal_files=len(list((HERE/'raw/formal').rglob('*.json'))))
out=HERE/'safety_pause.json'
assert not out.exists()
out.write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps(record),flush=True)
doc=Path('/home/mzyx/read_ic_dequickening_attempt01/A/doc/quickjs.texi')
if doc.exists():
    lines=doc.read_text().splitlines()
    for i,l in enumerate(lines):
        if 'finalizer' in l.lower():print('\n'.join(f'{j+1}: {lines[j]}' for j in range(max(0,i-3),min(len(lines),i+7))))
