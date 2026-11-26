from run import *
import argparse
def main():
 ap=argparse.ArgumentParser();ap.add_argument('group',choices=['instance','call','nested','counts']);a=ap.parse_args()
 if a.group=='counts':
  os.sched_setaffinity(0,{2});out=next_out(HERE,'counts');out.mkdir();rows=[]
  jobs=[('INSTANCE_OFF','EarleyBoyer.Boyer'),('INSTANCE_DIRECT','EarleyBoyer.Boyer'),('INSTANCE_SLOT','EarleyBoyer.Boyer'),('INSTANCE_HOOK','EarleyBoyer.Boyer'),('INSTANCE_HOOK','EarleyBoyer.Earley'),('INSTANCE_HOOK','PdfJS'),('INSTANCE_HOOK','CodeLoad.Closure'),('CALL_OFF','DeltaBlue'),('CALL_OFF','Typescript'),('CALL_DIRECT','DeltaBlue'),('CALL_IC','DeltaBlue'),('CALL_FIELD','DeltaBlue'),('CALL_DIRECT','Typescript'),('CALL_IC','Typescript'),('CALL_FIELD','Typescript'),('NUMERIC_PLAN','RayTrace'),('NEST_PARENT','RayTrace'),('NEST_COMBINED','RayTrace')]
  for l,case in jobs:
   r=bench(l,'octane',native('octane',case),out/'raw',mode='counts',snapshot=True);rows.append(r);save(out/'samples.json',rows);print('COUNT',l,case,[(s['line'],s['c'][:10])for s in r['diagnostic'].get('R2_COUNTS',[])if s['c'][0]>10000][:10],r['diagnostic'].get('NP_WORK'),flush=True)
 else:
  labels,cases={'instance':(['SPARSE','INSTANCE_OFF','INSTANCE_DIRECT','INSTANCE_SLOT','INSTANCE_HOOK'],['EarleyBoyer.Boyer','EarleyBoyer.Earley','PdfJS','CodeLoad.Closure']),'call':(['SPARSE','CALL_OFF','CALL_DIRECT','CALL_IC','CALL_FIELD'],['DeltaBlue','Typescript']),'nested':(['NUMERIC_PLAN','NEST_PARENT','NEST_COMBINED'],['RayTrace'])}[a.group]
  dest=HERE/({'instance':'01_instance_hook','call':'02_call_adapter','nested':'03_nested_plan'}[a.group]);out=next_out(dest,'targeted');print(targeted(labels,[('octane',c)for c in cases],out))
if __name__=='__main__':main()
