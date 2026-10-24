# 调用路径跟进结果（2026-10-17）

## 做了什么

同一WSL2 Ubuntu24.04.2/x86_64 cohort，沿用冻结QuickJS 2026-06-04 / 04be246…
（GCC13.3 -O2）及官方d8 15.6.21（--max-opt=0 --no-lazy）、原snapshot与单调benchNow。
没有替换正式runtime，没有方法外提、VM优化或旧数据覆盖。HEAD起点69a7096。
完整身份见[manifest](manifest.json)，环境见[environment](environment.txt)。

四组均在4096次内层循环累加i+3，结果8398848；own/prototype逐字相同的caller/callee，
仅计时外对象建立不同。正确性N1/2/64共24/24；布局检查8/8；真实dump全部取得，
QJS正式/诊断qjsc生成的四份序列化表示逐份相同。计数、采样与正式计时完全分开。

内部计时包含首次目标调用，无workload预热；启动、VM、静态frontend和对象建立在外，
driver/checksum、反馈演化、实际GC/helper在内，不是全冷态或pure-loop self-time。
每组每引擎30新进程，共240/240有效，先后各15次，保留全部outlier。
N倍增，双方pilot>=1.5秒后各3个新进程复核>=1.2秒；全部正式样本>=1秒。
inline的N32768，其余N16384；同组两引擎一致。完整统计见[summary.csv](summary.csv)。

## 看到什么

单位µs/完整目标调用，含4096次内层循环及摊薄driver；均为点估计，无显著性检验。

|组别|QJS median [Q1,Q3]|V8 median [Q1,Q3]|V8/QJS|
|---|---:|---:|---:|
|inline|67.132 [66.610,67.765]|60.388 [60.054,60.820]|0.900|
|direct_call|159.969 [158.831,160.905]|116.395 [115.572,117.684]|0.728|
|own_method|217.156 [216.265,218.845]|120.905 [119.556,121.299]|0.557|
|prototype_method|225.086 [223.248,228.238]|125.348 [124.370,126.591]|0.557|

最明确的是：方法成为own属性后，V8/QJS差距仍在；prototype/own的组内median比为
QJS约1.0365、V8约1.0367，相对差距几乎不变。因此在这组对象/输入下，不能只用
“QuickJS每次多走一层原型”解释跨引擎差距。shape和反馈也随对象建立方式变化，
不能把这约3.7%直接称为纯原型查找成本；更不将差值外推成Richards成本占比。

direct到method时，QJS组内median约1.3575，V8约1.0388。但同时改变函数获取、
参数/receiver和callee读取方式，不是纯调用或纯this成本。真实dump显示QJS
stepPlain为5条，stepMethod为7条，后者多push_this/put_loc；V8两者均3条。
这给出具体候选工作，不是“多两条指令解释全部差值”的证明。

## 能解释什么

独立QJS路径实测：两种method均进入callee4096次、bias自身命中4096次；own的step
自身命中4096，prototype的step一层命中4096，均无通用fallback。普通调用进入4096次。
实际PC诊断另外观察到call-entry/frame、shape查找与分散的引用管理代码区域；
V8观察到GetNamedProperty与InterpreterEntry等执行区域。源码解释了值复制、
receiver保留、callee this局部、frame准备与清理的位置，但没有分别量出时间。
见[逐条对应](case_notes.md)和[教学说明](walkthrough.md)。

未修改Richards三个独立采样中，QJS find_own_property区域占内部top-PC约24.8–29.2%；
V8 GetNamedProperty约34.9–35.3%、InterpreterEntry约18.3–20.0%，分母/机制不同，
禁止横向相减。native计数确认currentTcb.run和task.run每Run各6573次、均一层原型。
但是TaskControlBlock.run实际为QJS tail_call_method，task又有四种原型，参数/返回值
是对象或null且状态持续改变；不能把小程序普通调用后累加的结果直接套上去。
详见[原Richards分析](richards_analysis.md)：有实际耗时区域证据，也有调用频率；
没有两个JS调用点各自的self-time，未证明它们是最耗时的两个函数。

## 还缺什么、下一步验证什么

V8精确源码/工具链对应和IC命中率UNKNOWN；没有全量实测opcode/native-dispatch计数，
逻辑次数仅推导。QJS信号采样请求1ms但本WSL实际约10ms，存在采样扰动/混叠和优化行号
归属限制；V8只分类整进程top-PC，均无完整JS栈。宿主功耗/频率/后台负载未完全控制。
正式普通调用一条约双倍时长样本原样保留；汇总条数笔误的保留/修正见[恢复记录](raw/recovery.md)。

下一步最值得问：**能否在不改Richards算法的独立诊断中，把查找和调用入口样本关联到
当前JS bytecode位置，区分own state/currentTcb读取与run方法读取/调用？**
先取得位置归因，再判断哪项成本值得深入；本轮不提出VM优化方案。

[正式审计](audit.json)与[独立审计](independent_audit.json)通过；原Richards审计为
PASS_WITH_ATTRIBUTION_LIMITS。旧Windows时间不参与本轮相除，旧WSL数据也未合并。
