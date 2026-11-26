from measure import *

def analyze(out,rows):
 table=[];stats={};labels=LABELS
 for suite in ['octane','sunspider']:
  rr=[];group_ratios={l:collections.defaultdict(list)for l in labels}
  for c in CATALOG['cases'][suite]:
   d=dict(suite=suite,case=c['case'],name=c['name'],N=c['N'],group=c['group']);base=next(r['ms']for r in rows if r['suite']==suite and r['case']==c['case']and r['label']=='SPARSE')
   for l in labels:
    d[l+'_ms']=next(r['ms']for r in rows if r['suite']==suite and r['case']==c['case']and r['label']==l);d[l+'_percent']=(d[l+'_ms']/base-1)*100
    group_ratios[l][c['group']if suite=='octane'else c['case']].append(math.log(d[l+'_ms']/base))
   rr.append(d)
  expected=14 if suite=='octane'else 26;assert len(group_ratios['SPARSE'])==expected
  logs={l:{g:statistics.mean(v)for g,v in gs.items()}for l,gs in group_ratios.items()};winner=min(logs['SITE'],key=logs['SITE'].get);stats[suite]={}
  for l in labels:
   groups=collections.defaultdict(list)
   for r in rr:groups[r['group']if suite=='octane'else r['case']].append(math.log(r[l+'_ms']))
   abs_gm=math.exp(statistics.mean(statistics.mean(v)for v in groups.values()));ratio=math.exp(statistics.mean(logs[l].values()));without=math.exp(statistics.mean(v for g,v in logs[l].items()if g!=winner))
   stats[suite][l]=dict(GM_ms=abs_gm,relative_percent=(ratio-1)*100,without_SITE_largest_winner_percent=(without-1)*100,excluded_suite=winner,sum_ms=sum(r[l+'_ms']for r in rr),worst=max(rr,key=lambda r:r[l+'_percent']),best=min(rr,key=lambda r:r[l+'_percent']))
  csvout(out/(suite+'.csv'),rr);table+=rr;lines=['|表项|SPARSE ms|BODY ms|SHAM ms|SITE ms|','|---|---:|---:|---:|---:|']
  for r in rr:lines.append('|'+r['name']+'|'+'|'.join(f'{r[l+"_ms"]:.5f}'+(f' ({r[l+"_percent"]:+.2f}%)'if l!='SPARSE'else'')for l in labels)+'|')
  lines+=['|**整体 GM**|'+'|'.join(f'{stats[suite][l]["GM_ms"]:.5f}'+(f' ({stats[suite][l]["relative_percent"]:+.2f}%)'if l!='SPARSE'else'')for l in labels)+'|','|**逐项耗时之和**|'+'|'.join(f'{stats[suite][l]["sum_ms"]:.5f}'for l in labels)+'|']
  (out/(suite+'.md')).write_text('\n'.join(lines)+'\n')
 save(out/'summary.json',dict(statistics=stats,rows=table));csvout(out/'comparison.csv',table);csvout(out/'raw_timings.csv',[{k:r[k]for k in ['suite','case','label','N','ms','binary_sha256','wall_ms']}for r in rows]);report=['# 四版同批完整基准','',
 '每项每版一个新进程，父版现场重跑；CPU 2、固定原输入/N/校验、原 Setup/Run 边界，首次 Run 计入，无额外热身。SHAM/SITE 使用同一 ELF。负数更快。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM。剔除最大赢家按 SITE 的最佳 suite（Octane）或单项（SunSpider），四版使用同一个剔除集合。','',
 '|版本|Octane GM 变化|剔除 SITE 最大赢家|SunSpider GM 变化|剔除 SITE 最大赢家|','|---|---:|---:|---:|---:|']
 for l in labels:report.append(f'|{l}|{stats["octane"][l]["relative_percent"]:+.2f}%|{stats["octane"][l]["without_SITE_largest_winner_percent"]:+.2f}%|{stats["sunspider"][l]["relative_percent"]:+.2f}%|{stats["sunspider"][l]["without_SITE_largest_winner_percent"]:+.2f}%|')
 report+=['',f'剔除项：Octane {stats["octane"]["SITE"]["excluded_suite"]}；SunSpider {stats["sunspider"]["SITE"]["excluded_suite"]}。','', '## Octane','',(out/'octane.md').read_text(),'','## SunSpider','',(out/'sunspider.md').read_text()];(out/'results.md').write_text('\n'.join(report)+'\n')
 print('FULL_GM',json.dumps({s:{l:(v['relative_percent'],v['without_SITE_largest_winner_percent'])for l,v in a.items()}for s,a in stats.items()}),flush=True)

def main():
 os.sched_setaffinity(0,{2});out=next_out(HERE,'full');out.mkdir();schedule=[]
 for i in range(26):
  for j,suite in enumerate(['octane','sunspider']):
   if i>=len(CATALOG['cases'][suite]):continue
   c=CATALOG['cases'][suite][i];shift=(i+j)%4
   for l in LABELS[shift:]+LABELS[:shift]:schedule.append(dict(label=l,suite=suite,case=c))
 save(out/'protocol.json',dict(schedule=schedule,repeats=1,CPU=2,locale='C',TZ='Asia/Shanghai',parent_remeasured=True,first_Run_included=True,extra_warmup=0,engines={l:dict(binary=binary(l),sha256=sha(binary(l)),control={ALIASES[l][1]:ALIASES[l][2]}if l in ALIASES else{})for l in LABELS}));rows=[]
 for i,j in enumerate(schedule):
  r=bench(j['label'],j['suite'],j['case'],out/'raw',1);rows.append(r);save(out/'samples.json',rows);print('FULL',f'{i+1}/172',r['suite'],r['name'],r['label'],r['ms'],flush=True)
 assert len(rows)==172==len({(r['label'],r['suite'],r['case'])for r in rows});analyze(out,rows);save(out/'complete.json',dict(status='PASS',new_release_processes=172,all_checksums_valid=True,parent_remeasured=True))
if __name__=='__main__':main()
