"""All VM phases serial; start only after finite correctness/native gates."""
import run
from common import *
if __name__=='__main__':
 assert read(HERE/'layout/gate.json')['status']=='PASS'
 if not (HERE/'pre_pilot_freeze.json').exists():run.freeze_before_pilot()
 if not (HERE/'frozen.json').exists():run.calibrate()
 run.formal()
