"""Post-formal supplement: exact measurement driver N1/N2, never performance data."""
import collections,re
import diagnostics
from common import *
def main():
 assert read(HERE/'analysis/audit.json')['status']=='PASS','no diagnostics concurrent with formal samples'
 store=STORE/'measurement_driver_reports';store.mkdir(exist_ok=True);manifest=read(HERE/'diagnostic_manifest.json');summary=[];archives=[]
 for c in CASES:
  for n in [1,2]:
   datasets={};icdata={}
   for v in 'MR':
    p=script(c,n,False);a=manifest['artifacts'][v];dest=store/f'{c}.N{n}.{v}';e=env();e['READ_IC_REPORT']=str(dest)+'.ic.json';e['LAYOUT_REPORT']=str(dest)+'.dispatch.json'
    r=capture(f'measure_driver_{c}_N{n}_{v}',[a['path'],p],e=e);assert not r['exit_code'] and not r['stderr'];payload=json.loads(re.findall(r'^TEB_RESULT:(.*)$',r['stdout'],re.M)[0]);assert payload['correctness']=='PASS' and payload['warmup_calls']==0
    for kind in ['ic','dispatch']:
     gz=HERE/'diagnostic/measurement_driver'/f'{c}.N{n}.{v}.{kind}.json.gz';archives.append(dict(**compress(Path(str(dest)+'.'+kind+'.json'),gz),command=r['command'],script_sha256=sha(p),binary_sha256=a['sha256'],N=n,performance_sample=False,driver='same measurement generator; N1/N2 not formal elapsed samples'))
    datasets[v]=read(HERE/'diagnostic/measurement_driver'/f'{c}.N{n}.{v}.dispatch.json.gz');icdata[v]=diagnostics.module().validate(read(HERE/'diagnostic/measurement_driver'/f'{c}.N{n}.{v}.ic.json.gz'),v)
   def canon(data,normalize=False):
    out=collections.Counter()
    for f in data['functions']:
     for s in f['dispatch']:
      key=(diagnostics.canonical(f),s['pc'],s['ordinary_opcode'])
      if normalize:out[key]+=s['ordinary_count']+s['ic_count']
      else:out[(key,s['ic_opcode'],s['ordinary_count'],s['ic_count'])]+=1
    return out
   assert collections.Counter(diagnostics.canonical(f) for f in datasets['M']['functions'])==collections.Counter(diagnostics.canonical(f) for f in datasets['R']['functions'])
   assert canon(datasets['M'],True)==canon(datasets['R'],True)
   row=dict(case=c,N=n,normalized_per_PC_equal=True,raw_dispatch_equal=canon(datasets['M'])==canon(datasets['R']),whole_M={},whole_R={})
   for v in 'MR':
    ss=[s for f in icdata[v]['functions'] for s in f['sites']];row['whole_'+v]={k:sum(s[k] for s in ss) for k in ['queries','hits','updates','replacements','exits','post_exit_reads','streak_reads','streak_writes','streak_resets']}
   if c!=CASES[3]:assert row['raw_dispatch_equal'] and row['whole_R']['exits']==row['whole_R']['post_exit_reads']==0
   summary.append(row)
 save(HERE/'diagnostic/measurement_driver/gate.json',dict(status='PASS',checks=summary,scope='post-formal independent N1/N2 exact measurement driver; times not analyzed'));save(HERE/'diagnostic/measurement_driver/archives.json',archives)
 print('EXACT_MEASUREMENT_DRIVER_N1_N2_PASS',16)
if __name__=='__main__':main()
