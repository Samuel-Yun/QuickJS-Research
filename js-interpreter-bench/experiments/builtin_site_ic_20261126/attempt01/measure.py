from run import *
LABELS=['SPARSE','BODY','SHAM','SITE']
EXTERNAL_N={'Acorn':1,'MarkdownIt':256}
TARGETS=[('external','Acorn'),('external','MarkdownIt'),('octane','Typescript'),('octane','PdfJS'),('sunspider','string-base64'),('sunspider','string-tagcloud'),('octane','Richards'),('octane','DeltaBlue'),('octane','RayTrace')]
def external(label,case,out,rep=1,mode='release',snapshot=False):
 out=Path(out);out.mkdir(parents=True,exist_ok=True);script=HERE/'external/scripts'/(case+'.js');env=dict(ENV)
 if label in ALIASES:env[ALIASES[label][1]]=ALIASES[label][2]
 stem=f'{case}.{label}.{mode}.{rep}';dest=out/(stem+'.json');assert not dest.exists(),dest
 if snapshot:env.update(QJS_INSPECT_FILE=str(script),QJS_INSPECT_OUTPUT=str(out/(stem+'.snapshot.jsonl')))
 cmd=[binary(label,mode),'--std',str(script),str(EXTERNAL_N[case])];t=time.monotonic();r=subprocess.run(cmd,capture_output=True,text=True,env=env,timeout=1800)
 row=dict(label=label,suite='external',case=case,name=case,rep=rep,mode=mode,command=cmd,control={ALIASES[label][1]:ALIASES[label][2]}if label in ALIASES else{},binary_sha256=sha(cmd[0]),script_sha256=sha(script),exit_code=r.returncode,stdout=r.stdout,stderr=r.stderr,wall_ms=(time.monotonic()-t)*1000)
 save(dest,row);assert not r.returncode,row
 data=[json.loads(l.split(':',1)[1])for l in r.stdout.splitlines()if l.startswith('EXTERNAL_RESULT:')];assert len(data)==1;v=data[0];assert v['N']==EXTERNAL_N[case]and v['case']==case
 if case=='Acorn':assert v['validation']==dict(root='Program',end=544096,nodes=29507,jsonLength=2279819,hash=1052523795)
 else:assert v['validation']==dict(length=12329,hash=3322973581)
 row.update(N=v['N'],ms=v['ms'],validation=v['validation']);assert row['ms']>0
 if mode=='counts':
  row['diagnostic']={k:json.loads(x)for l in r.stderr.splitlines()if ':'in l for k,x in [l.split(':',1)]if k in ['FOUR_COUNTS','BIC_COUNTS']};assert 'BIC_COUNTS'in row['diagnostic']
 else:assert not r.stderr,row
 return row

def sample(label,suite,case,out,rep=1,mode='release',snapshot=False):
 if suite=='external':return external(label,case,out,rep,mode,snapshot)
 return bench(label,suite,native(suite,case),out,rep,mode,snapshot)
def quantile(v,p):
 v=sorted(v);pos=(len(v)-1)*p;i=int(pos);return v[i]+(v[min(i+1,len(v)-1)]-v[i])*(pos-i)
def analyze(out,rows):
 summaries=[]
 for suite,case in dict.fromkeys((r['suite'],r['name'])for r in rows):
  subset=[r for r in rows if r['suite']==suite and r['name']==case];base={r['rep']:r['ms']for r in subset if r['label']=='SPARSE'};body={r['rep']:r['ms']for r in subset if r['label']=='BODY'};sham={r['rep']:r['ms']for r in subset if r['label']=='SHAM'}
  for l in LABELS:
   rr=sorted((r for r in subset if r['label']==l),key=lambda r:r['rep']);vs={k:[r['ms']/ref[r['rep']]for r in rr]for k,ref in [('SPARSE',base),('BODY',body),('SHAM',sham)]};v=[r['ms']for r in rr]
   summaries.append(dict(suite=suite,case=case,label=l,n=len(rr),median_ms=statistics.median(v),min_ms=min(v),max_ms=max(v),ratios=vs,**{k:dict(median=statistics.median(a),percent=(statistics.median(a)-1)*100,min=min(a),max=max(a),p10=quantile(a,.1),p90=quantile(a,.9))for k,a in vs.items()}))
 save(out/'summary.json',summaries);csvout(out/'timings.csv',[{k:r[k]for k in ['suite','case','name','label','rep','N','ms','binary_sha256','wall_ms']}for r in rows])
 lines=['|负载|模式|进程数|中位数 ms/Run|相对 SPARSE 配对中位数|配对变化范围|相对 BODY|相对 SHAM|','|---|---|---:|---:|---:|---:|---:|---:|']
 for r in summaries:lines.append(f'|{r["case"]}|{r["label"]}|{r["n"]}|{r["median_ms"]:.5f}|{r["SPARSE"]["percent"]:+.2f}%|{(r["SPARSE"]["min"]-1)*100:+.2f}% ～ {(r["SPARSE"]["max"]-1)*100:+.2f}%|{r["BODY"]["percent"]:+.2f}%|{r["SHAM"]["percent"]:+.2f}%|')
 (out/'results.md').write_text('\n'.join(lines)+'\n')
 return summaries

def paired(out,cases,reps,start=1,prior=None):
 os.sched_setaffinity(0,{2});out=Path(out);out.mkdir(exist_ok=False);rows=[]
 save(out/'protocol.json',dict(labels=LABELS,cases=cases,reps=reps,start=start,external_N=EXTERNAL_N,CPU=2,TZ='Asia/Shanghai',locale='C',order='rotate labels by (rep+case_index-1) mod 4',first_Run_included=True,extra_warmup=0,diagnostics=False,engines={l:dict(binary=binary(l),sha256=sha(binary(l)))for l in LABELS}))
 for rep in range(start,start+reps):
  for i,(suite,case)in enumerate(cases):
   shift=(rep+i-1)%4
   for l in LABELS[shift:]+LABELS[:shift]:
    r=sample(l,suite,case,out/'raw',rep);rows.append(r);save(out/'samples.json',rows);print('PAIRED',rep,suite,case,l,r['ms'],flush=True)
 allrows=(prior or [])+rows;analyze(out,allrows);save(out/'complete.json',dict(status='PASS',new_processes=len(rows)));return allrows

def counts():
 os.sched_setaffinity(0,{2});out=next_out(HERE,'counts');out.mkdir();rows=[]
 for suite,case in TARGETS:
  for l in LABELS:
   r=sample(l,suite,case,out/'raw',1,'counts',snapshot=True);rows.append(r);save(out/'samples.json',rows);d=r['diagnostic']['BIC_COUNTS'];tot=[sum(s['c'][i]for s in d['sites'])for i in range(16)];print('COUNTS',suite,case,l,'global',d['global'],'site',tot,'life',d.get('lifetime'),flush=True)
 save(out/'complete.json',dict(status='PASS',new_processes=len(rows)))
if __name__=='__main__':
 import argparse
 ap=argparse.ArgumentParser();ap.add_argument('phase',choices=['ten','focus','counts']);a=ap.parse_args()
 if a.phase=='ten':paired(next_out(HERE,'paired'),TARGETS,10)
 elif a.phase=='focus':
  prior=json.loads((HERE/'paired01/samples.json').read_text());cases=[('external','Acorn'),('external','MarkdownIt')];p=[r for r in prior if r['suite']=='external'];paired(next_out(HERE,'focus'),cases,20,11,p)
 else:counts()
