from common import *
import time
start=time.monotonic()
while not(HERE/'counts01/complete.json').exists():
 if time.monotonic()-start>1800:raise RuntimeError('counts not complete; inspect continue.log')
 time.sleep(5)
for script,log in [('callgrind_run.py','callgrind.log'),('check.py','check_final.log')]:
 with(HERE/log).open('w')as f:r=subprocess.run(['python3',str(HERE/script)],stdout=f,stderr=subprocess.STDOUT,env=ENV)
 assert not r.returncode,(script,HERE/log);print('AFTER_COMPLETE',script,flush=True)
