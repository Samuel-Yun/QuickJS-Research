# Timer recovery + completed three-engine comparison

## 实验事实

- 同一冻结WSL2 Ubuntu 24.04.2 x86_64 cohort；并非Linux-native主机或旧Windows实验。
- MAIN_MONOTONIC_V1；benchNow捕获三个已有native performance.now；固定N，首次Run计时，无性能warmup。没有新QuickJS计时shell/引擎重建。
- 原异常record/source/stdout/单位/边界核对未发现记录或subprocess包围bug；墙钟根因仍UNKNOWN。
- 新native-clock binding与0/25/100/1000ms控制、180秒分窗口观察PASS；每个新pilot/formal内部/外部一致性门禁保留。旧Date.now MAIN仍BLOCKED_TIMER，原数据hash保全。

| Benchmark | Valid / compatible budget | All-candidate budget | Complete intersection | V8/QJS GM | JSC/QJS GM | JSC/V8 GM | Audit |
|---|---:|---:|---:|---:|---:|---:|---|
| SunSpider | 2340/2340 | 2340 | 26 | 0.621430 | 0.733306 | 1.180030 | PASS |
| Octane | 1440/1440 | 1440 | 13 | 0.544626 | 0.755390 | 1.386989 | PASS |

ratio大于1表示分子耗时更多；全部采用相同完整三引擎交集。SunSpider等case权重；Octane subbenchmark ratio→完整suite内GM→suite间等权GM，不是官方Octane得分。

## 代表性差异与反例

- SunSpider V8/QJS: `regexp-dna` 0.028795；`bitops-nsieve-bits` 1.645346。
- SunSpider JSC/QJS: `string-unpack-code` 0.292934；`bitops-nsieve-bits` 1.524404。
- SunSpider JSC/V8: `access-nbody` 0.537671；`regexp-dna` 50.380094。
- SunSpider 正式有效样本按 WSL boot ID 计数：`{"3e035c9e-fd4d-4283-a7ce-c1d3e4721a0a": 1463, "94e240b1-774a-4fdc-8be3-8b5e85457d9d": 877}`。
- Octane V8/QJS: `RegExp.RegExp` 0.107069；`NavierStokes.NavierStokes` 1.212562。
- Octane JSC/QJS: `EarleyBoyer.Boyer` 0.522761；`Gameboy.Gameboy` 1.112764。
- Octane JSC/V8: `Crypto.Decrypt` 0.722061；`RegExp.RegExp` 7.727430。
- Octane 正式有效样本按 WSL boot ID 计数：`{"94e240b1-774a-4fdc-8be3-8b5e85457d9d": 1440}`。

各case完整median/mean/sample stddev/IQR/min/max及敏感性子集见两个attempt的summary。原始输出/命令/hash/clock检查见records，raw CSV只是其导出。

## 可能解释

两套workload的GM不同可能涉及不同算法、对象/GC/helper/builtin/RegExp、动态编译和首次调用准备。benchmark集合与等权单位也不同；不能把两GM差值等同于frontend占比或单纯“时间变长”的因果效应。

## UNKNOWN 与限制

- JSC首次函数准备/bytecode及其成本仍UNKNOWN/可计入。新时钟不等于删除frontend。动态eval/Function、GC、native helper及builtin仍属于实际区间。
- V8允许native RegExp编译，但本次实际native执行未证明；JSC useJIT=false禁RegExp JIT，QuickJS是C regex VM。RegExp不是纯JS dispatch证据。
- V8 artifact exact source/toolchain、墙钟根因、逐sample物理频率/温度/后台隔离及性能差异归因UNKNOWN。
- SunSpider 因客户端/WSL 中断跨 boot 恢复，有效位置未重采；恢复时主机、kernel、runtime/dependency/input hash 核验通过。各 boot 的单调绝对读数不相减，墙钟 timestamp 只作元数据。重启前后温度、功耗与后台负载可能不同，不能声称连续运行或环境完全隔离；详见 `raw/resume01.md`、`raw/environment.recovery01.json`。
- 不称pure interpreter-loop self time；不与旧Windows/失败Date.now数值相除；没有IC on/off、引擎优化或Prompt5。

## 证据与复现

- `audit.json`、`source/`、`raw/`：计时链；`adapter_impact.md`：adapter进入区间的明确影响。
- `summary/completed.json`：两个已完成审计及结果文件hash；两套attempt中各自manifest、contract、input hashes、schedule、raw、summary/audit/results。
```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/timer_recovery/campaign.py all --attempt 01
```

该命令resume有效位置不重新采样；全新独立复现使用新的两位attempt。已完成本轮，停止，不推送/发布。
