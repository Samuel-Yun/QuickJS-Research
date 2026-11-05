# 时钟与时间线：单调区间通过，UTC标签不稳定

原始记录没有改写。`timeline_audit.json`覆盖1530个正式进程：全部同boot、
单调时间线串行且无重叠。第一条UTC为2026-10-31 08:21:41.630176，
最后一条为09:37:51.373196（北京时间16:21至17:37，仅作溯源）。

Python外部CLOCK_MONOTONIC覆盖的序列跨度4660.991555秒；各子进程区间之和
4529.110064秒，区间之间开销131.881490秒，与跨度相符。
UTC标签跨度4569.743020秒，比单调跨度少91.248535秒；出现过负的UTC间隙，
单条UTC间隔与对应单调间隔的最大差0.818082秒。原因UNKNOWN，不能用UTC
日期标签当秒表，也不能把UI工具显示的等待时长当采样进度。

主指标没有用Date.now、UTC或这些标签：JS使用预先捕获的原生单调performance.now；
Python外部区间使用perf_counter_ns。每条保存的内部区间均为正且在外部区间内，
时钟capability探针通过；post_identity记录Python实现为clock_gettime(CLOCK_MONOTONIC)，
monotonic=true、adjustable=false，分辨率1e-9秒（不等于端到端精度保证）。

因此没有用标签回跳去改样本、校准N或计算ratio；但WSL时钟/环境存在此可知限制，
不把本批小幅差异推广成其它主机/OS的稳定普遍结论。单一cohort的探索性bootstrap
也不代替独立环境复核。未调整系统时间、电源、governor或WSL配置。
