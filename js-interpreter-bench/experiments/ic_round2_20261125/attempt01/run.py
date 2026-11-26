import argparse,collections,csv,importlib.util,json,math,os,statistics,subprocess,time
from common import *
CATALOG=json.loads((PACKAGE/'tests/benchmarks.json').read_text());TESTS=PACKAGE/'tests'
spec=importlib.util.spec_from_file_location('ep_validate',TESTS/'run.py');validator=importlib.util.module_from_spec(spec);spec.loader.exec_module(validator)
ALIASES={'INSTANCE_OFF':('INSTANCE','QJS_INSTANCE_MODE','off'),'INSTANCE_DIRECT':('INSTANCE','QJS_INSTANCE_MODE','direct'),'INSTANCE_SLOT':('INSTANCE','QJS_INSTANCE_MODE','cached'),'INSTANCE_HOOK':('INSTANCE','QJS_INSTANCE_MODE','hook'),'CALL_OFF':('CALL','QJS_CALL_MODE','off'),'CALL_DIRECT':('CALL','QJS_CALL_MODE','direct'),'CALL_IC':('CALL','QJS_CALL_MODE','ic'),'CALL_FIELD':('CALL','QJS_CALL_MODE','field'),'NEST_PARENT':('NESTED','QJS_NEST_MODE','parent'),'NEST_COMBINED':('NESTED','QJS_NEST_MODE','combined')}
OLDROOT=ROOT/'experiments/ic_execution_plans_20261125/attempt01'
def folder(label):
 actual=ALIASES.get(label,(label,None,None))[0]
 return HERE/({'INSTANCE':'01_instance_hook','SPARSE':'01_instance_hook','CALL':'02_call_adapter','NESTED':'03_nested_plan'}[actual])
def binary(label,mode='release'):
 if label=='A':return str(PACKAGE/'build/A/qjs')
 actual=ALIASES.get(label,(label,None,None))[0]
 if label=='NUMERIC_PLAN':stamp=OLDROOT/'01_forward_numeric'/f'NUMERIC_PLAN.{mode}.manifest.json'
 else:stamp=folder(label)/f'{actual}.{mode}.manifest.json'
 m=json.loads(stamp.read_text());assert sha(m['binary'])==m['binary_sha256']
 for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
 return m['binary']
def native(suite,case):
 return next(c for c in CATALOG['cases'][suite] if case in [c['case'],c['name']])
def diag_script(suite,c,out):
 src=(TESTS/c['path']).read_text()
 if suite=='octane':
  src=once(src,'  var started=now();','  __ep_begin();\n  var started=now();');src=once(src,'  var stopped=now();','  var stopped=now();\n  __ep_end();')
 else:
  src=once(src,'    __tebStarted = benchNow();','    __ep_begin();\n    __tebStarted = benchNow();');src=once(src,'    __tebStopped = benchNow();','    __tebStopped = benchNow();\n    __ep_end();')
 p=out/(c['case']+'.js');p.write_text(src);return p
def capture(label,script,args,out,case,rep=0,mode='release',snapshot=False):
 out=Path(out);out.mkdir(parents=True,exist_ok=True);stem=f'{case}.{label}.{mode}.{rep}';dest=out/(stem+'.json');assert not dest.exists(),dest
 env=dict(ENV)
 if label in ALIASES:env[ALIASES[label][1]]=ALIASES[label][2]
 if snapshot:env.update(QJS_INSPECT_FILE=str(script),QJS_INSPECT_OUTPUT=str(out/(stem+'.snapshot.jsonl')))
 cmd=[binary(label,mode)]
 if case=='zlib.zlib':cmd+=['--std','-I',str(TESTS/'support/zlib_read.js')]
 cmd+=[str(script),*map(str,args)];t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=1800)
 row=dict(label=label,case=case,rep=rep,mode=mode,command=cmd,script_sha256=sha(script),binary_sha256=sha(cmd[0]),control={ALIASES[label][1]:ALIASES[label][2]} if label in ALIASES else {},exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,wall_ms=(time.monotonic()-t)*1000)
 save(dest,row);assert r.returncode==0,row
 if mode!='counts':assert not r.stderr,row
 return row
def bench(label,suite,c,out,rep=0,mode='release',snapshot=False):
 assert sha(TESTS/c['path'])==c['sha256']
 protocol=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text());ref=protocol['scripts'][suite][c['case']]['measure'];assert ref['N']==c['N'] and ref['sha256']==c['sha256']
 out=Path(out);out.mkdir(parents=True,exist_ok=True)
 script=diag_script(suite,c,out) if mode=='counts' else TESTS/c['path']
 r=capture(label,script,[],out,c['case'],rep,mode,snapshot);prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
 data=[json.loads(l[len(prefix):]) for l in r['stdout'].splitlines() if l.startswith(prefix)];assert len(data)==1
 r.update(suite=suite,name=c['name'],N=c['N'],group=c['group'],ms=validator.validate(data[0],suite,c),original_sha256=c['sha256'])
 if mode=='counts':
  r['diagnostic']={}
  for line in r['stderr'].splitlines():
   if ':' in line and line.split(':',1)[0] in ['FOUR_COUNTS','NP_WORK','R2_COUNTS','R2_TARGETS']:
    k,v=line.split(':',1);r['diagnostic'][k]=json.loads(v)
  assert 'FOUR_COUNTS' in r['diagnostic'],r['stderr'][:2000]
 return r
def csvout(p,rows):
 if not rows:return
 with Path(p).open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
def next_out(parent,prefix):
 i=1
 while (parent/f'{prefix}{i:02d}').exists():i+=1
 return parent/f'{prefix}{i:02d}'
def targeted(labels,cases,out,repeats=5):
 os.sched_setaffinity(0,{2});out=Path(out);out.mkdir(parents=True,exist_ok=False);rows=[]
 save(out/'protocol.json',dict(labels=labels,cases=cases,repeats=repeats,CPU=2,TZ='Asia/Shanghai',locale='C',first_Run_included=True,extra_warmup=0,driver_sha256=sha(Path(__file__)),binaries={l:dict(path=binary(l),sha256=sha(binary(l))) for l in labels}))
 for rep in range(1,repeats+1):
  for j,(suite,case) in enumerate(cases):
   c=native(suite,case);shift=(rep+j-1)%len(labels)
   for l in labels[shift:]+labels[:shift]:
    r=bench(l,suite,c,out/'raw',rep);rows.append(r);save(out/'samples.json',rows);print('TARGET',rep,case,l,r['ms'],flush=True)
 summary=[]
 for _,case in cases:
  c=native(_,case);basev=[r['ms'] for r in rows if r['case']==c['case'] and r['label']==labels[0]];median=statistics.median(basev)
  for l in labels:
   v=[r['ms'] for r in rows if r['case']==c['case'] and r['label']==l]
   summary.append(dict(case=c['case'],label=l,values=v,median=statistics.median(v),min=min(v),max=max(v),percent=(statistics.median(v)/median-1)*100,paired_ratios=[y/x for x,y in zip(basev,v)]))
 save(out/'summary.json',summary);csvout(out/'raw_timings.csv',[{k:r[k] for k in ['case','label','rep','ms','N','binary_sha256']} for r in rows]);return summary
