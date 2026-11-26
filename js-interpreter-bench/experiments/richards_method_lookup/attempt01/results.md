# Richards 方法查找准备：实际结果

状态：COMPLETED_WITH_PARTIAL_REFERENCE_PROVENANCE。正式与诊断审计 PASS；NG 本地完整源码制品/40-digit 解析未取得，不伪造。

Cohort `wsl2-ubuntu2404-x64-20261004`，LAPTOP-QPKCPDCB，Ubuntu24.04.2/WSL2/5.15.167.4-microsoft-standard-WSL2/x86_64。
指标 `FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_DERIVED_METHOD_LOOKUP_V1`；每组N=512，正式 **180/180**，N1/N2 **12/12**，selected-N **6/6**；pilot60记录。

## 事实—调用点与实际路径

选中 `Scheduler.schedule -> currentTcb.run()`，不是所有同名 run，也不是
own state 读取。`source_evidence/sites.csv` 列出原定义：TCB 与四类 task
方法在各自 prototype；currentTcb/task/state/queue 是 own 数据属性。
TCB.run 完整保留出队、state 更新及 task.run；Scheduler、Packet、全部 task
方法和调度输入都未缩减。原型方法在脚本初始化后不被替换。

计数的接收者归属是 atom + 接收者直接原型 identity；函数计数按目标函数
identity。task.run 独立分类，不能与 TCB.run 混合。诊断 begin/end 在 Run
循环外包围计时区，Setup/输出/后置校验不计数。链步数为 prototype 跳数，
不是 find_own_property 的总测试次数：一跳意味着接收者+其原型两次测试。

固定源码 quickjs.c:19107–19170 的 GET_FIELD_INLINE 首先 find_own_property，
再沿 shape->proto；此普通数据命中路径不调用 JS_GetPropertyInternal。
8210ff 是 fallback helper，选定输入中零次；不能由 helper 热度猜总 lookup。
原调用 get_field2 run -> call_method0 -> JS_CallInternal (18220ff/17746ff)。
A/B 为 get_field2 call -> call_method1 -> native js_function_call
(41240ff) -> JS_Call -> JS_CallInternal。A/B 计数证实相同 helper 频率。

`diagnostics/counter_summary.csv` 每条件3个独立进程；各 task.run 又有
3,365,376 次一跳 lookup，B 没有移除它们。own hit/fallback/hops 仅代表
所分类的属性，绝不概括整个 VM。`diagnostics/overhead_summary.csv` 的
3对原输入过程分别观察到诊断/冻结 elapsed 比1.168744、1.142401、1.043902；
噪声/布局/构建差异仍存在，不是每次计数的精确成本，也不进入正式表。

27个 sequence 探针 = original/A/B × 三引擎 ×3进程，N512；保持原
queueCount2322/holdCount928 断言，3,365,376次调用，接收者 ID 分布一致，
输入/返回/前后 state 摘要都是4133815237。摘要有碰撞可能，不称形式化证明。
实际 code/return/this 不变的源代码审查与原断言共同支持语义一致。

复用旧 profiles，哈希与关联见 `source_evidence/reused_evidence.json`：V8
三份 whole-process top-PC 能看到属性/调用路径，但不能定位到这一个 site
的精确 self-time。JSC 旧 #EaXyiF/#Bkagj7/#DDXQoZ 分别关联 schedule、
TCB.run、predicate，见原 bytecode/函数样本表。没有新的 profiler 正式样本。

## 事实—A/B 改变与保留

`microbench/A.schedule.js` 与 B 是可读片段；完整衍生输入在 *.source.js。
只改变 schedule 的选定调用，原 Run/setup/teardown/断言及所有方法体保留。
两边相同 `.call`，builtin 在 timer 外固定为目标函数的 own 非可写属性；
该函数布局变化也属于派生设计，不能忽略。B 缓存发生每次 schedule 开头，
共N次且在 timer 内。没有提前调用 workload。不是任意 JS 合法的缓存：
有 own override/getter/Proxy、方法或原型修改时语义可能不同。

特别限定：A 的 `this.currentTcb.run` 还包含循环内一次额外的 own
currentTcb 读取和方法局部赋值；B 连同 inherited run lookup 一起把它们
移出内层循环。调用操作保持一致，但这不是“只去掉一次 prototype lookup”
的纯成本实验。不能把全部改善归给 prototype traversal。

真实 bytecode 见 `source_evidence/{A,B}.*.schedule_bytecode.txt`。V8 两边
94-byte/5-register schedule，同一 CallProperty1，run load 位于循环内/外。
QuickJS 同一 call_method1/native .call 链，属性计数一致。JSC 两边 op_call
且都有 jneq_ptr 的 Function.prototype.call identity guard、直接调用分支
和 .call fallback：不能假定 JSC 真的每次走 native .call helper。相同
JS call 方式并不使三 VM 的内部实现完全相同；正式 flags 保持 LLInt。

## 假设—证据—判断

事前 H1 要求 QuickJS 的 B/A 小于 V8，且 V8/QJS 向1移动；H0/替代解释
和否定条件已经冻结在 protocol/design 中，早于本轮 correctness/pilot/formal。
计数支持减少选定方法准备的机制；新正式点估计支持 H1 的方向：QuickJS
改善较大，QJS/V8 差距小幅收窄，但并未接近相同速度。结论是“该位置的
方法查找准备值得进一步检验”，不是“已证明它解释原 Richards 的多少%”。
局部赋值、额外 own 读取、字节码布局、引用计数、对象/IC/GC 状态及 .call
实现差异仍是替代解释。源码存在 traversal/IC 不能证明瓶颈或缓存命中率。

## 限制与 UNKNOWN

- 指标是 first-call-inclusive interpreter-mode derived execution，不是 pure
  interpreter-loop self time。Setup/source loading/输出在外；首次 Run、原
  Run 构造、调用、GC/helper/builtin/断言/残留 frontend 在内。JSC 首次
  函数准备仍可能在内；没有声称全部 frontend 被排除。
- 正式每组30个新进程，未做 warmup/trace/profile/counter/preload，串行；
  首次调用状态随 N 改变仍可能影响结果。一个 WSL 主机不是独立机器样本。
- WSL guest 诊断与正式进程组可能重启（boot_id 分开保存）；正式完整
  campaign 同一 boot，CPU/OS/arch/kernel/runtime/deps 未变。
- 未锁 CPU 频率/affinity。WSL cpufreq/governor、真实功耗/温度及 Windows
  后台宿主负载 UNKNOWN；PS/load-average 是可观察的 guest 快照/采样记录。
- selected lookup/call 的精确 self-time、每次 lookup 成本与原总耗时占比
  UNKNOWN；没有将派生改善百分比投射回旧 Richards。
- d8 制品精确 source commit/compiler/GN args 仍 UNKNOWN；官方版本-tag
  只是参考，冻结 SHA/运行时证据没有变。JavaScript JIT tier 关闭不等于
  所有 native generated code 关闭。此 Richards 无 regexp workload，但仍
  用 native builtin；三边 RegExp 策略沿用旧 manifest/机制记录，未新验证。
- 历史字节审计覆盖 Code Cache 全部唯一脚本身份及白盒 original 当前
  文件归档；不是对所有旧项目输入的全面历史恢复证明。
- NG v0.8.0 已通过官方源文件查看器检查 own-slot PIC；tag/短revision
  固定，全40-digit revision/本地完整源文件 SHA UNKNOWN。后续 NG 全部
  缓存覆盖 UNKNOWN，TLS 失败日志保留，无证书绕过。

## 一手实现与唯一下一步

`source_evidence/prior_art.md` 查阅 ECOOP1991 PIC、V8 properties、WebKit
metadata 及 NG v0.8.0。NG 当时四-shape/offset ring 的 fill 限制 own
property (`proto_depth==0`)，不能由这套 own-slot PIC 推断 inherited
TCB.run 已被缓存。官方 PR884 还记录后来删除历史 IC；不能依赖泛化文档
断言当前版本包含它。PIC/方法缓存/调用特化都不是本轮的新颖性贡献。

唯一建议：后续先验证一个受 shape/原型版本/own shadowing 约束的小型
inherited-method cache 能否以较小 guard/初始化/内存成本回收该机会；
在独立 upstream-revision 原型中保留 getter/Proxy/删除重定义/原型变更
fallback、this/返回/副作用语义，并测 hit/miss、失效、内存/GC 引用保留。
现有 NG v0.8.0 own-slot 机制不是这类 inherited site 的充分对照；必须
比较已有 prototype-cache 技术，不能宣称新颖或保证论文产出。本轮不实现。


## 正式完整统计（ms/Run）

| variant | engine | N | samples | median_ms_per_Run | mean_ms_per_Run | sample_stddev | tukey_halves_IQR | min | max |
|---|---|---|---|---|---|---|---|---|---|
| A | quickjs | 512 | 30 | 3.701276 | 3.712491 | 0.043341 | 0.061284 | 3.640017 | 3.827301 |
| A | v8 | 512 | 30 | 2.168374 | 2.179009 | 0.054514 | 0.060623 | 2.095352 | 2.326309 |
| A | jsc | 512 | 30 | 2.105957 | 2.115743 | 0.052413 | 0.050703 | 2.048047 | 2.250469 |
| B | quickjs | 512 | 30 | 3.530698 | 3.546763 | 0.108002 | 0.126521 | 3.385475 | 3.853745 |
| B | v8 | 512 | 30 | 2.129047 | 2.147909 | 0.072860 | 0.094045 | 2.066373 | 2.355191 |
| B | jsc | 512 | 30 | 2.078730 | 2.104526 | 0.069759 | 0.103711 | 2.022266 | 2.310000 |


## B/A（各引擎 B median / A median）

| engine | A_median_ms | B_median_ms | B_over_A |
|---|---|---|---|
| quickjs | 3.701276 | 3.530698 | 0.953914 |
| v8 | 2.168374 | 2.129047 | 0.981863 |
| jsc | 2.105957 | 2.078730 | 0.987072 |


## 引擎 ratio（均为同一派生变体的组 median 比）

| variant | V8_over_QJS | JSC_over_QJS | JSC_over_V8 |
|---|---|---|---|
| A | 0.585845 | 0.568981 | 0.971215 |
| B | 0.603010 | 0.588759 | 0.976367 |


QJS/V8：A=1.706936，B=1.658347；差距收窄但 QJS 仍更慢。

## 计数诊断（不是性能占比）

|输入|选定方法查找(N512)|原型跳数|TCB.run调用|native .call helper|
|---|---:|---:|---:|---:|
|original|3365376|1|3365376|0|
|A|3365376|1|3365376|3365376|
|B|512|1|3365376|3365376|


## 字节与独立审计

45个旧 Code Cache 唯一输入：现存实际文件45个已精确匹配运行 SHA，无需复原；21个 Git blob SHA 与运行 SHA 不同。
现存运行字节和可核对的 recorded 副本已归档。没有重写旧 SHA/raw/统计或批量改换行。
Windows/Linux archive_audit 对 ZIP→Git tree→git archive→解包再 SHA 的核验均PASS；主仓库索引/分支未改。
新设计与正式字节同时归档，嵌套 .gitattributes 仅针对本目录。
`summary/formal_audit.json` 从 stdout 重解析、比较命令/flags/deps/adapter/script哈希、时钟差、每组30/唯一位置/排列与统计CSV；全部PASS。
六种引擎排列每变体各5，每引擎每位置10；A/B先各15块；低于校准门槛的正式样本0条，未过滤任何 outlier。
详细证据入口：raw/journal.jsonl、raw/formal.csv、diagnostics/records、source_evidence、manifest.json；复核见next_commands.md。

已完成本阶段，未推进 VM 优化或下一轮实验。
