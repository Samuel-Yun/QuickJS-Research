# Octane strict interpreter-mode execution

这是新增实验，旧 `experiments/octane/`、SunSpider 各模式、binary、VM 源码及 PPT/tex 全部不修改。
正式结果文件只有完整性审计 PASS 后才能称为完成；审计与实现先于 calibration/formal。

## 冻结对象

- QuickJS upstream 2026-06-04，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，原 GCC13.1.0 `-O2` binary。
- Engine=V8，Shell=d8（不是 Node.js），15.6.21，原官方 prebuilt d8/snapshot/ICU。
- Octane 2.0，`https://github.com/chromium/octane.git`，commit `570ad1ccfe86e3eecba0636c8f932ac08edec517`。所有 upstream 文件按旧 `experiments/octane/upstream_sha256.txt` 验证；不下载/更新。
- 具体绝对路径、SHA256、主机、电源计划、timer 探测见 `environment.txt`、`config.json`。
- 正式 V8 flags **仅** `--max-opt=0 --no-lazy`，另显式固定 `--snapshot_blob=...`；诊断 trace flags 不进入正式计时。QuickJS 无 runtime flags。

## 定义与审计

先读 `harness_audit.md`。原 suite 拆成16个官方 Benchmark.run 单元；同一单元两个 engine 用同一个已校准 N。

```text
新进程 → VM初始化 → 同一拼接JS文件的静态编译 → 必需Setup
  [均不计时；没有提前运行所选Run做性能warmup]
timer_start
  for (i=0; i<N; i++) test.run();
timer_stop
  correctness/必要验证续跑 → TearDown → 输出 → 退出
```

名称：**Octane strict interpreter-mode execution time**，不是 pure interpreter-loop self time。
计入 call/loop 控制、Run 中已有断言/统计、runtime helper、IC、GC、builtin、regexp、动态 eval；计时外的 Setup 可能改变共享 helper/heap 状态。
RegExp 只保留输入构造，删原 Setup 内一次性能 priming Run；Crypto Decrypt 必需用 encrypt 一次造输入，未提前调用 decrypt。
NavierStokes N<15 的校验续跑发生在 timer_stop 后，不倒算成 timed N；正式 raw 保存额外验证调用数。

## Timer

先在 base.js 加载前探测两 shell 原生 performance.now：两者存在，但 QuickJS Windows `quickjs-libc.c:2131–2165` 底层是 gettimeofday，不能由短 smoke 证明其单调性。
因此主模式统一采用 Date.now，观察到双方1-ms步进，沿用 SunSpider strict。
1 s calibration 的1-ms量化阶约0.1%，不是完整误差上界；墙钟调整/调度/热状态仍有限制。
各 Run 原有的 performance.now bookkeeping 不改写；这是 workload 原语义的一部分，不是外层 strict timer。

## 运行顺序与命令

从项目根目录 `js-interpreter-bench` 运行：

```powershell
python -B experiments/octane_strict/run_strict.py smoke
python -B experiments/octane_strict/run_strict.py frontend
python -B experiments/octane_strict/run_strict.py tier
python -B experiments/octane_strict/run_strict.py correctness
python -B experiments/octane_strict/run_strict.py calibrate
python -B experiments/octane_strict/run_strict.py selected-correctness
python -B experiments/octane_strict/run_strict.py pilot
python -B experiments/octane_strict/run_strict.py formal
python -B experiments/octane_strict/summarize.py
```

首次可用 `python -B experiments/octane_strict/run_strict.py all`。`-B` 仅防止 Python 在读取旧 prepare 模块时生成 pycache，不是 engine flag。中断后优先重跑对应缺失 stage；`formal` 自动跳过同一 suite/benchmark/engine/N/iteration 的已有 valid sample。不会更新 binary 或 jsvu。
新的 config 校验冻结 driver/runner SHA。上游原文件逐字节拼接，仅添加 `driver.js`；两个 engine 使用相同 generated script、相同参数 N/mode/timer（shell 参数传递差异仅 transport shim）。

## Calibration / correctness / sampling

独立 correctness N1、N2 在 calibration 前；selected N 在 calibration 后额外验证。原 Run 自带 assertion 保留；Crypto Encrypt 仅独立 correctness 模式逐次额外 decrypt，正式只在 timer 后验证末次。其他依 upstream 原逐次/整段验证能力，不伪造 checksum。
若 selected N=1，已有同一脚本/flags的 N1 PASS gate 可复用，不产生重复行；本次 Mandreel/Typescript 均为 N1，因此全部条件覆盖时是92条独立 correctness 记录，而非96条。
N=1,2,4,...；选首次双方内部 elapsed≥1000 ms 的共同 N。pilot 和每个正式样本都用新进程，无跨进程 warmup 状态。
每 engine/subbenchmark30次；每轮随机打乱 subbenchmark，engine顺序轮流交错，每单元两方各15次先运行，seed20260928。`schedule.json` 保存所有预定位置。
逐条CSV flush/fsync；失败、stderr、原 stdout、命令、脚本SHA、时间戳完整保留。正式 <1s 样本照实保留，不删 outlier。单个样本 timeout=300s；calibration最大N65536为安全边界，触发则NOT_COMPARABLE而不是伪造结果。
zlib/Box2D 继续排除；其他失败明确记 compatibility，不能静默删除。

## 统计

按 elapsed_ms/N（ms/Run）计算 median、mean、sample stddev(n−1)、Tukey median-of-halves IQR、min/max、CV=stddev/mean。
每 subbenchmark ratio = V8 median / QJS median；suite ratio为其subbenchmark ratios的等权GM；overall为suite ratios等权GM。ratio<1表示V8更低，>1表示QJS更低；tie只用数学相等，不虚构显著性。
旧 native 是先每sample取subbenchmark time GM再取median，与新聚合不完全可交换；三模式原统计保持原值，不称该差值是frontend占比。
敏感性名单先于采样固定：窄版排除RegExp/CodeLoad；宽版另排除Mandreel/Typescript，依据mechanism而非结果。主结果不排除它们。

## 输出

`probes/` 保存全新 smoke、实际Run frontend顺序、500k tier trace和flag dump；前期诊断解析失败与修订也保留。
`raw/calibration.csv` / `calibration_runs.csv`、`raw/pilot.csv`、`raw/measurements.csv`、`raw/failures.csv`。
`correctness.csv`、`compatibility.csv`；`summary/strict_summary.csv`（subbenchmark完整统计）、`suite_summary.csv`、`three_mode_comparison.csv`、`audit.json`、`results.md`。
`plots/ratio_by_suite.svg`、`three_mode_ratio.svg`；`group_meeting_update.md`，不自动改PPT。
