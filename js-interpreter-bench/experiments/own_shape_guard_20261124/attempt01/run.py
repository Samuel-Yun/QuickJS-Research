import argparse,importlib.util,json,math,os,statistics,subprocess,time
from pathlib import Path
from build import HERE,ROOT,PACKAGE,LABELS,sha,save
TESTS=PACKAGE/'tests';CATALOG=json.loads((TESTS/'benchmarks.json').read_text())
spec=importlib.util.spec_from_file_location('og_validator',TESTS/'run.py');validator=importlib.util.module_from_spec(spec);spec.loader.exec_module(validator)
ENV=dict(os.environ,TZ='Asia/Shanghai',LC_ALL='C',LANG='C',ASAN_OPTIONS='detect_leaks=0:halt_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
CASES=[('object','fused'),('object','plain'),('function','fused'),('regexp','fused'),('array','fused')]
TARGETS=[c for c in CATALOG['cases']['octane'] if c['name'] in ['RegExp','Gameboy','Typescript']]
def binary(label,mode):
 if label=='A':return str(PACKAGE/'build/A/qjs')
 m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text());assert sha(m['binary'])==m['binary_sha256']
 for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
 return m['binary']
def capture(label,mode,script,args,phase,case,rep=0,snapshot=False):
 d=HERE/phase;d.mkdir(parents=True,exist_ok=True);stem=f'{case}.{label}.{mode}.{rep}';p=d/(stem+'.run.json');assert not p.exists(),p
 env=dict(ENV)
 if mode=='counts':env['OG_OUTPUT']=str(d/(stem+'.counts.json'))
 if snapshot:env.update(QJS_INSPECT_FILE=str(script),QJS_INSPECT_OUTPUT=str(d/(stem+'.snapshot.jsonl')))
 cmd=[binary(label,mode)]
 if case=='zlib.zlib':cmd+=['--std','-I',str(TESTS/'support/zlib_read.js')]
 cmd += [str(script),*map(str,args)];t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=1200)
 row=dict(label=label,mode=mode,case=case,rep=rep,command=cmd,binary_sha256=sha(cmd[0]),script_sha256=sha(script),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,external_wall_ms=(time.monotonic()-t)*1000)
 save(p,row);assert r.returncode==0,row
 if mode=='counts':assert all(x.startswith('OG_LAYOUT ') for x in r.stderr.splitlines()),row
 else:assert not r.stderr,row
 return row

def bench(label,mode,suite,c,phase,rep=0):
 native=json.loads((ROOT/'experiments/native_confirmation_20261108/attempt02/protocol.json').read_text());ref=native['scripts'][suite][c['case']]['measure']
 assert c['N']==ref['N'] and c['sha256']==ref['sha256']==sha(TESTS/c['path'])
 r=capture(label,mode,TESTS/c['path'],[],phase,c['case'],rep)
 prefix='OCTANE_IC_RESULT:' if suite=='octane' else 'TEB_RESULT:';p=[json.loads(x[len(prefix):]) for x in r['stdout'].splitlines() if x.startswith(prefix)];assert len(p)==1
 r.update(ms=validator.validate(p[0],suite,c),suite=suite,name=c['name'],group=c['group'],N=c['N']);return r

def read_counts(path):
 d=json.loads(Path(path).read_text());c=d['totals'];assert c['logical_named']==c['rdi0_named']+c['rdi1_named'];assert c['logical_named']==c['hits']+c['normal_lookups'];assert c['hits']==c['fused_hits']+c['field_hits']+c['prototype_hits']
 for s in d['sites']:
  q=sum(x['counts']['query'] for x in s['classes']);assert q<=s['counts']['logical_named']
  for x in s['classes']:assert x['counts']['query']==x['counts']['hit']+x['counts']['lookup']
 return d

def main():
 os.sched_setaffinity(0,{2});ap=argparse.ArgumentParser();ap.add_argument('phase',choices=['micro_counts','target_counts','pilot','micro_time','target_time','decide']);a=ap.parse_args()
 if a.phase=='micro_counts':
  rows=[]
  spec=importlib.util.spec_from_file_location('og_display',PACKAGE/'tools/bytecode.py');tool=importlib.util.module_from_spec(spec);spec.loader.exec_module(tool)
  for kind,mode in CASES:
   case=kind+'.'+mode
   for l in LABELS:
    r=capture(l,'counts',HERE/'micro.js',[kind,mode,65536],a.phase,case,snapshot=True);p=json.loads(r['stdout']);assert p['checksum']==196608
    stem=f'{case}.{l}.counts.0';d=read_counts(HERE/a.phase/(stem+'.counts.json'));fn='readPlain' if mode=='plain' else 'readX';sites=[s for s in d['sites'] if s['function']==fn];assert len(sites)==1 and sites[0]['counts']['logical_named']==65536
    snapshots=[json.loads(x) for x in (HERE/a.phase/(stem+'.snapshot.jsonl')).read_text().splitlines()];selected=[s for s in snapshots if s['function']==fn];assert len(selected)==1
    names=[op['name'] for op in selected[0]['opcodes']];assert names==(['get_arg1','get_field_rdi','return'] if mode=='plain' else ['v6_get_arg0','get_field_rdi','return']),names
    (HERE/a.phase/(stem+'.bytecode.txt')).write_text(tool.disassemble(selected))
    rows.append(dict(case=case,label=l,site=sites[0],layout=d['layout']));print('MICRO_COUNTS',case,l,sites[0]['counts'],sites[0]['classes'],flush=True)
  save(HERE/'micro_counts.json',rows)
 elif a.phase=='target_counts':
  rows=[]
  for c in TARGETS:
   for l in LABELS:
    bench(l,'counts','octane',c,a.phase);d=read_counts(HERE/a.phase/f'{c["case"]}.{l}.counts.0.counts.json');rows.append(dict(label=l,case=c['case'],data=d));save(HERE/'target_counts.json',rows)
    new=sum(x['counts']['nonbaseline_hit'] for s in d['sites'] for x in s['classes']);print('TARGET_COUNTS',c['name'],l,'new_class_hits',new,flush=True)
 elif a.phase=='pilot':
  rows=[]
  for mode in ['fused','plain']:
   for l in LABELS:
    r=capture(l,'release',HERE/'micro.js',['object',mode,1048576],a.phase,'object.'+mode);p=json.loads(r['stdout']);rows.append(dict(label=l,**p));print('PILOT',l,mode,p['elapsed_ms'],flush=True)
  n=2**math.ceil(math.log2(1048576*3000/min(r['elapsed_ms'] for r in rows)));save(HERE/'micro_protocol.json',dict(iterations=n,repeats=5,pilot=rows,CPU=2,first_call_included=True,extra_warmup=0))
 elif a.phase in ['micro_time','target_time']:
  assert json.loads((HERE/'gate.json').read_text())['status']=='PASS';rows=[]
  proto=HERE/f'{a.phase}.protocol.json';assert not proto.exists();save(proto,dict(engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in LABELS},CPU=2,TZ='Asia/Shanghai',locale='C',first_Run_included=True,extra_warmup=0,repeats=5,driver_sha256=sha(Path(__file__)),micro_sha256=sha(HERE/'micro.js')))
  for rep in range(1,6):
   items=CASES if a.phase=='micro_time' else TARGETS
   for i,c in enumerate(items):
    shift=(rep+i-1)%3;order=LABELS[shift:]+LABELS[:shift]
    for l in order:
     if a.phase=='micro_time':
      kind,mode=c;case=kind+'.'+mode;n=json.loads((HERE/'micro_protocol.json').read_text())['iterations'];r=capture(l,'release',HERE/'micro.js',[kind,mode,n],a.phase,case,rep);p=json.loads(r['stdout']);assert p['checksum']==n*3;r.update(ms=p['elapsed_ms'],name=case,N=n)
     else:r=bench(l,'release','octane',c,a.phase,rep)
     rows.append(r);save(HERE/f'{a.phase}_samples.json',rows);print('TIME',a.phase,rep,r['name'],l,r['ms'],flush=True)
  out=[]
  for case in dict.fromkeys(r['case'] for r in rows):
   base=statistics.median(r['ms'] for r in rows if r['case']==case and r['label']=='SPARSE')
   for l in LABELS:
    values=[r['ms'] for r in rows if r['case']==case and r['label']==l];out.append(dict(case=case,label=l,values=values,median=statistics.median(values),min=min(values),max=max(values),change_percent=(statistics.median(values)/base-1)*100))
  save(HERE/f'{a.phase}.json',out)
 elif a.phase=='decide':
  times=json.loads((HERE/'target_time.json').read_text());items=[]
  for l in LABELS[1:]:
   evidence=[]
   for c in TARGETS:
    b,v=[next(x for x in times if x['case']==c['case'] and x['label']==z) for z in ['SPARSE',l]];pairs=[(y/x-1)*100 for x,y in zip(b['values'],v['values'])]
    evidence.append(dict(case=c['case'],median_change=v['change_percent'],paired_changes=pairs,repeatable=all(p<0 for p in pairs) and v['change_percent']<0))
   items.append(dict(label=l,run_full=any(e['repeatable'] for e in evidence),evidence=evidence))
  save(HERE/'decision.json',items);print('DECISION',json.dumps(items),flush=True)
if __name__=='__main__':main()
