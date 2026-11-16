"""Offline assembly and immutable artifact checks; runs no benchmark."""
import json,csv,collections,hashlib,tarfile,tempfile,subprocess,io,gzip
from pathlib import Path
from build import parent
H=Path(__file__).resolve().parent;R3=H.parents[2]/'experiments/ic_four_rounds_20261115/attempt01/03_constructor_plan'
labels=['01_forward_ctor','02_proto_ticket','03_sparse_ctor'];names=['FORWARD_CTOR_IC','CTOR_PROTO_TICKET','SPARSE_CTOR_IC']
def load(p):return json.loads(p.read_text())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def events(p):return [json.loads(l) for l in (p.read_text() if p.exists() else gzip.open(str(p)+'.gz','rt').read()).splitlines()]
def main():
 original,digest=parent();audit={'parent_archive_sha256':digest,'independent_from_same_R3':True,'rounds':{},'formal_new_R3_C_suites':0,'auto_combination':False,'push':False}
 for label in [*labels,'04_construct_consume']:
  h=H/label;mode='probe' if label.startswith('04') else 'release';m=load(h/(mode+'.manifest.json'));w=Path(m['elf']).parent
  assert m['R3_archive_sha256']==digest and sha(w/'qjs')==m['elf_sha256']
  for n,s in m['sources'].items():assert sha(w/n)==s
  archive=h/('probe-source.tar.gz' if mode=='probe' else 'source.tar.gz');assert sha(archive)==archive.with_suffix('').with_suffix('.sha256').read_text().split()[0]
  with tarfile.open(archive) as t:
   data={x.name.split('/',1)[1]:t.extractfile(x).read() for x in t.getmembers() if x.isfile()}
  assert {n:hashlib.sha256(s).hexdigest() for n,s in data.items()}==m['sources']
  with tempfile.TemporaryDirectory(prefix='ctor-followup-patch-') as tmp:
   tmp=Path(tmp)
   for n,s in original.items():(tmp/n).parent.mkdir(exist_ok=True,parents=True);(tmp/n).write_text(s)
   p=subprocess.run(['patch','--batch','-p1','-i',str(h/(mode+'.patch'))],cwd=tmp,text=True,capture_output=True);assert p.returncode==0,p.stdout+p.stderr
   assert {n:sha(tmp/n) for n in m['sources']}==m['sources']
  counts={}
  for suite in ['octane','sunspider']:
   folder=h/'runs'/mode/suite;es=events(folder/'runs.jsonl');n=17 if suite=='octane' else 26
   assert collections.Counter(e['event'] for e in es)=={'sample':n,'process_start':n,'process_result':n}
   rows=[e for e in es if e['event']=='sample'];assert all(r['valid'] for r in rows)
   protocol=load(folder/'protocol.json');assert protocol['CPU']==2 and protocol['warmup_calls']==0 and protocol['independent_processes_per_case']==1
   for path,hs in protocol['frozen_files'].items():assert sha(Path(path))==hs
   for f in protocol['scripts'].values():assert sha(Path(f['path']))==f['sha256']
   for path,hs in protocol['input_files'].items():assert sha(H.parents[2]/path)==hs
   for r in rows:assert r['N']==protocol['scripts'][r['case']]['N']
   counts[suite]=n
  if mode=='release':
   gate=load(h/'qualification/gate.json');assert gate['status']=='PASS'
   for f,s in gate['frozen_files'].items():assert sha(Path(f))==s
   assert all(x['exit_code']==0 and not x['stderr'] for x in load(h/'qualification/ownership_realms.json'))
  audit['rounds'][label]=dict(status='NO_REAL_COVERAGE' if mode=='probe' else 'PASS',source_archive=archive.name,source_archive_sha256=sha(archive),ELF_sha256=m['elf_sha256'],patch_applies_exactly=True,source_manifest_exact=True,samples=counts,diagnostic_only=mode=='probe')
 # All methods side by side, retaining 43 rows, old medians and all regressions.
 tableparts=[]
 for suite in ['octane','sunspider']:
  datasets={label:{r['case']:r for r in csv.DictReader((H/label/'analysis'/ (suite+'.csv')).open())} for label in labels}
  rows=[]
  for ref in csv.DictReader((R3/'analysis'/(suite+'.csv')).open()):
   c=ref['case'];r=dict(case=c,A_ms=float(ref['A_ms']),EVAL_COLD_ms=float(ref['EVAL_COLD_ms']),R3_ms=float(ref['candidate_ms']),V8_ON_ms=float(ref['V8_ON_ms']))
   for label,name in zip(labels,names):x=datasets[label][c];r[name+'_ms']=float(x['candidate_ms']);r[name+'_vs_R3_pct']=float(x['vs_R3_pct'])
   rows.append(r)
  out=H/'analysis';out.mkdir(exist_ok=True)
  with (out/(suite+'.csv')).open('w') as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
  text=['## '+suite+' 完整逐项表（ms/Run）','','括号为相对旧R3；跨批次单轮筛选。A/EVAL_COLD/V8_ON为历史30轮中位数。','', '| 表项 | A | EVAL_COLD | R3 | FORWARD_CTOR_IC | CTOR_PROTO_TICKET | SPARSE_CTOR_IC | V8_ON --jitless |','|---|---:|---:|---:|---:|---:|---:|---:|']
  for r in rows:text.append('| '+r['case']+' | '+ ' | '.join(f"{r[k+'_ms']:.4f}" for k in ['A','EVAL_COLD','R3'])+' | '+' | '.join(f"{r[name+'_ms']:.4f} ({r[name+'_vs_R3_pct']:+.2f}%)" for name in names)+f" | {r['V8_ON_ms']:.4f} |")
  text+=['','逐项耗时之和（ms）: '+json.dumps({k:sum(r[k+'_ms'] for r in rows) for k in ['A','EVAL_COLD','R3',*names,'V8_ON']})+'。','']
  (out/(suite+'.md')).write_text('\n'.join(text));tableparts+=text
 summaries={label:load(H/label/'analysis/summary.json') for label in labels}
 text=['# 构造IC第二批四轮实验','','三个有真实快路径的候选各跑Octane17+SunSpider26一轮，共129个正式独立进程；第4轮完整43项独立诊断确认零覆盖，按任务例外不跑正式Release。所有候选独立从冻结R3派生，没有组合、没有R3/C新全集、没有push。','', 'Octane为14 suite分层等权GM（suite内拆分子项先GM），SunSpider26项等权GM；负数更快。旧R3跨批次单轮对照，不报告显著性，也不把新旧收益相加。','', '| 轮次 | 候选 | 真实覆盖及省掉的工作 | Octane相对R3 | SunSpider相对R3 | 最大回退/下一步 |','|---|---|---|---:|---:|---|']
 works=['RayTrace参数直传3,246,080次；免同数arguments对象/参数列表，转发9,738,240实参；保留wrapper/native apply帧','Boyer票据8,211,289次；避免32,845,156描述符查询；不改分配/字段初始化','冷记录96→32B；RayTrace模板解析8,524,032→104；激活记录总128B，Boyer累计记录字节+27.19%']
 for i,(label,name,work) in enumerate(zip(labels,names,works),1):
  s=summaries[label]['aggregates'];o=s['octane'];u=s['sunspider'];a=o['max_regression'];b=u['max_regression']
  text.append(f"| {i} | [{name}]({label}/results.md) | {work} | {o['R3']:+.2f}% | {u['R3']:+.2f}% | {a['case']} {a['vs_R3_pct']:+.2f}%；{b['case']} {b['vs_R3_pct']:+.2f}% |")
 text+=['| 4 | [CONSTRUCT_CONSUME_IC](04_construct_consume/results.md) | 49,231,038构造尝试；立即读仅2次原生目标，合格覆盖0，局部桥接0；消除分配0 | N/A | N/A | 无覆盖，停止该窄模板 |','', '第1轮拓展了原R3零命中的RayTrace包装负载；第2轮让已有构造命中的原型资格检查更便宜，微基准-3.88%，全集没有净收益。第3轮减少冷记录及反复判型，有整体单轮筛选收益，但热记录更大、微基准+1.40%、Tree仍退化，不是无代价。第4轮无真实覆盖，未用微基准替代负载证据。','', '第1/3轮Octane约-0.90%/-0.89%，差仅0.013个百分点，单轮不适合据此排名；第3轮SunSpider总体更好，第1轮RayTrace更好。没有自动组合或宣布最终赢家。计数来自独立插桩构建，不当成正式Release命中率，尤其Tree对布局/shape学习条件敏感。第2轮Tree专项独立诊断发现9,802,867次因R3要求的空hashed shape不在表中而无法学计划，不能把整项回退归到票据比较本身。','', '| 版本 | Octane相对A | SunSpider相对A | Octane耗时之和ms | SunSpider耗时之和ms |','|---|---:|---:|---:|---:|']
 for label,name in zip(labels,names):
  s=summaries[label]['aggregates'];o=s['octane'];u=s['sunspider'];text.append(f"| {name} | {o['A']:+.2f}% | {u['A']:+.2f}% | {o['sum_ms']['candidate']:.4f} | {u['sum_ms']['candidate']:.4f} |")
 text+=['', 'R3原始SunSpider之和393.0469ms；逐项和用于辅助观察，不替代GM。所有最大回退原样保留。','', '每轮目录含results.md、相对R3的release.patch（第4轮probe.patch）、源包/SHA、构建manifest、qualification、独立计数、原始process_start/process_result/sample、完整CSV。详细内存/工作量在03_sparse_ctor/analysis/memory_work.csv；有效性/失效在02_proto_ticket/qualification/safety.counts.json；保存加载、GC双realm和ASan/UBSan结果在各qualification。LeakSanitizer在sandbox不可用，未声称LSan通过。','', '构建及复现命令见[REPRODUCE.md](REPRODUCE.md)。原始大诊断JSONL另有无损gzip归档，未删除明文，忽略明文以避免重复提交。','']+tableparts
 (H/'results.md').write_text('\n'.join(text))
 (H/'audit.json').write_text(json.dumps(audit,indent=2)+'\n');print('OFFLINE_ARTIFACT_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
