"""One continuous WSL process for all workload gates, calibration and sampling.
Build/test boots are not automatically a measurement cohort. Never merge boots.
"""
import traceback
from common import *
import run
def main():
    assert read(HERE/'correctness/semantic_gate.json')['status']=='PASS'
    assert read(HERE/'correctness/safety_gate.json')['status']=='PASS'
    assert read(HERE/'correctness/serialization_gate.json')['status']=='PASS'
    assert read(HERE/'correctness/additional_gate.json')['status']=='PASS'
    initial=read(HERE/'runtime.json')
    for c,a in initial['artifacts'].items():assert sha(a['path'])==a['sha256']
    assert not (HERE/'campaign_runtime.json').exists(),'no implicit campaign retry/resume'
    initial.update(boot_id=boot(),timestamp=stamp(),preparation_boot_id=initial['boot_id'],cohort='WSL2_V8_INSPIRED_IC_20261031_'+HERE.name+'_'+boot()[:8])
    save(HERE/'campaign_runtime.json',initial)
    save(HERE/'campaign_environment.json',dict(timestamp=stamp(),boot_id=boot(),loadavg=Path('/proc/loadavg').read_text(),cpuinfo=Path('/proc/cpuinfo').read_text(),processes=subprocess.check_output(['ps','-eo','pid,ppid,stat,comm,args'],text=True),frequency='UNKNOWN',temperature='UNKNOWN',formal_control='serial CPU2, original system settings unchanged'))
    try:
        run.clocks();run.compatibility();run.correctness();run.calibrate();run.freeze();run.formal()
    except Exception as e:
        save(HERE/'campaign_stop.json',dict(timestamp=stamp(),error=str(e),traceback=traceback.format_exc(),boot_id=boot(),formal_completed=len(list((HERE/'raw/formal').rglob('*.json'))),planned=1530))
        raise
if __name__=='__main__':main()
