import json,csv,math,statistics,collections,gzip,hashlib,tarfile,io
from pathlib import Path
from build import H,sha
LABELS=['R3','NEGATIVE_ONLY','SPARSE','LAYOUT_OFF']
def rows(phase,mode):
 p=H/'runs'/phase/mode/'runs.jsonl';s=p.read_text() if p.exists() else gzip.open(str(p)+'.gz','rt').read();es=[json.loads(l) for l in s.splitlines()];assert all(r['valid'] for r in es if r['event']=='sample');return [r for r in es if r['event']=='sample']
def save_csv(path,rs):
 with path.open('w') as f:w=csv.DictWriter(f,fieldnames=list(rs[0]));w.writeheader();w.writerows(rs)
def gm(xs):return math.exp(sum(map(math.log,xs))/len(xs))
def main():
 out=H/'analysis';out.mkdir(exist_ok=True);times=rows('target','release');counts=rows('target','counts');assert len(times)==len(counts)==60
 target=[];raw=[]
 for case in ['RayTrace.RayTrace','access-binary-trees','EarleyBoyer.Boyer']:
  reference=statistics.median([r['ms_per_Run'] for r in times if r['case']==case and r['label']=='R3'])
  for label in LABELS:
   ts=sorted([r for r in times if r['case']==case and r['label']==label],key=lambda r:r['repetition']);cs=sorted([r for r in counts if r['case']==case and r['label']==label],key=lambda r:r['repetition']);assert len(ts)==len(cs)==5
   t=[r['ms_per_Run'] for r in ts];parse=[r['counts']['sparse'][0] if label=='SPARSE' else r['counts']['negative'][0] for r in cs];negative=[r['counts']['sparse'][2] if label=='SPARSE' else r['counts']['negative'][1] for r in cs];positive=[r['counts']['ctor'][1] for r in cs];empty=[r['counts']['negative'][6] for r in cs]
   x=dict(case=case,label=label,N=ts[0]['N'],ms_median=statistics.median(t),ms_min=min(t),ms_max=max(t),ms_mean=statistics.mean(t),vs_R3_median_pct=100*(statistics.median(t)/reference-1),parses_median=statistics.median(parse),parses_min=min(parse),parses_max=max(parse),negative_hits_median=statistics.median(negative),positive_hits_median=statistics.median(positive),positive_hits_min=min(positive),positive_hits_max=max(positive),empty_shape_misses_median=statistics.median(empty),empty_shape_misses_min=min(empty),empty_shape_misses_max=max(empty))
   target.append(x)
   for i in range(5):raw.append(dict(case=case,label=label,repetition=i,N=ts[i]['N'],Release_ms_per_Run=t[i],independent_counter_template_parses=parse[i],independent_counter_negative_hits=negative[i],independent_counter_positive_hits=positive[i],independent_counter_missing_empty_shape=empty[i],not_same_process=True))
 save_csv(out/'target_summary.csv',target);save_csv(out/'target_raw.csv',raw)
 full=rows('full','release');assert len(full)==86;tables=[];aggregates={}
 for suite in ['octane','sunspider']:
  d={(r['label'],r['case']):r for r in full if r['suite']==suite};cases=[r['case'] for r in full if r['suite']==suite and r['label']=='R3'];assert len(cases)==(17 if suite=='octane' else 26);rs=[]
  for case in cases:
   a=d['R3',case];b=d['NEGATIVE_ONLY',case];assert a['N']==b['N'];rs.append(dict(case=case,N=a['N'],R3_ms=a['ms_per_Run'],NEGATIVE_ONLY_ms=b['ms_per_Run'],vs_R3_pct=100*(b['ms_per_Run']/a['ms_per_Run']-1)))
  g=collections.defaultdict(list)
  for r in rs:g[r['case'].split('.')[0] if suite=='octane' else r['case']].append(r['NEGATIVE_ONLY_ms']/r['R3_ms'])
  assert len(g)==(14 if suite=='octane' else 26);aggregates[suite]=dict(GM_vs_R3_pct=100*(gm([gm(v) for v in g.values()])-1),sum_R3_ms=sum(r['R3_ms'] for r in rs),sum_NEGATIVE_ONLY_ms=sum(r['NEGATIVE_ONLY_ms'] for r in rs),max_regression=max(rs,key=lambda r:r['vs_R3_pct']),max_improvement=min(rs,key=lambda r:r['vs_R3_pct']))
  save_csv(out/(suite+'.csv'),rs);table=['## '+suite+' 全集同批次单轮（ms/Run）','','| 表项 | R3 | NEGATIVE_ONLY | 相对R3 |','|---|---:|---:|---:|']
  for r in rs:table.append(f"| {r['case']} | {r['R3_ms']:.4f} | {r['NEGATIVE_ONLY_ms']:.4f} | {r['vs_R3_pct']:+.2f}% |")
  a=aggregates[suite];table+=['',f"GM相对R3：{a['GM_vs_R3_pct']:+.4f}%；逐项和：R3 {a['sum_R3_ms']:.4f}ms，NEG {a['sum_NEGATIVE_ONLY_ms']:.4f}ms。",''];tables+=table;(out/(suite+'.md')).write_text('\n'.join(table))
 tt=['## 重点项目5次交替：Release时间与独立计数','','计数版同样各5个独立进程，结构大小与Release一致，无逐点日志分配；这些计数不属于对应的Release计时进程。时间保留全部5次，判定使用中位数，不用计数版时间。','','| 项目 | 版本 | 5次Release时间ms/Run | 中位数 | 相对R3中位数 | 模板解析中位数 | 负命中中位数 | 正命中中位数 | 找不到空shape中位数 |','|---|---|---|---:|---:|---:|---:|---:|---:|']
 for r in target:
  ts=[x['Release_ms_per_Run'] for x in raw if x['case']==r['case'] and x['label']==r['label']];tt.append(f"| {r['case']} | {r['label']} | "+' / '.join(f'{t:.4f}' for t in ts)+f" | {r['ms_median']:.4f} | {r['vs_R3_median_pct']:+.2f}% | {r['parses_median']:,.0f} | {r['negative_hits_median']:,.0f} | {r['positive_hits_median']:,.0f} | {r['empty_shape_misses_median']:,.0f} |")
 tt+=['','各5次计数及所有最小/最大范围见analysis/target_raw.csv和target_summary.csv；Tree的空shape失败独立报告，没有修改任何学习条件。','']
 summary=dict(status='PASS',target_release_processes=60,target_counter_processes=60,full_release_processes=86,full_new_A_C_V8_processes=0,positive_record_bytes=96,positive_fast_path_unchanged=True,target=target,full=aggregates);(out/'summary.json').write_text(json.dumps(summary,indent=2))
 notes=(H/'method.md').read_text() if (H/'method.md').exists() else '';conclusion=(H/'conclusion.md').read_text() if (H/'conclusion.md').exists() else ''
 (H/'results.md').write_text(notes+'\n\n'+conclusion+'\n\n'+'\n'.join(tt+tables))
 m=json.loads((H/'NEGATIVE_ONLY/release.manifest.json').read_text());rawtar=io.BytesIO()
 with tarfile.open(fileobj=rawtar,mode='w',format=tarfile.USTAR_FORMAT) as t:
  for n in sorted(m['sources']):
   data=(Path(m['elf']).parent/n).read_bytes();assert sha(Path(m['elf']).parent/n)==m['sources'][n];x=tarfile.TarInfo('quickjs-R3_NEGATIVE_ONLY/'+n);x.size=len(data);x.mode=0o644;t.addfile(x,io.BytesIO(data))
 with (H/'NEGATIVE_ONLY/source.tar.gz').open('wb') as f:
  with gzip.GzipFile(fileobj=f,mode='wb',filename='',mtime=0) as z:z.write(rawtar.getvalue())
 (H/'NEGATIVE_ONLY/source.sha256').write_text(sha(H/'NEGATIVE_ONLY/source.tar.gz')+'  source.tar.gz\n');print(json.dumps(dict(target=target,full=aggregates),indent=2))
if __name__=='__main__':main()
