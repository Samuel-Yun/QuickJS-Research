"""Record a changed boot without changing the original environment/manifest."""
import json
import os
from pathlib import Path
import subprocess
import sys
import run

H = run.H
assert not (H/'environment_recovery.json').exists()
assert not run.lab.load(H/'recovery01.job.json')['boot_id'] == run.lab.load(H/'environment.json')['boot_id']
for cid in ['A','s001','mx019','d03','d04']:
    art = run.measure.artifact(cid)
    assert run.lab.sha(art['path']) == art['sha256']
compiler = subprocess.check_output(['gcc','--version'],text=True)
old = run.lab.load(H/'environment.json')
assert compiler == old['compiler']
current = dict(timestamp=run.lab.stamp(), boot_id=run.lab.boot(), uname=os.uname(),
    os_release=Path('/etc/os-release').read_text(), cpuinfo=Path('/proc/cpuinfo').read_text(),
    meminfo=Path('/proc/meminfo').read_text(), compiler=compiler, affinity=[2],
    process_inventory=subprocess.check_output(['ps','-eo','pid,comm,args'],text=True),
    previous_boot=old['boot_id'], source_environment='environment.json',
    cohort='WSL2 structural recovery cohort; independent times not combined with first boot',
    power_frequency_control='UNKNOWN', temperature='UNKNOWN', background_load_control='UNKNOWN')
assert current['os_release'] == old['os_release']
run.lab.save(H/'environment_recovery.json',current)
os.environ['STRUCTURAL_ENVIRONMENT']='environment_recovery.json'
subprocess.Popen([sys.executable,str(H/'keeper.py')],cwd=H,stdin=subprocess.DEVNULL,
                 stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,start_new_session=True)
import job
job.launch('recovery02',['recovery_batch.py'])
