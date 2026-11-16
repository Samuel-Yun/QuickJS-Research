import json,csv,statistics,math,gzip
from pathlib import Path
from build import H,ROOT

def records(phase):
 p=H/'raw'/phase/'runs.jsonl';return [r for r in map(json.loads,p.read_text().splitlines()) if r['event']=='sample']
def csvout(p,rows):
 with p.open('w') as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
def decode(row):
 out=[]
 for i in row['opcodes']:
  operand=i.get('atom','')
  if 'site_index' in i:operand+=f" IC[{i['site_index']}] delta={i['site_delta']}"
  elif 'constructor_index' in i:operand=f"record[{i['constructor_index']}] argc={i['argc']}"
  elif 'target' in i:operand='->'+str(i['target'])
  elif i['format'] in ['u8','i8','u16','i16','u32','i32','loc','loc8','arg','npop','const']:
   raw=bytes.fromhex(i['raw'])[1:];operand=str(int.from_bytes(raw,'little',signed=i['format'].startswith('i')))
  out.append(dict(pc=i['pc'],opcode=i['name'],operand=operand,raw=i['raw']))
 return out

def main():
 times=records('measure');diag=records('counts');assert len(times)==130 and len(diag)==13
 out=H/'analysis';out.mkdir(exist_ok=True);summary=[];countrows=[];snaps=H/'snapshots';snaps.mkdir(exist_ok=True)
 for d in diag:
  c=d['counts'];n=d['iterations'];kind=d['kind'];r=d['target'];q,h,m=c['read'][:3] if kind=='read' else (c['ctor'][0],c['ctor'][1],c['ctor'][4]);neg=c['sparse'][2];actual=100*(h if kind!='negative' else neg)/n
  countrows.append(dict(kind=kind,target=r,iterations=n,queries=q,positive_or_read_hits=h,misses_or_normal_constructions=m,negative_hits=neg,template_entries=c['sparse'][0],fused_hits=c['read'][3],regular_hits=c['read'][4],actual_hit_percent=actual))
  for label in ['A','SPARSE']:
   rows=[t for t in times if t['kind']==kind and t['target']==r and t['label']==label];assert len(rows)==5;vals=[t['elapsed_ms'] for t in rows]
   summary.append(dict(kind=kind,target=r,label=label,iterations=n,actual_SPARSE_hit_percent=actual,median_ms=statistics.median(vals),min_ms=min(vals),max_ms=max(vals),mean_ms=statistics.mean(vals),cv_percent=statistics.stdev(vals)/statistics.mean(vals)*100))
  for snap in d['snapshots']:
   stem=kind+'.'+str(r)+'.SPARSE.'+snap['label'];(snaps/(stem+'.json')).write_text(json.dumps(snap,indent=2));decoded=decode(snap);csvout(snaps/(stem+'.csv'),decoded);(snaps/(stem+'.txt')).write_text('\n'.join(f"{i['pc']:04d}  {i['opcode']:<22} {i['operand']}" for i in decoded)+'\n')
 csvout(out/'statistics.csv',summary);csvout(out/'counts.csv',countrows);csvout(out/'samples.csv',[{k:r[k] for k in ['kind','target','label','rep','iterations','elapsed_ms','checksum']} for r in times])
 metrics={}
 for kind in ['read','positive','negative']:
  def value(label,rate):return next(r['median_ms'] for r in summary if r['kind']==kind and r['label']==label and r['target']==rate)
  metrics[kind]=dict(method_low_vs_high_pct=100*(value('SPARSE',0)/value('SPARSE',100)-1),A_low_vs_high_pct=100*(value('A',0)/value('A',100)-1),method_high_vs_A_pct=100*(value('SPARSE',100)/value('A',100)-1),method_low_vs_A_pct=100*(value('SPARSE',0)/value('A',0)-1))
 historical={}
 for suite in ['octane','sunspider']:
  p=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor/analysis'/(suite+'.csv');historical[suite]=list(csv.DictReader(p.open()))
 result=dict(method_name='按需构造缓存',statistics=summary,counts=countrows,metrics=metrics,historical=historical,full_suites_rerun=False)
 (out/'data.json').write_text(json.dumps(result,indent=2,ensure_ascii=False));text=['# 按需构造缓存：命中率、字节码和时间','','每个表格时间是5个独立Release进程中位数，范围全部保留；计数来自独立诊断进程，生成序列不计时。A没有本项目的IC，按同一输入对照。','']
 for kind,title in [('read','属性读取'),('positive','正计划构造'),('negative','负缓存构造')]:
  text+=['## '+title,'','| 目标档位 | 实测命中率 | A中位数 [范围] ms | 按需构造缓存中位数 [范围] ms |','|---|---:|---:|---:|']
  for c in [x for x in countrows if x['kind']==kind]:
   a=next(x for x in summary if x['kind']==kind and x['target']==c['target'] and x['label']=='A');s=next(x for x in summary if x['kind']==kind and x['target']==c['target'] and x['label']=='SPARSE');text.append(f"| {c['target']}% | {c['actual_hit_percent']:.8f}% | {a['median_ms']:.3f} [{a['min_ms']:.3f}, {a['max_ms']:.3f}] | {s['median_ms']:.3f} [{s['min_ms']:.3f}, {s['max_ms']:.3f}] |")
  text+=['',f"按需构造缓存从高命中降到低命中，耗时变化{metrics[kind]['method_low_vs_high_pct']:+.2f}%；A相同输入变化{metrics[kind]['A_low_vs_high_pct']:+.2f}%。",'']
 (H/'results.md').write_text('\n'.join(text));print(json.dumps(metrics,indent=2))
if __name__=='__main__':main()
