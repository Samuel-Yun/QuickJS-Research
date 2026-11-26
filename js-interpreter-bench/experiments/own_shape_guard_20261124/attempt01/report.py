"""Combine separately collected correctness, mechanism and Release evidence."""
import collections,csv,json,platform,subprocess
from pathlib import Path
from build import HERE,PACKAGE,LABELS,save,sha

def load(n):return json.loads((HERE/n).read_text())
def csvout(n,rows):
 if not rows:return
 with (HERE/n).open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
def main():
 gate=load('gate.json');assert gate['status']=='PASS'
 micro=load('micro_time.json');target=load('target_time.json');decision=load('decision.json')
 lines=['# OWN_SHAPE_GUARD：缩短自有字段读取守卫','',
 '三版独立从冻结 SPARSE_CTOR_IC（06aada4）派生。RELAX_CLASS 去掉自有读的 class 限制；SHAPE_ONLY 同时去掉 exotic 限制。'
 '只改 keep=0 的自有数据读及 arg0/loc0 融合读。没有叠加之前的读/构造实验，没有修改冻结源码或默认版本。','',
 '## Release 时间','',
 f'每组每版 5 个新进程，按组与轮次轮换版本顺序，CPU 2、Asia/Shanghai、C locale。微基准全部使用同一 N={load("micro_protocol.json")["iterations"]:,}，'
 '接收者准备不计时，首次调用计入；真实项目保持原脚本、N、校验及 Setup/Run 边界。下面是中位数，括号内相对本批 SPARSE，负数更快。','',
 '| 用例 | SPARSE ms | RELAX_CLASS ms | SHAPE_ONLY ms |','|---|---:|---:|---:|']
 for data in [micro,target]:
  for case in dict.fromkeys(r['case'] for r in data):
   rr=[next(r for r in data if r['case']==case and r['label']==l) for l in LABELS]
   lines.append('| '+case+' | '+' | '.join(f'{r["median"]:.4f}'+(f' ({r["change_percent"]:+.2f}%)' if i else '') for i,r in enumerate(rr))+' |')
 csvout('timing_comparison.csv',[dict(phase=p,**r) for p,data in [('micro',micro),('target',target)] for r in data])
 raw=[]
 for p in ['micro_time','target_time']:
  for r in load(p+'_samples.json'):
   raw.append({k:r[k] for k in ['label','case','rep','ms','N','binary_sha256','script_sha256','external_wall_ms']})
 csvout('raw_timings.csv',raw)
 lines+=['','### 每轮原始时间与范围','',
 '| 用例 | 版本 | 5 次 ms | 最小—最大 ms |','|---|---|---|---:|']
 for r in micro+target:lines.append(f'| {r["case"]} | {r["label"]} | '+', '.join(f'{v:.4f}' for v in r['values'])+f' | {r["min"]:.4f}—{r["max"]:.4f} |')
 lines+=['','## 实际新增了哪些命中','',
 '以下均为独立计数构建，不拿计数构建的耗时下结论。每次逻辑读取只记一次，融合失败交给 get_field_rdi 时不重复记。'
 '诊断范围是准备后的 rdi 命名读取；不含遗留 get_length，因此不把它冒充整个解释器的所有属性读取。','',
 '| 微基准 / 版本 | 查询 | 融合命中 | 普通 IC 命中 | 正常查找 | rdi_update |','|---|---:|---:|---:|---:|---:|']
 countrows=[]
 for r in load('micro_counts.json'):
  s=r['site'];c=s['counts'];countrows.append(dict(case=r['case'],label=r['label'],**c))
  lines.append(f'| {r["case"]} / {r["label"]} | {c["logical_named"]:,} | {c["fused_hits"]:,} | {c["field_hits"]:,} | {c["normal_lookups"]:,} | {c["updates"]:,} |')
 csvout('micro_coverage.csv',countrows)
 lines+=['', '实际布局：普通对象 class=1、函数 class=13、RegExp class=18 均非 exotic；数组 class=2 且 exotic。'
 '这几组的真实自有 x 描述符和 shape 均已确认可哈希；x 值始终从当前接收者的 prop 数组读取。'
 'RELAX_CLASS 新覆盖函数和 RegExp，仍不覆盖数组；SHAPE_ONLY 还覆盖数组真实自有数据槽。'
 '密集数组元素、typed-array 元素、字符串虚拟索引不是这种 prop 槽，仍走原路径。'
  'RELAX_CLASS 的数组用例没有新增命中，若计时有变化，不能把它算作数组进入缓存的收益。','',
 '| 小测试的接收者 | class | exotic | x 的真实槽号 |','|---|---:|---:|---:|',
 '| 普通对象 | 1 | 0 | 0 |','| 函数 | 13 | 0 | 3 |','| RegExp | 18 | 0 | 1 |','| 数组 | 2 | 1 | 1 |','',
 '槽号取自运行时描述符和已填的 IC 记录，不按 JS 字面量猜测；以上四组 shape 均已哈希。','',
 '| 真实项目 / 版本 | rdi 逻辑读取 | keep=0 查询 | 新类别命中 | 正常查找 | rdi_update |','|---|---:|---:|---:|---:|---:|']
 cr=[];classes=[];sites=[]
 for r in load('target_counts.json'):
  d=r['data'];c=d['totals'];new=sum(x['counts']['nonbaseline_hit'] for s in d['sites'] for x in s['classes'])
  cr.append(dict(case=r['case'],label=r['label'],nonbaseline_hit=new,**c))
  lines.append(f'| {r["case"]} / {r["label"]} | {c["logical_named"]:,} | {c["rdi0_named"]:,} | {new:,} | {c["normal_lookups"]:,} | {c["updates"]:,} |')
  totals={}
  for s in d['sites']:
   sites.append(dict(case=r['case'],label=r['label'],id=s['id'],function=s['function'],atom=s['atom'],pc=s['pc'],**s['counts']))
   for x in s['classes']:
    key=(x['class'],x['exotic'],x['hashed'],x['name']);t=totals.setdefault(key,collections.Counter());t.update(x['counts'])
  for (cl,ex,ha,name),c in totals.items():classes.append(dict(case=r['case'],label=r['label'],class_id=cl,exotic=ex,hashed=ha,class_name=name,**c))
 csvout('target_coverage.csv',cr);csvout('target_classes.csv',classes);csvout('target_sites.csv',sites)
 lines+=['', '三个真实项目的新增类别命中都是 0。RegExp 的 exec 有 5,432,000 次读取，全是 keep=1 的 get_field2_rdi，'
 '本轮没有改这条方法读取路径；不是删掉 class 检查就能把继承方法变成自有字段。'
 'keep=0 下函数真实自有数据查找在 RegExp / Gameboy / Typescript 分别有 8 / 231 / 38,029 次，但对应 shape 都未哈希，仍不填槽。'
 'Gameboy 一个 Error 自有字段从不填变成填槽一次，后面没有重复读取，新增命中仍为 0。'
 '普通对象原有热读数量没有增加，时间变化要与更短守卫和编译布局一起判断。','',
 '## 实际字节码和 Release 汇编','',
 '微基准融合读实际为 `0 v6_get_arg0; 1 get_field_rdi x; 6 return`，'
 '普通读实际为 `0 get_arg1; 1 get_field_rdi x; 6 return`。三版编码、7 字节总长及 24B ReadICSite 均不变。'
 'micro_counts/ 保留实际执行缓冲区的 snapshot.jsonl、反汇编和前六次读取的对象/缓存 shape、槽号及描述符。','',
 'assembly.py 从这三个真实 Release ELF 的 computed-goto 表定位 handler，不使用另编的标签构建。'
 'v6_get_arg0 的对象块在 entry 之外，已单独保存 *.object.asm；*.branches.asm 保留分支目标，避免把相邻 opcode 当成快路。','',
 '| 融合命中的检查 | SPARSE | RELAX_CLASS | SHAPE_ONLY |','|---|---|---|---|',
 '| 对象 tag | 保留 | 保留 | 保留 |','| class==Object 的比较/条件跳转 | 有 | 无 | 无 |',
 '| exotic 位测试/条件跳转 | 有 | 有 | 无 |','| shape 比较/条件跳转 | 有 | 有 | 有 |','',
 '普通 get_field_rdi 的 Release 汇编也相应去掉这些准入检查。编译器同时改变了寄存器安排和代码位置，'
 '不能用源码删掉几个条件，直接推算整段程序必然快多少。get_field2_rdi 的守卫源码、原型 IC 和共享写守卫保持原样。','']
 if (HERE/'instructions.json').exists():
  ir=load('instructions.json');lines+=['### Callgrind 指令数（不是耗时）','','| 用例 | SPARSE Ir | RELAX_CLASS Ir | SHAPE_ONLY Ir |','|---|---:|---:|---:|']
  for mode in ['fused','plain']:
   lines.append('| object.'+mode+' | '+' | '.join(f'{next(x for x in ir["rows"] if x["label"]==l and x["mode"]==mode)["events"]["Ir"]:,}' for l in LABELS)+' |')
  lines+=['','N=65,536，未插桩 Release，经 Callgrind 统计整个进程 Ir，包含加载/编译/准备/清理。'
   '与几秒长循环的原生 Release 耗时分开看；原始输出和 inclusive 注解在 callgrind/。','']
 shape_source=Path(load('SHAPE_ONLY.release.manifest.json')['binary']).parent
 macro=(shape_source/'quickjs.c').read_text().split('#define V6_PREPARED_BORROW(slot)',1)[1].split('} while (0)',1)[0]
 lines+=['## 关键 C 代码','',
 'SHAPE_ONLY 的融合入口实际源码如下；RELAX_CLASS 在 shape 比较前还保留 `!object->is_exotic`。',
 '```c','#define V6_PREPARED_BORROW(slot)'+macro+'} while (0)','```','',
 '原来在 shape 比较前还要求 Object 类别、非 exotic；现在已证明本记录只装真实自有数据槽，所以可以用当前 shape 直接核对布局。'
 '命中仍从当前 object->prop 取当前值，并照旧 DupValue；pc 加 5 跳过后面的 get_field_rdi，失败仍把 receiver 压栈让旧查找处理。','',
 '普通 get_field_rdi 的两处配套改动（原始源码节选，中间未改部分省略）：','```c',
 'if (!keep || (p->class_id == JS_CLASS_OBJECT && !p->is_exotic)) {',
 '    /* 原缓存探测和命中收尾不变，省略 */','}',
 '/* 正常查找已确认真实数据描述符后；继承字段仍走上面的原分支 */',
 'else if (keep && (p->class_id != JS_CLASS_OBJECT || p->is_exotic)) { RDI_REASON(special); }',
 'else if (!p->shape->is_hashed) { RDI_REASON(unhashed); }',
 'else {',
 '    RDI_REASON(own_miss);',
 '    rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
 '}','```','',
 'keep=0 才放宽；keep=1 的方法读取保留原条件。仍不缓存 getter、继承字段、未哈希布局或虚拟数组元素。'
 '两版完整独立补丁在本目录，read_ic_runtime.inc、共享写和构造代码没有改。','',
 '## 正确性和布局依据','',
 '与 A 对齐的测试通过：已有 property_reads/safety、同布局改值/删除/改 getter、继承字段、Proxy/revoke、数字形式名称、'
 '函数调用前后读取、读扩大后共享写仍按旧守卫回退。两候选 ASan/UBSan 通过。'
 '内部 C fixture 实测普通对象与自定义 exotic 对象可以共用同一个 shape：双方有真实普通自有槽时，A 本来就在特殊分派前读取；'
 '删除后 shape 分离并触发一次 exotic get。另覆盖真实 get_field 的数字 atom、数组/typed array/String、buffer detach 和 GC。'
  '内部函数样例实测 class 为 13→13，没有把它写成已实测的 cold→warm 类别转换。','',
 '为什么 SHAPE_ONLY 可以读：填槽仍必须正常查找到接收者本身的真实普通数据描述符，并且 shape 已哈希。'
 'IC 持有该 shape，删除、类型转换、属性移动、改原型等更新在共享布局上采用复制，不能悄悄把旧槽变成别的属性。'
 '每次都读当前对象的当前值；不假定同 shape 等于同 class，也不缓存特殊 API 返回的虚拟属性。逐入口核查见 layout_proof.md。','',
 '未增加任何静态点、函数或运行时元数据；ReadICSite 24B、JSFunctionBytecode 160B、JSRuntime 2216B、JSShape 56B、JSObject 64B 均与冻结 SPARSE 相同。'
 '不改字节码表示，因此没有为本次守卫改动另做 qjsc 格式改动。LSan 在当前 ptrace 环境关闭，ASan/UBSan 和 runtime 释放断言正常执行。','',
 '## 是否继续跑全集','']
 for d in decision:
  lines.append(f'- {d["label"]}：'+('有真实项目连续 5 对均更快，进入同批单轮全集。' if d['run_full'] else '没有真实项目连续 5 对均更快，按原停止条件不扩到全集。'))
  for e in d['evidence']:lines.append('  '+e['case']+' 五对变化：'+', '.join(f'{v:+.2f}%' for v in e['paired_changes'])+'。')
 full=HERE/'full_confirmation01/summary.json'
 if full.exists():
  fs=json.loads(full.read_text());lines+=['','### 同批单轮全集','',
   '| 版本 | Octane 整体 GM | SunSpider 整体 GM |','|---|---:|---:|']
  for l in fs['labels']:
   lines.append('| '+l+' | '+' | '.join(f'{fs["aggregates"][s][l]["GM_percent"]:+.2f}%' for s in ['octane','sunspider'])+' |')
  lines+=['','Octane 按 14 suite 分层等权，SunSpider 按 26 项等权。两套逐项表、ms/Run 与逐项耗时之和见 full_confirmation01/results.md。'
   '本批基线重新测量，一项一版一个新进程；单轮不报显著性。']
  lines+=['','两版都没有显示明显的整体收益。RELAX_CLASS 两套仅有不到 0.2% 的耗时下降；'
   'SHAPE_ONLY 的 Octane 几乎持平，SunSpider 略慢。保留实验，不替换冻结版。',
   'SHAPE_ONLY 的 Gameboy 定向 5 对都更快，但全集这一轮为 +0.28%；两批结果均保留，不追加重测来挑结果。']
 lines+=['','计数证明范围是否扩大，汇编证明守卫是否减少，Release 时间才说明是否更快。'
 '没有把小测试新增命中解释成正则匹配器变快，也不把跨版本的代码布局差异排除在时间变化之外。'
 '本轮结果保留为实验，不替换冻结 SPARSE，不 push。','',
 '## 复现','',
 '首次运行顺序（先 cd 到本实验目录）：','',
 '```sh',
 'python3 build.py',
 'python3 build.py --labels RELAX_CLASS SHAPE_ONLY --modes sanitize',
 'python3 validate.py',
 'python3 run.py micro_counts',
 'python3 run.py target_counts',
 'python3 assembly.py',
 'python3 instructions.py',
 'python3 run.py pilot',
 'python3 run.py micro_time',
 'python3 run.py target_time',
 'python3 run.py decide',
 'python3 full_confirmation.py  # 没有合格候选时直接结束，不启动全集',
 'python3 report.py','```','',
 '上面的命令需先 cd 到本实验目录。原始记录默认拒绝覆盖；完整复跑时把脚本、inc、JS、C 文件复制到同级新的 attempt 目录后运行。'
 'build.py 每版从冻结目录生成独立源码，验证 manifest 哈希；补丁独立对 SPARSE，不需要按顺序应用。','']
 (HERE/'results.md').write_text('\n'.join(lines))
 m=load('micro_counts.json')[0]['layout'];frozen=json.loads((PACKAGE/'manifest.json').read_text())
 for n,h in frozen['modified'].items():assert sha(PACKAGE/'modified'/n)==h
 for n,h in frozen['original'].items():assert sha(PACKAGE/'original'/n)==h
 changed={}
 for l in LABELS[1:]:
  manifest=load(l+'.release.manifest.json');base=load('SPARSE.release.manifest.json')
  changed[l]=[n for n,h in manifest['sources'].items() if base['sources'].get(n)!=h]
  assert set(changed[l])=={'quickjs.c','read_ic_opcodes.inc'}
  assert sha(manifest['binary'])==manifest['binary_sha256']
 full_validation=json.loads((full.parent/'validation.json').read_text()) if full.exists() else None
 save(HERE/'audit.json',dict(status='PASS',frozen_original_and_modified_unchanged=True,release_changed_files=changed,
  gate=gate,layout=m,micro_release_processes=len(load('micro_time_samples.json')),target_release_processes=len(load('target_time_samples.json')),
  full_validation=full_validation,formal_release_processes_total=len(raw)+(full_validation['fresh_processes'] if full_validation else 0)))
 save(HERE/'summary.json',dict(micro=micro,target=target,decision=decision,extra_metadata_bytes=0,new_hits_in_target_workloads=0,
  full=fs if full.exists() else None))
 save(HERE/'environment.json',dict(branch=subprocess.check_output(['git','branch','--show-current'],text=True).strip(),
  platform=platform.platform(),compiler=subprocess.check_output(['gcc','--version'],text=True).splitlines()[0],CPU=2,
  lscpu=subprocess.check_output(['lscpu'],text=True),TZ='Asia/Shanghai',locale='C',
  cpu_governor=Path('/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor').read_text().strip(),
  thread_siblings=Path('/sys/devices/system/cpu/cpu2/topology/thread_siblings_list').read_text().strip()))
 (HERE/'README.md').write_text('# OWN_SHAPE_GUARD\n\n独立两档自有字段读实验。完整结果和复现命令：[results.md](results.md)。\n\n'
  '机制：RELAX_CLASS 去掉 Object 类别限制，SHAPE_ONLY 进一步用 shape 验证已填入的真实自有数据槽。布局证明：[layout_proof.md](layout_proof.md)。\n\n'
  '补丁：SPARSE-to-RELAX_CLASS.patch、SPARSE-to-SHAPE_ONLY.patch。两版各自对冻结 SPARSE，不叠加。\n\n'
  '计时：raw_timings.csv、timing_comparison.csv、micro_time/、target_time/。计数：micro_counts/、target_counts/ 及 coverage CSV。\n'
  '字节码：micro_counts/*.snapshot.jsonl、*.bytecode.txt。Release 汇编：assembly/。正确性和 ASan/UBSan：gate.json、validation/、validation_js/。\n')
 if full.exists():
  brief=['# OWN_SHAPE_GUARD 本轮结果','',
   '结论：两版都没有明显的整体收益。RELAX_CLASS 几乎持平，SHAPE_ONLY 在 SunSpider 略慢。保留代码和数据，不替换冻结 SPARSE。','',
   '## 完整基准：相对同批现场 SPARSE','',
   '| 版本 | Octane GM | SunSpider GM |','|---|---:|---:|']
  for l in fs['labels'][1:]:brief.append('| '+l+' | '+' | '.join(f'{fs["aggregates"][s][l]["GM_percent"]:+.2f}%' for s in ['octane','sunspider'])+' |')
  brief+=['','每版每项一个新进程，输入/N/校验不变；Octane 14 suite 分层等权、SunSpider 26 项等权。负数更快，单轮筛选。'
   'RELAX_CLASS 最大回退 Crypto.Decrypt +2.03%；SHAPE_ONLY 最大回退 3d-cube +4.21%。','',
   '## 这次到底改了什么','',
   '- RELAX_CLASS：真实自有数据读不再要求 class 必须是普通 Object，仍检查非 exotic 与 shape。',
   '- SHAPE_ONLY：独立从 SPARSE 派生，命中只检查对象 tag 与已填自有记录的 shape。填槽前仍必须确认真实自有数据描述符与已哈希布局。',
   '- 方法读取 get_field2_rdi、原型 IC、写入和构造路径没改；字节码和记录尺寸没改，新增元数据 0B。','',
   '实际 SHAPE_ONLY 融合命中源码节选：','',
   '```c','if (site->shape == object->shape) {',
   '    *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);',
   '    pc += 5;','    break;','}','```','',
   '原来在 shape 前还查 class 和 exotic；现在把这两项去掉。取当前槽值、引用处理和失配回退照旧。'
   'Release 汇编确实少了相应比较与条件跳转，Callgrind 融合读的整进程指令数少 0.81% / 1.02%，但不是同样幅度的时间收益。','',
   '## 两个问题的答案','',
   '1. 稳定普通对象：5 次中位数，融合读 RELAX_CLASS −0.28%、SHAPE_ONLY −0.67%；非融合读 +0.22% / +1.84%。没有清楚的普遍改善。',
   '2. 新类别：诊断各读 65,536 次，函数和 RegExp 在两版都从 0 命中变成 65,535；数组仅 SHAPE_ONLY 达到 65,535。'
   '相应 Release 小测试函数快约 5%、RegExp 快约 5%、SHAPE_ONLY 数组快 6.74%。'
   '但真实 RegExp / Gameboy / Typescript 的新增类别命中均为 0；exec 是继承方法读取，不走这次改的自有字段路径。','',
   '定向五轮真实时间：Gameboy −1.66% / −1.69%，Typescript −1.23% / −1.45%。'
   '因此按原条件进入全集；全集并未给出相近的整体提升。SHAPE_ONLY 的 Gameboy 单轮 +0.28%，与定向结果不一致，原样保留。','',
   'A/SPARSE 差分、getter/删除/Proxy/数字属性、同 shape 跨类别、GC 和 ASan/UBSan 均通过。','',
   '[完整说明与复现命令](results.md) · [43 项逐项表和耗时之和](full_confirmation01/results.md) · '
   '[原始计时](raw_timings.csv) · [布局依据](layout_proof.md) · '
   '[RELAX_CLASS 补丁](SPARSE-to-RELAX_CLASS.patch) · [SHAPE_ONLY 补丁](SPARSE-to-SHAPE_ONLY.patch)','']
  (HERE/'results_brief.md').write_text('\n'.join(brief))
 print('REPORT_PASS',flush=True)
if __name__=='__main__':main()
