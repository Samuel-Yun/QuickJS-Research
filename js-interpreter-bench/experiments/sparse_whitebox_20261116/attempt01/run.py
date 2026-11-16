import json,os,importlib.util,argparse,time,math,collections
from pathlib import Path
from build import H,ROOT,sha
spec=importlib.util.spec_from_file_location('wb_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py');b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
RATES=[0,25,50,75,90,99,100];CRATES=[0,50,100]
def manifests():return json.loads((H/'release_manifest.json').read_text())
def script_args(kind,rate,n,diag=False):
 if kind=='read':return [str(H/('own_read.diag.js' if diag else 'own_read.js')),'--hit-percent',str(rate),'--iterations',str(n),'--min-ms','0' if diag else ('3000' if n>=100000000 else '0')]
 return [str(H/('ctor.diag.js' if diag else 'ctor.js')),kind,str(rate),str(n)]
def capture(name,label,kind,rate,n,diag=False,check_ms=False):
 m=json.loads((H/(label+'.diagnostic.json')).read_text()) if diag else manifests()[label]
 assert sha(m['elf'])==m['elf_sha256'];cmd=[m['elf'],*script_args(kind,rate,n,diag)]
 z=b.capture(cmd,label,name,timeout=240,identity=dict(kind=kind,rate=rate,iterations=n,diagnostic=diag,elf_sha256=m['elf_sha256']));assert z['exit_code']==0 and not z['timeout'],z
 lines=z['stdout'].splitlines();payload=next(json.loads(s) for s in lines if s.startswith('{') and json.loads(s).get('kind') in ['own_read','ctor']);assert payload['checksum']==3*n and payload['iterations']==n and payload['warmup_calls']==0
 row=dict(label=label,kind=kind,target=rate,iterations=n,elapsed_ms=payload['elapsed_ms'],checksum=payload['checksum'],diagnostic=diag)
 if diag:
  assert z['stderr'].startswith('WHITEBOX_COUNTS:');c=json.loads(z['stderr'].removeprefix('WHITEBOX_COUNTS:'));row['counts']=c
  if kind=='read':assert c['read'][0]==n==c['read'][1]+c['read'][2] and c['read'][1]==c['read'][3]+c['read'][4]
  else:assert c['ctor'][0]==n==c['ctor'][1]+c['ctor'][4]
  snapshots=[json.loads(s.removeprefix('BYTECODE_SNAPSHOT:')) for s in lines if s.startswith('BYTECODE_SNAPSHOT:')];row['snapshots']=snapshots
 else:
  assert not z['stderr'];assert math.isfinite(row['elapsed_ms']) and 0<row['elapsed_ms']<=z['external_wall_ms']+5
  if check_ms:assert row['elapsed_ms']>3000,row
 return row

def main():
 p=argparse.ArgumentParser();p.add_argument('phase',choices=['calibrate','gate','measure','counts']);a=p.parse_args();out=H/'raw'/a.phase;out.mkdir(parents=True,exist_ok=True);b.H=out;os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C');os.sched_setaffinity(0,{2});assert not os.environ.get('LD_PRELOAD')
 done={r['key']:r for r in b.records() if r['event']=='sample'}
 if a.phase=='calibrate':
  schedule=[dict(label=l,kind=k,target=r,n=8388608 if k=='read' else 2097152) for k in ['read','positive','negative'] for r in [0,100] for l in ['A','SPARSE']]
 elif a.phase=='gate':
  schedule=[dict(label=l,kind=k,target=r,n=65536,diag=(l=='SPARSE')) for k in ['read','positive','negative'] for r in (RATES if k=='read' else CRATES) for l in ['A','SPARSE']]
 else:
  assert json.loads((H/'gate.json').read_text())['status']=='PASS';config=json.loads((H/'config.json').read_text());schedule=[]
  for rep in range(5 if a.phase=='measure' else 1):
   for ki,k in enumerate(['read','positive','negative']):
    for ri,r in enumerate(RATES if k=='read' else CRATES):
     order=(['A','SPARSE'] if (rep+ri+ki)%2==0 else ['SPARSE','A']) if a.phase=='measure' else ['SPARSE']
     for l in order:schedule.append(dict(label=l,kind=k,target=r,n=config['read_iterations' if k=='read' else 'ctor_iterations'],rep=rep,diag=a.phase=='counts'))
  frozen={str(p):sha(p) for p in [Path(__file__),H/'own_read.js',H/'ctor.js',H/'config.json',H/'release_manifest.json']}
  protocol=dict(phase=a.phase,schedule=schedule,CPU=2,TZ='Asia/Shanghai',locale='C',first_Run=True,warmup_calls=0,frozen=frozen)
  if (out/'protocol.json').exists():assert json.loads((out/'protocol.json').read_text())==protocol
  else:b.save('protocol.json',protocol)
 if not(out/'environment.before.json').exists():b.save('environment.before.json',b.environment())
 for i,t in enumerate(schedule):
  key='.'.join(str(t[k]) for k in ['kind','target','label'])+'.r'+str(t.get('rep',0))
  if key in done:continue
  row=capture(key,t['label'],t['kind'],t['target'],t['n'],t.get('diag',False),a.phase=='measure');row.update(event='sample',key=key,rep=t.get('rep',0));b.append(row);done[key]=row
  v=round(row['elapsed_ms'],3)
  if row['diagnostic']:
   c=row['counts'];v=dict(read=c['read'][:4],ctor=c['ctor'][:5],parses=c['sparse'][0],negative=c['sparse'][2])
  print(i+1,len(schedule),key,v,flush=True)
 b.save('environment.after.json',b.environment());b.save('audit.json',dict(status='PASS',samples=len(done),fresh_processes=True));
 if a.phase=='gate':
  for row in done.values():
   if row['diagnostic'] and row['kind']=='positive':
    actual=row['counts']['ctor'][1]/65536*100;assert abs(actual-row['target'])<0.1,(row['target'],actual)
   if row['diagnostic'] and row['kind']=='negative':assert row['counts']['ctor'][1]==0
  b.save('../../gate.json',dict(status='PASS',cases=len(done),positive_targets_verified=True,checksums_equal=True))
 print('PHASE_COMPLETE',a.phase,flush=True)
if __name__=='__main__':main()
