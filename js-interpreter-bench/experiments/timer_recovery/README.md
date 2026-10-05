# Timer recovery: MAIN_MONOTONIC_V1

本次只更换harness计时后端，不优化/重建/升级引擎，不修改冻结upstream workload。
旧SunSpider Date.now MAIN继续保留BLOCKED_TIMER，旧Windows实验与原163条pilot均不复用。

## 本轮完成状态（客户端日期 2026-10-05）

计时恢复、SunSpider 和 Octane 三项审计均 PASS，正式有效样本共 3,780 条。

| 实验 | 兼容交集 | 正式有效 / 期望 | N1/N2 correctness | 选定 N correctness | 审计 |
|---|---|---:|---:|---:|---|
| SunSpider | 26 cases | 2340/2340 | 156/156 | 78/78 | PASS |
| Octane | 13 完整 suites / 16 Runs | 1440/1440 | 96/96 | 48/48 | PASS |

总报告：[results.md](results.md)；可检查交付状态及两套结果 hash：
[summary/completed.json](summary/completed.json)。完整 raw、统计与各自审计在下方列出的 attempt01 目录。
SunSpider 保留中断前 1,463 条并续采 877 条，跨两个实际采样 boot；恢复说明见
[raw/resume01.md](raw/resume01.md)，不声称全程连续或功耗/温度完全隔离。
未启动 Prompt 5、引擎优化、推送或发布。

## 已完成证据

- `audit.json`: 单调计时链PASS；18个10秒独立短窗口累计180秒，逐窗口raw保存。
- `raw/`: 每个实际binary的clock binding、控制时长0/25/100/1000ms及180秒观察的完整命令、stdout/stderr与Python外部区间。
- `source/quickjs.txt`: upstream固定revision的quickjs-libc.c:2139–2143使用`clock_gettime(CLOCK_MONOTONIC)`；2162–2165返回浮点毫秒；4111–4114将`performance.now`接到该函数。
- `source/jsc_shell.txt`: 固定WebKit jsc.cpp:941–943注册performance.now；3555–3558使用MonotonicTime减去本进程origin并降低时间分辨率。
- `source/jsc_clock.txt`: WTF CurrentTime.cpp:298–309的Linux/GLIB单调来源。实际binary绑定进一步确认CLOCK_MONOTONIC调用。
- `raw/binding.{baseline,calls}.{quickjs,v8,jsc}.json`: LD_PRELOAD诊断计数对照，新增10000次benchNow调用产生CLOCK_MONOTONIC调用差值QJS10000、V8 10000、JSC10001。诊断.so不是引擎shell，正式采样无LD_PRELOAD/trace。
- `source/audit.json`: 固定V8版本tag参考revision的小文件获取失败（可信TLS链/网络）；没有关闭TLS验证。V8 exact artifact source/toolchain继续UNKNOWN，不把tag冒充artifact commit。当前实际binary的native clock binding与控制程序有运行证据。
- Linux Python `perf_counter`: 实际报告clock_gettime(CLOCK_MONOTONIC)、monotonic=true、adjustable=false；外部区间在subprocess之前开始、结束后停止。

benchNow捕获三个shell已有的native performance.now；单位均为浮点毫秒，仅本进程stop−start。
不覆盖Date.now、performance.now或workload的API；无新增QuickJS计时shell。
观察到的最小正步长：QJS约0.00012ms，V8约0.001ms，JSC约0.02ms；这不是所有调用/硬件的分辨率保证。
5ms容差比观察到的量化误差保守；只要求内部区间不能明显超过含启动/退出的外部包围区间，不要求相等。
负值/NaN/明显内部大于外部将阻塞新链；每条pilot/formal保存同一检查，不能因短探针PASS永久跳过门禁。

180秒观察中Date.now仍出现跳变：JSC窗口15的单调区间10000ms、外部10026.232352ms，但Date差值7840ms。Date仅诊断，不决定循环终止/校准或新mode gate。
原两个异常record的单位、script hash、stdout、命令/attempt、IIFE命名空间、Python subprocess边界已核对，未发现记录/边界bug；不能断言已排除一切软件问题。墙钟根因仍UNKNOWN。

## 新实验合同

`manifest.json`、`execution_contract.json`与`input_manifest.json`在本次采样前冻结。
旧Phase2合同的历史`selected_correctness_N`字段仅描述准备阶段，不作为本轮N；本轮实际策略在campaign config、selected_n及selected_correctness records：每case独立N1/N2，以及本轮选择的最小共同2的幂N。
指标为first-call-inclusive interpreter-mode execution time：第一次Run计时，无性能warmup；JSC首次frontend仍可计入。不是pure interpreter-loop self time或frontend-excluded strict。
必需Setup、输出、后置验证/TearDown在外；Run、循环/调用控制、GC、helper、builtin、RegExp、动态frontend与原in-Run断言在内。

## 实际运行 / Resume

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/timer_recovery/campaign.py all --attempt 01
```

先验证新时钟审计与全部冻结hash，再运行SunSpider；独立审计PASS后自动运行Octane。
所有记录write-once，失败保留；有效位置resume不会再次采样。完全新的独立复现使用新attempt（例如02）。
新raw/summary分别在：

- `../sunspider_three_engine/MAIN_MONOTONIC_V1/attempt01/`
- `../octane_three_engine/MAIN_MONOTONIC_V1/attempt01/`

只有新mode独立审计PASS才生成正式results。不会执行Prompt5、解释器优化或推送发布。
