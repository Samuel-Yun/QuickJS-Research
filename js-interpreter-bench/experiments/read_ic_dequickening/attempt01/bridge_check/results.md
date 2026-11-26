# 有限bridge_check：确认开关扰动，停止追分

精确旧M/SW源码逐文件恢复后新构建。每项12对新进程，M→ON/ON→M各6对、seed20261024，48条全部有效；双方同传mode=1占位，不进AMR主raw。
两项共同N沿用上轮，内部区间全部>=1秒，首次Run在内、没有workload预跑。这里只给小样本点估计，不宣称根因或显著性。

| 项目 | M ms/Run | ON ms/Run | M/ON | ON/M耗时变化 |
|---|---:|---:|---:|---:|
| M4.numeric_control | 0.035171 | 0.038924 | 0.9036 | +10.67% |
| Richards.Richards | 3.233783 | 3.304132 | 0.9787 | +2.18% |

## 确认的变化

独立N2诊断中，规范最终字节码/atom与逐函数实际dispatch计数的多重集合完全匹配；numeric目标无属性读，不进入mode命中分支。
完整原始计数在matched_environment/diagnostic/*.json.gz，规范码在numeric_target.json，逐函数各opcode计数在dispatch_counts.csv。handler融合消费的后续逻辑opcode不一定单独dispatch，不能把该表当native instruction计数。
实际M JS_CallInternal起点0x22ac0、大小0xa27f；SW起点0x22ba0、大小0xa2ec（+109字节）。整.text分别762514/762818（+304）。
实际prologue均保存rbp/r15/r14/r13/r12/rbx，局部栈预留均0x248；这没有证明全函数spill或路径都相同。
完整两份JS_CallInternal反汇编保存于machinecode/；numeric_mapped_excerpts.asm按相同原C操作对应，明确为DWARF归属的非连续片段，不把片段拼成完整执行路径。

## 支持的解释和UNKNOWN

JS目标工作量/动态dispatch未变，机器码相对布局和部分派生控制流确有变化；支持继续考虑非目标路径/局部性影响，而不是声称多执行了数值目标的mode判断。
寄存器/栈分配的完整动态影响、分支预测、I-cache与频率/调度的贡献仍UNKNOWN，不能按109字节或一个额外分支计算成本。
perf能力命令非零退出，原始stdout/stderr及状态在../raw/build/bridge_perf_availability.1.json；未取得cycles/instructions工作负载样本，未sudo或改宿主/内核。
没有搜索padding、flag、mode布局，也没有为了追上M改源码。有限检查到此停止；后续AMR不包含SW，用独立新时间回答R净收益。

## 初版配置偏差与恢复

初始48条M未传旧mode占位，全部原样保留在raw/，不混入本报告表。实际最终48条来自matched_environment/raw/。
偏差在主正式汇总前发现并声明，待主全部VM阶段结束后才串行恢复，补4个同环境N2诊断；原R设计/正式样本不变。
这是配置纠错，不是按时间方向择优。不能把初始48与匹配48当同一批次合并，全部实际桥接性能记录为96条，其中最终配置48条。
