# 新boot的恢复尝试：仍被计时复检阻塞

按“继续完成任务”实际恢复执行。工作区仍为myx，仅v7目录未跟踪，保护全部前轮文件。
新boot为`bf4a2c0e-4821-410b-a26d-acddb0e5a61c`，未发现其他实验/构建进程。

1. `V7_EPOCH=restored01 python3 run.py recover`：30秒检查触发已冻结RAW对照门槛，
   漂移0.776908460秒。原入口在assert前未保存观测数组，该数组标缺失，没有反造。
2. 最后一次检查固定CPU2，Windows Stopwatch包住命令，实际各运行一次A、s001的zlib。
   二者exit0、correctness PASS、stderr为空。30秒空闲段MONOTONIC/RAW差0.548646868秒；
   A负载外层分别8.291814823/7.922253384秒，s001分别7.919165525/7.674947506秒。

这次Windows外层49.8287905秒确实包住Linux内层；**没有重现**旧boot的外层包不住内层
现象。不能说新boot也证明MONOTONIC超过Windows区间。当前只可确认两个Linux时钟
差异仍超过冻结门槛，固定CPU不能充分解释它，哪个时钟准确及底层原因均UNKNOWN。

旧73条measurement继续隔离，本次仅新增2个诊断负载，新增正式采样0条。
P1首轮和全部新候选性能仍未完成。没有把新诊断时间填入comparison表。

只读检查显示当前clocksource=tsc，可用另一个hyperv_clocksource_tsc_page。
临时切换是下一项可尝试的环境干预，不能保证解决；它是系统设置，未经新授权未执行。
没有关闭校时服务、重启发行版、改编译参数、换计时协议或提高门槛。

证据：`precheck.restored01.1.json`、`precheck.restored01.2.raw.json`、
`precheck.restored01.2.host.json`和`precheck.restored01.2.json`。
若用户授权临时切换：先保存原clocksource并确认其他WSL任务不受影响，只写当前
boot的clocksource，不改持久配置；再以新epoch恢复，保留旧STOP及两次失败。
若复检通过，完整重开A/s001/P1的129条首轮，然后继续候选实现和测试。
