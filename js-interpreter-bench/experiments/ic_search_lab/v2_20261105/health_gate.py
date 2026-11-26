"""Exactly one A-only check after saved repeat drift; does not erase STOP."""
import json,os,platform
from pathlib import Path
import run
lab=run.lab;measure=run.measure;HERE=run.HERE
if __name__=='__main__':
    destination=HERE/'health_after_drift.json';assert not destination.exists(),'one bounded check only'
    assert (HERE/'STOP_MATCHED').exists() and lab.boot()==lab.load(HERE/'environment.json')['boot_id']
    os.sched_setaffinity(0,{2});info=measure.inputs('sunspider');case='bitops-3bit-bits-in-byte'
    before=lab.capture(['ps','-eo','pid,ppid,etime,comm,args'],'health_inventory','after repeat drift',10)
    lab.save(HERE/'environment_confirmation.json',dict(timestamp=lab.stamp(),boot_id=lab.boot(),
        platform=platform.uname()._asdict(),os_release=Path('/etc/os-release').read_text(),affinity=sorted(os.sched_getaffinity(0)),
        meminfo=Path('/proc/meminfo').read_text(),load_average=os.getloadavg(),proc_pressure=Path('/proc/pressure/cpu').read_text() if Path('/proc/pressure/cpu').exists() else 'UNKNOWN_NOT_AVAILABLE',
        temperature='UNKNOWN',power_frequency_control='UNKNOWN',background_cause='UNKNOWN',process_token=before['token']))
    samples=[measure.invoke(info,'health',case,'A',info['N'][case],'environment_stability',0,i,'v2.health_once') for i in range(4)]
    xs=[r['elapsed_ms'] for r in samples];spread=max(xs)/min(xs)
    result=dict(status='PASS_BOUNDED_START_GATE_ONLY' if spread<=1.10 else 'BLOCKED_UNSTABLE_ENVIRONMENT',
        elapsed_ms=xs,max_over_min=spread,boot_id=lab.boot(),tokens=[r['process_token'] for r in samples],
        meaning='No candidate ranking, no proof that a long campaign is stable. Old partial and STOP remain.')
    lab.save(destination,result);print(json.dumps(result),flush=True)
