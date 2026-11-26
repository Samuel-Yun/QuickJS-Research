from run import *
LABELS=['INSTANCE_DIRECT','INSTANCE_SLOT','INSTANCE_HOOK','CALL_DIRECT','CALL_IC','CALL_FIELD','NEST_PARENT','NEST_COMBINED']
HISTORY=OLDROOT/'full01/summary.json'
def gm(rows,label,suite):
 groups=collections.defaultdict(list)
 for r in rows:
  c=native(suite,r['case']);groups[c['group']if suite=='octane'else c['case']].append(math.log(r[label+'_ms']))
 return math.exp(statistics.mean(statistics.mean(v)for v in groups.values()))
def analyze(out,samples):
 history=json.loads(HISTORY.read_text());rows=[];stats={};lines=['# Round 2：完整基准单轮筛选','',
 '三个想法拆为 3 / 3 / 2 个分步对照，共 8 个执行模式、344 个新进程。每个候选每项仅一次，使用同一套 Release ELF 的模式开关进行归因。A、冻结 SPARSE、NUMERIC_PLAN 和 V8 使用上一轮已记录数据，均为跨批次比较；新鲜同批五对定向对照另列。',
 'CPU 2 / GCC 15.2.0 / -O2 / Asia/Shanghai / C locale。原脚本、原 N、原校验、Setup 不计时、首个 Run 计入、无额外热身。括号相对各自父版：前两组为 SPARSE，第三组为 NUMERIC_PLAN。负数更快。Octane 为 14 suite 分层等权 GM；SunSpider 为 26 项等权 GM。V8 历史参数为 --jitless --no-lazy --use-ic。','',
 '|候选|父版|Octane GM / ms|相对父版|相对 A|SunSpider GM / ms|相对父版|相对 A|','|---|---|---:|---:|---:|---:|---:|---:|']
 for suite in ['octane','sunspider']:
  rr=[]
  for c in CATALOG['cases'][suite]:
   old=next(x for x in history['rows']if x['suite']==suite and x['case']==c['case']);r={k:old[k]for k in ['suite','case','name','N','A_ms','SPARSE_ms','NUMERIC_PLAN_ms','V8_ON_ms']}
   for label in LABELS:r[label+'_ms']=next(x['ms']for x in samples if x['label']==label and x['suite']==suite and x['case']==c['case'])
   for label in LABELS:
    parent='NUMERIC_PLAN'if label.startswith('NEST_')else'SPARSE';r[label+'_vs_parent_percent']=(r[label+'_ms']/r[parent+'_ms']-1)*100;r[label+'_vs_A_percent']=(r[label+'_ms']/r['A_ms']-1)*100
   rr.append(r)
  stats[suite]={}
  for label in ['A','SPARSE','NUMERIC_PLAN',*LABELS,'V8_ON']:
   g=gm(rr,label,suite);parent='NUMERIC_PLAN'if label.startswith('NEST_')else'SPARSE'
   stats[suite][label]=dict(GM_ms=g,sum_ms=sum(r[label+'_ms']for r in rr),parent=parent,vs_parent_percent=(g/gm(rr,parent,suite)-1)*100,vs_A_percent=(g/gm(rr,'A',suite)-1)*100)
   if label in LABELS:stats[suite][label]['worst']=max(rr,key=lambda r:r[label+'_vs_parent_percent'])
  csvout(out/(suite+'.csv'),rr);rows+=rr
 for label in LABELS:
  o=stats['octane'][label];s=stats['sunspider'][label];lines.append(f'|{label}|{o["parent"]}|{o["GM_ms"]:.4f}|{o["vs_parent_percent"]:+.2f}%|{o["vs_A_percent"]:+.2f}%|{s["GM_ms"]:.4f}|{s["vs_parent_percent"]:+.2f}%|{s["vs_A_percent"]:+.2f}%|')
 for family,labels in [('instance',['INSTANCE_DIRECT','INSTANCE_SLOT','INSTANCE_HOOK']),('call',['CALL_DIRECT','CALL_IC','CALL_FIELD']),('nested',['NEST_PARENT','NEST_COMBINED'])]:
  for suite in ['octane','sunspider']:
   cols=['A','SPARSE']+(['NUMERIC_PLAN']if family=='nested'else[])+labels+['V8_ON'];table=['|表项|'+'|'.join(cols)+'|','|---|'+'---:|'*len(cols)]
   for r in rows:
    if r['suite']!=suite:continue
    table.append('|'+r['name']+'|'+'|'.join(f'{r[l+"_ms"]:.4f}'+(f' ({r[l+"_vs_parent_percent"]:+.2f}%)'if l in labels else'')for l in cols)+'|')
   for key,name in [('GM_ms','整体 GM'),('sum_ms','逐项耗时之和')]:table.append('|**'+name+'**|'+'|'.join(f'{stats[suite][l][key]:.4f}'+(f' ({stats[suite][l]["vs_parent_percent"]:+.2f}%)'if l in labels and key=='GM_ms'else'')for l in cols)+'|')
   (out/(family+'_'+suite+'.md')).write_text('\n'.join(table)+'\n');lines+=['','## '+family+' / '+suite,'',*table]
 regressions=[dict(suite=r['suite'],case=r['case'],label=l,percent=r[l+'_vs_parent_percent'])for r in rows for l in LABELS if r[l+'_vs_parent_percent']>5];csvout(out/'regressions_over_5pct.csv',regressions)
 csvout(out/'comparison.csv',rows);csvout(out/'raw_timings.csv',[{k:s[k]for k in ['suite','case','label','N','ms','binary_sha256','wall_ms']}for s in samples]);save(out/'summary.json',dict(statistics=stats,rows=rows,new_processes=len(samples),regressions=regressions));(out/'results.md').write_text('\n'.join(lines)+'\n')
 print('GM',json.dumps({s:{l:stats[s][l]['vs_parent_percent']for l in LABELS}for s in stats}),flush=True)
def main():
 os.sched_setaffinity(0,{2});out=next_out(HERE,'full');out.mkdir();schedule=[]
 for i in range(26):
  for j,suite in enumerate(['octane','sunspider']):
   if i>=len(CATALOG['cases'][suite]):continue
   c=CATALOG['cases'][suite][i];shift=(i+j)%len(LABELS)
   for l in LABELS[shift:]+LABELS[:shift]:schedule.append(dict(label=l,suite=suite,case=c))
 engines={l:dict(binary=binary(l),sha256=sha(binary(l)),control={ALIASES[l][1]:ALIASES[l][2]})for l in LABELS}
 save(out/'protocol.json',dict(schedule=schedule,engines=engines,history=str(HISTORY),history_sha256=sha(HISTORY),cpu=2,repeats=1,first_Run_included=True,extra_warmup=0,driver_sha256=sha(Path(__file__))))
 rows=[];print('FULL_OUTPUT',out,flush=True)
 for i,j in enumerate(schedule):
  r=bench(j['label'],j['suite'],j['case'],out/'raw',1);rows.append(r);save(out/'samples.json',rows);print('FULL',f'{i+1}/{len(schedule)}',j['suite'],r['name'],r['label'],r['ms'],flush=True)
 assert len(rows)==344==len({(r['label'],r['suite'],r['case'])for r in rows});analyze(out,rows);save(out/'complete.json',dict(status='PASS',new_processes=344,all_original_checksums_valid=True))
if __name__=='__main__':main()
