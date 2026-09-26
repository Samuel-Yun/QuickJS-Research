# Interpreter-mode execution time：SunSpider 26 cases

研究目的：在原始 SunSpider 1.0.2 source-to-finish 与已有 same-process external amortized 之外，新增**进程内、JS 内部计时**，观察计时边界逐步收窄时 QuickJS/V8 Ignition-only 的 `V8 median / QuickJS median` 如何变化。本实验不声称测到纯解释器循环自耗时。

## 冻结输入与执行模式

- Windows 11 x64 原生主机；QuickJS upstream 2026-06-04，`qjs.exe` SHA-256 `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`；V8 官方预编译 15.6.21，shell 为 `d8.exe`（非 Node.js），SHA-256 `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`。snapshot/ICU 与 SunSpider 文件由 `scripts/run_sunspider.py:verify_frozen_inputs` 每次校验。
- QuickJS 命令：`qjs.exe <generated-case.js>`；V8 命令：`d8.exe --snapshot_blob=<frozen snapshot_blob.bin> --max-opt=0 --no-lazy <generated-case.js>`。没有改动 engine、旧 benchmark 数据或 SunSpider workload 正文。
- JS 包装沿用已有 `experiments/frontend_isolation/run_repeated_mode.py` 的 `function workload(){...}` 和 checksum 表；本实验不在 timer 前调用 workload。旧包装脚本及旧 correctness CSV 的 SHA-256 在 [run_internal.py](run_internal.py) 中冻结。两引擎同 case/N 运行逐字相同的生成 JS（SHA-256 每条样本记录）。

## 为什么初始 frontend 在计时之前

- QuickJS 源码 `engines/quickjs-upstream/qjs.c:66` 用 `JS_Eval` 载入脚本；`quickjs.c:37280` 在执行顶层之前调用 `js_create_function`，其 `quickjs.c:36072-36085` 递归创建子函数及字节码。因此静态 `workload` 与子函数的初次编译发生在到达顶层 `timerStart` 之前。
- V8 15.6.21 [官方 tag](https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21) 对应 commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764`；该 commit 的 [`src/flags/flag-definitions.h`](https://chromium.googlesource.com/v8/v8/+/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/flags/flag-definitions.h) 第 3116–3118 行定义 `lazy=true`、`lazy_eval=true`、`lazy_streaming=true`。当前 d8 的 `--help` 也显示 `--lazy` 默认开启；本次用 `--no-lazy`，实际 `--print-flag-values` 显示 `--no-lazy`、`--max-opt=0`、`--no-sparkplug`、`--no-maglev`、`--no-turbofan`。
- [独立 lazy-order 探针](probes/lazy_order.js) 在默认模式下于 `MARKER_BEFORE_TIMER` 之后打印 `workload` 和子函数字节码；`--no-lazy` 下两者均在标记之前。[26 个实际 workload 的诊断记录](evidence/workload_bytecode/summary.csv)全部 PASS：`workload` 字节码输出先于计时标记。完整输出以 gzip 保存在同目录，生成脚本/输出的 SHA-256 也记录在表中。诊断运行不计入正式样本。
- `--max-opt=0 --no-lazy` 重新运行 500,000 次 [热点 tier 探针](../../benchmarks/probes/v8_tier_probe.js)，仍只见 `INTERPRETED_FUNCTION` 状态，未见 Sparkplug、Maglev、TurboFan 或 OSR 事件；完整 help、flag dump、bytecode 和 trace 见 [evidence](evidence/)，机器检查结果见 [summary.json](evidence/summary.json)。正式采样不带诊断 flag。

这些证据支持**静态 workload 的主要初次 source parse/bytecode generation 在 timer 前完成**。但它们不证明动态 `eval`、动态 RegExp 构造或其他运行时编译都已排除；实际 flag dump 中 `--lazy-eval` 仍为开启。具体每一次动态编译的耗时和次数是 **UNKNOWN**。

## 内部计时边界

生成 JS 的核心结构为：

```js
function workload() { /* 原 case 源码 + 沿用旧 checksum 返回表达式 */ }
var lastResult;
var timerStart = Date.now();
for (var repeatIndex = 0; repeatIndex < N; ++repeatIndex) lastResult = workload();
var elapsedMs = Date.now() - timerStart;
// 从这里开始做 checksum 检查和 console.log，均不计入 elapsedMs。
```

脚本读取/解析、进程与 VM 初始化、静态函数初次编译均在第一条 `Date.now()` 之前；第一次 workload 调用**包含**在 timed region，没有每进程 warmup。GC、runtime helper、builtins、regexp、workload 内的动态 `eval`，以及循环控制/计时器自身的微小开销仍可能落在 timed region。`Date.now()` 是两引擎共有的毫秒计时器，因此每次正式测量的校准门槛设为 1,000 ms；它不是高精度的解释器循环探针。

## 门禁、校准与统计

1. 独立 correctness：26 case × 2 engine × N=1/2，共 104 次；检查退出码、stderr、JS 输出、checksum，并与前一阶段已冻结的正确性结果核对。`3d-raytrace` 保留上游已记录的双长度哨兵，按各引擎冻结 checksum 验证。结果见 [correctness.csv](raw/correctness.csv)。
2. 校准从 N=1 开始严格二倍增长，取**第一个**同时使 QuickJS 与 V8 的内部 `elapsedMs ≥ 1000` 的 N；同 case 两边使用同一个 N。每次 pilot 保存在 [calibration.csv](raw/calibration.csv)，选择值见 [selected_n.csv](summary/selected_n.csv)。pilot 与正式样本严格分开。
3. 正式每 case/engine 30 个新进程样本，固定 seed `20260926` 每轮打乱 case 顺序，两个 engine 的先后顺序逐轮反转。原始数据保留 `elapsed_ms`、`elapsed_ns`、N、`per_call_ns = elapsed_ns/N`、外部墙钟诊断值、checksum、stdout/stderr、exit code、JS SHA，不删除 outlier。
4. 对每 engine/case 的 30 个 `per_call_ns` 计算 median、mean、样本 stddev（n−1）、Tukey median-of-halves IQR、min/max；ratio = V8 median / QuickJS median；跨 case 几何均值 = `exp(mean(log(ratio)))`。最终对照读取原始 [source-to-finish summary](../../results/processed/sunspider_summary.csv) 和 [external amortized summary](../frontend_isolation/summary/repeated_summary.csv)，二者 SHA-256 均在脚本中冻结，不重跑、不覆盖。

## 复现顺序

在**全新实验副本**的项目根目录运行；这些证据和 raw/summary 文件使用排他创建，现有结果不会被覆盖。

```powershell
python .\experiments\interpreter_mode_execution\verify_v8_no_lazy.py
python .\experiments\interpreter_mode_execution\run_internal.py correctness
python .\experiments\interpreter_mode_execution\run_internal.py calibrate
python .\experiments\interpreter_mode_execution\verify_workload_bytecode.py
python .\experiments\interpreter_mode_execution\run_internal.py measure
python .\experiments\interpreter_mode_execution\verify_full_n_correctness.py
python .\experiments\interpreter_mode_execution\run_internal.py summarize
python .\experiments\interpreter_mode_execution\audit_results.py
```

独立的选定 N 逐次 checksum 复核见 [full_n_correctness.csv](raw/full_n_correctness.csv)。第一次复核脚本使用顶层 `i`，与 `3d-raytrace` 的未局部声明变量冲突，导致检查异常变慢；已停止该独立尝试并保留 [attempt1 原始记录](raw/full_n_correctness_attempt1.csv)，修正版改用与正式包装一致的 `repeatIndex`，52/52 PASS。正式 1,560 条计时样本没有被修改。

最终结果和剩余 UNKNOWN 在 [results.md](results.md) 中汇总。**解释模式不能叫 pure interpreter-loop self time。**同时，V8 在本轮增加 `--no-lazy`，旧两轮没有；因此三个 ratio 的变化不仅是计时边界差异，不能从差值直接推算 frontend 占比。
