# 位置、字节码与执行路径

## 1. 身份与 PC：先保证不是错位归因

源码：QuickJS commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`；以下未特别说明的
QuickJS 行号指 `engines/quickjs-upstream/quickjs.c`，不是旧 binary 地址。
本次诊断 binary/patch/hash 见 `source_evidence/diagnostic_identity.json`、`build_inputs.json`；
成功编译命令在 `raw/build.attempt02.json`，GCC13.3、上游 -O2 -g，computed goto 未关闭。
冻结 QJS/d8/snapshot/ICU 的绝对路径与全 hash 见 manifest.json。

QuickJS:17762/17777 的 dispatch 都用 `opcode=*pc++`。属性 case 入口的 `pc-1` 才是
真实 opcode 起点：`get_field/get_field2/put_field` 随后读取 4B atom 并使 pc 再前进4。
`sf->cur_pc` 只在某些 helper、调用和异常前赋值（例如19149/19206），可能是旧值或操作数之后。
**本轮不使用 sf->cur_pc 做 site 归因**。

在最终编译结束后（原36263附近）只复制 metadata，不改变字节码：定义行/列、函数源码、
最终 code hex、opcode 宽度、atom文本和 source position。函数键为定义行/列、源码文本、
最终 code SHA256 的组合；同时保留输入文件/hash。用该键+offset跨进程核对，不按匿名名字
或 native 指针合并。进程内 b 指针仅查表取得数字 ID；匿名函数用原始定义行映射名称。
`mapping/functions.csv/sites.csv` 和每次 `raw/*.functions.csv/sites.csv` 可复查。
没有只凭名字猜测同一函数。driver 的 N 改变会改变其身份，不能强合并；本轮1229个查找
样本均落在原 Richards 可核对的函数中。

`summary/offset_audit.json` 校验 **189/189** 活跃 site：完整最终 dump 解码到该 offset，
opcode 名与属性 operand 一致，非操作数字节。`bytecode/original.frozen.c` 与
`original.diagnostic.c` 完全相同（49effd61…）；说明诊断工具未改该原输入的序列化执行表示。
这不证明诊断 native 代码/性能与 release 相同。

## 2. 上下文、完整来源与计数

`probes/site_hooks.h`：属性 scope 在 `get_field/get_field2/get_length/put_field` 入口建立，
GCC cleanup 在普通离开、跳出、异常 goto 时恢复。JS_CallInternal 从入口起暂时清除外层
site，结束再恢复；因此 getter 内的 JS 属性读取属于自己的函数，不继承外层 getter 的 site。
`probes/context_safety.js` 专测 getter重入和抛异常：外层 first/second 各1次操作、2次探查，
内层 inner 和后继 ok 各1次操作、1次探查，无错误沿用旧 site，见 summary/context_safety.json。
这不是对所有 exotic/generator 的通用证明；Richards 不使用这些机制。

`find_own_property` 原函数后定义 wrapper/macro，使之后的所有原生调用者都计数并保留
诊断源码调用行。不是只统计读 opcode。原 `find_own_property1` 是另一个函数，不混计；
它的 PC 若被采到保留在其他 native 分类中。实际调用来源库存为 mapping/find_own_source_inventory.csv。

N1 的所有 find_own_property 来源（次数，计数仅在 runRichards C entry/exit 内开启）：

|诊断源码行|来源|内部探查|有 site|命中|
|---:|---|---:|---:|---:|
|19189|get_field inline|156220|156220|156220|
|19193|get_field2 inline|86116|86116|45651|
|19218|put_field 首次 own 探查|50687|50687|50589|
|9720|JS_SetPropertyInternal 首次查找|107|98|9|
|9853|JS_SetPropertyInternal 原型链查找|196|196|0|
|8281|JS_GetPropertyInternal|30|0|30|
|合计||293356|293317|252499|

39次没有 site：30次 getter helper 来源、9次 setter helper 来源；**具体 JS opcode/属性 UNKNOWN**，
不硬分给最近的读 opcode。这些 helper 名字指入口，不表示用户定义 getter/setter 被调用。
未覆盖的其他 opcode/runtime来源保留该未知分类。

N1/N2 所有活跃 site 的 operation、probe、hit/miss、深度、fallback计数准确倍增。
读 get_field 156220 次全 own；get_field2 45651 次，其中 own5186、深度1命中40465，
故产生86116次内部自身探查；put_field50687次，50589次直接可写数据路径，98次fallback，
总计50981次探查。不要把一次 JS 操作、一次 own 探查、一次 hash-chain atom比较当同一件事。
**单个 own 探查内的 atom 比较次数未测量（UNKNOWN）**。

## 3. 采样方法、扰动和分母

handler 只读取一个完整的 `volatile sig_atomic_t` site ID；-1是准备中的无效状态，0是无跟踪
属性上下文。每条记录仅有原生 RIP、CLOCK_MONOTONIC 时间和这个 ID，写预分配数组；
不分配、不解析名字、不调用 VM API、不打印、不等待被中断线程。clock_gettime 为本平台
async-signal-safe API，errno保存/恢复。handler 不解引用任何可能变化的 VM/metadata 指针。
全部样本0丢弃（capacity未满），不是过滤掉不喜欢的样本。

`source_evidence/sa_begin.disassembly.txt` 显示15f58发布 ID 后返回；本次
`context_boundaries.disassembly.txt` 显示 get_field 的26c6f调用 sa_begin，26cb0开始 shape
读取，26d78恢复上下文，26d96才下一次 dispatch；另保存 get_field2/put_field 的边界。
因此不是凭 volatile 名字推断发布顺序。每个进程用自己的 maps、新 ELF PT_LOAD、
addr2line 内联栈解析；不把旧诊断 binary 的行号/PC 套过来。

“查找区域”保守定义为 DWARF 最内层函数为 find_own_property 的 native PC。
必要机器码核查显示 shape/hash/atom 比较指令；inline调度、内联子函数及优化行号有边界，
不把整个宏或一条 addr2line 输出视为精确 self-time。其他上下文样本含 refcount、helper、
值复制和诊断开销，不全部算查找。

|上下文开启独立进程|有效内部样本|查找区域且映射|有上下文但其他PC|准备中无效|无属性上下文|
|---|---:|---:|---:|---:|---:|
|rep1|1823|336|423|118|946|
|rep2|1782|414|336|92|940|
|rep3|1788|479|312|106|891|
|合计|5393|1229|1071|316|2777|

查找区域无 site 样本是0；不能因此认为39次未映射探查没耗时。316个准备样本仍保留为无效
上下文，不分配给site；2777个不处于属性上下文，不表示原生PC都无法解析。

请求1ms实际median约10ms；20ms独立变体实际约20ms，890个内部样本、212个查找区域样本，
同样全部映射。每次完整PC、spacing、native分布和stderr都保留，不只给合并结果。

上下文关闭采样各次查找区域499/1819、448/1781、456/1666；开启为336/1823、414/1782、
479/1788，分布会变化。无信号N512的三次时长：冻结1707/1718/1784ms，关闭2142/2082/2073ms，
开启2223/2297/2137ms。开启/关闭median点估计1.068，开启/冻结1.294。
这些不同批次不是正式随机化性能实验，不能当精确插桩成本；已经足以说明不能宣称无扰动。
相同时长也不会证明无分布扰动。频率近似的两个 state site 被采85/9次，特别提醒周期性
混叠/执行阶段等风险；不据此说第一条 state 读取的单次成本是第二条的9倍。

## 4. 主要位置表

每Run频率来自无采样计数；样本来自三个上下文开启进程。百分比分母分别是**全部内部5393**、
**已映射查找区域1229**。这里不是“Top精确耗时指令”。完整表见 summary/site_samples.csv。

|原函数（省略prototype）|QJS offset|原richards.js行/属性|操作|操作/Run|查找区域样本|占5393|占1229|
|---|---:|---|---|---:|---:|---:|---:|
|TCB.isHeldOrSuspended|3|310/state（首次）|get_field|10671|85|1.58%|6.92%|
|Scheduler.schedule|25|191/currentTcb|get_field|10671|54|1.00%|4.39%|
|Scheduler.schedule|30|191/isHeldOrSuspended|get_field2|10671|54|1.00%|4.39%|
|Scheduler.schedule|15|190/currentTcb|get_field|10672|53|0.98%|4.31%|
|TCB.run|3|326/state|get_field|6573|52|0.96%|4.23%|
|Scheduler.schedule|83|195/run|get_field2|6573|43|0.80%|3.50%|
|TCB.run|73|337/run|get_field2|6573|36|0.67%|2.93%|
|Scheduler.schedule|66|194/id|get_field|6573|32|0.59%|2.60%|
|Scheduler.schedule|91|195/currentTcb|put_field|6573|29|0.54%|2.36%|
|Scheduler.schedule|61|194/currentTcb|get_field|6573|28|0.52%|2.28%|
|TCB.isHeldOrSuspended|19|310/state（第二次）|get_field|10115|9|0.17%|0.73%|

按函数的查找区域采样：Scheduler.schedule382、TCB.run150、HandlerTask.run140、
Scheduler.queue118、TCB.isHeldOrSuspended94。不是这些函数的总时间百分比。
按属性：currentTcb280、state204、run79；按op：get_field799、get_field2 277、put_field153。
两级run确实各6573次且深度1、共26292次自身探查，但相关样本仅79/1229，不能预设它们占主要查找开销。
`samples_by_*` CSV的操作/探查参考列只加总有上下文样本的site；全量频率请读
`site_frequencies.csv`，不要把采样覆盖子集的频率当作属性的全程序总数。

## 5. 选定位置：原 this.state，不改 Richards

选择理由：第一次 state 读取在三次分别27/25/33样本，均靠前；20ms变体12样本，也出现。
函数短、receiver来源和短路语义清楚，适合逐步对照；并非据小样本宣布绝对最大开销点。

原程序 `benchmarks/octane/upstream/richards.js:309–311`：

```js
TaskControlBlock.prototype.isHeldOrSuspended = function () {
  return (this.state & STATE_HELD) != 0 || (this.state == STATE_SUSPENDED);
};
```

调用者 schedule:191 通过 `this.currentTcb.isHeldOrSuspended()` 进入，this为当前TCB，
不是Scheduler。TCB构造器建立 own state，源码的状态常量/更新是整数位标志；
本次native诊断观察两个site的返回数据tag均为INT：10671/10115，无prototype命中、无fallback。
源码设计的状态范围0..7；本轮没有逐值直方图，不能冒充实际值序列。

### 实际 QJS 最终函数：16条、29B

完整原始文本：bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.txt；
完整真实offset：同名 .decoded.json。下面只补offset注释，不改变内容：

```text
 0 push_this
 1 put_loc0 this
 2 get_loc0 this
 3 get_field state
 8 get_var STATE_HELD
11 and
12 push_0
13 neq
14 dup
15 if_true8 28
17 drop
18 get_loc0 this
19 get_field state
24 get_var STATE_SUSPENDED
27 eq
28 return
```

首次 site 的实际路径是：object tag检查→own shape/hash探查→找到普通data descriptor→
JS_DupValue整数→释放栈中receiver引用→用整数替换receiver。没有遍历原型/通用fallback。
依据：ops/probes/own各10671，prototype/fallback均0，tags `0:10671;`。
原源码6135–6160说明hash桶与链比较；19107–19160说明描述符检查、复制/替换；
quickjs.h:687/707说明带refcount tag值的释放/复制。整数state本身不做对象refcount，
但 get_loc0 的receiver复制和 get_field 替换时的receiver释放仍存在。没有单独测其次数/时间。

### 实际 V8 最终函数：14条、31B

完整同进程文本：bytecode/v8/TaskControlBlock.isHeldOrSuspended.txt。

```text
 0 GetNamedProperty <this>, state, FBV[0]
 4 Star0
 5 LdaGlobal STATE_HELD, FBV[2]
 8 BitwiseAnd r0
11 Star0
12 LdaZero
13 TestEqual r0
16 LogicalNot
17 JumpIfTrue 30
19 GetNamedProperty <this>, state, FBV[4]
23 Star0
24 LdaGlobal STATE_SUSPENDED, FBV[6]
27 TestEqual r0
30 Return
```

同进程IC日志（raw/v8_selected_site_full.log）：`0x1eef01001650` 对应offset0，
`0x1eef01001663` 对应offset19，两处均为原310行（拼接后702行），各一条 `LoadIC ... 0,1 ... state`，
receiver_map均 `0x189b01023ef1`。详见 mapping/v8_selected_IC_transitions.csv。
N1/N32其他独立诊断也保存同位置转换，各进程地址不互相混用。没有用日志事件数当属性访问次数。

**实际观测**：反馈槽、确切site的转换码0→1与map、同制品handler机器码。
**实现解释**：source_evidence/v8_GetNamedProperty.actual.disassembly.txt 中1d63172加载
反馈槽，1d6317f比较map、1d63181分支，之后存在字段load（例如1d6324d）和通用分支。
它解释“该handler具备这些机制”，不是证明本site正式执行哪一支。
**未知/假设**：命中/回退次数、handler内部实际路径、每次探查的节省量和总性能贡献UNKNOWN。
此制品DebugPrint没有详细反馈向量；精确源码/编译配置仍无制品对应证明，未用近似源码替代。

相同源码操作按组对应：QJS取得this局部/入栈/get_field，V8直接读<this>/GetNamedProperty；
之后两边都读取常量、按位与、比较、短路，必要时再读一次state。V8少两条而编码更长；
不能把编码长度、逻辑指令数、native dispatch数与单条成本混成结论。

## 6. 与 run 候选的关系与未做的事

run查找原假设没有被当作结论。频率/深度证据继续成立，但本轮更直接指向普通状态/调度字段。
原TCB.run的结尾仍是tail_call_method，不把小程序call_method后累加的时间套到它上面。
这里没有测frame复用、没有属性单次计时、没有新增小程序或正式性能矩阵、没有VM优化。
当前范围缩小到真实 own state 读取及调度器 currentTcb 一组位置；还没找到Richards总体差距的主要原因。
