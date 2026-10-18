# 马云霄周报讲稿

资料截至2026-10-17；核对时为 myx / 5d349e82dadd72c876f576415893dd1d46d372be，初始工作区干净。
组会日期未提供，不将数据截止日当作组会日期。正文6页，另有2页完整指令附录。

## 第1页：先讲明白一轮求和

同一函数计算0到4095的和，QuickJS的 add_loc 直接更新局部sum，inc_loc更新i；Ignition经过累加器运算和虚拟槽写回，Mov复制的是旧sum，Star0才写新sum。
每完整调用的中位耗时是43.782/54.839微秒，V8/QJS=1.253，表示本例V8用时更长；不是一条加法的成本。
计时在进程内部，首次调用在内、没有workload预跑，启动/静态前端在外，driver和实际GC/helper等仍在内。
这些指令组提供可检查的执行差异，但不能据此证明栈式更优或较短字节码造成时间优势。

## 第2页：方法成为own属性后，差距仍存在

这里四组累加i+3，不是上一页的单纯sum+=i；每个时间都含4096轮内循环，每组每引擎30个新进程。
own与prototype两组caller/callee逐字相同，只改变计时外的对象建立方式，V8/QJS点估计均约0.557，因此“一层原型解释全部差距”不成立为充分解释。
普通调用显式传obj和x，方法调用传receiver和x，对象shape、反馈、调用准备也会变化，不能把组间时间相减叫纯查找或纯调用成本。

## 第3页：不要把run调用频繁当作查找耗时主因

Richards模拟任务调度：Scheduler持有currentTcb，TCB持有task；取得对象、查找run、执行run是不同工作。
三次插桩诊断共有5393个内部样本，其中1229个查找区域样本已映射；currentTcb/state/run的280/204/79都以1229为分母，按属性合并多个读写site，不是全程序耗时比例。
普通状态字段值得继续看，但没有证明总体瓶颈；189个活跃位置和N1/N2核对只是定位方法的可信性说明，不当作研究发现本身。

## 第4页：顺着state的读取、比较和短路看

schedule内this是Scheduler，进入isHeldOrSuspended后this是当前TCB；两边都先读state，与STATE_HELD做按位与并比较，左侧为真时不再读第二次state。
正文明确为非连续的真实指令摘录：例如QJS的12 push_0、14 dup、17 drop未显示，不能把正文当成可直接执行的连续序列；完整内容在附录。
Ignition的TestEqual配合LogicalNot实现不等判断，r0是虚拟frame槽而非CPU物理寄存器；字节码offset也不是native PC。

## 第5页：把实际观测和解释分开

QuickJS原程序的首次state读取每Run10671次，全为own数据属性命中、整数结果、无fallback；自身命中仍经过shape/hash、描述符检查和值/receiver处理，整数值本身不做对象引用计数。
V8实际字节码的两个读取点使用FBV[0]/FBV[4]，同进程日志对应offset0/19、状态码0到1和同一receiver map。
日志不是逐次命中计数，handler具备某分支不证明该site每次命中；“QJS重复自身查找、V8可能复用字段反馈”是待验证解释，尚不是性能原因。

## 第6页：带着限制讨论下一步

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

## 页脚来源索引（路径均相对 js-interpreter-bench）

- S1 = experiments/bytecode_whitebox_simple/attempt01/。
- S2 = experiments/call_path_followup/attempt01/。
- S3 = experiments/richards_site_attribution/attempt01/。

| 页 | 主要来源 |
|---|---|
| 1 | S1/cases/numeric_loop.js；S1/bytecode/{quickjs,v8}/wbNumericLoop.txt；S1/summary.csv；S1/raw/timing.csv及其raw/formal记录 |
| 2 | S2/cases/{inline,direct_call,own_method,prototype_method}.js；S2/summary.csv；S2/raw/timing.csv及原始JSON；S2/source_evidence/shared_method_core.json、method_bytecode_equal.json |
| 3 | benchmarks/octane/upstream/richards.js:195、337；S3/summary/site_samples.csv、sampling_summary.json、count_audit.json；S3/mapping/find_own_origins.csv |
| 4 | 原richards.js:309–311；S3/bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.{txt,decoded.json}；S3/bytecode/v8/TaskControlBlock.isHeldOrSuspended.{txt,decoded.json} |
| 5 | S3/raw/counts_N1.sites.csv及functions.csv；S3/mapping/v8_selected_IC_transitions.csv；S3/raw/v8_selected_site_full.log；S3/source_evidence/v8_GetNamedProperty.actual.disassembly.txt；S3/site_notes.md |
| 6 | S3/raw/control_frozen_nosignal_rep{1,2,3}.json；S3/raw/control_nosignal_ctx1_rep{1,2,3}.json；S3/summary/perturbation.json；S3/summary/site_samples.csv；S3/raw/counts_N1.sites.csv |
| 附录 | 第4页的完整目标函数dump及S3/summary/selected_bytecode_checks.json |

## 使用边界

性能表只来自各自正式样本，诊断时长/样本比例不混入，不与旧Windows数据相除。
不新增总体GM、显著性、纯解释器self-time或Richards总体性能原因结论；不引用暂停的方法外提A/B作为本周成果。
本机与现有WSL未找到XeLaTeX/latexmk：未在本地编译，PDF页数、缺字和实际溢出尚未经编译/渲染验证；源码结构与数字核对见同目录validation.json。
