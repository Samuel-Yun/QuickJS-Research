# 调用路径跟进：四组相同计算与原始 Richards

本轮不优化 VM、不缓存/外提方法、不复用暂停的 Richards A/B。历史数据不覆盖。
已完成：正式240/240、correctness24/24、shape8/8；独立审计PASS。
先读[results.md](results.md)，教学见[walkthrough.md](walkthrough.md)，原程序见[richards_analysis.md](richards_analysis.md)。
同一 WSL2 Ubuntu24.04.2/x86_64 cohort；冻结 QuickJS 2026-06-04 / 04be246… / GCC13.3 -O2，
官方 Linux d8 15.6.21，保持原 snapshot、`--max-opt=0 --no-lazy` 和可靠 `benchNow`。
完整绝对路径、制品/动态依赖/adapter hashes 在 manifest.json；功耗/频率和宿主后台隔离 UNKNOWN。

## 操纵与计时

四组内层 i=0..4095、bias=3，独立预期4096*4095/2+3*4096=8398848。
inline 在 caller 读 bias；direct_call 通过全局绑定 stepPlain(obj,i)，显式传两个参数；
own_method / prototype_method 逐次 obj.step(i)，共享逐字相同 caller/callee 源码，
区别仅为 timer 外对象建立方式，step 分别为 own 和深度1的继承数据属性。
shape、属性顺序/布局、feedback 状态可能随之不同；不把组间时间差当纯 lookup/call self-time。
没有 `.call/.bind`、方法外提或特定引擎的目标逻辑分支。

正式 mode 沿用 FIRST_CALL_INCLUSIVE_INTERPRETER_MODE_MONOTONIC_SIMPLE_V1：
process/VM/源码加载和静态编译、对象创建在 timer 外；首次目标调用、剩余 N-1 次、
循环/driver/int32 checksum、实际 GC/helper/runtime 成本在内；校验和输出在后。
checksum 显式 int32 回绕，目标结果本身不溢出。没有 workload 性能预热，不称整个区间全冷态。
正式进程没有 trace、profiler、插桩或 LD_PRELOAD。

校准：N=1,2,4…；首个双方 pilot 都>=1500ms 时，再各用3个独立新进程复核，
全部>=1200ms才接受，否则翻倍。留出余量，但不保证每个正式样本都过1秒；偏短样本保留。
四组各2引擎×30新进程，seed20261017，先后顺序各15次，轮内组别顺序打乱。
每个组两引擎使用相同 N 和逐字相同 generated JS。Q1/Q3 使用线性位置(n-1)*p；
std 是样本标准差；ratio 是 V8 median / QJS median；不计算四组总体GM。

## 命令（PowerShell）

```powershell
$entry = '/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/call_path_followup/attempt01/run.py'
wsl.exe -d Ubuntu -- python3 $entry prepare
wsl.exe -d Ubuntu -- python3 $entry correctness
wsl.exe -d Ubuntu -- python3 $entry dump
wsl.exe -d Ubuntu -- python3 $entry paths
wsl.exe -d Ubuntu -- python3 $entry calibrate
wsl.exe -d Ubuntu -- python3 $entry measure
wsl.exe -d Ubuntu -- python3 $entry summarize
```

首次可用 `run.py all`；上述顺序先 prepare，再正确性/dump/路径门禁后计时。
本 attempt write-once/resume，不重采已有位置；全新复现应建立新 attempt，仅复制代码/cases/probes源码。
本轮重用旧入口的捕获、共同 driver、解码器和时钟，旧文件本身不修改。

Richards 独立诊断（不能与正式计时并行运行）：

```powershell
$diag = '/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/call_path_followup/attempt01/richards.py'
wsl.exe -d Ubuntu -- python3 $diag all
```

小程序额外独立PC诊断入口为`sample_simple.py`；离线核验/逐条笔记为`analyze.py`，
原程序离线抽取为`richards_report.py`，编译表示/handler核对为`artifacts.py`。
这些命令均可resume，诊断不与正式性能进程并行；不会重新采已完成的正式位置。

原始脚本直接拼接冻结 upstream base.js / richards.js 原字节，没有定义 method.call 或替换方法。
运行时 JS entry/shape 计数副本明确标 DIAGNOSTIC_JS_COUNTS，patch单独保存；它会改变字节码，
不用于原程序 dump/正式性能。另复用独立 QJS native hooks，不改变 JS 原算法。
V8 --prof 为整进程 top-PC；QJS 单独 SIGPROF/ITIMER_PROF LD_PRELOAD 采样冻结 Release binary，
保存实际映射并用 addr2line 定位，按 CLOCK_MONOTONIC 截取内部区间。均无完整 JS 栈归因，
样本比例不跨引擎换算绝对成本；插桩或采样时间绝不进入正式统计。

## 文件

- cases/、generated/：相同输入和标准 JS driver，manifest/逐条 raw 记录 SHA256。
- bytecode/<case>/{quickjs,v8}/：原始输出、函数块和可靠解码；own/prototype 两次都留存。
- calibration/：pilot、三次独立复核与选定 N；raw/formal/：240个不可覆盖原始位置。
- summary.csv、raw/timing.csv：完整统计与原始记录导出。
- richards/：未修改原程序、三次独立采样、真实原函数 dump、诊断副本。
- source_evidence/：源码身份、复用工具、静态对应、保护检查与诊断 patch。
- results.md、case_notes.md、walkthrough.md：中文结论、逐组对应与教学说明。
- audit.json、independent_audit.json：runner与独立核验。所有 UNKNOWN 保留。
