# QuickJS IC Round 2

已完成三个想法的实现、语义与生命周期验证、独立计数、五对定向实验，以及完整 Octane 17 项和 SunSpider 26 项的单轮筛选。三份源码；为分清收益来源，分别保留 3、3、2 个执行模式，共 344 个全集新进程。没有组合三个想法，没有修改冻结源码或默认引擎，没有 push。

|主实现|父版|Octane 相对父版|SunSpider 相对父版|Octane 相对 A|SunSpider 相对 A|
|---|---|---|---|---|---|
|instanceof 路径缓存|SPARSE|-0.25%|+2.00%|-8.09%|-1.87%|
|call 适配＋字段配方|SPARSE|+2.92%|+3.32%|-5.17%|-0.60%|
|父子组合构造计划|NUMERIC_PLAN|-1.11%|+0.23%|-12.17%|-1.99%|

**最值得继续的是父子组合构造计划。** RayTrace 同批五对中位数减少 17.61%，全集 Octane 相对 NUMERIC_PLAN 再减 1.11%，SunSpider +0.23%。它保留了已有 Color 子计划，新增收益来自省掉父层 wrapper、arguments、apply 和 initializer。
`instanceof` 版 Boyer 同批 −13.04%，但整体只有 −0.25% / +2.00%，属于局部收益。`.call` 版真正省了部分 native 帧和 JS 字段初始化体，然而两套全集都更慢，保留失败记录。

## 如何看这些数据

负数表示耗时减少。Octane 用 14 suite 分层等权 GM，SunSpider 用 26 项等权 GM。GM 与逐项时间之和都保留。计数只在 Run 开启，计时使用无计数 Release。全部版本沿用原输入、N、校验、Setup/Run 边界、CPU 2、C locale、Asia/Shanghai、GCC 15.2.0 与 -O2。
A/SPARSE/NUMERIC_PLAN/V8 的全集按本次要求使用历史记录，故整体比较是跨批次单轮筛选。A/V8 来自既有 native_confirmation 的 30 进程中位数；SPARSE 使用上一轮报告里的近期冻结父版单轮，NUMERIC_PLAN 使用其上一轮单轮。不要把 0.2% 这类变化当成已确认收益。现场五对定向父版对照才用于判断专项变化能否重复。
V8_ON 的历史参数是 --jitless --no-lazy --use-ic。用户包里的 EPYC/GCC14.2 时间仅作设计参考，没有混入本轮表格。

## 数据、代码和复现

- [全部模式、两套完整逐项表](full01/results.md)，[Octane CSV](full01/octane.csv)，[SunSpider CSV](full01/sunspider.csv)。
- [三个主实现与 A/SPARSE/NUMERIC_PLAN/V8：Octane](full01/octane_vs_A.md)，[SunSpider](full01/sunspider_vs_A.md)：括号相对 A。
- [instanceof 实现和结果](01_instance_hook/results.md)，[call 实现和结果](02_call_adapter/results.md)，[组合构造实现和结果](03_nested_plan/results.md)。各目录有独立补丁、source.tar.gz、Release/计数/ASan+UBSan manifest、五对原始时间。
- [命名后的计数](mechanism_counts.json)，原始计数及实际执行镜像在 counts01/raw/；目标身份在 02_call_adapter/identities01/。
- [验证](validation02/gate.json)、[额外失效/回退验证](extra_validation01/gate.json)、[GC/realm/中断及保存/加载验证](c_validation01/gate.json)、[补丁与计时审计](audit.json)。LSan 在该环境下未启用，ASan/UBSan 及 runtime 释放断言已通过。
- [执行字节码摘录](bytecode.md)，[结构实际大小](sizes.json)，[复现命令](commands.md)。

各目录的 work/ 是本机编译缓存，不纳入源码交付；source.tar.gz 和 manifest 对应实际测量的版本。结果、补丁和输入哈希经过 audit.py 独立核对。
