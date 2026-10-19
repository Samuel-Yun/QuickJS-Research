# 马云霄周报讲稿

资料仍截至2026-10-17，证据参考myx / 5d349e82；本次修订在2026-10-18核对当前myx / 5db371f7b2dd9d18361d7e68a48e80e8972afc51，开始时工作区干净。
原main.tex与原Overleaf ZIP不变，原讲稿另存notes_original.md；本讲稿对应main_fixed.tex。
组会日期未提供，不将数据截止日当作组会日期。2026-10-19仅补充已有字节码展示，正文7页，另有2页完整指令附录；原有8页内容不变。新增页完整材料见call_bytecode_notes.md。

## 第1页：先讲明白一轮求和

同一函数计算0到4095的和，QuickJS的add_loc更新局部sum并弹出栈顶，inc_loc更新i；Ignition经过累加器运算和虚拟槽写回，Mov复制的是旧sum，Star0才写新sum。
每完整调用的中位耗时是43.782/54.839微秒，V8/QJS=1.253，表示本例V8用时更长；不是一条加法的成本。
计时在进程内部，首次调用在内、没有workload预跑，启动/静态前端在外，driver和实际GC/helper等仍在内。
这些指令组提供可检查的执行差异，但不能据此证明栈式更优或较短字节码造成时间优势。

## 第2页：方法成为own属性后，差距仍存在

这里四组累加i+3，不是上一页的单纯sum+=i；每个时间都含4096轮内循环，每组每引擎30个新进程。
own与prototype两组复用相同caller/callee、参数传递与this绑定形式；区别主要是计时外对象建立方式、step所在位置及相关shape/反馈，V8/QJS点估计均约0.557，因此多一层原型不足以解释这组差距。
普通函数与方法调用之间才另外涉及显式obj参数与receiver传递差异；不把这些因素笼统说成每两组都变，也不把组间时间相减叫纯查找或纯调用成本。

## 第3页：四组调用方式的关键字节码

caller是循环函数，callee是实际被调用的stepPlain/stepMethod；页面四行都是caller内部连续片段，完整序列和省略范围见[call_bytecode_notes.md](call_bytecode_notes.md)。
get_field2读取方法时保留obj，供call_method作为this；普通函数则把obj作为显式参数传入。own/prototype字节码相同，但已有QJS独立计数确认step分别在自身/一层原型命中4096次，这不是V8命中率证据。
方法准备、this初始化和字段访问值得继续核查，尚无独立步骤耗时；不按指令条数解释整组差距。一分钟可直接念的讲稿及完整callee/caller均在独立讲稿中，不增加PDF附录页。

## 第4页：不要把run调用频繁当作查找耗时主因

Richards模拟任务调度：Scheduler持有currentTcb，TCB持有task；取得对象、查找run、执行run是不同工作。
三次插桩诊断共有5393个内部样本，其中1229个查找区域样本已映射；currentTcb/state/run的280/204/79都以1229为分母，按属性合并多个读写site，不是全程序耗时比例。
普通状态字段值得继续看，但没有证明总体瓶颈；189个活跃位置和N1/N2核对只是定位方法的可信性说明，不当作研究发现本身。

## 第5页：顺着state的读取、比较和短路看

schedule内this是Scheduler，进入isHeldOrSuspended后this是当前TCB；两边都先读state，与STATE_HELD做按位与并比较，左侧为真时不再读第二次state。
修订页恢复了push_0、dup、drop：记t=state & STATE_HELD，b=(t!=0)，栈底到顶在push_0后为[t,0]，neq后[b]，dup后[b,b]；if_true8弹出顶上一份，真则跳28把余下b返回，假则经drop清掉左值，再计算右侧。
QJS展示offset2至19、V8展示offset0至19，各自区间内无缺指令；QJS0–1/24–28与V8 23–30明确省略、完整见附录，V8补齐了保存t的Star0和LdaZero，TestEqual加LogicalNot得到b，r0是虚拟槽而非CPU寄存器（offset也不是native PC）。

QJS的dup/drop实现见quickjs.c:18023–18040，if_true8见18881–18901；这里只解释该真实字节码的栈效果，没有新增执行次数或耗时实验。

## 第6页：把实际观测和解释分开

QuickJS首次state读取每Run10671次，全为own普通数据属性命中、整数结果、无fallback；正文8行是upstream2026-06-04、commit04be246001599f5995fa2f2d8c91a0f198d3f34c的quickjs.c:19126–19133，仅规范缩进/宏续行符前对齐空白，真实token与宏续行符均保留，并明确没有展示对象检查、未命中/原型/慢路径与最终写回。
find_own_property在quickjs.c:6135起用shape/hash/atom探查；命中后先查JS_PROP_TMASK再JS_DupValue取值，get_field使用keep=0，后续19157–19158执行JS_FreeValue(ctx, sp[-1])及sp[-1]=val，处理的是旧receiver，整数state本身不做对象引用计数（quickjs.h:687、707附近）。
V8两个读取点使用FBV[0]/FBV[4]，同进程offset0/19、原PC 0x1eef01001650/0x1eef01001663均有状态码0→1、同一receiver map 0x189b01023ef1；完整地址只在讲稿/原日志，不是逐次命中记录，实际IC命中率UNKNOWN。
“QJS重复自身查找、V8可能复用字段反馈”仍是待验证解释，handler具备分支不证明该site每次命中，精确V8源码/构建与制品对应仍有缺口，尚未把任何步骤量为性能主因。

## 第7页：带着限制讨论下一步

本周能说的是快慢随操作而变，方法案例不能只归因于原型层数，原程序普通字段提供了更具体的研究位置。
无信号N512小对照的冻结版/诊断开启版median是1718.276/2223.234ms，相比高29.39%，但不同批次的点估计不等于精确插桩成本。
首次和第二次state读取频率10671/10115很接近，查找区域样本却为85/9，且1ms请求实际约10ms，说明不能把这张表直接当精确成本排名。
想讨论的是先验证V8此site实际走哪条快路径，还是先降低扰动复核分布，不把讨论问题写成必须审批的下一阶段门禁。

## 附录A：QuickJS完整最终指令

该匿名原函数在QuickJS中是16条、29B，附录按真实解码补全offset，并保留全部opcode和operand，不含路径、源码注释和debug表。
它来自独立打印诊断构建；同一输入的序列化表示与冻结构建相同，不代表诊断native代码或性能与冻结版本相同。

## 附录B：Ignition完整最终指令

同函数在本d8制品中是14条、31B，附录保留全部指令及操作数，仅去掉左侧地址、编码列和调试信息。
跳转括号中的地址来自实际同进程dump，不能拿它与另一进程ASLR地址比较；原始LoadIC地址...1650/...1663分别对上offset0/19。
这里条数更少、字节更多，恰好提醒不要把两种静态指标或native分发次数混成执行成本。

## 资料索引（仅供讲稿查阅，不在幻灯片页脚显示）

路径均相对js-interpreter-bench；按最新要求，幻灯片底部页脚全部取消，来源、环境、运行参数、计时说明和页码均不显示。
本轮首页和其他旧frame均按实际源码保留，环境完整记录在讲稿：WSL2 Ubuntu24.04.2/x86_64，QuickJS2026-06-04，V8 15.6.21（d8，Ignition），V8参数--max-opt=0 --no-lazy；正式计时含首次调用、无计时前workload预跑，S3独立诊断不作正式性能结果。

- S1 = experiments/bytecode_whitebox_simple/attempt01/。
- S2 = experiments/call_path_followup/attempt01/。
- S3 = experiments/richards_site_attribution/attempt01/。

| 页 | 主要来源 |
|---|---|
| 1 | S1/cases/numeric_loop.js；S1/bytecode/{quickjs,v8}/wbNumericLoop.txt；S1/summary.csv；S1/raw/timing.csv及其raw/formal记录 |
| 2 | S2/cases/{inline,direct_call,own_method,prototype_method}.js；S2/summary.csv；S2/raw/timing.csv及原始JSON；S2/source_evidence/shared_method_core.json、method_bytecode_equal.json |
| 3 | S2/bytecode/下四组caller/callee；S2/raw/diagnostics/{own_method,prototype_method}_paths.json；完整索引与讲稿见call_bytecode_notes.md |
| 4 | benchmarks/octane/upstream/richards.js:195、337；S3/summary/site_samples.csv、sampling_summary.json、count_audit.json；S3/mapping/find_own_origins.csv |
| 5 | 原richards.js:309–311；S3/bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.{txt,decoded.json}；S3/bytecode/v8/TaskControlBlock.isHeldOrSuspended.{txt,decoded.json} |
| 6 | engines/quickjs-upstream/quickjs.c:19126–19133、19157–19158；S1/source_evidence/quickjs_source_identity.json；S3/raw/counts_N1.sites.csv；S3/mapping/v8_selected_IC_transitions.csv；S3/raw/v8_selected_site_full.log |
| 7 | S3/raw/control_frozen_nosignal_rep{1,2,3}.json；S3/raw/control_nosignal_ctx1_rep{1,2,3}.json；S3/summary/perturbation.json；S3/summary/site_samples.csv；S3/raw/counts_N1.sites.csv |
| 附录 | 第5页的完整目标函数dump及S3/summary/selected_bytecode_checks.json |

## 使用边界

性能表只来自各自正式样本，诊断时长/样本比例不混入，不与旧Windows数据相除。
不新增总体GM、显著性、纯解释器self-time或Richards总体性能原因结论；不引用暂停的方法外提A/B作为本周成果。
2026-10-19再次检查Windows PATH及现有Ubuntu WSL，均未找到XeLaTeX/latexmk/tectonic/kpsewhich；未在本地编译，未生成本轮PDF，实际9页输出、缺字、换行及Overfull日志均未验证，离线源码检查不等同编译通过。
原稿中i<n、<this>、正文的单反斜杠转义百分号及双反斜杠表格行末本来正确，未发现Markdown星号、NBSP或代码隔行空白；本轮未做全局反斜杠清理。code宏基于detokenize，参数内直接写下划线；正文下划线继续按TeX规则转义，listing保留原代码。
