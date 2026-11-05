"""Data-only standard-library statistics, never requires historical executables."""
import argparse,collections,math,random,statistics as st
from common import *
def quantile(x,p):
 x=sorted(x);f=(len(x)-1)*p;a=int(f);b=min(a+1,len(x)-1);return x[a]+(x[b]-x[a])*(f-a)
def stats(x):
 x=sorted(x);h=len(x)//2;q1=st.median(x[:h]) if h else x[0];q3=st.median(x[-h:]) if h else x[-1]
 return dict(n=len(x),median=st.median(x),mean=st.mean(x),stddev=st.stdev(x) if len(x)>1 else None,Q1=q1,Q3=q3,IQR=q3-q1,min=x[0],max=x[-1])
def raw():return [read(p) for stage in ['base_pre','layout','base_post'] for p in sorted((HERE/'raw'/stage).rglob('*.json'))]
def ratio_row(case,cohort,comparison,num,den,values,base,counts,n):
 lo,hi=quantile(values,.025),quantile(values,.975)
 return dict(case=case,cohort=cohort,comparison=comparison,numerator=num,denominator=den,ratio=base,CI_low=lo,CI_high=hi,direction='right_faster' if lo>1 else 'right_slower' if hi<1 else 'unclear',counts=counts,N=n)
def analyze(output=None):
 out=Path(output) if output else HERE/'analysis';records=raw();assert all(r['valid'] for r in records),'invalid records: report explicitly before statistics'
 groups=collections.defaultdict(list)
 for r in records:groups[(r['case'],r['stage'],r['condition'])].append(r)
 statistic=[]
 for (case,stage,condition),rs in sorted(groups.items()):
  for boundary,key in [('internal_ms_per_Run','elapsed_per_Run_ms'),('external_ms_process','outer_wall_ns')]:
   vals=[r[key]/(1e6 if key=='outer_wall_ns' else 1) for r in rs]
   statistic.append(dict(case=case,stage=stage,condition=condition,boundary=boundary,N=rs[0]['N'],**stats(vals)))
 ratios=[];interactions=[];summary=[];rng=random.Random(SEED)
 for case in CASES:
  rs=[r for r in records if r['case']==case];n=rs[0]['N'];base={}
  for stage in ['base_pre','base_post']:
   a=sorted([r for r in rs if r['stage']==stage and r['condition']=='M_base'],key=lambda r:r['rep']);b=sorted([r for r in rs if r['stage']==stage and r['condition']=='R_base'],key=lambda r:r['rep'])
   assert len(a)==len(b)==12;base[stage]=([r['elapsed_per_Run_ms'] for r in a],[r['elapsed_per_Run_ms'] for r in b])
  for label in ['base_pre','base_post','base_combined_stratified']:
   stages=['base_pre','base_post'] if label.endswith('stratified') else [label]
   a=sum([base[s][0] for s in stages],[]);b=sum([base[s][1] for s in stages],[]);point=st.median(a)/st.median(b);boot=[]
   for _ in range(10000):
    aa=[];bb=[]
    for s in stages:
     indexes=[rng.randrange(12) for i in range(12)];aa += [base[s][0][i] for i in indexes];bb += [base[s][1][i] for i in indexes]
    boot.append(st.median(aa)/st.median(bb))
   row=ratio_row(case,label,'M/R','M_base','R_base',boot,point,len(a),n);ratios.append(row)
   summary.append(dict(case=case,cohort=label,N=n,M_median_ms=st.median(a),R_median_ms=st.median(b),R_time_change_pct=(st.median(b)/st.median(a)-1)*100,M_R=point,CI_low=row['CI_low'],CI_high=row['CI_high'],n_each=len(a)))
  lr=[r for r in rs if r['stage']=='layout']
  if not lr:continue
  series={c:[next(r['elapsed_per_Run_ms'] for r in lr if r['condition']==c and r['block']==i) for i in range(16)] for c in LAYOUT}
  comparisons=[('M_p'+f'{p:03}','R_p'+f'{p:03}') for p in [0,16,32,48]]+[(v+'_p000',v+'_p'+f'{p:03}') for v in 'MR' for p in [16,32,48]]
  boots={x:[] for x in comparisons};iboot={p:[] for p in [16,32,48]}
  for _ in range(10000):
   indexes=[rng.randrange(16) for i in range(16)];med={k:st.median([x[i] for i in indexes]) for k,x in series.items()}
   for x in comparisons:boots[x].append(med[x[0]]/med[x[1]])
   for p in iboot:iboot[p].append(math.log(med[f'R_p{p:03}']/med[f'M_p{p:03}'])-math.log(med['R_p000']/med['M_p000']))
  med={k:st.median(x) for k,x in series.items()}
  for (a,b),boot in boots.items():
   row=ratio_row(case,'layout',a+'/'+b,a,b,boot,med[a]/med[b],16,n);ratios.append(row)
   if a.startswith('M_') and b.startswith('R_'):summary.append(dict(case=case,cohort=a[2:],N=n,M_median_ms=med[a],R_median_ms=med[b],R_time_change_pct=(med[b]/med[a]-1)*100,M_R=med[a]/med[b],CI_low=row['CI_low'],CI_high=row['CI_high'],n_each=16))
  for p,boot in iboot.items():
   low,high=quantile(boot,.025),quantile(boot,.975)
   interactions.append(dict(case=case,padding=p,log_interaction=math.log(med[f'R_p{p:03}']/med[f'M_p{p:03}'])-math.log(med['R_p000']/med['M_p000']),CI_low=low,CI_high=high,direction='not_detected' if low<=0<=high else 'nonzero_exploratory',blocks=16))
 csvout(out/'statistics.csv',statistic);csvout(out/'ratios.csv',ratios);csvout(out/'summary.csv',summary)
 if interactions:csvout(out/'interactions.csv',interactions)
 tables=['# 当前批次内部时间与探索区间','单位ms/完整Run，micro每Run4096轮；M/R>1为R快。base与layout不混池，无总体GM。','|case|cohort|N|M median|R median|M/R [95%]|R/M时间变化|n/边|','|---|---|---:|---:|---:|---|---:|---:|']
 for r in summary:tables.append(f'|{r["case"]}|{r["cohort"]}|{r["N"]}|{r["M_median_ms"]:.6f}|{r["R_median_ms"]:.6f}|{r["M_R"]:.5f} [{r["CI_low"]:.5f},{r["CI_high"]:.5f}]|{r["R_time_change_pct"]:+.2f}%|{r["n_each"]}|')
 save(out/'tables.md','\n'.join(tables)+'\n');plots(out,ratios);external(records,out)
 csvout(out/'raw_distribution.csv',[dict(case=r['case'],stage=r['stage'],condition=r['condition'],rep=r['rep'],block=r['block'],order=r['order'],N=r['N'],elapsed_ms=r['elapsed_ms'],ms_per_Run=r['elapsed_per_Run_ms'],outer_ms_process=r['outer_wall_ns']/1e6,timestamp=r['timestamp'],valid=r['valid']) for r in sorted(records,key=lambda r:r['outer_start_ns'])])
 print('STATISTICS_REBUILT',len(records),flush=True)
def external(records,out):
 rng=random.Random(SEED);ratios=[]
 for c in CASES:
  rr=[r for r in records if r['case']==c];n=rr[0]['N'];base={}
  for stage in ['base_pre','base_post']:
   base[stage]={v:[r['outer_wall_ns']/1e6 for r in sorted([r for r in rr if r['stage']==stage and r['condition']==v+'_base'],key=lambda r:r['rep'])] for v in 'MR'}
  for label in ['base_pre','base_post','base_combined_stratified']:
   stages=['base_pre','base_post'] if label.endswith('stratified') else [label];med={v:st.median(sum([base[s][v] for s in stages],[])) for v in 'MR'};boot=[]
   for _ in range(10000):
    vals={v:[] for v in 'MR'}
    for s in stages:
     ix=[rng.randrange(12) for i in range(12)]
     for v in 'MR':vals[v]+=[base[s][v][i] for i in ix]
    boot.append(st.median(vals['M'])/st.median(vals['R']))
   ratios.append(dict(**ratio_row(c,label,'M/R','M_base','R_base',boot,med['M']/med['R'],12*len(stages),n),numerator_ms_process=med['M'],denominator_ms_process=med['R']))
  lr=[r for r in rr if r['stage']=='layout']
  if not lr:continue
  series={k:[next(r['outer_wall_ns']/1e6 for r in lr if r['condition']==k and r['block']==i) for i in range(16)] for k in LAYOUT}
  comparisons=[('M_p'+f'{p:03}','R_p'+f'{p:03}') for p in [0,16,32,48]]+[(v+'_p000',v+'_p'+f'{p:03}') for v in 'MR' for p in [16,32,48]];boots={x:[] for x in comparisons}
  for _ in range(10000):
   ix=[rng.randrange(16) for i in range(16)];med={k:st.median([vals[i] for i in ix]) for k,vals in series.items()}
   for a,b in comparisons:boots[(a,b)].append(med[a]/med[b])
  med={k:st.median(x) for k,x in series.items()}
  for (a,b),boot in boots.items():ratios.append(dict(**ratio_row(c,'layout',a+'/'+b,a,b,boot,med[a]/med[b],16,n),numerator_ms_process=med[a],denominator_ms_process=med[b]))
 csvout(out/'external_ratios.csv',ratios)
def plots(out,ratios):
 from html import escape
 for case in CASES:
  rr=[r for r in ratios if r['case']==case and (r['comparison']=='M/R' or (r['cohort']=='layout' and r['numerator'].startswith('M_') and r['denominator'].startswith('R_')))]
  lo=min([.95]+[r['CI_low'] for r in rr]);hi=max([1.05]+[r['CI_high'] for r in rr]);fx=lambda x:210+(x-lo)/(hi-lo)*560
  s=[f'<svg xmlns="http://www.w3.org/2000/svg" width="900" height="{110+len(rr)*38}"><rect width="100%" height="100%" fill="white"/><g font-family="sans-serif" font-size="14" fill="black">',f'<text x="15" y="24">{escape(case)} — median M/R, exploratory 95% interval</text>',f'<line x1="{fx(1)}" x2="{fx(1)}" y1="45" y2="{60+len(rr)*38}" stroke="#888" stroke-dasharray="4 4"/>']
  for i,r in enumerate(rr):
   y=65+i*38;s += [f'<text x="15" y="{y+5}">{escape(r["cohort"] if r["cohort"]!="layout" else r["numerator"][2:])}</text>',f'<line x1="{fx(r["CI_low"])}" x2="{fx(r["CI_high"])}" y1="{y}" y2="{y}" stroke="#154360" stroke-width="3"/>',f'<circle cx="{fx(r["ratio"])}" cy="{y}" r="4" fill="#154360"/>',f'<text x="790" y="{y+5}">{r["ratio"]:.4f}</text>']
  s.append('</g></svg>');save(out/(case+'.svg'),'\n'.join(s))
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--output');a=p.parse_args();analyze(a.output)
