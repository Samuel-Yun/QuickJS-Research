from run import *
os.sched_setaffinity(0,{2});out=next_out(HERE/'02_call_adapter','identities');out.mkdir();rows=[]
for case in ['DeltaBlue','Typescript']:
 r=bench('CALL_OFF','octane',native('octane',case),out/'raw',mode='counts');rows.append(r);save(out/'samples.json',rows)
 byaddr={s['address']:s for s in r['diagnostic']['R2_COUNTS']};targets=r['diagnostic']['R2_TARGETS'];table=[]
 for addr,site in byaddr.items():
  t=[x for x in targets if x['site_address']==addr];total=sum(x['n']for x in t)
  table.append(dict(case=case,line=site['line'],pc=site['pc'],function=site['function'],total=total,distinct_actual_targets=len(t),dominant_fraction=max([x['n']for x in t]or[0])/max(total,1),targets=t))
 save(out/(case+'.json'),table);print(case,[(x['line'],x['total'],x['distinct_actual_targets'],x['dominant_fraction'])for x in table],flush=True)
