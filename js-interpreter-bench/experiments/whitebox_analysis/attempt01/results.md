# 白盒分析与小型机制对照：已实际完成

## 完成状态与事实

WSL2 Ubuntu24.04.2/x86_64，cohort wsl2-ubuntu2404-x64-20261004。
正式指标 MAIN_MONOTONIC_V1_DERIVED：first-call-inclusive interpreter-mode
execution 的 elapsed/N。4变体×3引擎×30新进程=360/360有效样本；两组N均256。
N1/2 correctness24/24，selected-N独立复核12/12；原始断言不放宽。
六排列各5次，每引擎每位置10次，固定seed交错变体。保留outlier及失败诊断。
完整旧基线未重跑；原始CSV目标9组270样本复算与旧summary一致。

重要证据：[正式独立审计](summary/formal_audit.json)、[raw](raw/formal.csv)、
[冻结协议](protocol.md)、[设计时间/hash](microbench/design.json)、[schedule](microbench/schedule.json)。
总审计 COMPLETED_WITH_PARTIAL_PROFILING：正式实验PASS，但不能把缺少的
QuickJS采样self-time、原生符号或frontend证明伪装PASS。

## 完整派生统计（ms/Run）

| 变体 | 引擎 | N | median(ms/Run) | mean | std(n−1) | IQR | min | max |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| richards_fields | quickjs | 256 | 8.069566 | 8.076415 | 0.249832 | 0.295407 | 7.571225 | 8.499505 |
| richards_fields | v8 | 256 | 6.806652 | 6.792803 | 0.204917 | 0.245980 | 6.283363 | 7.329180 |
| richards_fields | jsc | 256 | 5.979375 | 5.996182 | 0.357767 | 0.171250 | 5.462578 | 7.459922 |
| richards_cached | quickjs | 256 | 7.797116 | 7.885079 | 0.280911 | 0.351158 | 7.497281 | 8.442839 |
| richards_cached | v8 | 256 | 6.576381 | 6.587450 | 0.139324 | 0.172406 | 6.274629 | 6.906625 |
| richards_cached | jsc | 256 | 5.492930 | 5.453919 | 0.150915 | 0.127109 | 5.068047 | 5.662031 |
| navier_array | quickjs | 256 | 5.110232 | 5.119013 | 0.160692 | 0.186083 | 4.822055 | 5.488540 |
| navier_array | v8 | 256 | 6.722074 | 6.729129 | 0.132172 | 0.117492 | 6.434129 | 7.013402 |
| navier_array | jsc | 256 | 4.561289 | 4.574081 | 0.109280 | 0.102734 | 4.215547 | 4.844375 |
| navier_f64 | quickjs | 256 | 6.039724 | 6.024274 | 0.151658 | 0.174976 | 5.701906 | 6.319118 |
| navier_f64 | v8 | 256 | 7.213822 | 7.198393 | 0.156048 | 0.129211 | 6.786699 | 7.542680 |
| navier_f64 | jsc | 256 | 6.149336 | 6.138701 | 0.113093 | 0.098516 | 5.767031 | 6.300156 |

## 组内B/A（median B / median A）

| 组 | 引擎 | B/A | 变化 |
| --- | --- | --- | --- |
| richards | quickjs | 0.966237 | -3.38% |
| richards | v8 | 0.966170 | -3.38% |
| richards | jsc | 0.918646 | -8.14% |
| navier | quickjs | 1.181889 | +18.19% |
| navier | v8 | 1.073154 | +7.32% |
| navier | jsc | 1.348157 | +34.82% |

## 引擎比值（同一变体median）

| variant | V8/QJS | JSC/QJS | JSC/V8 |
| --- | --- | --- | --- |
| richards_fields | 0.8434967046459477 | 0.7409785094979147 | 0.8784604674999122 |
| richards_cached | 0.8434376605143634 | 0.7044822774201668 | 0.8352511518047986 |
| navier_array | 1.3154147196161412 | 0.892579667820498 | 0.6785538085516991 |
| navier_f64 | 1.1943959238447457 | 1.0181484250174642 | 0.8524379602201395 |

## Richards：事实→假设→证据→判断

原调度器每Run状态谓词10671次；V8实际GetNamedProperty top-PC样本突出，
JSC匿名函数hash关联到schedule/谓词/TCB.run。参见[cases/richards/evidence.md](cases/richards/evidence.md)。
派生缓存字段合法且校验一致，QJS动态get_field由393224降到262152（含公共driver）。
固定QJS属性handler进行shape属性查找；固定JSC缓存StructureID/offset路径在
实际lib汇编中可见。它们是具体路径证据，不是IC命中率或精确耗时归因。

预期QJS缓存收益可能大于其他引擎；实际B/A：QJS0.9662、
V80.9662、JSC0.9186。
字段读取敏感性按点估计获得支持，但“QuickJS尤其受益”的相对预测没有得到
观察支持。未进行IC开关或单机制因果隔离；没有据此拒绝统计H0或证明IC解释
了原Richards全部差距。新增局部访问、字节码/分支布局和调用被移除也是混杂项。

## NavierStokes：反例与表示敏感性

旧同cohort是QJS61.663120<V874.770359，但JSC58.624688最快。
JSC原N32采样lin_solve占主要函数样本；V8出现Add/keyed访问/循环等具体路径。
QJS原N32计数105969638次get_array_el走in-handler Array分支（其他opcode未计入）。
派生同数值核的333316次读取：Array全走该分支，F64全进入helper分支。
helper本身已有Float64Array专门的bounds/load，不能说每次都做通用属性哈希。
参见[cases/navier_stokes/evidence.md](cases/navier_stokes/evidence.md)。

改成F64，B/A：QJS1.1819、V81.0732、
JSC1.3482。表示敏感性以及QJS方向预测获得观察支持；它不等于
已经测出helper本身的成本。TypedArray并不保证解释器更快；普通Array与typed
的storage、tagging、类型转换、边界测试/专门化等同时变化。
两组保留的工作不同：Richards偏属性/调用/分支，solver偏大量算术/索引读写。
这是相对关系不同的有证据的路径描述，仍不能完整解释原案例的速度差。

## RegExp运行时边界

原N64三引擎各3个诊断进程，不是新的正式性能矩阵。
V8 trace-regexp-tier-up在此制品为readonly，失败日志保留；--prof实际可用。
额外live-maps诊断：124个RegExp tick PC，其中
124个落在实际进程观察到的可执行映射中，
并与注册的RegExp代码区间对应，见[原始关联证据](profiles/regexp.mapped/execution_evidence.json)。
这支持实际native正则执行，不只是允许生成代码。不能据此估计整个Run的精确
native占比或所有pattern覆盖。JSC固定源码useJIT=false会关闭useRegExpJIT，
Yarr解释路径仍有RegExp分类样本；该分类本身不代表正则JIT。
QJS调用C libregexp。JS-JIT-off并非所有runtime-generated-code-off，不能把
正则速度差当作通用JS dispatch优势。

## 诊断能力与边界

perf命令不存在，但perf_event_open实际读取硬件/软件事件成功。小型C wrapper
收集三重复的whole-child-process计数，enabled=running，无伪造软件cycles。
它覆盖exec/VM/frontend/Setup等，不是仅内部Run；WSL vPMU也不是原生Linux等价保证。
V8/JSC软件采样各原案例三独立进程，QJS采用可验证函数计数/原生opcode计数。
QJS单独GCC13.3/-O2诊断构建保留patch/hash/correctness/开销对照，不替换冻结binary，
不用于引擎排名。详见[能力](capabilities.json)、[开销](summary/diagnostic_overhead.csv)。
whole-process占比不是内部计时占比，opcode次数不是时间；引用计数成本散布于handler/helper，
不能按GC标签代替全部内存管理成本。V8本地分类器只关联top-PC，没有完整栈/inline或C++符号解析。

## 可以说、不能说和UNKNOWN

可以说：两个明确片段的对照实际完成；字段读取/数值表示会改变当前解释器配置
的时间关系，原案例相关路径得到运行证据支持。不能说：差距全来自IC/dispatch，
computed goto已证明瓶颈，或已经得到pure-loop self time。
JSC首次准备仍可能在内部；单调时钟只是修复计时，不是frontend完全排除证明。
代表性静态函数QJS/V8诊断bytecode在stdout timer标记前可见；JSC分流日志不能
证明生成顺序。动态编译/GC/helper/builtin仍是实际成本。N内状态/IC并非每Run冷态。
V8制品精确source/compiler/GN、精确Run内各成本、每样本功耗/频率/温度/后台隔离
均UNKNOWN。历史Windows不参与本轮相除。NG具体实现版本未固定，仅查阅官方文档。
导师引擎名与“0.6/0.7/0.8”仍待原录音确认，不能声称指定WebKitcommit或IC实验。

## 下一轮候选问题（本轮不实现）

1. 原Richards的prototype method查找/调用准备，是否比冗余own-state读取更值得研究？
   证据是原调用频率与属性/entry/call采样，而简单state缓存收益并未特别偏向QJS。
   最小下一步是固定真实片段输入，诊断prototype hops/lookup/JS_CallInternal调用，
   再设计保留this/调用语义的受控对照；不先加PIC。IC/PIC与fusion已有实现，
   任何未来方法需明确内存/正确性/多态退化权衡，尚无可信新颖方法成立。
2. F64进入helper的额外流程，究竟来自call/tag/conversion还是其他因素？
   下一步只对固定helper/typed load/store分类计数或采样；保留detach/resizable/
   bounds/NaN等语义。helper已有专门化，不能把“加入TypedArray支持”当创新。

已有技术核对与一手来源：[prior_art.md](source_evidence/prior_art.md)。
全部新数据独立保存，已停止在本阶段；未进入优化、IC全矩阵或发布。
