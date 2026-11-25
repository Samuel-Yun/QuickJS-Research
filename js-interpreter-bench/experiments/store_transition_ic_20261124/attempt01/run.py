"""One process per sample; diagnostics never supply performance conclusions."""
import argparse,importlib.util,json,os,statistics,subprocess,time
from pathlib import Path
from build import HERE,ROOT,PACKAGE,LABELS,sha,save
TESTS=PACKAGE/'tests';CATALOG=json.loads((TESTS/'benchmarks.json').read_text())
spec=importlib.util.spec_from_file_location('validator',TESTS/'run.py');validator=importlib.util.module_from_spec(spec);spec.loader.exec_module(validator)
ENV=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C',LANG='C',ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
TARGETS=[('octane',next(c for c in CATALOG['cases']['octane'] if c['name']=='RayTrace')),('sunspider',next(c for c in CATALOG['cases']['sunspider'] if c['name']=='access-binary-trees'))]
def binary(label,mode):
 if label=='A':return str(PACKAGE/'build/A/qjs')
 m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text());assert sha(m['binary'])==m['binary_sha256']
 for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
 return m['binary']
def capture(label,mode,script,args,phase,case,rep=0):
 folder=HERE/phase;folder.mkdir(parents=True,exist_ok=True);stem=f'{case}.{label}.{mode}.{rep}';p=folder/(stem+'.run.json');assert not p.exists(),p
 env=dict(ENV)
 if mode=='counts':env['ST_OUTPUT']=str(folder/(stem+'.counts.json'))
 cmd=[binary(label,mode)]
 if case=='zlib.zlib':cmd+=['--std','-I',str(TESTS/'support/zlib_read.js')]
 cmd += [str(script),*map(str,args)]
 t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=900)
 row=dict(label=label,mode=mode,case=case,rep=rep,command=cmd,binary_sha256=sha(cmd[0]),script_sha256=sha(script),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,external_wall_ms=(time.monotonic()-t)*1000)
 save(p,row);assert r.returncode==0 and not r.stderr,row
 return row

def bench(label,mode,suite,c,phase,rep=0):
 native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text())
 ref=native['scripts'][suite][c['case']]['measure'];assert c['N']==ref['N'] and c['sha256']==ref['sha256']==sha(TESTS/c['path'])
 r=capture(label,mode,TESTS/c['path'],[],phase,c['case'],rep)
 prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:'
 p=[json.loads(x[len(prefix):]) for x in r['stdout'].splitlines() if x.startswith(prefix)];assert len(p)==1
 r.update(ms=validator.validate(p[0],suite,c),suite=suite,name=c['name'],group=c['group'],N=c['N']);return r

def main():
 ap=argparse.ArgumentParser();ap.add_argument('phase',choices=['baseline_counts','target_counts','micro_counts','pilot','micro_time','target_time']);a=ap.parse_args();os.sched_setaffinity(0,{2})
 if a.phase in ['baseline_counts','target_counts']:
  labels=['SPARSE'] if a.phase=='baseline_counts' else ['STORE_TRANSITION_IC'];rows=[]
  for suite,c in TARGETS:
   for l in labels:
    bench(l,'counts',suite,c,a.phase+'03')
    data=json.loads((HERE/(a.phase+'03')/f'{c["case"]}.{l}.counts.0.counts.json').read_text());rows.append(dict(label=l,suite=suite,case=c['case'],data=data));save(HERE/f'{a.phase}.json',rows)
    print('COUNTS',l,c['name'],json.dumps(data['totals']),flush=True)
 elif a.phase=='micro_counts':
  rows=[]
  for case in ['plain','plus_one','overwrite','resize','alternate']:
   for l in LABELS:
    r=capture(l,'counts',HERE/'micro.js',[case,65536],a.phase+'03',case)
    data=json.loads((HERE/(a.phase+'03')/f'{case}.{l}.counts.0.counts.json').read_text());rows.append(dict(case=case,label=l,output=json.loads(r['stdout']),data=data));print('MICRO_COUNTS',case,l,data['totals'],flush=True)
  save(HERE/'micro_counts.json',rows)
 elif a.phase=='pilot':
  rows=[]
  for case in ['plain','plus_one']:
   for l in LABELS:
    r=capture(l,'release',HERE/'micro.js',[case,1048576],'pilot02',case);p=json.loads(r['stdout']);rows.append(dict(label=l,**p));print('PILOT',case,l,p,flush=True)
  import math
  n=2**math.ceil(math.log2(1048576*3000/min(r['elapsed_ms'] for r in rows)))
  save(HERE/'micro_protocol.json',dict(iterations=n,repeats=5,pilot=rows,CPU=2,extra_warmup=0,first_call_included=True))
 elif a.phase in ['micro_time','target_time']:
  assert json.loads((HERE/'gate.json').read_text())['status']=='PASS';rows=[]
  protocol_path=HERE/f'{a.phase}.protocol.json';assert not protocol_path.exists()
  save(protocol_path,dict(labels=LABELS,engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in LABELS},
   CPU=2,TZ='Asia/Shanghai',locale='C',repeats=5,extra_warmup=0,first_Run_included=True,
   driver_sha256=sha(Path(__file__)),micro_sha256=sha(HERE/'micro.js'),catalog_sha256=sha(TESTS/'benchmarks.json'),
   order='rep 1..5; alternate engine order at each case and repetition',phase=a.phase))
  for rep in range(1,6):
   cases=['plain','plus_one'] if a.phase=='micro_time' else TARGETS
   for i,item in enumerate(cases):
    for l in (LABELS if (rep+i)%2 else LABELS[::-1]):
     if a.phase=='micro_time':
      n=json.loads((HERE/'micro_protocol.json').read_text())['iterations'];r=capture(l,'release',HERE/'micro.js',[item,n],a.phase,item,rep);p=json.loads(r['stdout']);assert p['checksum']==n*(4 if item=='plus_one' else 3);r.update(ms=p['elapsed_ms'],N=n,name=item)
     else:suite,c=item;r=bench(l,'release',suite,c,a.phase,rep)
     rows.append(r);save(HERE/f'{a.phase}_samples.json',rows);print('TIME',a.phase,rep,r['name'],l,r['ms'],flush=True)
  summary=[]
  for case in dict.fromkeys(r['case'] for r in rows):
   b=[r['ms'] for r in rows if r['case']==case and r['label']=='SPARSE'];v=[r['ms'] for r in rows if r['case']==case and r['label']!='SPARSE']
   summary.append(dict(case=case,SPARSE=b,STORE_TRANSITION_IC=v,SPARSE_median=statistics.median(b),candidate_median=statistics.median(v),change_percent=(statistics.median(v)/statistics.median(b)-1)*100,paired_changes=[(y/x-1)*100 for x,y in zip(b,v)]))
  save(HERE/f'{a.phase}.json',summary)
if __name__=='__main__':main()
