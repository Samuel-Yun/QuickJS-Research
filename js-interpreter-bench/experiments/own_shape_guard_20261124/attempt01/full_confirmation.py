"""Only candidates passing the predeclared repeated-target screen enter here."""
import collections,csv,json,math,os,platform,statistics,subprocess
from pathlib import Path
from build import HERE,ROOT,save,sha
from run import CATALOG,TESTS,bench

def csvout(path,rows):
 if not rows:return
 with Path(path).open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
def verify(p):
 for m in p['engines'].values():
  assert not m['instrumented'] and not m['sanitized']
  assert sha(m['binary'])==m['binary_sha256']
  for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h
 for n,h in p['inputs'].items():assert sha(n)==h
def analyze(out,samples,labels):
 aggregates={};all_rows=[];report=['# OWN_SHAPE_GUARD：同批单轮全集','',
  '只纳入通过事先定下的定向重复筛选的候选。SPARSE 基线现场新测；每版每项一个新进程，版本顺序随表项轮换。'
  '沿用冻结脚本、输入、N、校验、Setup/Run 边界，首个 Run 计入，无额外热身；CPU 2、Asia/Shanghai、C locale。','',
  '负数是耗时下降。Octane 按 14 suite 分层等权 GM，SunSpider 按 26 项等权 GM；单轮筛选，不报显著性，不替换默认版。','']
 for suite in ['octane','sunspider']:
  rows=[];logs={l:collections.defaultdict(list) for l in labels};absolute={l:collections.defaultdict(list) for l in labels}
  for c in CATALOG['cases'][suite]:
   rr={l:next(s for s in samples if s['suite']==suite and s['case']==c['case'] and s['label']==l) for l in labels}
   row=dict(suite=suite,name=c['name'],case=c['case'],N=c['N']);group=c['group'] if suite=='octane' else c['case']
   for l,s in rr.items():
    row[l+'_ms']=s['ms'];row[l+'_percent']=100*(s['ms']/rr['SPARSE']['ms']-1)
    logs[l][group].append(math.log(s['ms']/rr['SPARSE']['ms']));absolute[l][group].append(math.log(s['ms']))
   rows.append(row)
  stats={}
  for l in labels:
   assert len(logs[l])==(14 if suite=='octane' else 26)
   stats[l]=dict(GM_percent=100*(math.exp(statistics.mean(statistics.mean(v) for v in logs[l].values()))-1),
    GM_ms=math.exp(statistics.mean(statistics.mean(v) for v in absolute[l].values())),sum_ms=sum(r[l+'_ms'] for r in rows),
    best=min(rows,key=lambda r:r[l+'_percent']),worst=max(rows,key=lambda r:r[l+'_percent']))
  aggregates[suite]=stats
  lines=['| 表项 | '+' | '.join(l+' ms/Run' for l in labels)+' |','|---|'+'---:|'*len(labels)]
  for r in rows:lines.append('| '+r['name']+' | '+' | '.join(f'{r[l+"_ms"]:.4f}'+('' if l=='SPARSE' else f' ({r[l+"_percent"]:+.2f}%)') for l in labels)+' |')
  lines.append('| **整体 GM** | '+' | '.join(f'**{stats[l]["GM_ms"]:.4f}**'+('' if l=='SPARSE' else f' **({stats[l]["GM_percent"]:+.2f}%)**') for l in labels)+' |')
  lines.append('| **逐项耗时之和** | '+' | '.join(f'**{stats[l]["sum_ms"]:.4f}**' for l in labels)+' |')
  (out/f'{suite}.md').write_text('\n'.join(lines)+'\n');csvout(out/f'{suite}.csv',rows);all_rows+=rows
  report+=['## '+suite,'',*lines,'']
 csvout(out/'comparison.csv',all_rows)
 csvout(out/'raw_timings.csv',[{k:s[k] for k in ['suite','case','name','label','N','ms','binary_sha256','external_wall_ms']} for s in samples])
 regressions=[dict(label=l,case=r['case'],suite=r['suite'],change_percent=r[l+'_percent']) for r in all_rows for l in labels[1:] if r[l+'_percent']>5]
 csvout(out/'regressions_over_5pct.csv',regressions)
 report+=['超过 5% 的回退：'+('; '.join(f'{r["label"]} / {r["case"]} {r["change_percent"]:+.2f}%' for r in regressions) or '无')+'。','',
  '此前 RegExp、Gameboy、Typescript 的独立计数显示新增类别命中均为 0；本次不能把时间变化说成这几个项目新覆盖更多属性。'
  '普通读守卫确实变短，其他未计数全集项不能仅凭耗时猜测命中原因。','',
  '原始命令、stdout、退出状态：raw/*.run.json；完整顺序、源码/二进制/输入哈希：protocol.json。']
 (out/'results.md').write_text('\n'.join(report)+'\n')
 save(out/'summary.json',dict(status='PASS',new_release_processes=len(samples),labels=labels,aggregates=aggregates,regressions_over_5pct=regressions))
 return aggregates
def main():
 assert subprocess.check_output(['git','branch','--show-current'],cwd=ROOT,text=True).strip()=='myx'
 assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
 decision=json.loads((HERE/'decision.json').read_text());labels=['SPARSE']+[r['label'] for r in decision if r['run_full']]
 if len(labels)==1:print('NO_QUALIFIED_CANDIDATE: full suite not started');return
 os.sched_setaffinity(0,{2});os.environ.update(TZ='Asia/Shanghai',LC_ALL='C',LANG='C')
 assert not os.environ.get('LD_PRELOAD') and not os.environ.get('LD_AUDIT')
 out=HERE/'full_confirmation01';out.mkdir(exist_ok=False)
 schedule=[];inputs={str(TESTS/'benchmarks.json'):sha(TESTS/'benchmarks.json')}
 for i in range(26):
  for j,suite in enumerate(['octane','sunspider']):
   if i>=len(CATALOG['cases'][suite]):continue
   c=CATALOG['cases'][suite][i];inputs[str(TESTS/c['path'])]=c['sha256'];shift=(i+j)%len(labels)
   for l in labels[shift:]+labels[:shift]:schedule.append(dict(label=l,suite=suite,case=c))
 for n,h in CATALOG['support'].items():inputs[str(TESTS/n)]=h
 prior={str(HERE/n):sha(HERE/n) for n in ['gate.json','decision.json','micro_time.json','target_time.json','micro_counts.json','target_counts.json']}
 p=dict(engines={l:json.loads((HERE/f'{l}.release.manifest.json').read_text()) for l in labels},inputs=inputs,schedule=schedule,
  CPU=2,TZ='Asia/Shanghai',locale='C',first_Run_included=True,extra_warmup=0,repeats_per_case=1,fresh_processes=len(schedule),
  platform=platform.platform(),prior_files=prior,driver_sha256=sha(Path(__file__)),failure_policy='no automatic retries',
  authorization='original task: repeatable targeted Release benefit -> fresh full screening')
 save(out/'protocol.json',p);verify(p);samples=[]
 for i,j in enumerate(schedule):
  verify(p);r=bench(j['label'],'release',j['suite'],j['case'],str(out/'raw'),1)
  samples.append(r);save(out/'samples.json',samples)
  print('FULL_PASS',f'{i+1}/{len(schedule)}',j['suite'],r['name'],r['label'],f'{r["ms"]:.5f}',flush=True)
 verify(p)
 for n,h in prior.items():assert sha(n)==h
 assert len(samples)==len({(s['suite'],s['case'],s['label']) for s in samples})==43*len(labels)
 stats=analyze(out,samples,labels)
 save(out/'validation.json',dict(status='PASS',fresh_processes=len(samples),hashes_verified=True,all_outputs_and_checksums_validated=True,prior_results_unchanged=True))
 save(out/'complete.json',dict(status='PASS',fresh_processes=len(samples)))
 print('FULL_COMPLETE',json.dumps({s:{l:a['GM_percent'] for l,a in v.items()} for s,v in stats.items()}),flush=True)
if __name__=='__main__':main()
