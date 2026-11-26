# 第三轮：由内置慢路径安装 charCodeAt 调用 IC

**实现已经生效，但没有形成两套基准的整体净收益。** MarkdownIt 有可重复的专项收益；Acorn 即使高覆盖也基本持平。保留为实验，不替换冻结 SPARSE。

## 本批整体结果

|模式|Octane GM|剔除 Richards|SunSpider GM|剔除 3d-cube|
|---|---|---|---|---|
|SPARSE|+0.00%|+0.00%|+0.00%|+0.00%|
|BODY|-0.03%|+0.00%|-0.32%|-0.33%|
|SHAM|-0.48%|+0.03%|+1.78%|+1.99%|
|SITE|-0.56%|-0.03%|+1.42%|+1.60%|

全部数值为相对本批冻结 SPARSE 的耗时变化，负数更快。四版同批，每项各一个新进程；父版现场重跑。Octane 按 14 suite 分层等权 GM，SunSpider 按 26 项等权 GM。计时包括运行触发的 C 内建、分配与 GC，不是只测解释器分派。
Octane 的最大赢家 Richards 是零覆盖项：独立计数确认没有进入 charCodeAt，也没有分配调用 IC。SHAM 在它上面同样变快。因此不能把 SITE 的 −0.56% 整体变化全算成动作 IC 收益；剔除 Richards 后仅 −0.03%。SunSpider 则整体 +1.42%。

## 外部负载：预先选定的两项补到 30 对

|外部负载（30 对）|SPARSE 中位数 ms|BODY 中位数 ms|SHAM 中位数 ms|SITE 中位数 ms|SITE/SPARSE 配对变化|SITE/BODY|SITE/SHAM|
|---|---|---|---|---|---|---|---|
|Acorn|1316.58019|1315.69856|1322.47524|1317.17602|+0.03%|+0.11%|-0.44%|
|MarkdownIt|5.20703|5.11926|5.39119|5.02954|-3.40%|-1.76%|-6.66%|

表内 ms 是各版耗时中位数，百分比是逐对相除后的中位数，两者计算口径不同。Acorn N=1；MarkdownIt N=256，让每进程的计时循环约一秒。读取输入和加载包在计时外，首个解析/渲染计入。固定 npm tarball SHA 全部匹配用户给出的值。Acorn 校验 Program/end=544096/29507 节点及完整 AST JSON 的 FNV；MarkdownIt 校验 12329 个 UTF-16 code unit 与 FNV=3322973581。
Acorn 的 SITE/SPARSE 中位数 +0.03%，SITE/BODY +0.11%，没有重复的净收益；MarkdownIt 为 −3.40%，SITE/BODY −1.76%，三十对均快于 SPARSE。未满足“两种外部负载都有可重复净收益”的条件，未启动 PostCSS/Bootstrap 留出负载。
每对原始时间、最小/最大区间、P10/P90 和描述性的配对中位数 bootstrap 区间都保存，未用计数或 Valgrind 进程的耗时下结论。

## 四个对照分别做了什么

- SPARSE：冻结源码原样编译。
- BODY：只在 charCodeAt C 函数体入口对平坦原始字符串、界内 int32 下标直接 string_get；仍建立普通 native 帧。
- SHAM：由真实内置慢路径学习，8 次合格观测后发布 3 字节专用 opcode；执行同样的 callee/receiver/index 守卫，随后仍走普通调用。
- SITE：与 SHAM 同一 ELF，命中后直接返回 code unit，省 native 帧及通用调用/转换路径。保留前面的属性读取和参数求值；使用栈上已取到的函数，绝不再读方法属性。
SHAM 进入 builtin 后仍会执行学习入口的检查，所以 SITE/SHAM 的耗时差同时包含普通调用、原 builtin 处理和这些检查的成本；没有把这整个差值都称为纯建帧收益。实际少建的帧数由独立计数给出。

## Run 内实际覆盖

|负载|N|V1 动态合格|Run 安装位点|实际省 native 帧|覆盖合格调用|专用指令内命中率|回退/停训|
|---|---|---|---|---|---|---|---|
|Acorn|1|314,096|28|313,860|99.925%|100.000%|0/0|
|MarkdownIt|256|6,198,548|68|6,198,004|99.991%|100.000%|0/0|
|Typescript|1|1,190,379|3|1,190,355|99.998%|100.000%|0/0|
|PdfJS|16|1,009,632|16|199,987|19.808%|99.980%|40/5|
|string-base64|256|12,583,936|11|8,406,948|66.807%|99.996%|297/6|
|string-tagcloud|256|6,934,784|1|6,934,776|100.000%|100.000%|0/0|
|Richards|1024|0|0|0|0.000%|—|0/0|
|DeltaBlue|512|0|0|0|0.000%|—|0/0|
|RayTrace|128|0|0|0|0.000%|—|0/0|

“覆盖合格调用”＝真正执行动作次数 / 原版 V1 合格次数；“专用指令内命中率”＝守卫通过 / 执行专用指令。两者不是一回事。PdfJS 和 base64 的部分位点连续失配后停训，之后的普通合格调用不再安装，因此看命中率高也不能当成全部机会都覆盖。Typescript 另有 1,471,095 次仅因尾调用形式而未覆盖，保持原路径；本轮未叠加 tail-call 扩展。

## 代码、内存和验证

学习在 js_string_charCodeAt 内，不在普通 OP_call_method 添加通用检查。核对当前 native frame、直接 JS caller、realm、argv 所在的 caller 栈窗口、实际 callee/receiver、返回 PC 和解码指令边界；绑定/间接/宿主/.call 不因此被误认。只改已经由 rdi_prepare 分配的私有可写执行镜像。
记录由字节码持有并标记/释放 callee 引用。指针数组可增长，单个记录地址不搬动；中断回调重入也不会留下悬空记录。8 次连续失配后恢复普通 opcode 和 argc=1，保留记录为停训状态，不重放参数求值或转换。保存字节码时恢复普通 call_method 1，原版 A 可正常/ROM 加载。
正式 ELF 实测：BuiltinSite 24B，加一项 8B 指针，摊销前每点 32B；每个有观测的函数另有 16B 表头及按 4 项起步的指针容量。第一次单点观测请求 16+32+24=72B，另加该函数字节码已有的 8B 元数据；不含 allocator 头和容量余量。从未出现合格调用的函数不分配表/记录，但 JSFunctionBytecode 仍由 160→168B。JSRuntime 保持 2216B。
普通方法调用 handler 的 C 代码逐字相同；实际 JS_CallInternal 从 46132→46802 字节（+670B），入口栈空间仍 0x288。完整汇编和结构大小已保存。零覆盖项的变化发生在没有安装/执行动作的情况下，属于改版的公共成本或收益，不能记成 IC 动作收益。额外诊断确认 SunSpider bitops-nsieve-bits（SITE +14.98%）和 Octane NavierStokes（+6.14%）也都是零 charCodeAt 调用、零安装，见 regression_diagnostic01/。本轮未继续调布局救成绩。
方法改写、参数求值中改方法、getter 次数、代理对、越界、下标转换副作用、间接/绑定/多参/尾调用、GC 循环引用、跨 realm、保存/加载/ROM、ASan/UBSan 均通过。四版中断测试都在 9998 次迭代停止。LSan 未启用，runtime 释放断言保留。
发布时直接复制实际执行缓冲区的 3 个字节：Acorn 28 个 Run 安装点、MarkdownIt 68 个，live 字节与发布字节一致，见 installation01/。这不是只看改写前编译输出。

## 为什么 Acorn 高覆盖仍没快

Callgrind 只采集 Run：约 93.8% 的指令在正则匹配器，命名读取约 0.95%。SITE 的总指令比 BODY 少约 0.20%，却没有转化成可重复的 Release 耗时收益。指令占比不等于耗时占比；没有把其它解析和分配成本归到 IC。原型属性读取未成为整体主导，因此没有追加 get_field2 原型读缓存来救成绩。
[指令明细与统计口径](instructions.md)。

## 文件入口

- [四版全集逐项表](full01/results.md)、[Octane CSV](full01/octane.csv)、[SunSpider CSV](full01/sunspider.csv)。
- [首批十对专项](paired01/results.md)、[两项外部三十对](focus01/results.md)、[区间](external_paired_uncertainty.json)、[原始命名计数](named_counts.json)。
- [与历史 A/V8 的附加 Octane 对照](full01/octane_historical_context.md)、[SunSpider 对照](full01/sunspider_historical_context.md)：仅这些附加列为历史，主结论用本批四版。
- [主解释器快路](builtin_opcode.inc)、[学习与生命周期代码（正式版本）](builtin_site_release.inc)、[构建和补丁生成](build.py)。candidate/ 内有独立补丁、完整源码包及 Release/计数/Sanitizer manifest。
- [最新语义验证](validation03/gate.json)、[生命周期与序列化](c_validation01/gate.json)、[安装字节证据](installation01/gate.json)、[审计](audit.json)、[复现命令](commands.md)。
首次 focus 未启动是 Python 工具名 inspect.py 遮住标准库造成的，已改为 inspect_binary.py 后续跑；未重复全集或首批十对。Callgrind 两次解析修正只重读原始文件，没有重跑已完成的采集。失败日志保留。
