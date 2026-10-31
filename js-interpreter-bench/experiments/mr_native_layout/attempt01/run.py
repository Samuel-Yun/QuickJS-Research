"""Fixed 192 baseline + 512 layout samples; no data-dependent additions."""
import argparse,collections,math,random,re
from common import *
def verify():
 m=read(HERE/'manifest.final.json');assert platform.node()==m['host'] and platform.release()==m['kernel'] and platform.machine()==m['architecture']
 for p,h in m['inputs'].items():assert sha(ROOT/p)==h,p
 for c,a in m['artifacts'].items():assert sha(a['path'])==a['sha256'],c
 for v,files in m['objects'].items():
  for p,h in files.items():assert sha(STORE/(v+'_base')/p)==h
 return m
def invoke(stage,c,condition,n,rep,pos,block=None,check=False):
 m=read(HERE/'manifest.final.json');a=m['artifacts'][condition]
 dest=HERE/'raw'/stage/c/f'b{block}.rep{rep}.pos{pos}.{condition}.N{n}.json'
 if dest.exists():return read(dest)
 p=script(c,n,check);e=read(HERE/'environment.json');assert env()==e,'relevant environment changed'
 assert not any(k in e for k in ['QJS_READ_IC_MODE','LD_PRELOAD','LD_AUDIT'])
 assert sha(a['path'])==a['sha256']
 r=dict(cohort=m['cohort']+('-layout' if stage=='layout' else '-base' if stage.startswith('base_') else '-gates'),mode=MODE,stage=stage,case=c,condition=condition,variant=a['variant'],rep=rep,order=pos,block=block,N=n,command=[a['path'],str(p)],flags=[],cwd=str(ROOT),environment=e,environment_sha256=sha(HERE/'environment.json'),source_identity_sha256=a['source_identity_sha256'],objects=m['objects'][a['variant']],link_inputs_sha256=m['link_inputs_sha256'],binary_sha256=a['sha256'],script_sha256=sha(p),script_relative=p.relative_to(HERE).as_posix(),timestamp=stamp(),boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),affinity=sorted(os.sched_getaffinity(0)),valid=False)
 start=time.perf_counter_ns()
 try:
  x=subprocess.run(r['command'],cwd=ROOT,env=e,capture_output=True,text=True,timeout=300);r.update(exit_code=x.returncode,stdout=x.stdout,stderr=x.stderr,timeout=False)
 except subprocess.TimeoutExpired as x:r.update(exit_code=None,stdout=(x.stdout or b'').decode(errors='replace'),stderr=(x.stderr or b'').decode(errors='replace'),timeout=True)
 stop=time.perf_counter_ns();r.update(outer_start_ns=start,outer_stop_ns=stop,outer_wall_ns=stop-start)
 clock=False
 try:
  found=re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M);assert r['exit_code']==0 and not r['stderr'] and len(found)==1
  payload=json.loads(found[0]);r['payload']=payload
  assert payload['case']==c and payload['N']==n and payload['mode']==MODE and payload['warmup_calls']==0 and payload['correctness']=='PASS'
  if not check:
   clock=True;t0,t1,elapsed=[payload[k] for k in ['start_ms','stop_ms','elapsed_ms']]
   assert all(math.isfinite(t) for t in [t0,t1,elapsed]) and elapsed>0 and t1-t0==elapsed
   assert start/1e6-1<=t0<t1<=stop/1e6+1
   r.update(elapsed_ms=elapsed,elapsed_per_Run_ms=elapsed/n)
  r['valid']=True
 except (AssertionError,KeyError,ValueError,TypeError):r['error']='BLOCKED_TIMER' if clock else 'CORRECTNESS_OR_PROCESS'
 save(dest,r);print(stage,c,condition,rep,'PASS' if r['valid'] else r['error'],r.get('elapsed_ms'),flush=True)
 return r
def correctness():
 m=verify();save(HERE/'environment.json',env());rows=[]
 for v in 'MR':
  for f in ['legacy_regression.js','multislot.js','read_semantics.js','site_regression.js','dequickening.js']:
   r=capture(v+'_regression_'+f,[m['artifacts'][v+'_base']['path'],OLD/'correctness'/f]);assert not r['exit_code'] and not r['stderr'] and 'PASS' in r['stdout']
 for c in CASES:
  for n in [1,2]:
   for pos,condition in enumerate(BASE+LAYOUT):
    r=invoke('correctness_final',c,condition,n,n,pos,check=True);rows.append(dict(case=c,N=n,condition=condition,valid=r['valid'],exit_code=r['exit_code']))
 csvout(HERE/'correctness/results_final.csv',rows);assert all(r['valid'] for r in rows)
 save(HERE/'correctness/gate_final.json',dict(status='PASS',workload_checks=len(rows),semantic_regressions=10,full_test262=False))
def freeze_before_pilot():
 verify();assert read(HERE/'correctness/gate_final.json')['status']=='PASS';assert read(HERE/'diagnostic/gate.json')['status']=='PASS'
 files=[HERE/'manifest.final.json',HERE/'design.md',HERE/'environment.json',HERE/'prepare.py',HERE/'repair_padding.py',HERE/'run.py',HERE/'common.py',HERE/'diagnostics.py',HERE/'counter.inc',HERE/'native.py']
 save(HERE/'pre_pilot_freeze.json',dict(timestamp=stamp(),files={p.relative_to(HERE).as_posix():sha(p) for p in files},fixed_padding=[0,16,32,48],max_formal_records=704))
def calibrate():
 verify();f=read(HERE/'pre_pilot_freeze.json')
 for p,h in f['files'].items():assert sha(HERE/p)==h
 layout=read(HERE/'layout/gate.json')['status']=='PASS';conditions=BASE+(LAYOUT if layout else [])
 for c in CASES:
  selected=HERE/'selected'/f'{c}.json'
  if selected.exists():continue
  n=read(OLD/'selected'/f'{c}.json')['N']
  while n<=131072:
   rows=[invoke('pilot',c,k,n,rep,pos,block=n) for rep in range(3) for pos,k in enumerate(conditions[rep:]+conditions[:rep])]
   assert all(r['valid'] for r in rows)
   if min(r['elapsed_ms'] for r in rows)>=1000:
    save(selected,dict(case=c,N=n,pilot_records=len(rows),minimum_ms=min(r['elapsed_ms'] for r in rows)));break
   n*=2
  else:raise RuntimeError('MAX_N '+c)
 rng=random.Random(SEED);schedule=[]
 for stage in ['base_pre','layout','base_post']:
  if stage=='layout':
   if not layout:continue
   orders=[[LAYOUT[(i+k)%8] for i in [0,1,7,2,6,3,5,4]] for k in range(8)]*2;rng.shuffle(orders)
   for block,seq in enumerate(orders):
    cases=CASES.copy();rng.shuffle(cases)
    for c in cases:
     for pos,k in enumerate(seq):schedule.append(dict(index=len(schedule),stage=stage,case=c,condition=k,rep=block,order=pos,block=block))
  else:
   orders={c:[BASE,BASE[::-1]]*6 for c in CASES}
   for seqs in orders.values():rng.shuffle(seqs)
   pairs=list(range(12));rng.shuffle(pairs)
   for rep in pairs:
    cases=CASES.copy();rng.shuffle(cases)
    for c in cases:
     for pos,k in enumerate(orders[c][rep]):schedule.append(dict(index=len(schedule),stage=stage,case=c,condition=k,rep=rep,order=pos,block=stage))
 for s in schedule:s['N']=read(HERE/'selected'/f'{s["case"]}.json')['N']
 # Independently validate the planned balance, before samples exist.
 for c in CASES:
  for stage in ['base_pre','base_post']:
   rr=[s for s in schedule if s['case']==c and s['stage']==stage];assert len(rr)==24
   assert collections.Counter(s['condition'] for s in rr if s['order']==0)==dict(M_base=6,R_base=6)
  if layout:
   rr=[s for s in schedule if s['case']==c and s['stage']=='layout'];assert len(rr)==128
   assert set(collections.Counter((s['condition'],s['order']) for s in rr).values())=={2}
   adj=collections.Counter()
   for b in range(16):
    seq=sorted([s for s in rr if s['block']==b],key=lambda s:s['order']);adj.update((a['condition'],b['condition']) for a,b in zip(seq,seq[1:]))
   assert len(adj)==56 and set(adj.values())=={2}
 save(HERE/'schedule.json',schedule)
 save(HERE/'frozen.json',dict(timestamp=stamp(),pre_pilot_sha256=sha(HERE/'pre_pilot_freeze.json'),schedule_sha256=sha(HERE/'schedule.json'),selected={p.name:sha(p) for p in sorted((HERE/'selected').glob('*.json'))},scripts={c:sha(script(c,read(HERE/'selected'/f'{c}.json')['N'])) for c in CASES}))
 print('PILOT_AND_SCHEDULE_FROZEN',len(schedule),flush=True)
def formal():
 verify();f=read(HERE/'frozen.json');assert sha(HERE/'schedule.json')==f['schedule_sha256']
 for p,h in read(HERE/'pre_pilot_freeze.json')['files'].items():assert sha(HERE/p)==h,p
 assert not any(x in ['cc1','cc1plus','as','ld'] for x in subprocess.check_output(['ps','-eo','comm'],text=True).splitlines())
 snapshot('formal_start' if not (HERE/'raw/environment/formal_start.json').exists() else 'resume_'+str(time.time_ns()));last=0;laststage=None
 for s in read(HERE/'schedule.json'):
  if laststage!=s['stage']:
   label='stage_'+s['stage']
   if not (HERE/'raw/environment'/f'{label}.json').exists():snapshot(label)
   laststage=s['stage']
  r=invoke(s['stage'],s['case'],s['condition'],s['N'],s['rep'],s['order'],s['block'])
  assert r['outer_start_ns']>=last;last=r['outer_stop_ns']
  if r.get('error')=='BLOCKED_TIMER':save(HERE/'BLOCKED_TIMER.json',r);raise RuntimeError('BLOCKED_TIMER')
 verify();snapshot('formal_end');print('FIXED_SCHEDULE_COMPLETE',flush=True)
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('stage',choices=['correctness','freeze_before_pilot','calibrate','formal']);a=p.parse_args();globals()[a.stage]()
