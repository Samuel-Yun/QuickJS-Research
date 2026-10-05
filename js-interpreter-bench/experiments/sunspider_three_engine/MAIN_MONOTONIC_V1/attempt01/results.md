# SunSpider: MAIN_MONOTONIC_V1

## 实验事实 / Confirmed observations

- Cohort: `wsl2-ubuntu2404-x64-20261004`，同一 WSL2 Ubuntu 24.04.2 x86_64 主机；不是 Windows/native Linux 结果。
- 指标：**first-call-inclusive interpreter-mode execution time**，每 sample 新进程；`benchNow()` 浮点毫秒差值仅包住第一次 Run 和后续 Run × N。没有性能 warmup。
- source loading、adapter、必需 Setup 在外；GC、helper、builtin、RegExp、运行中 eval/Function、首次调用仍需的准备和原 Run 断言按实际行为计入。
- QuickJS 2026-06-04/04be246；V8/d8 15.6.21 `--max-opt=0 --no-lazy`；JSC/fd3406f `--useJIT=false --useLLInt=true --validateOptions=true`。完整路径/hash/依赖：`manifest.json`。正式命令没有诊断 trace/LD_PRELOAD。
- N1/N2 correctness: 156/156 valid；selected-N correctness: 78 valid。失败及 exclusions 见 `compatibility.csv`、`failures/`。
- 正式有效 2340/2340（兼容预算）；原全部候选预算 2340。
- 每组30；每case六种排列各5次，每引擎每位置10次。`schedule.json`、逐条 command/script hash/checksum/stdout/stderr 在 `records/`；CSV 在 `raw/`。
- 审计 PASS：数量/顺序/flags/hash/正确性/每条时钟链/统计重算/旧数据保全。低于pilot1000ms的正式样本 5 条仍保留；不删 outlier。
- 完整三引擎共同交集 26：3d-cube, 3d-morph, 3d-raytrace, access-binary-trees, access-fannkuch, access-nbody, access-nsieve, bitops-3bit-bits-in-byte, bitops-bits-in-byte, bitops-bitwise-and, bitops-nsieve-bits, controlflow-recursive, crypto-aes, crypto-md5, crypto-sha1, date-format-tofte, date-format-xparb, math-cordic, math-partial-sums, math-spectral-norm, regexp-dna, string-base64, string-fasta, string-tagcloud, string-unpack-code, string-validate-input.
- GM: V8/QJS = 0.621430; JSC/QJS = 0.733306; JSC/V8 = 1.180030.
- 每组 median、mean、样本stddev（n−1）、Tukey IQR（下15/上15各取median）、min/max：`summary/per_case.csv`。ratio = 分子 median / 分母 median；大于1表示分子耗时更多。
- 三组 GM 均用同一完整交集，exp(mean(log(ratio)))。SunSpider每case等权。

| Case / Run | QJS ms/call | V8 ms/call | JSC ms/call | V8/QJS | JSC/QJS | JSC/V8 |
|---|---:|---:|---:|---:|---:|---:|
| 3d-cube | 22.283033 | 19.647004 | 10.628047 | 0.881702 | 0.476957 | 0.540950 |
| 3d-morph | 14.292403 | 19.198434 | 13.594219 | 1.343261 | 0.951150 | 0.708090 |
| 3d-raytrace | 16.043928 | 16.672812 | 14.355937 | 1.039198 | 0.894789 | 0.861039 |
| access-binary-trees | 12.932443 | 6.216383 | 14.172656 | 0.480681 | 1.095899 | 2.279888 |
| access-fannkuch | 37.625079 | 35.988578 | 24.212187 | 0.956505 | 0.643512 | 0.672774 |
| access-nbody | 16.582091 | 21.606371 | 11.617109 | 1.302994 | 0.700582 | 0.537671 |
| access-nsieve | 19.921733 | 10.688709 | 6.417852 | 0.536535 | 0.322153 | 0.600433 |
| bitops-3bit-bits-in-byte | 9.878314 | 7.405188 | 6.359023 | 0.749641 | 0.643736 | 0.858726 |
| bitops-bits-in-byte | 20.354709 | 20.430727 | 15.371875 | 1.003735 | 0.755200 | 0.752390 |
| bitops-bitwise-and | 7.599853 | 9.761812 | 8.249727 | 1.284474 | 1.085511 | 0.845102 |
| bitops-nsieve-bits | 14.680993 | 24.155313 | 22.379766 | 1.645346 | 1.524404 | 0.926495 |
| controlflow-recursive | 7.516253 | 6.880354 | 6.633086 | 0.915397 | 0.882499 | 0.964062 |
| crypto-aes | 15.374573 | 14.638492 | 10.913750 | 0.952123 | 0.709857 | 0.745552 |
| crypto-md5 | 7.134008 | 8.042813 | 5.944141 | 1.127390 | 0.833212 | 0.739062 |
| crypto-sha1 | 6.844593 | 8.937252 | 5.845352 | 1.305739 | 0.854010 | 0.654044 |
| date-format-tofte | 30.944497 | 9.394750 | 12.378047 | 0.303600 | 0.400008 | 1.317549 |
| date-format-xparb | 23.112076 | 4.494123 | 8.255820 | 0.194449 | 0.357208 | 1.837026 |
| math-cordic | 24.217662 | 18.512641 | 19.671719 | 0.764427 | 0.812288 | 1.062610 |
| math-partial-sums | 11.858211 | 13.085898 | 10.308516 | 1.103531 | 0.869315 | 0.787758 |
| math-spectral-norm | 8.895600 | 9.253430 | 11.238203 | 1.040225 | 1.263344 | 1.214491 |
| regexp-dna | 69.468107 | 2.000328 | 100.776719 | 0.028795 | 1.450690 | 50.380094 |
| string-base64 | 16.595392 | 6.724713 | 9.850508 | 0.405216 | 0.593569 | 1.464822 |
| string-fasta | 24.270108 | 10.969004 | 13.518672 | 0.451955 | 0.557009 | 1.232443 |
| string-tagcloud | 23.801523 | 6.084734 | 19.388398 | 0.255645 | 0.814586 | 3.186400 |
| string-unpack-code | 46.261552 | 7.037482 | 13.551602 | 0.152124 | 0.292934 | 1.925632 |
| string-validate-input | 12.072697 | 5.980937 | 11.228125 | 0.495410 | 0.930043 | 1.877319 |

代表性差异和反例（每组ratio的最小/最大，不是原因解释）：

- V8/QJS: minimum `regexp-dna` 0.028795；maximum `bitops-nsieve-bits` 1.645346。
- JSC/QJS: minimum `string-unpack-code` 0.292934；maximum `bitops-nsieve-bits` 1.524404。
- JSC/V8: minimum `access-nbody` 0.537671；maximum `regexp-dna` 50.380094。

按预先固定机制标签的敏感性子集：`summary/pairwise_summary.csv`（交集逐项保存）。不是去掉builtin后的“纯解释器”。

## 可能解释 / Possible explanations

差异可能涉及解释器、首次调用准备、IC/对象/GC状态、native helper/builtin/RegExp和workload机制；当前总区间无法定量拆分。时钟变化与平台迁移不等于性能原因。

## UNKNOWN

- JSC首次调用frontend成本、占比及全部静态callee的提前准备覆盖仍UNKNOWN；计时后端改为单调时钟没有移除这部分。
- V8官方prebuilt精确source/toolchain provenance未提供的字段保持UNKNOWN；版本tag源码参照不当作artifact源码证明。
- 原Date.now墙钟跳变的根因（host/WSL/NTP具体来源）仍UNKNOWN。新门禁只依赖已验证的单调链，不需要墙钟稳定。
- 实际物理频率/温度/后台隔离和逐case各机制占比UNKNOWN。

## 限制

- 不是pure interpreter-loop self time，不是frontend-excluded strict；V8禁JS tier不等于禁一切native/generated code。JSC useJIT=false的RegExp策略与V8默认策略不同，单独披露，RegExp不作为dispatch证据。
- Date.now仍可能被原workload用于统计/分支；没有全局替换。新harness的终止和预算只依赖固定N/benchNow。
- 旧Windows与Date.now raw/summary完全保留且hash核对，不与本cohort相除。没有优化、升级、旧pilot复用或warmup诊断混表。
- 控制探针PASS不是永久时钟保证；每个pilot/formal都保留内部<=外部+5ms的一致性检查。外部含启动/退出，不要求相等。

## 复现 / Resume

在Windows PowerShell：

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/timer_recovery/campaign.py all --attempt 01
```

有效位置resume不重复采样；所有输入冻结，不自动更新引擎。新的完整独立复现用新的两位attempt（例如02），保留本次attempt。SunSpider审计PASS后自动执行Octane；不执行Prompt5。
