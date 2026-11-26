from common import *
# Performance processes are deliberately sequential, never concurrent on CPU2.
for group in ['nested','call','instance']:
 p=HERE/('targeted_'+group+'.log')
 with p.open('w')as f:r=subprocess.run(['python3',str(HERE/'targeted.py'),group],stdout=f,stderr=subprocess.STDOUT,env=ENV)
 assert r.returncode==0,(group,p);print('FINISHED_TARGETED',group,flush=True)
with (HERE/'full.log').open('w')as f:r=subprocess.run(['python3',str(HERE/'full.py')],stdout=f,stderr=subprocess.STDOUT,env=ENV)
assert r.returncode==0,HERE/'full.log'
print('FINISHED_FULL',flush=True)
