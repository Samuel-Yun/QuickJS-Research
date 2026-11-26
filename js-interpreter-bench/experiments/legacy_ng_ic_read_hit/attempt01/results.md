# 读 IC wrapper 内联：A/C/D 同批次结果

## 做了什么，是否完成

在同一WSL2 Ubuntu24.04.2/x86_64主机上，分别干净构建A（冻结upstream）、
C（上一轮空槽修复）和D（read_ic_wrapper_inline）。底座精确为QuickJS
2026-06-04 / 04be246001599f5995fa2f2d8c91a0f198d3f34c，NG来源仍为
e1b5978775f75f9637c624fc45e69b92d2c15f42。GCC13.3.0、官方Makefile
-O2/-g/-fwrapv相同，没有NDEBUG、LTO/PGO或诊断插桩。没有把旧时间和本轮D相除。
实际路径/完整SHA256/链接依赖见manifest.json、sources/identities.json和raw/build。

**正式1890/1890有效**：16个Octane Run单元1440条，5个微基准450条；各项每版30新进程。
六种排列各5次，每版在三个位置各10次；pilot与正式分开。无失败重试、异常值删除或偏短筛除。
全部正式样本≥1秒，但仍保留了偏长样本（例如M5），不是删异常值后的结果。
另完成42次所选工作量C/D诊断、10次N=2机制诊断和144次独立GNU time RSS检查。
参见analysis/completion.json、formal_audit.json、independent_audit.json。

计时仍是内部单调时钟：静态加载/编译、必需Setup在外，第一次Run在N次Run之内，
无额外性能预跑。重复会自然变热；GC/helper/builtin/RegExp、动态编译及原断言按原口径计入。
微基准的外层驱动与checksum累加也在内，不称单条指令self-time。

## 1. 源码只改什么，机器码改变什么

C→D完整补丁只有一行：`JS_GetPropertyInternalWithIC`声明增加既有`force_inline`宏。
容量4、probe/index/填槽、函数+atom共享、eager创建、只读与OOM安全适配、写IC及GC都不变。
C/D源码全文除这个声明外完全相同；不是新IC算法。

C的两个读opcode分别调用一个156字节wrapper；D两处不再调用wrapper，
而在JS_CallInternal内执行对象tag检查、调用共享probe、MISS判断、offset取值和JS_DupValue。
共享probe仍是call，96字节机器码逐字节相同。cur_pc保存、异常处理、assert及receiver处理仍在：
get_field释放旧receiver并替换栈顶，get_field2保留receiver并压入取得的方法。
真实地址、慢路径和逐组说明见machinecode/notes.md及各版局部.asm。

编译器并非只删除call/ret：JS_CallInternal增237字节，写opcode保存中间值的栈槽和跳转距离也变化。
所以本轮识别的是“一处内联要求及其编译结果”的整体干预，不是测出了纯wrapper调用成本。

## 2. 稳定命中微基准和Richards

单位为**ms/完整目标调用**；每个微基准调用含4096轮。C/D>1表示D快。
区间为固定seed、10000次同组三元组配对bootstrap的探索性95%区间，未经多重检验校正。
方向按完整精度判定，不按表中舍入值；不能把区间跨1写成已证明相等。

| 项目 | N | A | C | D | C/D [95%CI] | D相对C耗时 |
|---|---:|---:|---:|---:|---|---:|
| M1 own整数读 | 32768 | 0.059675 | 0.071120 | 0.072495 | 0.981034 [0.969522,0.992611] | +1.93% |
| M2 own引用值读 | 16384 | 0.078557 | 0.093698 | 0.084396 | 1.110220 [1.096285,1.124157] | −9.93% |
| M3 own方法 | 8192 | 0.229458 | 0.230448 | 0.228073 | 1.010412 [0.938811,1.027638] | −1.03%，不明确 |
| M4 数值控制 | 32768 | 0.037225 | 0.038818 | 0.038389 | 1.011178 [0.993048,1.036828] | −1.11%，不明确 |
| M5 写控制 | 32768 | 0.042157 | 0.054050 | 0.055060 | 0.981665 [0.967281,1.004748] | +1.87%，不明确 |
| Richards原Run | 512 | 3.433334 | 4.074234 | 3.865962 | 1.053873 [1.032548,1.073170] | −5.11% |

独立诊断确认M1、M2目标单位分别134217727、67108863次已重写查询全命中，probe/query=1；
M3的step与bias各33554431次全命中。M4目标函数没有字段单位，M5目标单位仅134217727次写，
没有读查询。首次普通opcode不在这些query分母内。N=2机制检查与正式N的诊断一致。
源码、真实最终bytecode、目标单位表见cases/、bytecode/*.target_only.txt和analysis/micro_target_units.csv。

因此**稳定命中不保证内联受益**。M2和Richards改善，但M1反向，M3没有明确收益。
M1做整数累加，M2做引用比较，消费者逻辑不同，不能把二者差值直接解释为引用计数成本。
同理，不能用M1减M4得到纯读取成本。

## 3. Octane逐项与聚合

16项C/D探索区间支持右侧更快6项：Richards、RayTrace、Boyer、Splay、Gameboy、TypeScript；
更慢4项：RegExp、PdfJS、CodeLoadClosure、CodeLoadJQuery；其余6项方向不明确。
其中RayTrace和Splay的区间下界仅为1.000180、1.000487，接近边界，不宜作强结论。
全部逐项绝对时间、A/C和A/D、变化率CI、N、有效数见analysis/tables.md和summary.csv；
mean/样本std/Q1/Q3/IQR/min/max见statistics.csv。

值得保留的反例：RegExp从183.011916增至210.374353ms（+14.95%，C/D区间[0.861731,0.882180]）；
PdfJS +1.76%，CodeLoadClosure +4.63%，JQuery +2.81%。不能因研究目标是稳定读命中而忽略它们。
RayTrace本轮D比C减少1.78%，不等于已经解释上一轮填槽修复造成的退化。

主集合预先排除Crypto：14个Run单元/12个suite；先suite内子项GM，再suite等权。
GM区间预先选定为10000次完整rep轮次分块重采样，各case共享轮次索引。

| 比较 | 主集合GM [95%CI] |
|---|---|
| A/C | 0.929586 [0.925469,0.933014] |
| **C/D** | **1.002397 [0.996519,1.005729]，整体方向不明确** |
| A/D | 0.931814 [0.925756,0.935510] |

含受限Crypto的敏感性C/D=1.001762 [0.996207,1.004924]，也跨1。
这些是自定义固定工作量统计，不是官方Octane分数。Box2D/zlib/latency边界没有扩展。
端到端ms/process另表，未用中位数相减推导精确初始化成本。

相对同批A，D仍有净成本：M1 +21.48%、M2 +7.43%、Richards +12.60%；
Richards A/D=0.888093 [0.871166,0.898337]。M3相对A方向不明确。
Octane中仅Mandreel的A/D区间在1上方，Earley与NavierStokes跨1，其余13项在1下方。

## 4. 计数、代码大小和内存代价

除Crypto两项外，其余19项C/D的汇总计数完全一致，包括读写queries/hits/fallback、probe、
更新/插入/替换、创建数量和直接请求/峰值存活字节。Crypto差异保留，加载期padding尚未逐对固定，
不能把该差异简单归因于内联或强行修改计数。每份诊断均校验queries=hits+fallback、slots≤4、
释放后直接IC存活字节=0；范围是整进程，不把过程ID当跨进程同一cache。

Richards C/D都是82640297读查询、25901529写查询，全accepted hit、总probe108541826。
收益没有伴随miss下降，但这不能证明全部5.11%来自调用边界。
RegExp整进程只有14次已重写读查询，却有678999次写查询；C/D全部这些计数相同，时间仍增加14.95%。
原始units_detail中，678999次写均在Exec/lastIndex；14次读由RegExpRun/run与匿名driver/run各7次组成。
这里是函数+atom单位的整进程频率，不是Exec的耗时占比或逐site计时。
它提示读wrapper改动的派生影响必须解释，不能只讲稳定读命中的局部收益。
CodeLoadClosure仍创建120884个IC、454816个atom单位，已重写查询仅2047；eager成本没有被消除。

真正ELF.text段：C 763586→D 763666字节（+80）；GNU size的text汇总字段则为
1038363→1038323（−40，统计范围不同）。不能将后者称纯指令代码缩小。
qjs文件5127368→5126912字节含debug段，不能代表RSS。

独立GNU time每项每版3进程、KiB、原始分布全部保留。例如Richards：
C 3480 [3464,3548]、D 3452 [3448,3520]；PdfJS：C 28796 [28736,28808]、D 28916 [28792,28944]；
CodeLoadClosure：A 61696、C 89804、D 89704（范围见memory_comparison.csv）。
这些小样本没有显示一致的C→D内存方向，不能证明两者内存相等。
所有21项直接IC请求/峰值存活字节C/D相同；间接shape保活、allocator及完整对象图字节数仍UNKNOWN。
未获得可信PMU计数：当前没有perf executable，不用诊断耗时替代硬件cycles/instructions。

## 5. 现在能解释到哪里，还缺什么

实际观测支持：读wrapper调用边界确实消失；缓存策略计数基本不变；部分工作负载获益，另有明确反例。
源码/静态机器码解释了保留下来的检查、probe、JSValue处理及receiver逻辑，
尚未量出call、spill、分支预测、布局或各helper的独立时间。
控制项的区间跨1不证明派生影响为零，也不能将RegExp退化自动归于某个helper。

独立审计记录了一个元数据限制：82处“UTC开始+单调时长”与下一条UTC开始不相容，
最大873.542ms，原因UNKNOWN。不能混用CLOCK_REALTIME与MONOTONIC推算进程结束。
1440个Octane已记录的绝对单调区间均不重叠；微基准仅有elapsed，缺绝对起止端点。
冻结runner的阻塞subprocess.run及schedule支持串行执行。内部计时未改为UTC，未据此删除或重跑样本。
初版审计失败与修正依据均保留；独立状态为PASS_WITH_CLOCK_METADATA_LIMITATION。

公开raw已在Windows Python3.11.4无Linux binary条件下重算；22份输出21份逐字节一致，
aggregate.json仅浮点末位差异且数值在1e-12容差内匹配，原Linux输出未改。
上一轮1440条及更早960条只读重算到新目录，LF规范化文本匹配；旧raw/hash未改。
平台是单一WSL2，功耗/频率、背景负载未完全控制；区间只是探索性结果。

**下一轮只选一个问题：RegExp读IC查询极少，为什么D仍退化约15%？**
先定位未改原算法中Exec/正则本体的实际执行区域，核对写路径/其它热opcode的寄存器与布局派生变化，
区分读wrapper本身与编译结果的全局影响。此处尚无耗时归因，不预先把它写成布局原因，
也不自动追加命中路径、逐site、自适应或延迟创建优化。
