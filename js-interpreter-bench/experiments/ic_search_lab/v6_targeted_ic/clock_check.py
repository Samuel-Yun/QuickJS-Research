"""Finite clock diagnosis. A saved STOP is never removed or rewritten."""
import json
import os
from pathlib import Path
import sys
import time
import experiment as e

name=sys.argv[1]
assert name.replace('_','').isalnum() and name!='initial'
assert (e.H/'STOP.json').exists()
rows=[]
for i in range(31):
    rows.append(dict(index=i,realtime_ns=time.time_ns(),monotonic_ns=time.monotonic_ns(),
                     raw_ns=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW),
                     boottime_ns=time.clock_gettime_ns(time.CLOCK_BOOTTIME),boot_id=e.lab.boot()))
    if i%5==0:print('CLOCK_CHECK',name,i,flush=True)
    if i<30:time.sleep(1)
first=rows[0]
drift=max(abs((r['realtime_ns']-first['realtime_ns'])-(r['monotonic_ns']-first['monotonic_ns']))/1e9 for r in rows)
status='PASS_BOUNDED_CLOCK_CHECK' if len({r['boot_id'] for r in rows})==1 and drift<=1 else 'BLOCKED_CLOCK_CHECK'
file='clock_check.'+name+'.json'
e.save(file,dict(status=status,observations=rows,max_realtime_monotonic_drift_seconds=drift,
                 threshold_seconds=1,prior_STOP_sha256=e.lab.sha(e.H/'STOP.json'),not_proof_of_long_term_stability=True))
if status=='PASS_BOUNDED_CLOCK_CHECK':
    env=e.lab.load(e.H/'environment.json')
    env.update(uname=e.os.uname(),os_release=Path('/etc/os-release').read_text(),
               cpuinfo=Path('/proc/cpuinfo').read_text(),memory=Path('/proc/meminfo').read_text(),
               compiler=e.subprocess.check_output(['gcc','--version'],text=True))
    env.update(timestamp=e.lab.stamp(),boot_id=e.lab.boot(),cohort_epoch=name,clock_check=file,
               prior_STOP_sha256=e.lab.sha(e.H/'STOP.json'),previous_epoch='initial',
               performance_data_not_pooled=True,process_inventory=e.subprocess.check_output(['ps','-eo','pid,comm,args'],text=True))
    env['preserved_STOPs']={p.name:e.lab.sha(p) for p in e.H.glob('STOP*.json')}
    if (e.H/'STOP.recovery01.json').exists():env['previous_epoch']='recovery01'
    e.save('environment.'+name+'.json',env)
print(status,name,drift,flush=True)
sys.exit(0 if status=='PASS_BOUNDED_CLOCK_CHECK' else 2)
