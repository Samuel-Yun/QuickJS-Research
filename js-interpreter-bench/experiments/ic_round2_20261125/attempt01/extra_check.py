from run import *
os.sched_setaffinity(0,{2});out=next_out(HERE,'extra_validation');out.mkdir();checks=[]
groups=[(['INSTANCE_DIRECT','INSTANCE_SLOT','INSTANCE_HOOK'],HERE/'01_instance_hook/semantics.js'),(['CALL_DIRECT','CALL_IC','CALL_FIELD'],HERE/'02_call_adapter/semantics.js'),(['NEST_PARENT','NEST_COMBINED'],HERE/'03_nested_plan/semantics.js')]
for labels,script in groups:
 ref=capture('A',script,[],out,script.parent.name)
 for label in labels:
  for mode in ['release','counts','sanitize']:
   r=capture(label,script,[],out,script.parent.name,mode=mode,snapshot=mode=='counts');assert r['stdout']==ref['stdout'],(label,mode,r['stdout'][-200:],ref['stdout'][-200:]);checks.append(dict(label=label,mode=mode,source=str(script),matches_A=True));print('EXTRA_PASS',label,mode,flush=True)
save(out/'gate.json',dict(status='PASS',checks=checks))
