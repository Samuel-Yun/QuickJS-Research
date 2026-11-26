from run import *
def main():
 out=next_out(HERE,'validation');out.mkdir();checks=[]
 groups=[(['INSTANCE_OFF','INSTANCE_DIRECT','INSTANCE_SLOT','INSTANCE_HOOK'],HERE/'bundle/semantics.js'),(['CALL_OFF','CALL_DIRECT','CALL_IC','CALL_FIELD'],HERE/'02_call_adapter/semantics.js'),(['NEST_PARENT','NEST_COMBINED'],HERE/'03_nested_plan/semantics.js')]
 for labels,custom in groups:
  for script in [custom,TESTS/'safety.js',TESTS/'property_reads.js']:
   ref=capture('A',script,[],out,script.stem+custom.parent.name)
   for label in labels:
    for mode in ['release','counts','sanitize']:
     if not (folder(label)/(ALIASES[label][0]+'.'+mode+'.manifest.json')).exists():continue
     r=capture(label,script,[],out,script.stem+custom.parent.name,mode=mode);assert r['stdout']==ref['stdout'],(label,mode,script,r['stdout'][-1000:],ref['stdout'][-1000:]);checks.append(dict(label=label,mode=mode,script=str(script)));print('CHECK',label,mode,script.stem,flush=True)
 save(out/'gate.json',dict(status='PASS',checks=checks));print('GATE',out,flush=True)
if __name__=='__main__':main()
