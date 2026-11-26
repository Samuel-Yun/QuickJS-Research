from common import *
for arg,log in [('focus','focus02.log'),('counts','counts.log')]:
 with(HERE/log).open('w')as f:r=subprocess.run(['python3',str(HERE/'measure.py'),arg],stdout=f,stderr=subprocess.STDOUT,env=ENV)
 assert not r.returncode,(arg,HERE/log);print('PHASE_COMPLETE',arg,flush=True)
