"""Compare one combined pass with the frozen standalone passes. No new controls."""
import csv,json,collections,math,gzip,hashlib,tarfile,io
from pathlib import Path
H=Path(__file__).resolve().parent;ROOT=H.parents[2];OLD=ROOT/'experiments/ctor_ic_followups_20261115/attempt01';R3=ROOT/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan';R=H/'FORWARD_SPARSE'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def gm(a):return math.exp(sum(map(math.log,a))/len(a))
def records(p):return [json.loads(l) for l in (p.read_text() if p.exists() else gzip.open(str(p)+'.gz','rt').read()).splitlines()]
def load(p):return json.loads(p.read_text())
def main():
 m=load(R/'release.manifest.json');w=Path(m['elf']).parent;assert sha(w/'qjs')==m['elf_sha256']
 for n,s in m['sources'].items():assert sha(w/n)==s
 out=R/'analysis';out.mkdir(exist_ok=True);aggregates={};coverage=[];tables=[];refhashes={}
 for suite in ['octane','sunspider']:
  files={'R3':R3/'analysis'/(suite+'.csv'),'FORWARD':OLD/'01_forward_ctor/analysis'/(suite+'.csv'),'SPARSE':OLD/'03_sparse_ctor/analysis'/(suite+'.csv')}
  refs={k:{r['case']:r for r in csv.DictReader(p.open())} for k,p in files.items()};refhashes.update({str(p):sha(p) for p in files.values()});n=17 if suite=='octane' else 26;both={}
  for mode in ['release','counts']:
   folder=R/'runs'/mode/suite;es=records(folder/'runs.jsonl');assert collections.Counter(x['event'] for x in es)=={'process_start':n,'process_result':n,'sample':n}
   both[mode]={r['case']:r for r in es if r['event']=='sample'};assert len(both[mode])==n and all(r['valid'] for r in both[mode].values())
   p=load(folder/'protocol.json')
   for info in p['scripts'].values():assert sha(Path(info['path']))==info['sha256']
   assert set(both[mode])==set(refs['R3'])
  rows=[]
  for case,r in refs['R3'].items():
   z=both['release'][case];diag=both['counts'][case];q=diag['counts'];f=q['follow'];assert z['N']==diag['N']==int(r['N']);assert q['attempts']==q['hits']+q['fallbacks'];assert f[12]==f[14]+f[15] and f[14]==f[16]==f[17]
   x=dict(case=case,N=z['N'],A_ms=float(r['A_ms']),EVAL_COLD_ms=float(r['EVAL_COLD_ms']),C_ms=float(r['C_ms']),R3_ms=float(r['candidate_ms']),FORWARD_ms=float(refs['FORWARD'][case]['candidate_ms']),SPARSE_ms=float(refs['SPARSE'][case]['candidate_ms']),combo_ms=z['ms_per_Run'],V8_ON_ms=float(r['V8_ON_ms']))
   for k in ['A','EVAL_COLD','C','R3','FORWARD','SPARSE','V8_ON']:x['vs_'+k+'_pct']=100*(x['combo_ms']/x[k+'_ms']-1)
   for k in ['FORWARD','SPARSE']:x[k+'_vs_R3_pct']=100*(x[k+'_ms']/x['R3_ms']-1)
   rows.append(x)
   coverage.append(dict(suite=suite,case=case,constructor_attempts=q['attempts']-f[12],constructor_hits=q['hits']-f[14],forward_attempts=f[12],forward_eligible=f[13],forward_hits=f[14],forward_fallbacks=f[15],arguments_objects_avoided=f[16],argument_lists_avoided=f[17],actual_arguments_forwarded=f[18],element_copies_avoided=f[19],template_parse_calls=f[0],negative_cache_hits=f[2],new_plans_Run=f[1],total_slots_lifetime=f[8],total_full_plans_lifetime=f[9],requested_Release_record_bytes=32*f[8]+96*f[9]))
  groups=collections.defaultdict(list)
  for r in rows:groups[r['case'].split('.')[0] if suite=='octane' else r['case']].append(r)
  assert len(groups)==(14 if suite=='octane' else 26)
  sums={k:sum(r[k+'_ms'] for r in rows) for k in ['A','EVAL_COLD','C','R3','FORWARD','SPARSE','combo','V8_ON']}
  agg={k:100*(gm([gm([r['combo_ms']/r[k+'_ms'] for r in v]) for v in groups.values()])-1) for k in ['A','EVAL_COLD','C','R3','FORWARD','SPARSE','V8_ON']}
  agg['standalone_vs_R3_pct']={k:100*(gm([gm([r[k+'_ms']/r['R3_ms'] for r in v]) for v in groups.values()])-1) for k in ['FORWARD','SPARSE']}
  agg.update(sum_ms=sums,max_regression_vs_R3=max(rows,key=lambda r:r['vs_R3_pct']),faster_than_both_cases=[r['case'] for r in rows if r['combo_ms']<min(r['FORWARD_ms'],r['SPARSE_ms'])],slower_than_both_cases=[r['case'] for r in rows if r['combo_ms']>max(r['FORWARD_ms'],r['SPARSE_ms'])])
  aggregates[suite]=agg
  with (out/(suite+'.csv')).open('w') as f:wri=csv.DictWriter(f,fieldnames=list(rows[0]));wri.writeheader();wri.writerows(rows)
  table=['## '+suite+'（ms/Run）','','括号均相对固定R3。R3和两个单版沿用历史单轮，本组合为新单轮，跨批次筛选，无额外热身；计数独立，不进入耗时。','','| 表项 | R3 | 第一轮 FORWARD | 第三轮 SPARSE | 组合 | 组合相对第一轮 | 组合相对第三轮 |','|---|---:|---:|---:|---:|---:|---:|']
  for r in rows:table.append(f"| {r['case']} | {r['R3_ms']:.4f} | {r['FORWARD_ms']:.4f} ({r['FORWARD_vs_R3_pct']:+.2f}%) | {r['SPARSE_ms']:.4f} ({r['SPARSE_vs_R3_pct']:+.2f}%) | {r['combo_ms']:.4f} ({r['vs_R3_pct']:+.2f}%) | {r['vs_FORWARD_pct']:+.2f}% | {r['vs_SPARSE_pct']:+.2f}% |")
  table+=['','几何平均：'+'；'.join(f'组合相对{k} {agg[k]:+.4f}%' for k in ['R3','FORWARD','SPARSE','A','EVAL_COLD','V8_ON'])+'。','', '逐项耗时之和（ms）：'+json.dumps(sums)+'。','']
  (out/(suite+'.md')).write_text('\n'.join(table));tables+=table
 with (out/'coverage.csv').open('w') as f:wri=csv.DictWriter(f,fieldnames=list(coverage[0]));wri.writeheader();wri.writerows(coverage)
 s=dict(status='PASS',formal_samples=43,independent_count_processes=43,new_baseline_full_runs=0,comparison='cross-batch single pass vs historical standalone R3/FORWARD/SPARSE; A/EVAL_COLD/V8 historical30 medians',aggregates=aggregates,reference_files_sha256=refhashes)
 (out/'summary.json').write_text(json.dumps(s,indent=2)+'\n')
 raw=io.BytesIO()
 with tarfile.open(fileobj=raw,mode='w',format=tarfile.USTAR_FORMAT) as t:
  for name in sorted(m['sources']):
   data=(w/name).read_bytes();info=tarfile.TarInfo('quickjs-FORWARD_SPARSE/'+name);info.size=len(data);info.mode=0o644;t.addfile(info,io.BytesIO(data))
 with (R/'source.tar.gz').open('wb') as f:
  with gzip.GzipFile(fileobj=f,mode='wb',filename='',mtime=0) as z:z.write(raw.getvalue())
 (R/'source.sha256').write_text(sha(R/'source.tar.gz')+'  source.tar.gz\n')
 notes=(R/'method.md').read_text() if (R/'method.md').exists() else ''
 overview=['## 整体对照（相对固定R3）','','| 版本 | Octane14 suite GM | SunSpider26项 GM | SunSpider逐项和ms |','|---|---:|---:|---:|']
 for key,name in [('FORWARD','第一轮 FORWARD'),('SPARSE','第三轮 SPARSE')]:
  o=aggregates['octane']['standalone_vs_R3_pct'][key];u=aggregates['sunspider']['standalone_vs_R3_pct'][key];su=aggregates['sunspider']['sum_ms'][key]
  overview.append(f'| {name} | {o:+.4f}% | {u:+.4f}% | {su:.4f} |')
 overview.append(f"| 组合 FORWARD_SPARSE | {aggregates['octane']['R3']:+.4f}% | {aggregates['sunspider']['R3']:+.4f}% | {aggregates['sunspider']['sum_ms']['combo']:.4f} |")
 for suite,a in aggregates.items():overview+=['',suite+'组合相对第一轮 '+f"{a['FORWARD']:+.4f}%"+'；相对第三轮 '+f"{a['SPARSE']:+.4f}%"+'。']
 notes+='\n\n'+'\n'.join(overview)+'\n' 
 (R/'results.md').write_text(notes+'\n\n'+ '\n'.join(tables));(H/'results.md').write_text(notes+'\n\n'+ '\n'.join(tables));print(json.dumps(s,indent=2))
if __name__=='__main__':main()
