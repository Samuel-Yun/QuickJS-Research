# Octane 2.0: QuickJS 与 V8 Ignition-only

本实验检查更长、更重的 JavaScript workload 下，两种**固定解释器执行模式**的关系是否与第一轮短 SunSpider source-to-finish 一致。它不是纯 interpreter-loop 微基准，也不把 Octane 与 SunSpider 的总体数字视为相同 workload 的配对比较。

## 来源与冻结

- 官方项目：[chromium/octane](https://github.com/chromium/octane)，Git 仓库 `https://github.com/chromium/octane.git`。
- 仓库 `README.md` 标识 Octane 2.0；`base.js` 中 `BenchmarkSuite.version = '9'` 是**得分格式版本**，不是另一个 Octane 版本。
- 冻结 commit：`570ad1ccfe86e3eecba0636c8f932ac08edec517`。用该 commit 的浅克隆，不混合其他版本、archive 或第三方修改版。
- 上游 tracked 文件的逐文件 SHA-256：[upstream_sha256.txt](upstream_sha256.txt)；该清单 SHA-256：`226ae24b505ce3190584173b7ecd25bb473d7899294fb7f87bddccbb37b969f6`。脚本每次核对 commit 和洁净工作树，生成后的 JS 如与已有文件不同则拒绝覆盖。原仓库在 `benchmarks/octane/upstream/`，没有改动。
- 参考官方 `run.js` 的加载顺序，把原封不动的 `base.js` 与对应 suite 文件串接为单个 JS 文件，再附一个**双方完全相同**的 shell 驱动。这样不需要给 QuickJS 伪造 d8 的 `load()`，也没有修改 workload。可审计的驱动生成代码在 [prepare.py](prepare.py)；不存在对上游源码的 patch。

15 个原始 suite：Richards、DeltaBlue、Crypto、RayTrace、EarleyBoyer、RegExp、Splay、NavierStokes、PdfJS、Mandreel、Gameboy、CodeLoad、Box2D、zlib、Typescript。原始 runner 会另报告 Splay/Mandreel latency 子得分；本实验的时间比只分析各 suite 的 throughput workload，不等同于官方 Octane 总分。

## 冻结引擎

- 同一台 Windows 11 x64 原生主机，AMD Ryzen 7 5800H（8 个物理核 / 16 个逻辑处理器，RAM 约 15.86 GiB）；机器证据见 [Windows 平台记录](../../notes/platform_windows.md) 与 [baseline manifest](../../baseline_manifest.md)。
- QuickJS：`engines/quickjs-upstream/qjs.exe`，upstream 2026-06-04，SHA-256 `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`。
- V8：官方预编译 `engines/v8-official-15.6.21/runtime/d8.exe`，V8 15.6.21，SHA-256 `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`。Shell 是 **d8，不是 Node.js**。命令固定 `d8.exe --snapshot_blob=<冻结的 snapshot_blob.bin> --max-opt=0 <case.js>`；环境与资源 SHA 校验复用 `scripts/run_sunspider.py:verify_frozen_inputs`。Ignition-only 证据见 `notes/v8_interpreter_validation.md`；本阶段没有改 runtime flags 或重新构建引擎。

## 兼容性与正确性

先对所有 15 个 suite、每引擎各跑一次原始 Octane harness。它执行内置 setup、warmup、测量、tearDown 和断言；非零退出、stderr、缺少完成标记或超时均不算 PASS。完整 stdout/stderr/exit code 在 [raw/compatibility_runs.csv](raw/compatibility_runs.csv)，分类及纳入决定在 [compatibility.csv](compatibility.csv)。

zlib：QuickJS 因原始 `zlib-data.js` 使用 d8 风格 `read()` 而报 `ReferenceError`，标 `UNSUPPORTED`，未移植；V8 PASS。Box2D：两引擎均可运行，但原始 `runBox2D` 没有输出校验或断言，虽为兼容 PASS，**不满足本实验的 correctness gate**。因此正式交集为 13/15；失败 case 没有静默删除。部分 suite 的“内置正确性”覆盖面有限；没有额外发明 checksum。

## 两种正式测量

1. `fixed_source_to_finish`：每次启动新进程，同一 suite 中每个 benchmark 各跑 `minIterations × multiplier` 次；multiplier 在计时前校准，要求两引擎单次进程墙钟均至少 500 ms，选择与两引擎一致并记录在 [selected_work.csv](selected_work.csv)。使用 `time.perf_counter_ns()` 从 `subprocess.run` 前到返回后计时，包括启动、VM 初始化、源文件读取/解析/编译、setup、固定次数运行、tearDown、输出和退出。**无显式 warmup**；校准/正确性运行不计入正式样本。固定驱动没有更改原 workload 函数；每次的上游断言仍执行。
2. `native_frontend_amortized`：按原始 `BenchmarkSuite.RunSuites` 驱动执行，记录上游 `BenchmarkResult.time`（`base.js:291-334`，微秒/`benchmark.run()`）。原始 harness 通常以每个 benchmark 至少约 1 秒的测量窗口反复调用；**遵循每个 benchmark 原有 `doWarmup`、`doDeterministic`、`minIterations` 设置**，并非统一预热。计时在 JS 内部，不包含外部 process/source 启动的总墙钟；但可能含惰性编译、GC、builtins、动态 `eval` 等，不能称为纯解释器时间。特别是 CodeLoad 每次运行会动态解析/编译代码，本模式只摊薄 suite 初次载入，**没有**摊薄这个 workload 自身的动态 frontend。多子 benchmark 的 suite 用每个 `BenchmarkResult.time` 的几何均值作 suite 时间，与 `base.js:248-250` 的 throughput 合成方式一致；Splay/Mandreel latency 子得分另算，不在该时间比中。原 harness **按时间预算运行**，故绝不使用它的外层进程墙钟来判断性能。

原生 harness 的 `doWarmup=true` suite 是 Richards、DeltaBlue、Crypto、RayTrace、EarleyBoyer、RegExp、Splay、NavierStokes；`doWarmup=false` 是 PdfJS、Mandreel、Gameboy、CodeLoad、Typescript。纳入交集中的 Typescript 还设 `doDeterministic=true`、每轮 5 次，其余使用原有时间预算；这些设置可从对应上游 JS 的 `new Benchmark(...)` 定义核对。两种模式均未在正式样本前另加统一 warmup。

两模式均每 case/engine 10 次正式重复；每轮固定 seed `20260925` 打乱 case 次序，两个 engine 顺序交替。完整原始样本、stdout、stderr、脚本 SHA、外层墙钟以及正式指标见 [raw/measurements.csv](raw/measurements.csv)；校准过程见 [raw/calibration.csv](raw/calibration.csv)。全部样本保留、不删除 outlier。统计见 [summary.csv](summary.csv)：median、mean、样本标准差（`n−1`）、Tukey median-of-halves IQR、min/max；ratio = V8 median / QuickJS median；跨 suite geomean = `exp(mean(log(ratio)))`。两模式分别统计，不能混用。

## 复现命令

在一个**新的项目副本**中，先从官方仓库取精确 commit；当前副本已经有冻结 checkout，勿再次下载或覆盖。下面的 `fetch` 通过 commit SHA 固定版本，而非随 master/latest 更新。

```powershell
git init .\benchmarks\octane\upstream
git -C .\benchmarks\octane\upstream remote add origin https://github.com/chromium/octane.git
git -C .\benchmarks\octane\upstream fetch --depth 1 origin 570ad1ccfe86e3eecba0636c8f932ac08edec517
git -C .\benchmarks\octane\upstream checkout --detach FETCH_HEAD
```

然后在项目根目录运行以下命令。脚本对已有正式原始数据采用排他创建；**不要直接重跑覆盖本次结果**。需要复现时先使用独立实验目录并调整输出路径。

```powershell
python .\experiments\octane\prepare.py
python .\experiments\octane\run_octane.py compatibility
python .\experiments\octane\run_octane.py calibrate
python .\experiments\octane\run_octane.py benchmark
python .\experiments\octane\run_octane.py summarize
python .\experiments\octane\plot_results.py
```

当次结果与保留疑点见 [notes.md](notes.md)。本实验没有下载或修改 QuickJS/V8，亦没有修改 SunSpider 首轮数据。
