"""Fresh-process paired cohorts, frozen original N/input/checksum/timing boundaries."""
import argparse,importlib.util,json,os,math,collections
from pathlib import Path
from build import H,ROOT,sha
OLD=ROOT/'experiments/native_confirmation_20261108/attempt02'
spec=importlib.util.spec_from_file_location('neg_run_recorder',ROOT/'experiments/native_octane_20261107/attempt01/run.py');b=importlib.util.module_from_spec(spec);spec.loader.exec_module(b)
LABELS=['R3','NEGATIVE_ONLY','SPARSE','LAYOUT_OFF']
TARGETS=[('octane','RayTrace.RayTrace'),('sunspider','access-binary-trees'),('octane','EarleyBoyer.Boyer')]
def main():
 p=argparse.ArgumentParser();p.add_argument('cohort',choices=['target','full']);p.add_argument('mode',choices=['release','counts']);a=p.parse_args();assert not(a.cohort=='full' and a.mode=='counts')
 assert b.load(H/'qualification/gate.json')['status']=='PASS';out=H/'runs'/a.cohort/a.mode;out.mkdir(parents=True,exist_ok=True);b.H=out
 os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C');os.sched_setaffinity(0,{2});assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
 original=b.load(OLD/'protocol.json');infos={s:b.load(OLD/(s+'.inputs.json')) for s in ['octane','sunspider']};manifests={l:b.load(H/l/(a.mode+'.manifest.json')) for l in (LABELS if a.cohort=='target' else LABELS[:2])};scripts={}
 for suite,info in infos.items():
  for case in info['cases']:
   f=original['scripts'][suite][case]['measure'];assert sha(f['path'])==f['sha256'];path=Path(f['path'])
   if a.mode=='counts':
    s=path.read_text();start,stop=('  var started=now();','  var stopped=now();') if suite=='octane' else ('    __tebStarted = benchNow();','    __tebStopped = benchNow();');assert s.count(start)==s.count(stop)==1;s=s.replace(start,start+'\n__four_begin();',1).replace(stop,'__four_end();\n'+stop,1);path=out/'scripts'/(case+'.js');path.parent.mkdir(exist_ok=True)
    if path.exists():assert path.read_text()==s
    else:path.write_text(s)
   scripts[case]=dict(suite=suite,path=str(path),sha256=sha(path),N=f['N'],original_sha256=f['sha256'])
 schedule=[]
 if a.cohort=='target':
  for rep in range(5):
   for ci,(suite,case) in enumerate(TARGETS):
    offset=(rep+ci)%len(LABELS);order=LABELS[offset:]+LABELS[:offset]
    for label in order:schedule.append(dict(label=label,suite=suite,case=case,repetition=rep))
 else:
  ci=0
  for suite,info in infos.items():
   for case in info['cases']:
    order=LABELS[:2] if ci%2==0 else list(reversed(LABELS[:2]));ci+=1
    for label in order:schedule.append(dict(label=label,suite=suite,case=case,repetition=0))
 frozen={str(Path(__file__)):sha(Path(__file__)),str(OLD/'protocol.json'):sha(OLD/'protocol.json'),**{str(H/l/(a.mode+'.manifest.json')):sha(H/l/(a.mode+'.manifest.json')) for l in manifests}}
 protocol=dict(cohort=a.cohort,mode=a.mode,CPU=2,TZ='Asia/Shanghai',locale='C',warmup_calls=0,first_Run_included=True,scripts=scripts,schedule=schedule,boot_id=b.boot(),frozen_files=frozen,input_files={**infos['octane']['files'],**infos['sunspider']['files']},counts_are_independent_processes=True,not_pairing_counter_hits_with_Release_process=True)
 if (out/'protocol.json').exists():assert b.load(out/'protocol.json')==protocol
 else:b.save('protocol.json',protocol)
 def verify():
  for l,m in manifests.items():
   assert sha(m['elf'])==m['elf_sha256']
   for f,d in m['sources'].items():assert sha(Path(m['elf']).parent/f)==d
  for f,d in frozen.items():assert sha(f)==d
  for f,d in protocol['input_files'].items():assert sha(ROOT/f)==d
  for s in scripts.values():assert sha(s['path'])==s['sha256']
  assert b.boot()==protocol['boot_id']
 verify()
 if not(out/'environment.before.json').exists():b.save('environment.before.json',b.environment())
 done={(r['label'],r['case'],r['repetition']):r for r in b.records() if r['event']=='sample'}
 for i,t in enumerate(schedule):
  key=t['label'],t['case'],t['repetition']
  if key in done:assert done[key]['valid'];continue
  m=manifests[t['label']];s=scripts[t['case']];cmd=[m['elf']]
  if t['case']=='zlib.zlib':cmd+=['--std','-I',str(ROOT/'experiments/v8_inspired_ic/attempt03/inputs/zlib_read.js')]
  cmd.append(s['path']);z=b.capture(cmd,t['label'],t['case']+'.r'+str(t['repetition']),timeout=600,identity=dict(**t,N=s['N'],mode=a.mode,binary_sha256=m['elf_sha256']))
  row=dict(event='sample',**t,N=s['N'],valid=False,diagnostic_only=a.mode=='counts')
  try:
   assert z['exit_code']==0 and not z['timeout'],z['stderr'][-2000:];prefix='OCTANE_IC_RESULT:' if t['suite']=='octane' else 'TEB_RESULT:';lines=[l[len(prefix):] for l in z['stdout'].splitlines() if l.startswith(prefix)];assert len(lines)==1;x=json.loads(lines[0]);assert x['case']==t['case'] and x['N']==s['N'] and x['phase']=='measure' and x['correctness']=='PASS' and x['warmup_calls']==0
   if t['suite']=='sunspider':assert x['checksum'] in infos['sunspider']['contract']['allowed'][t['case']]
   if t['case'].startswith('Crypto.'):
    gold=ROOT/'experiments/ic_fast_slow_20261102/attempt01/octane/crypto'/(t['case']+'.N'+str(s['N'])+'.json');assert x['checksum']==b.load(gold)['final_ciphertext']
   if a.mode=='counts':
    assert z['stderr'].count('NEG_COUNTS:')==1;c=json.loads(z['stderr'].removeprefix('NEG_COUNTS:'));assert c['ctor'][0]==c['ctor'][1]+c['ctor'][4];row['counts']=c
   else:
    assert not z['stderr'];assert 0<x['elapsed_ms']<=z['external_wall_ms']+5 and x['elapsed_ms']==x['stop_ms']-x['start_ms'];row['ms_per_Run']=x['elapsed_ms']/s['N']
   assert z['boot_id']==z['boot_id_after']==protocol['boot_id'];assert abs(z['raw_minus_monotonic_ms'])<=5+.002*z['external_wall_ms'];row.update(payload=x,valid=True)
  except Exception as e:row['error']=str(e)
  b.append(row);assert row['valid'],row;done[key]=row;v=round(row['ms_per_Run'],5) if a.mode=='release' else dict(parses=c['sparse'][0] if t['label']=='SPARSE' else c['negative'][0],negative=c['sparse'][2] if t['label']=='SPARSE' else c['negative'][1],positive=c['ctor'][1],empty_shape_misses=c['negative'][6]);print(i+1,len(schedule),t['label'],t['case'],t['repetition'],v,flush=True)
 verify();b.save('environment.after.json',b.environment());b.save('audit.json',dict(status='PASS',samples=len(done),counts_separate=a.mode=='counts',all_inputs_frozen=True));print('COHORT_COMPLETE',a.cohort,a.mode,flush=True)
if __name__=='__main__':main()
