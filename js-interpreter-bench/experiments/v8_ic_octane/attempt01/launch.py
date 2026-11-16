"""One long-lived WSL process, bounded 8-hour serial pilot+formal campaign."""
from common import *
import run
def main():
    names=['common.py','prepare.py','run.py','crypto_inputs.py','analyze.py','replay.py','launch.py','protocol.json']
    frozen=HERE/'pre_pilot_freeze.json'
    if not frozen.exists():save(frozen,dict(timestamp=stamp(),files={n:sha(HERE/n) for n in names}))
    for p,h in read(frozen)['files'].items():assert sha(HERE/p)==h
    try:run.calibrate();run.formal()
    except Exception as e:
        save(HERE/'campaign_stop.json',dict(status='PARTIAL',reason=str(e),timestamp=stamp(),boot_id=boot(),performance_records=len(list((HERE/'raw/formal').rglob('*.json')))));raise
if __name__=='__main__':main()
