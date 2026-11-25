"""Audit the final builds and report measured work separately from elapsed time."""
import csv,json,statistics,subprocess,tempfile,platform,os
from pathlib import Path
from build import HERE,PACKAGE,LABELS,sha,save,transform

def csvout(name,rows):
 with (HERE/name).open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)

def total(sites,shared=None):
 sites=[s for s in sites if shared is None or s['shared']==shared]
 return {k:sum(s['counts'][k] for s in sites) for k in sites[0]['counts']} if sites else {}

def main():
 manifest=json.loads((PACKAGE/'manifest.json').read_text());base={}
 for group in ['original','modified']:
  for n,h in manifest[group].items():assert sha(PACKAGE/group/n)==h,(group,n)
 for n in manifest['modified']:base[n]=(PACKAGE/'modified'/n).read_text()
 candidate=dict(base);transform(candidate)
 bm=json.loads((HERE/'STORE_TRANSITION_IC.release.manifest.json').read_text());bd=Path(bm['binary']).parent
 for n,s in candidate.items():assert (bd/n).read_text()==s,n
 changed=[n for n,s in candidate.items() if s!=base.get(n)]
 for n in ['four_runtime.inc','four_prepare.inc','sparse_runtime.inc','read_ic_prepare.inc','read_ic_runtime.inc','read_ic_opcodes.inc','edge_strong_helpers.inc']:
  assert candidate[n]==base[n],n
 for marker in ['        CASE(OP_put_field_shared):','        CASE(OP_four_ctor):']:
  def part(q):
   p=q.index(marker);e=q.index('        CASE(',p+len(marker));return q[p:e]
  assert part(candidate['quickjs.c'])==part(base['quickjs.c']),marker
 with tempfile.TemporaryDirectory(prefix='store-patch-') as tmp:
  d=Path(tmp)
  for n,s in base.items():p=d/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
  r=subprocess.run(['patch','-p1','--fuzz=0','-i',str(HERE/'SPARSE-to-STORE_TRANSITION_IC.patch')],cwd=d,capture_output=True,text=True)
  assert r.returncode==0,r.stdout+r.stderr
  for n,s in candidate.items():assert (d/n).read_text()==s,n
 for label in LABELS:
  for mode in ['release','counts']+(['sanitize'] if label!='SPARSE' else []):
   m=json.loads((HERE/f'{label}.{mode}.manifest.json').read_text());assert sha(m['binary'])==m['binary_sha256']
   for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
 assert json.loads((HERE/'gate.json').read_text())['status']=='PASS'
 assert json.loads((HERE/'ownership_gate.json').read_text())['status']=='PASS'
 # Diagnostic partitions, only the final revision, not developmental results.
 diagnostics=json.loads((HERE/'baseline_counts.json').read_text())+json.loads((HERE/'target_counts.json').read_text())
 micro=json.loads((HERE/'micro_counts.json').read_text())
 for row in diagnostics+micro:
  data=row['data'];c=data['totals'];assert total(data['sites'])==c
  assert c['writes']==c['ordinary_writes']+c['shared_writes']
  assert c['writes']==c['existing_fast']+c['slow_calls']+c['transition_hits']
  assert c['add_calls']==c['new_own']
  assert data['memory']['requested_bytes']==data['memory']['released_bytes']
 for row in diagnostics:
  assert row['data']['totals']['transition_hits']==0
 for case in ['plain','plus_one']:
  b,v=[next(r for r in micro if r['case']==case and r['label']==l) for l in LABELS]
  assert b['data']['totals']['add_calls']-v['data']['totals']['add_calls']==v['data']['totals']['transition_hits']
  x=next(s for s in v['data']['sites'] if s['function']==('writeX' if case=='plain' else 'Calc') and s['atom']=='x')
  assert x['counts']['writes']==65536 and x['counts']['transition_hits']==65534 and x['counts']['publications']==1
  if case=='plus_one':assert v['data']['constructors']['hits']==0
 for case in ['overwrite','resize','alternate']:
  d=next(r for r in micro if r['case']==case and r['label']!= 'SPARSE')['data']
  assert d['totals']['transition_hits']==0
 timing=[];raw=[]
 for phase in ['micro_time','target_time']:
  rows=json.loads((HERE/f'{phase}_samples.json').read_text());assert len(rows)==20
  assert len({(r['label'],r['case'],r['rep']) for r in rows})==20
  for r in rows:
   m=json.loads((HERE/f'{r["label"]}.release.manifest.json').read_text());assert r['binary_sha256']==m['binary_sha256']
   assert r['exit_code']==0 and not r['stderr'];assert r['mode']=='release'
   assert sha(r['command'][0])==r['binary_sha256']
   script=next(Path(x) for x in reversed(r['command']) if str(x).endswith('.js'));assert sha(script)==r['script_sha256']
   raw.append({k:r[k] for k in ['label','case','rep','ms','binary_sha256','external_wall_ms']}|dict(phase=phase))
  for c in dict.fromkeys(r['case'] for r in rows):
   b=[r['ms'] for r in rows if r['case']==c and r['label']=='SPARSE'];v=[r['ms'] for r in rows if r['case']==c and r['label']!='SPARSE']
   assert len(b)==len(v)==5
   timing.append(dict(case=c,unit='ms / entire loop' if phase=='micro_time' else 'ms/Run',SPARSE_ms=statistics.median(b),candidate_ms=statistics.median(v),change_percent=(statistics.median(v)/statistics.median(b)-1)*100,
    SPARSE_min=min(b),SPARSE_max=max(b),candidate_min=min(v),candidate_max=max(v),SPARSE_raw=b,candidate_raw=v))
 csvout('raw_timings.csv',raw);csvout('timing_comparison.csv',[{k:v for k,v in r.items() if not k.endswith('_raw')} for r in timing])
 profiles=[];tops=[]
 for r in diagnostics:
  for shared in [0,1]:
   c=total(r['data']['sites'],shared)
   if not c:c={k:0 for k in r['data']['totals']}
   profiles.append(dict(case=r['case'],label=r['label'],shared=shared,**c))
  for s in sorted(r['data']['sites'],key=lambda s:s['counts']['reject_proto_unhashed'],reverse=True)[:5]:
   tops.append(dict(case=r['case'],label=r['label'],id=s['id'],function=s['function'],pc=s['pc'],atom=s['atom'],shared=s['shared'],**s['counts']))
 csvout('write_profile.csv',profiles);csvout('top_rejected_sites.csv',tops)
 lines=['# STORE_TRANSITION_IC 实测结果','',
  '新增写入快路在受控小例子上有效，在本轮 RayTrace / Tree 上没有一次新增 IC 命中。Tree 的时间确实下降，但诊断中原整函数构造快路覆盖也变化了，不能把它算成本写入 IC 的收益。','',
  '原 SPARSE 和候选均从冻结源码独立构建。CPU 2、C locale、Asia/Shanghai，GCC 原 Makefile Release；每项两版轮换，各 5 个新进程。计数与计时分开，首次调用计入，无额外热身。负数表示更快。','',
  '## Release 时间','',
  '| 项目 | 单位 | 原 SPARSE 中位数 [最小, 最大] | 候选中位数 [最小, 最大] | 相对变化 |','|---|---|---:|---:|---:|']
 for r in timing:lines.append(f'| {r["case"]} | {r["unit"]} | {r["SPARSE_ms"]:.4f} [{r["SPARSE_min"]:.4f}, {r["SPARSE_max"]:.4f}] | {r["candidate_ms"]:.4f} [{r["candidate_min"]:.4f}, {r["candidate_max"]:.4f}] | {r["change_percent"]:+.2f}% |')
 lines+=['','微基准 N = 67,108,864。plain：每轮 Object.create(null)、写 pad、同一 writeX 位点新增 x；plus_one：每轮 new Calc(3)，构造体 this.pad=1; this.x=x+1。两版使用同一 JS 和输入，整段循环计时，不把对象创建成本排出去。null 原型用于建立符合本轮守卫条件的正例，不能拿这组替代真实负载。','',
  '### 每轮原始时间','', '| 项目 | 原 SPARSE 5 次 | 候选 5 次 |','|---|---|---|']
 for r in timing:lines.append(f'| {r["case"]} | '+', '.join(f'{x:.4f}' for x in r['SPARSE_raw'])+' | '+', '.join(f'{x:.4f}' for x in r['candidate_raw'])+' |')
 lines+=['','## 原写入覆盖诊断','',
  '下表来自原脚本完整执行，含 Setup/校验；普通 put_field 与既有 put_field_shared 分开。“已有”指命中自有属性分支；AUTOINIT 重试在同一调用只计一次。新 IC 命中和旧全局转换表复用不是同一计数。','',
  '| 项目 / 版本 | 指令 | 执行 | 已有自有属性 | 新增自有属性 | 复用目标 shape | 其中无需扩容 | 新 IC 命中 |','|---|---|---:|---:|---:|---:|---:|---:|']
 for p in profiles:lines.append(f'| {p["case"]} / {p["label"]} | '+('put_field_shared' if p['shared'] else '普通写点（含本轮同长改写）')+f' | {p["writes"]:,} | {p["existing_fast"]+p["own_existing_slow"]:,} | {p["new_own"]:,} | {p["reuse_shape"]:,} | {p["reuse_no_resize"]:,} | {p["transition_hits"]:,} |')
 lines+=['','RayTrace 原版有 16,854,706 次同容量复用；候选诊断有 16,865,323 次，全部在局部原型验证遇到未哈希布局，学习为 0。Tree 原版有 13,210,773 次；候选有 4,040,165 次，同样全部被未哈希原型拒绝。TreeNode 本身属于原构造模板，保留普通写指令；这些是机会诊断，不能报成新 IC 执行。没有强行把未哈希布局变成可信记录。','',
  '| 项目 | 原 SPARSE 旧构造尝试 / 命中 | 候选旧构造尝试 / 命中 |','|---|---:|---:|']
 for case in [r['case'] for r in diagnostics if r['label']=='SPARSE']:
  b,v=[next(r for r in diagnostics if r['case']==case and r['label']==l)['data']['constructors'] for l in LABELS]
  lines.append(f'| {case} | {b["attempts"]:,} / {b["hits"]:,} | {v["attempts"]:,} / {v["hits"]:,} |')
 lines+=['','Tree 的旧构造命中多了 3,028,751 次，恰好对应少执行 9,086,253 次构造体字段写入（三个字段）。本轮没有改构造算法、资格或淘汰；新增函数元数据和分配会改变内存/GC 条件，诊断用 C 分配还可能改变地址分布。Release 的具体构造次数没有混入计时测量，因此这里只报告路径变化，不用诊断比例精确拆解 Release 时间。','',
  '## 微基准的白盒证据','',
  '诊断 N=65,536。plain / plus_one：原版各进 add_property 131,072 次，候选各 5 次，少 131,067 次，等于新 IC 命中数。两组各发布 2 条计划，未替换。只看目标 x 写点：writeX 的 PC=2、Calc 的 PC=13，各执行 65,536 次、命中 65,534 次、发布 1 次。Calc 的旧整函数构造尝试 65,536 次、命中 0，所以这里确实是赋值快路在工作。','',
  '已有 x、需要扩容、交替布局三个对照，均没有误命中，值校验通过。resize 有 65,535 次复用目标但需要扩容，均回原路径；本版没有优化它。','',
  '验证程序的实际执行缓冲区（validation/*.fixture.run.json）展示单个 writeX 的：`PC 2 put_field_sti site=0 atom=x from_count=0 to_count=1 capacity=2 offset=0 depth=1`。这里 site=0 是旁表编号，offset=0 是对象属性槽号。对应原版同一 PC 是 put_field x；两条均 5 字节。','',
  '```c',
  'if (p->shape != s->from) return 0;   /* 另有 class/exotic/extensible/容量守卫 */',
  'for (int i = 0; i < s->depth; i++) {',
  '    if (!proto || proto->class_id != JS_CLASS_OBJECT || proto->is_exotic ||',
  '        proto->shape != s->chain[i]) return 0;',
  '    proto = proto->shape->proto;',
  '}',
  'if (proto) return 0;',
  'JSShape *old = p->shape;',
  'p->shape = js_dup_shape(s->to);',
  'p->prop[s->offset].u.value = val;',
  'js_free_shape(ctx->rt, old);',
  '```','',
  '代码为原实现关键行的节选（计数及拒绝分支省略）。命中时不查属性名、不逐层查描述符、不进入 add_property，也不探旧的全局 32 项转换表。它仍要做对象/布局/链条件比较、shape 引用交接，以及原栈对象释放。','',
  '## 验证和内存','',
  'A / SPARSE / 候选对照：已有 property_reads.js、safety.js，以及本轮原型 setter、只读、换链、删除、getter、Proxy、preventExtensions、对象 RHS/身份/副作用与大数字属性名。ASan/UBSan 通过。内部 fixture 还覆盖实际学习、守卫失败后原检查、可选记录 OOM、普通和 ROM 保存/加载、缓存-原型-函数环的 GC、发布后释放旧计划所触发的原生重入。ptrace 环境关闭 LSan；QuickJS FreeRuntime 断言保留。','',
  'JSRuntime 仍 2,216 B，JSShape 仍 56 B。JSFunctionBytecode 从 160 B 到 176 B（每函数 +16 B）；每个启用写点 64 B。另有只写且无原准备镜像的函数复制代码，不把它遗漏。RayTrace 记录累计请求/释放 7,808 B，额外代码复制 352 B；Tree 记录请求/释放 64 B，代码复制 0 B。未把这些请求量冒充进程堆净增量，保活的 shape/原型还会影响寿命。','',
  '## 完整基准与结论','']
 full=HERE/'full_confirmation01/summary.json'
 if full.exists():
  f=json.loads(full.read_text());lines+=['用户追加要求后，两版现场交错跑完整 Octane / SunSpider，各项各 1 个进程，原输入/N/校验和计时边界不变。','', '| 套件 | 整体 GM 变化 | 改善 / 回退 |','|---|---:|---:|']
  for suite,a in f['aggregates'].items():lines.append(f'| {suite} | {a["GM_percent"]:+.2f}% | {a["faster"]} / {a["slower"]} |')
  lines+=['','[全部 43 项时间、GM、逐项和](full_confirmation01/results.md)，[原始逐项时间](full_confirmation01/raw_timings.csv)。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权。单轮筛选，不替换默认版。']
 lines+=['','新快路省写入工作的证据在受控微基准成立；RayTrace / Tree 没有实际新增快路覆盖。即使 Tree 的总体时间下降，也不能据此说本写入 IC 的命中有收益。本轮停在这个范围，不放宽未哈希守卫、不继续调策略、不 push。','',
  '交付：[独立补丁](SPARSE-to-STORE_TRANSITION_IC.patch)、[运行和设计说明](README.md)、[原始 5 轮计时](raw_timings.csv)、[写入诊断](write_profile.csv)、[主要拒绝位点](top_rejected_sites.csv)。开发版本只归档，不混入正式表。']
 (HERE/'results.md').write_text('\n'.join(lines)+'\n')
 save(HERE/'decision.json',dict(run_full_by_original_screening=False,reason='both targeted workloads have zero new transition IC hits',full_user_requested=True,full_run=full.exists(),expand_strategy=False))
 save(HERE/'summary.json',dict(status='PASS',timing=timing,profiles=profiles,mechanism='micro only; zero new IC hits in targeted real programs',full_summary=str(full) if full.exists() else None))
 save(HERE/'audit.json',dict(status='PASS',branch=subprocess.check_output(['git','branch','--show-current'],text=True).strip(),frozen_sources_unchanged=True,changed_release_files=changed,patch_reconstructs=True,ctor_read_shared_write_global_transition_files_unchanged=True,semantic_ASan_UBSan=True,formal_targeted_release_processes=40,counters_not_in_release=b'ST_OUTPUT' not in Path(bm['binary']).read_bytes(),new_real_transition_hits=0,full_user_requested=full.exists()))
 print('REPORT_AUDIT_PASS',json.dumps({r['case']:r['change_percent'] for r in timing}),flush=True)
if __name__=='__main__':main()
