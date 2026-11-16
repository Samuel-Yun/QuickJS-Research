"""Second and final finite environment check; no candidate ranking."""
import json
import os
from pathlib import Path
import subprocess
import sys
import time
import run as r

prefix=sys.argv[1] if len(sys.argv)>1 else 'precheck.2'
assert prefix.replace('_','').replace('.','').isalnum()
assert not (r.H/(prefix+'.raw.json')).exists(),'Do not overwrite a previous finite probe'
os.sched_setaffinity(0,{2})

output=dict(boot_before=r.e.lab.boot(),affinity=sorted(os.sched_getaffinity(0)),clocksource=Path('/sys/devices/system/clocksource/clocksource0/current_clocksource').read_text(),
            prior_STOP_sha256=r.e.lab.sha(r.H/'STOP.json'),observations=[],loads=[])


def clocks():
    return dict(realtime_ns=time.time_ns(),monotonic_ns=time.monotonic_ns(),
                raw_ns=time.clock_gettime_ns(time.CLOCK_MONOTONIC_RAW),
                boottime_ns=time.clock_gettime_ns(time.CLOCK_BOOTTIME))


print('CLOCK_PROBE_BEGIN',flush=True)
for i in range(31):
    output['observations'].append(clocks())
    if i<30: time.sleep(1)
for label in ['A','s001']:
    info=r.e.lab.load(r.H/'octane.inputs.json')
    case='zlib.zlib'
    art=r.e.measure.artifact(label)
    script=r.e.measure.script(info,case,info['N'][case],'clock_precheck2')
    command=[art['path'],'--std','-I',str(r.e.measure.OCT/'inputs/zlib_read.js'),str(script)]
    before=clocks()
    p=subprocess.run(command,capture_output=True,text=True,timeout=90)
    after=clocks()
    output['loads'].append(dict(label=label,command=command,before=before,after=after,
          stdout=p.stdout,stderr=p.stderr,exit_code=p.returncode,binary_sha256=r.e.lab.sha(art['path']),
          script_sha256=r.e.lab.sha(script)))
    print('CLOCK_LOAD_COMPLETE',label,p.returncode,flush=True)
output['boot_after']=r.e.lab.boot()
first=output['observations'][0]
output['max_utc_monotonic_drift_seconds']=max(abs((row['realtime_ns']-first['realtime_ns'])-
    (row['monotonic_ns']-first['monotonic_ns']))/1e9 for row in output['observations'])
output['max_raw_monotonic_drift_seconds']=max(abs((row['raw_ns']-first['raw_ns'])-
    (row['monotonic_ns']-first['monotonic_ns']))/1e9 for row in output['observations'])
r.save(prefix+'.raw.json',output)
print(json.dumps({k:v for k,v in output.items() if k not in ['observations','loads']}),flush=True)
