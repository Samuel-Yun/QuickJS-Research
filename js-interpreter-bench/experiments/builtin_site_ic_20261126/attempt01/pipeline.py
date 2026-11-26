from common import *
for script,arg,log in [('measure.py','ten','paired.log'),('full.py',None,'full.log'),('measure.py','focus','focus.log'),('measure.py','counts','counts.log')]:
 cmd=['python3',str(HERE/script)]+([arg]if arg else[])
 with(HERE/log).open('w')as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=ENV)
 assert not r.returncode,(script,arg,HERE/log);print('PHASE_COMPLETE',script,arg,flush=True)
