"""One full pass for each new candidate. A/SPARSE/V8 reuse recorded data."""
from run import *
LABELS=['NUMERIC_PLAN','COMPARE_FIRST','COMPARE_FULL','COALLOC']
REFERENCE=ROOT/'experiments/ctor_ic_followups_20261115/attempt01/03_sparse_ctor/analysis'
RECENT_PARENT=ROOT/'experiments/own_shape_guard_20261124/attempt01/full_confirmation01/comparison.csv'
def references():
 result={};recent={r['case']:r for r in csv.DictReader(RECENT_PARENT.open())}
 for suite in ['octane','sunspider']:
  result[suite]={}
  for r in csv.DictReader((REFERENCE/(suite+'.csv')).open()):
   r['SPARSE_published_ms']=r['candidate_ms'];r['candidate_ms']=recent[r['case']]['SPARSE_ms'];result[suite][r['case']]=r
 return result
def analyze(out,samples):
 refs=references();allrows=[];stats={};tables={}
 for suite in ['octane','sunspider']:
  rows=[];logs={l:collections.defaultdict(list) for l in ['A','SPARSE',*LABELS,'V8_ON']}
  for c in CATALOG['cases'][suite]:
   old=refs[suite][c['case']];assert int(old['N'])==c['N']
   r=dict(suite=suite,case=c['case'],name=c['name'],N=c['N'],A_ms=float(old['A_ms']),SPARSE_ms=float(old['candidate_ms']),SPARSE_published_ms=float(old['SPARSE_published_ms']),V8_ON_ms=float(old['V8_ON_ms']))
   for l in LABELS:r[l+'_ms']=next(s['ms'] for s in samples if s['suite']==suite and s['case']==c['case'] and s['label']==l)
   group=c['group'] if suite=='octane' else c['case']
   for l in logs:
    logs[l][group].append(math.log(r[l+'_ms']))
    r[l+'_vs_A_percent']=(r[l+'_ms']/r['A_ms']-1)*100
    r[l+'_vs_SPARSE_percent']=(r[l+'_ms']/r['SPARSE_ms']-1)*100
    r[l+'_vs_V8_percent']=(r[l+'_ms']/r['V8_ON_ms']-1)*100
   rows.append(r)
  absolute={l:math.exp(statistics.mean(statistics.mean(v) for v in g.values())) for l,g in logs.items()}
  ss={}
  for l in logs:
   ss[l]=dict(GM_ms=absolute[l],vs_A_percent=(absolute[l]/absolute['A']-1)*100,vs_SPARSE_percent=(absolute[l]/absolute['SPARSE']-1)*100,
    sum_ms=sum(r[l+'_ms'] for r in rows),worst_vs_SPARSE=max(rows,key=lambda r:r[l+'_vs_SPARSE_percent']),best_vs_SPARSE=min(rows,key=lambda r:r[l+'_vs_SPARSE_percent']))
  stats[suite]=ss;allrows+=rows
  headers=['原版 A','冻结 SPARSE',*LABELS,'V8 --jitless']
  cols=['A','SPARSE',*LABELS,'V8_ON']
  lines=['| 表项 | '+' | '.join(h+' ms/Run' for h in headers)+' |','|---|'+'---:|'*len(cols)]
  for r in rows:lines.append('| '+r['name']+' | '+' | '.join(f'{r[l+"_ms"]:.4f}'+(f' ({r[l+"_vs_SPARSE_percent"]:+.2f}%)' if l in LABELS else '') for l in cols)+' |')
  lines+=['| **整体 GM** | '+' | '.join(f'**{ss[l]["GM_ms"]:.4f}**'+(f' **({ss[l]["vs_SPARSE_percent"]:+.2f}%)**' if l in LABELS else '') for l in cols)+' |',
   '| **逐项耗时之和** | '+' | '.join(f'**{ss[l]["sum_ms"]:.4f}**' for l in cols)+' |']
  csvout(out/f'{suite}.csv',rows);(out/f'{suite}.md').write_text('\n'.join(lines)+'\n');tables[suite]=lines
 csvout(out/'comparison.csv',allrows)
 csvout(out/'raw_timings.csv',[{k:s[k] for k in ['suite','case','name','label','N','ms','binary_sha256','wall_ms']} for s in samples])
 regressions=[dict(suite=r['suite'],case=r['case'],label=l,percent=r[l+'_vs_SPARSE_percent']) for r in allrows for l in LABELS if r[l+'_vs_SPARSE_percent']>5]
 csvout(out/'regressions_over_5pct.csv',regressions)
 report=['# 三种执行路径实验：完整基准','',
  '每个新候选每项一个新进程，按测试项轮换版本顺序，沿用冻结原脚本、输入、N、校验、Setup/Run 边界、首个 Run 计入，无额外热身，CPU 2 / Asia/Shanghai / C locale。',
  '按用户要求，不重跑 A/SPARSE/V8 全集。A/V8 沿用 03_sparse_ctor/analysis 中 native_confirmation 的 30 进程中位数；'
  '父版 SPARSE 使用最近已有的 own_shape_guard/full_confirmation01 中同一冻结源码的现场单轮，避免拿更早、差异更大的父版时间归因新优化。'
  '旧已发表 SPARSE 时间也保留在 CSV 的 SPARSE_published_ms 列，不覆盖旧记录。'
  '因此新候选与它们的全集比较是跨批次筛选。定向 5 对现场 SPARSE 对照另列，不能用历史父版代替它。',
  'V8_ON 历史参数为 --jitless --no-lazy --use-ic。括号相对历史冻结 SPARSE，负数更快；CSV 另附相对 A、V8 的变化。'
  'Octane 按 14 suite 分层等权 GM，SunSpider 按 26 项等权。','',
  '| 候选 | Octane 相对 SPARSE | Octane 相对 A | SunSpider 相对 SPARSE | SunSpider 相对 A |','|---|---:|---:|---:|---:|']
 for l in LABELS:report.append(f'| {l} | {stats["octane"][l]["vs_SPARSE_percent"]:+.2f}% | {stats["octane"][l]["vs_A_percent"]:+.2f}% | {stats["sunspider"][l]["vs_SPARSE_percent"]:+.2f}% | {stats["sunspider"][l]["vs_A_percent"]:+.2f}% |')
 report+=['','## Octane','',*tables['octane'],'','## SunSpider','',*tables['sunspider'],'','## 最大回退','']
 for l in LABELS:
  for suite in ['octane','sunspider']:
   worst=stats[suite][l]['worst_vs_SPARSE'];report.append(f'- {l} / {suite}：{worst["name"]} {worst[l+"_vs_SPARSE_percent"]:+.2f}%。')
 report+=['','所有原始 stdout、命令和返回状态在 raw/；时序、二进制/源码/输入和历史 CSV 哈希在 protocol.json。']
 (out/'results.md').write_text('\n'.join(report)+'\n');save(out/'summary.json',dict(status='PASS',statistics=stats,rows=allrows,new_release_processes=len(samples),regressions_over_5pct=regressions))
 return stats
def verify(p):
 for m in p['engines'].values():
  assert not m['instrumented'] and not m['sanitized'];assert sha(m['binary'])==m['binary_sha256']
  for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
 for path,h in p['inputs'].items():assert sha(path)==h,path
 for path,h in p['history'].items():assert sha(path)==h,path
def main():
 os.sched_setaffinity(0,{2});assert not ENV.get('QJS_NUMERIC_ENTRY_OFF') and not ENV.get('QJS_CTOR_COALLOC_OFF')
 for gate in ['01_forward_numeric/validation01/gate.json','02_compare_branch/validation01/gate.json','03_ctor_coalloc/validation03/gate.json']:assert json.loads((HERE/gate).read_text())['status']=='PASS'
 out=next_out(HERE,'full');out.mkdir(exist_ok=False)
 engines={l:json.loads((folder(l)/f'{l}.release.manifest.json').read_text()) for l in LABELS};schedule=[];inputs={str(TESTS/'benchmarks.json'):sha(TESTS/'benchmarks.json')}
 for i in range(26):
  for j,suite in enumerate(['octane','sunspider']):
   if i>=len(CATALOG['cases'][suite]):continue
   c=CATALOG['cases'][suite][i];shift=(i+j)%len(LABELS);inputs[str(TESTS/c['path'])]=c['sha256']
   for l in LABELS[shift:]+LABELS[:shift]:schedule.append(dict(label=l,suite=suite,case=c))
 for n,h in CATALOG['support'].items():inputs[str(TESTS/n)]=h
 history={str(REFERENCE/(s+'.csv')):sha(REFERENCE/(s+'.csv')) for s in ['octane','sunspider']};history[str(RECENT_PARENT)]=sha(RECENT_PARENT)
 p=dict(engines=engines,schedule=schedule,inputs=inputs,history=history,
  new_release_processes=len(schedule),reference_policy='do not remeasure A/SPARSE/V8 full suites',CPU=2,TZ='Asia/Shanghai',locale='C',first_Run_included=True,extra_warmup=0,repeats=1,driver_sha256=sha(Path(__file__)))
 save(out/'protocol.json',p);verify(p);rows=[];print('FULL_OUTPUT',out,flush=True)
 for i,j in enumerate(schedule):
  verify(p);r=bench(j['label'],j['suite'],j['case'],out/'raw',1);rows.append(r);save(out/'samples.json',rows)
  print('FULL',f'{i+1}/{len(schedule)}',j['suite'],r['name'],r['label'],r['ms'],flush=True)
 verify(p);assert len(rows)==172==len({(r['label'],r['suite'],r['case']) for r in rows})
 stats=analyze(out,rows);save(out/'complete.json',dict(status='PASS',new_release_processes=172,all_checksums_valid=True,references_not_remeasured=True))
 print('FULL_DONE',json.dumps({s:{l:v['vs_SPARSE_percent'] for l,v in d.items() if l in LABELS} for s,d in stats.items()}),flush=True)
if __name__=='__main__':main()
