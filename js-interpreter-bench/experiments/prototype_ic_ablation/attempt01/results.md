# 状态：PERFORMANCE_ENV_UNSTABLE，正式采集0/384

本轮没有得到可靠的ON/OFF耗时结论。实现、语义、机制与短生命周期
检查已完成，但原H数字控制连续两组12进程都超过事先约定的稳定性
阈值，因此按协议停止，没有把pilot当作正式结果，也没有继续堆版本。

直接回答四个问题：

1. **同一ELF开启原型IC是否净受益：UNKNOWN。** 稳定原型小例子与原
   Richards都未开始正式采样，不能由命中/少查找或两个pilot下结论。
2. **新ON是否扰动原H：UNKNOWN。** 已实现ON/H参照，但没有正式数据。
   同一程序的ON/OFF控制成立，不等于新程序对原H零扰动。
3. **OFF相对M是否还有公共成本：UNKNOWN。** 源码保留24B/site与holder
   分支，能说明存在公共结构差异，不能说明它们各造成多少时间。
4. **是否继续这版H：暂不追加设计。** 最短下一步是在安静窗口、新
   cohort复跑同一个开关实验；目前既不能证明值得推进，也不能说IC无用。

## 主时间表

单位应为ms/完整Run；以下均未正式测量，不填pilot或历史绝对时间。
M是own单槽参照，不是原版A。OFF/ON为同一个新ELF。

|案例|M|原H|switch OFF|switch ON|
|---|---|---|---|---|
|prototype_method|未正式测|未正式测|未正式测|未正式测|
|own_integer|未正式测|未正式测|未正式测|未正式测|
|numeric_control|未正式测|未正式测|未正式测|未正式测|
|Richards.Richards|未正式测|未正式测|未正式测|未正式测|

四案例的ON/OFF、ON/H、OFF/M、H/M比值、变化率和区间全部为UNKNOWN。
analysis_final/summary.csv保留0个有效正式样本及空估计，ratios.csv
标NOT_RUN；bootstrap实际执行0次。预生成384位置只是计划，不是样本。

## 短稳定性检查：为什么停

沿用WSL2 Ubuntu24.04.2/x86_64，冻结M/H与GCC13.3工具链；四条件
统一固定CPU15，实际affinity=[15]。原有Windows电源方案为均衡模式，
供电查询被拒绝，频率/温度及宿主后台控制UNKNOWN，未改系统配置。

四案例共同N仍为8192、16384、32768、512；各条件2个独立pilot
均≥1秒，32个pilot与16个选定N正确性通过。然后只用原H、
numeric_control、N=32768做规定的12进程检查。下表为内部完整N次
区间的毫秒，不是一次操作时间；Q1/Q3为排序上下半段中位数。

|组|median ms|Q1 ms|Q3 ms|min ms|max ms|IQR/median|max/min|
|---|---:|---:|---:|---:|---:|---:|---:|
|首次12进程|1914.582|1832.205|2036.275|1499.146|2156.733|10.659%|1.43864|
|唯一整理后12进程|1733.071|1624.864|1843.966|1512.125|2159.015|12.642%|1.42780|

止损条件为IQR/median>10%或max/min>1.25，两组两项都超过。
唯一环境整理只确认无自有编译/诊断并行、重设相同CPU affinity并
空闲10秒；没有杀其他用户进程、改电源/WSL、换N或源码，再无第三组。
所有顺序和逐点数值见analysis_final/stability_order.csv及stability/。
这只是工程阈值，不是显著性定义；低于它也不保证能辨认1%差异。

性能准备/稳定性全过程同一boot，内部native performance.now与外部
perf_counter_ns分开保存；UTC仅审计辅助，未用UTC差算耗时。

## 实现和动态机制确实成立

ON/OFF共用Release SHA256：
`e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d`。
QJS_EXPERIMENT_PROTO_IC=0/1在CLI启动、runtime创建前读取一次，
保存于file-static变量；不在热路径getenv，不新增runtime/site字段或
JS API。仅在合格继承data填充处追加条件；own命中/填充保持开启。
两选项等长，其余环境来自同一模板，保留原H的24B/site及eager分配。

16个独立诊断进程（四案例×N1/N2×ON/OFF）验证最终字节码/site数
一致，均24B。按源码SHA、编译实例、最终PC定位，N1关键证据：

|位置|读取|OFF/ON继承命中|OFF/ON普通own探查|ON继承填充/替换|
|---|---:|---:|---:|---:|
|prototype_method PC13|4096|0 / 4095|8192 / 2|1 / 0|
|schedule PC30 isHeldOrSuspended|10671|0 / 10670|21342 / 2|1 / 0|
|schedule PC83 run|6573|0 / 6572|13146 / 2|1 / 0|
|TCB.run PC73 task.run|6573|0 / 3023|13146 / 7100|3550 / 3549|

Richards三处合计探查47634→7104，约少85.1%，不是少85.1% CPU时间。
own_integer两模式均4096查询、4095次own命中、一次填充/普通探查；
OFF没有关全部IC。数字循环m4Loop没有目标字段读，驱动仍有少量IC。
Richards数组请求两边均7464B，N1 shape边retain/release为OFF106/106、
ON7274/7274；N2 ON14374/14374。销毁后数组活跃字节归零，间接保活
峰值/RSS仍UNKNOWN。事件次数不能换算成成本。

## 正确性与限制

64/64复用已修正strict/non-strict八场景进程、32/32 workload N1/N2、
两模式短生命周期、ON热序列化→OFF/ON copy/ROM加载均通过；加载前
缓存为空，OFF不填/不命中继承，ON重新填充并命中，环境后改不变选项。
两边缓存引用清理平衡。四个非法/缺失选项按预期退出2，另列而非失败。

一次有限反汇编在2c2ac/2c3e7观察到继承填充处的开关比较，随后为
shape维护；own命中源码无新增开关条件，probe/update未见独立符号。
这些不是逐次执行trace或周期测量。路径表、真实摘录在path_table.md。

新sanitizer构建中WSL会话中断，检查发现新boot、零字节quickjs.o、
没有新sanitizer可执行文件，原因UNKNOWN，**不记为通过**。原H的
ASan/UBSan/OOM范围只作既有依据，不能代替新版本的实际验证。序列化
C测试初次编译及分析脚本的开发错误也保留在failures.md，不覆盖raw。

本轮到此停止。不用pilot推ON/OFF收益，不把引用维护、holder分支或
native布局说成已证实根因，不把旧H/M区间移到这批，更不推断超过A。
