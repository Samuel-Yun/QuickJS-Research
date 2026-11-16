"""Saved-data comparison with C, both components, and old A/EVAL/V8 references."""
import collections,csv,json,math
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
FOUR=ROOT/'experiments/ic_four_rounds_20261115/attempt01'
def gm(values):return math.exp(sum(map(math.log,values))/len(values))
def rows(path):return list(csv.DictReader(path.open()))
def load_samples(mode,suite):
 events=[json.loads(line) for line in (HERE/'runs'/mode/suite/'runs.jsonl').read_text().splitlines()]
 n=17 if suite=='octane' else 26
 assert collections.Counter(r['event'] for r in events)=={'process_start':n,'process_result':n,'sample':n}
 samples={r['case']:r for r in events if r['event']=='sample'};assert len(samples)==n and all(r['valid'] for r in samples.values())
 return samples
def main():
 out=HERE/'analysis';out.mkdir(exist_ok=True);summary={};tables=[];covered=[];totals={k:collections.Counter() for k in ['constructor','index']}
 for suite in ['octane','sunspider']:
  first=rows(FOUR/'03_constructor_plan/analysis'/(suite+'.csv'));second={r['case']:r for r in rows(FOUR/'04_index_consume/analysis'/(suite+'.csv'))}
  samples=load_samples('release',suite);counts=load_samples('counts',suite);assert set(samples)==set(second)==set(counts)=={r['case'] for r in first}
  result=[]
  for r in first:
   case=r['case'];s=second[case];z=samples[case];c=counts[case]['counts'];assert z['N']==counts[case]['N']==int(r['N'])==int(s['N'])
   x=dict(case=case,N=z['N'],A_ms=float(r['A_ms']),EVAL_COLD_ms=float(r['EVAL_COLD_ms']),C_ms=float(r['C_ms']),R3_ms=float(r['candidate_ms']),R4_ms=float(s['candidate_ms']),combo_ms=z['ms_per_Run'],V8_ON_ms=float(r['V8_ON_ms']))
   assert float(s['C_ms'])==x['C_ms']
   for name in ['A','EVAL_COLD','C','R3','R4','V8_ON']:x['vs_'+name+'_pct']=100*(x['combo_ms']/x[name+'_ms']-1)
   bykind={k:collections.Counter() for k in ['constructor','index']}
   for site in c['sites']:
    op=int(site['bytecode_hex'][:2],16);assert op in [33,67];kind='constructor' if op==33 else 'index'
    for key in ['attempts','hits','fallbacks','fills']:bykind[kind][key]+=site[key]
   assert sum(v['hits'] for v in bykind.values())==c['hits']
   for kind,d in bykind.items():
    for key in ['attempts','hits','fallbacks','fills']:x[kind+'_'+key]=d[key]
    totals[kind].update(d)
    covered.append(dict(suite=suite,case=case,kind=kind,**{key:d[key] for key in ['attempts','hits','fallbacks','fills']}))
   result.append(x)
  groups=collections.defaultdict(list)
  for r in result:groups[r['case'].split('.')[0] if suite=='octane' else r['case']].append(r)
  assert len(groups)==(14 if suite=='octane' else 26)
  def agg(numerator,denominator):return 100*(gm([gm([r[numerator]/r[denominator] for r in g]) for g in groups.values()])-1)
  aggdata={name:agg('combo_ms',name+'_ms') for name in ['A','EVAL_COLD','C','R3','R4','V8_ON']}
  aggdata['standalone_R3_vs_C_pct']=agg('R3_ms','C_ms');aggdata['standalone_R4_vs_C_pct']=agg('R4_ms','C_ms')
  aggdata['independent_multiplicative_reference_pct']=100*((1+aggdata['standalone_R3_vs_C_pct']/100)*(1+aggdata['standalone_R4_vs_C_pct']/100)-1)
  if suite=='sunspider':aggdata['sum_ms']={name:sum(r[name+'_ms'] for r in result) for name in ['C','R3','R4','combo']}
  summary[suite]=aggdata
  with (out/(suite+'.csv')).open('w') as f:w=csv.DictWriter(f,fieldnames=list(result[0]));w.writeheader();w.writerows(result)
  table=[f'## {suite}', '', '| 表项 | C 旧单轮 | 第三轮旧单轮 | 第四轮旧单轮 | 3+4 新单轮 | 相对 C | 相对第三轮 | 相对第四轮 |', '|---|---:|---:|---:|---:|---:|---:|---:|']
  for r in result:table.append(f"| {r['case']} | {r['C_ms']:.4f} | {r['R3_ms']:.4f} | {r['R4_ms']:.4f} | {r['combo_ms']:.4f} | {r['vs_C_pct']:+.2f}% | {r['vs_R3_pct']:+.2f}% | {r['vs_R4_pct']:+.2f}% |")
  table+=['', '组合版 GM：'+'；'.join(f"相对 {name} **{aggdata[name]:+.4f}%**" for name in ['C','R3','R4','A','EVAL_COLD','V8_ON'])+'。','']
  if suite=='sunspider':table+=['26 项时间之和（ms）：'+json.dumps(aggdata['sum_ms'])+'。','']
  (out/(suite+'.md')).write_text('\n'.join(table));tables+=table
 with (out/'coverage.csv').open('w') as f:w=csv.DictWriter(f,fieldnames=list(covered[0]));w.writeheader();w.writerows(covered)
 obj=dict(status='PASS',fresh_release_processes=43,independent_counter_processes=43,formal_control_retests=0,aggregates=summary,coverage_totals={k:dict(v) for k,v in totals.items()},unit='ms / complete Run',comparison='fresh combo single vs historical single C/R3/R4; A/EVAL_COLD/V8_ON historical medians')
 (out/'summary.json').write_text(json.dumps(obj,indent=2)+'\n')
 if (HERE/'method.md').exists():(HERE/'results.md').write_text((HERE/'method.md').read_text()+'\n\n'+'\n'.join(tables))
 (out/'tables.md').write_text('\n'.join(tables));print(json.dumps(obj,indent=2))
if __name__=='__main__':main()
