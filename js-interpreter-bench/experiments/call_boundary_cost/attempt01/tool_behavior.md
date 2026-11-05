# 工具行为与本轮安全边界

本轮2026-10-29只查以下必要文档：

- [setitimer Linux手册](https://man7.org/linux/man-pages/man2/setitimer.2.html)：ITIMER_PROF按进程用户态加系统态CPU时间推进；每种timer只有一份，投递时间受系统粒度与负载影响。标准信号不排队，不能由请求周期精确恢复丢失数。本轮保存每次投递的RIP与CLOCK_MONOTONIC，报告观测间隔，不把它叫硬件周期采样。
- [signal-safety Linux手册](https://man7.org/linux/man-pages/man7/signal-safety.7.html)：handler不能依赖stdio/分配等不可重入操作；clock_gettime可用于安全记录。sampler.c仅保存errno、用经检查的lock-free原子分配预分配槽、读ucontext和时钟、保存数字，最后恢复errno。映射/JSON/压缩/符号化全部在handler外。
- [GNU addr2line](https://www.sourceware.org/binutils/docs/binutils/addr2line.html)：用实际ELF将链接地址解析为函数/行号，-i保留inline链；未知行号可以是0/??。本轮先按ELF PT_LOAD与本进程maps归一化RIP，再结合实际反汇编、DWARF与共享控制流审查，不把一行源位置直接当精确self-time。

源码 sampler.c 与编译命令均公开。begin预触页并检查原handler/timer/线程；end在输出前停止timer、阻塞并drain pending信号，再恢复旧状态。SHIM_OFF与ON同一ELF、同一脚本，只改环境开关。两钩子在整个timed region外，没有逐次调用/opcode时钟或计数。本轮已有采样器方案之外不扩建工具；不安装perf、不sudo、不改内核权限，不禁用ASLR。

上述文档只支持工具行为，不是本工作负载的性能证据。实际扰动、投递粒度与分类可信度以新raw和各门禁表为准。
