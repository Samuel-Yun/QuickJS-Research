# 六个小程序的字节码与执行路径（2026-10-15）

先读 [results.md](results.md)，再读 [walkthrough.md](walkthrough.md)；完整源码、两边目标函数 dump 和分组注释在 [case_notes.md](case_notes.md)。

本轮没有改动正式 VM、旧 benchmark 或旧数据。使用原 WSL2 Ubuntu 24.04.2 / x86_64 cohort；不是 Windows 数据，也不含 JSC。正式计时使用冻结 qjs（2026-06-04 / 04be246…、GCC 13.3、-O2）和官方 d8 15.6.21。完整绝对路径、SHA256、依赖、adapter 与运行前缀见 manifest.json。V8 保持 `--max-opt=0 --no-lazy` 与原 snapshot。模式验证沿用同 hash 制品的 `../../three_engine_baseline/probes/tier/summary.json`，本轮另存实际 flags。

## 入口命令

在当前仓库根目录（包含 js-interpreter-bench 的 Windows 目录）运行：

```powershell
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/bytecode_whitebox_simple/attempt01/run.py correctness
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/bytecode_whitebox_simple/attempt01/run.py dump
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/bytecode_whitebox_simple/attempt01/run.py calibrate
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/bytecode_whitebox_simple/attempt01/run.py measure
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/bytecode_whitebox_simple/attempt01/run.py summarize
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/bytecode_whitebox_simple/attempt01/run.py evidence
```

`all` 依次执行 prepare/correctness/dump/calibrate/measure/summarize，**不自动混入诊断计时**。已存在的位置级记录只读复用，禁止覆盖；这些命令在本 attempt 是 resume，不会重新采集已完成的位置。全新复现须建 attempt02，仅复制代码、cases 与 probes/ml_counters.h，不复制 manifest、raw、generated、summary 等产物。脚本以自身位置定位项目根目录。`representation.py` 是额外的 release/diagnostic 编译表示一致性检查；`audit_independent.py` 独立复核 CSV、原始记录及统计；`write_notes.py` 从本 attempt 原始文件生成逐案例阅读材料。

## 计时口径

名称：`FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_MONOTONIC_SIMPLE_V1`。使用已有 `benchNow`，捕获原生 `performance.now`，不使用 Date.now。启动、VM 初始化、静态编译、adapter 加载和对象建立在 timer 前；首次 target 调用也在 timer 内，无性能 warmup。内部重复 driver、checksum、调用、GC/helper/builtin 等实际成本计入；结束后才检查结果、打印。它不是 pure interpreter-loop self time。

同 case 两边运行 **同一个 generated/*.js 文件**。每次目标函数内部循环 4096 次；共同外层 N 分别为 16384、16384、8192。N 按 1/2/4…首次使双方内部 elapsed >=1000ms 选定，再用独立新进程复核。正式每组 30 个新进程，固定 seed 20261015；每 case 两种先后顺序各 15 次，轮内随机 case 顺序。所有 outlier 和低于校准门槛的正式样本保留。

`elapsed_per_call_ms=elapsed_ms/N` 是一次完整目标函数调用加摊薄 driver 成本，不是一次属性访问或指令的 self-time。checksum driver 显式使用 int32 回绕，**目标函数的和均不溢出**。Q1/Q3 使用线性位置 `(n-1)*p`（Python inclusive quantiles）；stddev 是样本标准差，ratio 是两组 median 的 V8/QuickJS 点估计。不对人为选取的三个案例计算总体 GM，不声称统计显著。

## 文件与证据

- cases/：共同目标源码、固定输入、独立数学预期配置。
- generated/：每阶段实际共同脚本；每条 raw 记录含脚本与目标 hash、命令、binary hash。
- bytecode/{quickjs,v8}/：真实 dump 与按 opcode/编码字节解析的结果；static_counts.csv 为静态指令数和字节数，排除池/调试表/feedback vector。
- raw/correctness/：36 个独立检查；raw/selected_correctness/ 为选定 N 的 6 个复核。
- calibration/：全部 pilot 与 selected N；raw/formal/：180 个位置级不可覆盖记录；raw/timing.csv：正式导出。
- summary.csv：median、Q1/Q3、mean、样本 std、IQR、min/max、ratio。
- source_evidence/、probes/、raw/diagnostics/：源码摘录、诊断补丁/头文件、独立路径计数、地址映射与失败记录；**不用于正式时间**。
- audit.json 是 runner 审计，independent_audit.json 是独立检查；后者明确区分实测属性计数与推导的逻辑 opcode 次数。

QuickJS dump 使用已有同 revision 的独立构建（DUMP_BYTECODE=1，只输出最终 JSFunctionBytecode）。qjs `-d` 是内存统计，不用于 dump。本轮计数构建只在独立目录；正式 qjs 从未替换。诊断源码与正式源码的差异、换行差异及序列化对照单独记录。V8 --print-bytecode 是实际 frozen binary；help 中出现的 --print-builtin-code 实际为 readonly，失败保留，改用独立 code-event + /proc/maps + ELF objdump 读取真实 handler。该地址证据不代表已采到内部每条分支。

恢复记录见 raw/*recovery.md：离线标题解析修复、辅助 else 预期值笔误、native 映射修复，以及临时诊断制品迁入持久目录；未改正式输入或统计口径。V8 精确源码 commit、compiler/GN 与 IC/native 分支命中率仍是 UNKNOWN。
