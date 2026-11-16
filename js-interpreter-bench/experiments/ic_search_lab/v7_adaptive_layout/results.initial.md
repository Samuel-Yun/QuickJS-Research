# 历史记录：v7首批因时钟矛盾中断

2026-11-07续跑：新boot已核实，实际补做两次有限恢复预检、含2个真实zlib进程，
仍未通过冻结计时门槛；没有新增正式采样。见[最新恢复记录](results.restored01.md)。
该次未重现旧boot的Windows外层矛盾，只确认RAW/MONOTONIC仍分离，不混用两者证据。

本轮实际运行了冻结A、s001、P1，保存73条通过原结果门禁的measurement；
其中A24、s00124、P1 25条。完整首轮目标129条，预先冻结5轮目标645条。第74个进程（zlib/A）已有完整
process_result，但计时门禁抛错，未产生measurement。未完成一轮，整批隔离，
没有完整Octane或SunSpider GM。不能判断P1的局部信号是否独立复现。

## 做了什么

核对工作区HEAD为35c6b80445ca95e1b052574900625fd0a4cbc09c、myx分支，
任务开始时工作区干净。核对三个ELF、SHA256及冻结43项输入，未重新构建旧对照。
首次预检用6个真实负载进程通过，然后立即开始完整首轮；没有先做新一轮机制诊断。
首次Run计入、无workload预跑、原完整N、内部CLOCK_MONOTONIC、固定CPU affinity 2。

首轮执行到73条，zlib/A的UTC区间为6.891681秒，外层MONOTONIC为7.902377596秒，
触发原有1秒差异门槛。boot始终为e9f25f68-b442-4024-bf25-08c4c4fa0884。
这不是checksum失败，也不是进程消失。

## 为什么这次不能直接忽略旧门槛

只出现UTC跳变，本来不能证明单调计时无效。因此做了第二次有限复检，并实际
运行A、s001的zlib各一次：退出码0、内置correctness PASS、stderr为空。
但时钟证据出现独立矛盾：Linux内层MONOTONIC47.068939383秒，RAW46.121214820秒；
包住整个命令的Windows Stopwatch只有46.6387301秒。Windows UTC为46.6420233秒，
与自身Stopwatch接近。Linux所选时钟的区间反而超过外层约0.430秒。
空闲段还观察到MONOTONIC/RAW分离约0.769秒。它足以干扰希望识别的约1%变化。

未自动关闭WSL、修改clocksource/系统设置，也未把RAW偷偷换成正式时钟。
两次有限检查用完后，停止当前环境的性能采集，不进行无上限重试。
具体原因是时钟读数矛盾，底层TSC/虚拟化/校时的根因仍UNKNOWN。

## 保存了什么、尚未完成什么

`comparison_octane.csv`、`comparison_sunspider.csv`列出全部计划case/条件，
已有数值的单位是ms/完整Run；未测为空，状态标记QUARANTINED_ENVIRONMENT。
`audit.json`分开记录已保存条数、首轮129目标与五轮645目标。
`raw/initial.runs.jsonl.gz`保留完整命令、输出、制品/脚本/输入SHA、时间和异常。
不补造缺失样本，不用历史时间充当本批对照，不给这批数值作性能排名。

IO2/IO4布局和直接读取仅写了source transformation初稿，未构建、未验证、未计时。
AQ1/AP1/ST1未开始。没有可保留的新候选，也没有“搜索证明这些方向无效”的结论。
没有生成VM补丁制品或声称sanitizer通过。`builder.py`与恢复入口仅做可做的源码检查，
不能代替实际执行验证；恢复环境后仍需完成这些工作。

## 下一步

用户保存其他WSL任务后手动恢复WSL。README给出了保留旧STOP、新boot新epoch的
恢复和**整批重新开始**命令，不能跨此次失效区间补齐剩余56条。先完成新批首轮129条，
再按原任务逐方向实现、检查和43项初筛，最后补齐独立5轮。当前不能回答IO收益来自
分配还是读取，或AQ1/AP1/ST1谁胜出；这些问题缺少实际数据，而不是已有负结论。
