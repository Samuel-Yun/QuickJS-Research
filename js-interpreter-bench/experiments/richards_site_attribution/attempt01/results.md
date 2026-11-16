# 原始 Richards：属性查找对应到了哪里

## 做了什么

沿用冻结 WSL2 QuickJS/d8、`--max-opt=0 --no-lazy`、内部单调时钟和首次 Run 计入的协议。
原 Richards/base 字节、算法、方法读取、this、断言 2322/928 均未改。独立 QJS native 诊断
记录真实 opcode 起始位置，N1/N2 计数与采样分开；另做三次独立 N4096 采样、上下文开关、
实际 20ms 采样和少量无信号扰动对照。27 次原 Richards 运行均通过原正确性断言；
没有新增正式性能样本。冻结 runtime、旧 attempt 文件校验保持不变。
证据：[审计](summary/audit.json)、[计数](summary/count_audit.json)、[原始记录](raw/)。

## 最具体的发现

每 Run 有 **252558 次被跟踪的属性 opcode 操作、293356 次 find_own_property 调用**。
后者 293317 次映射到 189 个 opcode site，39 次仍没有 JS site；所有活跃 site 的偏移、
属性都与最终 dump 一致，N2 是 N1 的两倍。多一层原型会增加自身探查，不能把两种次数混用。
读字段有 156220 次自身命中；写字段有 50687 次操作，其中 98 次进入 fallback，不能漏掉写查找。
见 [操作频率](summary/frequency_by_operation.csv)、[所有来源](mapping/find_own_origins.csv)。

以下是本轮插桩诊断版的采样，不是冻结 Release 的无扰动位置时间。
三次上下文开启采样共有 **5393 个内部样本**：1229 个落在保守定义的 find_own_property
内联 native 区域，全部能映射 site；1071 个有属性上下文但 PC 在其他区域；316 个处于
上下文准备的无效状态；2777 个不处于被跟踪的属性上下文。后三类不冒充查找 self-time。

在 1229 个已映射查找区域样本中，Scheduler.schedule 占 382，TCB.run 占 150，
HandlerTask.run 占 140，Scheduler.queue 占 118。按属性聚合，currentTcb 为 280（22.8%），
state 为 204（16.6%），两处 run 方法查找合计 79（6.4%）。这里含多个读/写 site，
不是某次操作的精确时间。**现有证据不支持把查找工作主要归给两级 run。**
见 [逐 site 表](summary/site_samples.csv)及 [逐函数表](summary/samples_by_function.csv)。

选定 `TaskControlBlock.isHeldOrSuspended` 首次 `this.state`：QJS offset 3，原源码 310 行。
它每 Run 10671 次，全部 own 命中、一次自身探查、整数结果，无 fallback；三次相关样本
27/25/33，合计 85，占全部内部样本 1.58%、已映射查找样本 6.92%。它是稳定出现、
短小易解释的候选，不是已经证明的最大耗时点。实际 20ms 变体也采到该位置。

对应 d8 的 offset 0 是 `GetNamedProperty <this>, state, FBV[0]`；第二次读取在 offset 19、
FBV[4]。同一诊断进程的字节码地址与 LoadIC 日志精确对应，两处都记录状态码 `0→1`、
同一个 receiver map，32 Run 内没有后续转换。它是**实际位置的反馈转换证据**，
不是每次命中记录；命中率、正式运行命中的 handler 分支仍 UNKNOWN。
见 [IC 对应表](mapping/v8_selected_IC_transitions.csv)。

## 能说明什么、还缺什么

此位置 QJS 确实每次做 own shape/hash 探查；V8 实际字节码使用反馈槽，制品 handler
机器码有 map/反馈检查及字段读取路径。但尚不能断言该 site 每次都走哪条快路径，
更不能量出两者因此相差多少。此完整函数 QJS 是 16 条/29B，V8 是 14 条/31B；
V8 少两条、编码反而更长，都不能直接解释执行成本。完整执行过程见 [walkthrough](walkthrough.md)。

采样仍有明显边界：1ms 请求实际约 10ms；上下文开关会改变分布，诊断版本身也更慢。
无信号小对照 median：冻结版1718ms、诊断关闭2082ms、开启2223ms（均 N512）。
不同批次的点估计只用于揭示扰动，不是精确插桩成本。首次/第二次 state 读取频率接近，
相关样本却为85/9；定时混叠、执行阶段和真实微观成本尚不能分开。因此不把该表当精确排名。

下一步最值得取得：**该 state site 在 V8 稳态实际经过的 handler 分支及命中/回退次数**。
它能检验“QJS重复 shape 探查、V8复用字段访问反馈”是否确实是本位置的运行路径差异；
即使成立，仍需进一步测量才能判断其对 Richards 总体差距的贡献。本轮未提出 VM 优化。
