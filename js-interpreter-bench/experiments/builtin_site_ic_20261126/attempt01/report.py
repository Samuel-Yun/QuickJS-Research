"""Generate reports solely from saved measurements; never rerun a benchmark."""
from measure import *
import random
FULL=HERE/'full01';full=json.loads((FULL/'summary.json').read_text());target=json.loads((HERE/'paired01/summary.json').read_text());focus=json.loads((HERE/'focus01/summary.json').read_text());counts=json.loads((HERE/'counts01/samples.json').read_text());cg=json.loads((HERE/'callgrind01/summary.json').read_text())
def tab(head,rows):return '\n'.join(['|'+'|'.join(head)+'|','|'+'|'.join(['---']*len(head))+'|',*['|'+'|'.join(map(str,row))+'|'for row in rows]])
def row(case,label,items):return next(r for r in items if r['case']==case and r['label']==label)
def pct(a,b):return(a/b-1)*100
# Bootstrap paired ratios as a descriptive uncertainty interval. All raw ranges
# and counts remain, so the point estimate cannot hide adverse pairs.
rng=random.Random(20261126);uncert=[]
for r in focus:
 for ref in ['SPARSE','BODY','SHAM']:
  v=r['ratios'][ref];bs=sorted(statistics.median(rng.choices(v,k=len(v)))for _ in range(10000));uncert.append(dict(case=r['case'],label=r['label'],reference=ref,n=len(v),median_percent=pct(statistics.median(v),1),min_percent=pct(min(v),1),max_percent=pct(max(v),1),bootstrap_median_95_percent=[pct(quantile(bs,.025),1),pct(quantile(bs,.975),1)],faster_pairs=sum(x<1 for x in v)))
save(HERE/'external_paired_uncertainty.json',uncert)
CN=['ordinary_qualified','learning_observations','installed_Run','special_opcode_executions','special_guard_pass','special_fallback','disabled','record_allocated_Run','native_qualified_after_special','native_frames_saved','unused10','unused11','unused12','unused13','unused14','unused15']
GN=['native_charCodeAt_entries','native_flat_int_in_range','native_out_of_range','native_nonflat_receiver','native_nonint_index','qualified_without_eligible_direct_caller','native_frames_saved','BODY_direct_actions','tables_allocated_Run','pointer_arrays_grown_Run','optional_allocation_failures','unused11','unused12','unused13','unused14','unused15']
mechanism=[];mt=[]
for r in counts:
 d=r['diagnostic']['BIC_COUNTS'];t=[sum(s['c'][i]for s in d['sites'])for i in range(16)];assert t[9]==d['global'][6]
 mechanism.append(dict(suite=r['suite'],case=r['name'],label=r['label'],N=r['N'],global_counts=dict(zip(GN,d['global'])),site_totals=dict(zip(CN,t)),lifetime=d['lifetime'],sites=[dict(function=s['function'],file=s['file'],line=s['line'],pc=s['pc'],counts=dict(zip(CN,s['c'])))for s in d['sites']]))
 if r['label']=='SITE':
  base=next(x for x in counts if x['label']=='SPARSE'and x['suite']==r['suite']and x['case']==r['case']);bd=base['diagnostic']['BIC_COUNTS'];eligible=sum(s['c'][0]for s in bd['sites']);assert base['N']==r['N'];assert bd['global'][0]==d['global'][0]+t[9];assert eligible==t[0]+t[4]+t[8]
  mt.append(dict(case=r['name'],N=r['N'],V1_eligible=eligible,eligible_PCs=len(bd['sites']),installed_Run=t[2],special_executions=t[3],special_guard_pass=t[4],fallback=t[5],disabled=t[6],native_frames_saved=t[9],eligible_coverage_percent=t[9]/eligible*100 if eligible else 0,special_hit_percent=t[4]/t[3]*100 if t[3]else None))
save(HERE/'named_counts.json',mechanism);csvout(HERE/'mechanism_summary.csv',mt)
mechtable=tab(['负载','N','V1 动态合格','Run 安装位点','实际省 native 帧','覆盖合格调用','专用指令内命中率','回退/停训'],[[r['case'],r['N'],f'{r["V1_eligible"]:,}',r['installed_Run'],f'{r["native_frames_saved"]:,}',f'{r["eligible_coverage_percent"]:.3f}%',f'{r["special_hit_percent"]:.3f}%'if r['special_hit_percent']is not None else'—',f'{r["fallback"]}/{r["disabled"]}']for r in mt])
# Instructions from the Run-only profile; no profiler timings enter any table.
ci=[]
for x in cg:
 ci.append(dict(label=x['label'],total_Run_Ir=x['total_Run_Ir'],**{k:dict(Ir=x[k],percent=x[k]/x['total_Run_Ir']*100)for k in ['regexp_matcher_self','named_read_combined','all_call_entry_self','all_native_frame_self','charCodeAt_body_inclusive']}))
save(HERE/'instruction_shares.json',ci)
ctable=tab(['Run 指令分类','BODY','SITE'],[[name,*[f'{x[key]["percent"]:.4f}%'for x in ci]]for name,key in [('正则匹配器自身','regexp_matcher_self'),('命名属性读取 handler 与其常规查找','named_read_combined'),('全部调用入口自身','all_call_entry_self'),('全部原生帧自身，不含函数体','all_native_frame_self'),('charCodeAt 函数体及其被调用函数','charCodeAt_body_inclusive')]])
(HERE/'instructions.md').write_text('\n'.join(['# Acorn：高覆盖为什么没形成耗时收益','',
 '单独使用 Callgrind，只在解析的 Run 区间计数。复用实际 Release 的 quickjs.o；仅替换 qjs 启动器加入开始/停止采集的两个客户端请求。原始输出在 callgrind01/。Callgrind 的耗时不进入任何性能表。','',ctable,'',
 f'总 Run 指令：BODY {cg[0]["total_Run_Ir"]:,}，SITE {cg[1]["total_Run_Ir"]:,}，变化 {pct(cg[1]["total_Run_Ir"],cg[0]["total_Run_Ir"]):+.4f}%。两版 lre_exec 的指令数完全相同：{cg[0]["regexp_matcher_self"]:,}。',
 '读取分类由普通/读 IC handler 的自身指令，加上它们进入 JS_GetPropertyInternal 的调用边计算；不把所有 find_own_property 都归到读取，因为构造/写入也使用它。调用入口列包含所有 JS/C 调用的入口工作；原生帧列包含所有 C builtin 的建帧/分派自身工作，不仅是 charCodeAt。函数体列含它调用的转换/学习辅助函数。剩下的解释器分派、解析、分配等工作没有硬塞进这几列。',
 'Callgrind 的递归函数名 JS_CallInternal\'2 等已合并；使用文件尾 totals 并与所有函数自身 Ir 之和核对，避免只看 summary:0 的客户端请求文件头。',
 'SITE 真正减少了 charCodeAt 调用工作，但这块只占整段指令的一小部分；Acorn 仍有约 93.8% 指令在正则匹配器。属性读取约 0.95%，未成为整个负载的主导。本轮不把这些指令百分比当成耗时百分比，也不据此追加字符串原型读 IC。'])+'\n')
# Optional historical A/V8 context; it is deliberately separate from the four
# freshly paired engines and is never used for their effect estimates.
history=json.loads((ROOT/'experiments/ic_round2_20261125/attempt01/full01/summary.json').read_text());hist=[]
for suite in ['octane','sunspider']:
 rr=[]
 for r in full['rows']:
  if r['suite']!=suite:continue
  old=next(x for x in history['rows']if x['suite']==suite and x['case']==r['case']);rr.append(dict(**r,historical_A_ms=old['A_ms'],historical_V8_ms=old['V8_ON_ms']))
 cols=['historical_A','SPARSE','BODY','SHAM','SITE','historical_V8'];rows=[]
 for r in rr:rows.append([r['name'],*[f'{r[l+"_ms"]:.5f}'+(f' ({r[l+"_percent"]:+.2f}%)'if l in ['BODY','SHAM','SITE']else'')for l in cols]])
 (FULL/(suite+'_historical_context.md')).write_text('A/V8 为历史记录，其他四版为本批现场数据。括号只相对本批 SPARSE。单位 ms/Run。\n\n'+tab(['表项','历史 A','SPARSE','BODY','SHAM','SITE','历史 V8 --jitless'],rows)+'\n');hist+=rr
csvout(FULL/'historical_context.csv',hist)
# Main result page.
summarytable=tab(['模式','Octane GM','剔除 Richards','SunSpider GM','剔除 3d-cube'],[[l,f'{full["statistics"]["octane"][l]["relative_percent"]:+.2f}%',f'{full["statistics"]["octane"][l]["without_SITE_largest_winner_percent"]:+.2f}%',f'{full["statistics"]["sunspider"][l]["relative_percent"]:+.2f}%',f'{full["statistics"]["sunspider"][l]["without_SITE_largest_winner_percent"]:+.2f}%']for l in LABELS])
extable=tab(['外部负载（30 对）','SPARSE 中位数 ms','BODY 中位数 ms','SHAM 中位数 ms','SITE 中位数 ms','SITE/SPARSE 配对变化','SITE/BODY','SITE/SHAM'],[[c,*[f'{row(c,l,focus)["median_ms"]:.5f}'for l in LABELS],*[f'{row(c,"SITE",focus)[l]["percent"]:+.2f}%'for l in ['SPARSE','BODY','SHAM']]]for c in ['Acorn','MarkdownIt']])
(HERE/'README.md').write_text('\n'.join(['# 第三轮：由内置慢路径安装 charCodeAt 调用 IC','',
 '**实现已经生效，但没有形成两套基准的整体净收益。** MarkdownIt 有可重复的专项收益；Acorn 即使高覆盖也基本持平。保留为实验，不替换冻结 SPARSE。','',
 '## 本批整体结果','',summarytable,'',
 '全部数值为相对本批冻结 SPARSE 的耗时变化，负数更快。四版同批，每项各一个新进程；父版现场重跑。Octane 按 14 suite 分层等权 GM，SunSpider 按 26 项等权 GM。计时包括运行触发的 C 内建、分配与 GC，不是只测解释器分派。',
 'Octane 的最大赢家 Richards 是零覆盖项：独立计数确认没有进入 charCodeAt，也没有分配调用 IC。SHAM 在它上面同样变快。因此不能把 SITE 的 −0.56% 整体变化全算成动作 IC 收益；剔除 Richards 后仅 −0.03%。SunSpider 则整体 +1.42%。','',
 '## 外部负载：预先选定的两项补到 30 对','',extable,'',
 '表内 ms 是各版耗时中位数，百分比是逐对相除后的中位数，两者计算口径不同。Acorn N=1；MarkdownIt N=256，让每进程的计时循环约一秒。读取输入和加载包在计时外，首个解析/渲染计入。固定 npm tarball SHA 全部匹配用户给出的值。Acorn 校验 Program/end=544096/29507 节点及完整 AST JSON 的 FNV；MarkdownIt 校验 12329 个 UTF-16 code unit 与 FNV=3322973581。',
 'Acorn 的 SITE/SPARSE 中位数 +0.03%，SITE/BODY +0.11%，没有重复的净收益；MarkdownIt 为 −3.40%，SITE/BODY −1.76%，三十对均快于 SPARSE。未满足“两种外部负载都有可重复净收益”的条件，未启动 PostCSS/Bootstrap 留出负载。',
 '每对原始时间、最小/最大区间、P10/P90 和描述性的配对中位数 bootstrap 区间都保存，未用计数或 Valgrind 进程的耗时下结论。','',
 '## 四个对照分别做了什么','',
 '- SPARSE：冻结源码原样编译。',
 '- BODY：只在 charCodeAt C 函数体入口对平坦原始字符串、界内 int32 下标直接 string_get；仍建立普通 native 帧。',
 '- SHAM：由真实内置慢路径学习，8 次合格观测后发布 3 字节专用 opcode；执行同样的 callee/receiver/index 守卫，随后仍走普通调用。',
 '- SITE：与 SHAM 同一 ELF，命中后直接返回 code unit，省 native 帧及通用调用/转换路径。保留前面的属性读取和参数求值；使用栈上已取到的函数，绝不再读方法属性。',
 'SHAM 进入 builtin 后仍会执行学习入口的检查，所以 SITE/SHAM 的耗时差同时包含普通调用、原 builtin 处理和这些检查的成本；没有把这整个差值都称为纯建帧收益。实际少建的帧数由独立计数给出。','',
 '## Run 内实际覆盖','',mechtable,'',
 '“覆盖合格调用”＝真正执行动作次数 / 原版 V1 合格次数；“专用指令内命中率”＝守卫通过 / 执行专用指令。两者不是一回事。PdfJS 和 base64 的部分位点连续失配后停训，之后的普通合格调用不再安装，因此看命中率高也不能当成全部机会都覆盖。Typescript 另有 1,471,095 次仅因尾调用形式而未覆盖，保持原路径；本轮未叠加 tail-call 扩展。','',
 '## 代码、内存和验证','',
 '学习在 js_string_charCodeAt 内，不在普通 OP_call_method 添加通用检查。核对当前 native frame、直接 JS caller、realm、argv 所在的 caller 栈窗口、实际 callee/receiver、返回 PC 和解码指令边界；绑定/间接/宿主/.call 不因此被误认。只改已经由 rdi_prepare 分配的私有可写执行镜像。',
 '记录由字节码持有并标记/释放 callee 引用。指针数组可增长，单个记录地址不搬动；中断回调重入也不会留下悬空记录。8 次连续失配后恢复普通 opcode 和 argc=1，保留记录为停训状态，不重放参数求值或转换。保存字节码时恢复普通 call_method 1，原版 A 可正常/ROM 加载。',
 '正式 ELF 实测：BuiltinSite 24B，加一项 8B 指针，摊销前每点 32B；每个有观测的函数另有 16B 表头及按 4 项起步的指针容量。第一次单点观测请求 16+32+24=72B，另加该函数字节码已有的 8B 元数据；不含 allocator 头和容量余量。从未出现合格调用的函数不分配表/记录，但 JSFunctionBytecode 仍由 160→168B。JSRuntime 保持 2216B。',
 '普通方法调用 handler 的 C 代码逐字相同；实际 JS_CallInternal 从 46132→46802 字节（+670B），入口栈空间仍 0x288。完整汇编和结构大小已保存。零覆盖项的变化发生在没有安装/执行动作的情况下，属于改版的公共成本或收益，不能记成 IC 动作收益。额外诊断确认 SunSpider bitops-nsieve-bits（SITE +14.98%）和 Octane NavierStokes（+6.14%）也都是零 charCodeAt 调用、零安装，见 regression_diagnostic01/。本轮未继续调布局救成绩。',
 '方法改写、参数求值中改方法、getter 次数、代理对、越界、下标转换副作用、间接/绑定/多参/尾调用、GC 循环引用、跨 realm、保存/加载/ROM、ASan/UBSan 均通过。四版中断测试都在 9998 次迭代停止。LSan 未启用，runtime 释放断言保留。',
 '发布时直接复制实际执行缓冲区的 3 个字节：Acorn 28 个 Run 安装点、MarkdownIt 68 个，live 字节与发布字节一致，见 installation01/。这不是只看改写前编译输出。','',
 '## 为什么 Acorn 高覆盖仍没快','',
 'Callgrind 只采集 Run：约 93.8% 的指令在正则匹配器，命名读取约 0.95%。SITE 的总指令比 BODY 少约 0.20%，却没有转化成可重复的 Release 耗时收益。指令占比不等于耗时占比；没有把其它解析和分配成本归到 IC。原型属性读取未成为整体主导，因此没有追加 get_field2 原型读缓存来救成绩。',
 '[指令明细与统计口径](instructions.md)。','',
 '## 文件入口','',
 '- [四版全集逐项表](full01/results.md)、[Octane CSV](full01/octane.csv)、[SunSpider CSV](full01/sunspider.csv)。',
 '- [首批十对专项](paired01/results.md)、[两项外部三十对](focus01/results.md)、[区间](external_paired_uncertainty.json)、[原始命名计数](named_counts.json)。',
 '- [与历史 A/V8 的附加 Octane 对照](full01/octane_historical_context.md)、[SunSpider 对照](full01/sunspider_historical_context.md)：仅这些附加列为历史，主结论用本批四版。',
 '- [主解释器快路](builtin_opcode.inc)、[学习与生命周期代码（正式版本）](builtin_site_release.inc)、[构建和补丁生成](build.py)。candidate/ 内有独立补丁、完整源码包及 Release/计数/Sanitizer manifest。',
 '- [最新语义验证](validation03/gate.json)、[生命周期与序列化](c_validation01/gate.json)、[安装字节证据](installation01/gate.json)、[审计](audit.json)、[复现命令](commands.md)。',
 '首次 focus 未启动是 Python 工具名 inspect.py 遮住标准库造成的，已改为 inspect_binary.py 后续跑；未重复全集或首批十对。Callgrind 两次解析修正只重读原始文件，没有重跑已完成的采集。失败日志保留。'])+'\n')
print('REPORTS_READY')
