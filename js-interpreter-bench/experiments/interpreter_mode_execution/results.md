# SunSpider interpreter-mode execution time：证据与结果

实验日期：2026-09-26。范围是**同一批冻结的 SunSpider 1.0.2 standalone 26 cases**，对照前两阶段已经保存的 source-to-finish 与 same-process external amortized 数据；不混入 Octane case。方法、复现命令与计时边界见 [README.md](README.md)。本文件先列证据，再下结论。

## 证据与门禁

| 问题 | 当前证据 | 判断 |
|---|---|---|
| 冻结的执行对象 | `scripts/run_sunspider.py:verify_frozen_inputs` 在所有行动前校验 `qjs.exe`、`d8.exe`、snapshot/ICU 及 SunSpider 原/移植文件。QuickJS SHA-256 `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`；d8 SHA-256 `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`。 | PASS；没有重建/更新引擎或修改旧 raw。 |
| QuickJS 静态编译发生在 timer 前 | `engines/quickjs-upstream/qjs.c:66` 调用 `JS_Eval`；`quickjs.c:37280` 在执行脚本前创建函数；`quickjs.c:36072-36085` 递归创建子函数。生成 JS 的 `timerStart` 位于顶层函数定义之后。 | 静态 `workload` 及其静态子函数的初次字节码生成位于 timer 前。 |
| V8 `--no-lazy` 的版本语义 | V8 [15.6.21 官方 tag](https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21) 对应 commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764`；该 commit 的 [flag 定义](https://chromium.googlesource.com/v8/v8/+/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/flags/flag-definitions.h) 第 3116–3118 行定义 `lazy=true` 与独立的 `lazy_eval=true`。当前 binary 的 [help](evidence/help.txt) 与 [完整 flag dump](evidence/no_lazy_flag_values.txt) 显示正式组合为 `--max-opt=0 --no-lazy`，有效值包括 `--no-sparkplug`、`--no-maglev`、`--no-turbofan`，但 `--lazy-eval` 仍在。 | `--no-lazy` 对静态函数有效；动态 `eval` 不保证排除。 |
| V8 字节码相对 timer 的次序 | [lazy-order 探针](probes/lazy_order.js)的默认模式在标记后生成 `workload`/`nestedProbe` 字节码；`--no-lazy` 在标记前生成。更重要的是 [26 个实际 workload 诊断](evidence/workload_bytecode/summary.csv)全部 26/26 PASS：`workload` 字节码输出均在 timer 标记前；每 case 的完整输出与诊断 JS SHA-256 保存在同目录。 | 当前脚本的静态 `workload` bytecode 先于计时区间。不能延伸为“所有运行时生成代码都已提前编译”。 |
| V8 仍为解释器受限模式 | 以**新 flag 组合**重跑 500,000 次热点探针，[tier trace](evidence/no_lazy_tier_trace.txt)中 `INTERPRETED_FUNCTION` 出现 333 次，Sparkplug、Maglev、TurboFan 编译/状态和 OSR entry 均为 0；[Ignition bytecode](evidence/no_lazy_tier_bytecode.txt)存在。机器核对见 [summary.json](evidence/summary.json)。正式命令无 trace flag。 | 热点探针 PASS；没有观察到 JIT tier-up。未对每条 SunSpider 样本逐条打开 tier trace。 |
| correctness | 新内部包装的 N=1/2：26×2×2 = [104/104 PASS](raw/correctness.csv)，并与旧阶段冻结 checksum 对照。正式计时结束后用**独立进程**对每个选定 N 的每次调用做 checksum：[52/52 PASS](raw/full_n_correctness.csv)。`3d-raytrace` 按已记录的两引擎长度哨兵核对。 | PASS。旧的检查器曾用顶层 `i` 与 workload 的全局变量冲突；该次未完成的检查记录单独保存在 [attempt1](raw/full_n_correctness_attempt1.csv)，修正版用 `repeatIndex`，不影响正式计时 raw。 |
| 自适应 N | [calibration.csv](raw/calibration.csv) 记录从 1 开始二倍增长的全部 pilot；[selected_n.csv](summary/selected_n.csv) 是每 case 第一个两边内部计时均 ≥1,000 ms 的共同 N，范围 32–1024。校准不计入正式样本。 | 26/26 满足预设选择规则。 |
| 正式样本与独立复算 | [measurements.csv](raw/measurements.csv) 包含 26×2×30 = **1,560/1,560 有效**；52 个组各 30 条，iteration 1–30 完整，同 case 两引擎 JS SHA-256 一致。独立 [audit.json](summary/audit.json) 重算 raw→median→ratio→geomean，PASS。原始 CSV SHA-256 `34988e002d9285678c91435561a88ff1ee381781c39f95e201814b18fe62d99c`。 | PASS；未删除 outlier。正式 52 条略低于 1 秒，最短 922 ms，全部保留；1 秒是 pilot 选 N 条件，不是事后筛样本条件。 |

## 三种模式的边界

| 模式 | 主指标 | 计入什么 | V8 flags |
|---|---|---|---|
| 原 source-to-finish | Python 进程外墙钟 | 启动/VM 初始化、源码读取和初始编译、执行、退出；原顶层 workload | `--max-opt=0` |
| 旧 same-process external amortized | Python 进程外墙钟 `/ N` | 一次启动/前端摊薄到 N 次调用，函数包装及 checksum 检查 | `--max-opt=0` |
| 新 interpreter-mode execution time | JS 内部 `Date.now()` elapsed `/ N` | 首次及后续 workload 调用、GC/builtin/runtime/regexp、动态代码生成、循环与 timer 的微小开销；**不计**外部启动和初始静态前端 | `--max-opt=0 --no-lazy` |

新模式绝不提前执行 workload warmup；第一次调用就在 timer 内。所有 checksum 检查和打印在 timer 停止后，但原 workload 自身的断言仍在调用中执行。`Date.now()` 为毫秒分辨率且不是单调时钟；以至少 1 秒校准减小量化影响，仍不等于纯解释器循环自耗时。

## 结果

ratio 始终定义为 **V8 median / QuickJS median**；小于 1 表示 V8 用时更短。三个 geomean 都在相同的 26 case 上先求每 case ratio，再取 `exp(mean(log(ratio)))`，不是直接对所有时间求平均。

| 模式 | QuickJS median 较低 | V8 median 较低 | ratio 几何均值 |
|---|---:|---:|---:|
| 原 source-to-finish | 24/26 | 2/26 | 1.693695375 |
| 旧 external amortized | 10/26 | 16/26 | 0.608303510 |
| 新 internal execution | 5/26 | 21/26 | 0.544283792 |

每 case 的 ratio 与选定 N（完整、未舍入值在 [three_mode_comparison.csv](summary/three_mode_comparison.csv)；新模式 median/mean/stddev/IQR/min/max 在 [internal_summary.csv](summary/internal_summary.csv)）：

| Case | N | Source-to-finish | External amortized | Internal execution |
|---|---:|---:|---:|---:|
| 3d-cube | 64 | 1.458 | 0.681 | 0.597 |
| 3d-morph | 64 | 1.769 | 1.062 | 0.900 |
| 3d-raytrace | 128 | 2.164 | 1.083 | 0.958 |
| access-binary-trees | 256 | 1.958 | 0.531 | 0.457 |
| access-fannkuch | 32 | 1.577 | 1.051 | 0.961 |
| access-nbody | 64 | 2.195 | 1.294 | 1.251 |
| access-nsieve | 128 | 1.407 | 0.507 | 0.441 |
| bitops-3bit-bits-in-byte | 256 | 2.246 | 0.835 | 0.779 |
| bitops-bits-in-byte | 64 | 1.897 | 1.073 | 0.996 |
| bitops-bitwise-and | 256 | 2.285 | 1.352 | 1.374 |
| bitops-nsieve-bits | 128 | 2.632 | 1.699 | 1.569 |
| controlflow-recursive | 256 | 2.372 | 0.911 | 0.838 |
| crypto-aes | 128 | 2.133 | 1.044 | 0.917 |
| crypto-md5 | 256 | 2.637 | 1.175 | 1.064 |
| crypto-sha1 | 256 | 2.808 | 1.352 | 1.247 |
| date-format-tofte | 128 | 1.169 | 0.311 | 0.278 |
| date-format-xparb | 256 | 1.408 | 0.237 | 0.209 |
| math-cordic | 64 | 1.777 | 0.855 | 0.768 |
| math-partial-sums | 128 | 1.755 | 0.770 | 0.672 |
| math-spectral-norm | 128 | 2.421 | 0.882 | 0.797 |
| regexp-dna | 1024 | 0.455 | 0.027 | 0.023 |
| string-base64 | 256 | 1.361 | 0.335 | 0.311 |
| string-fasta | 128 | 1.349 | 0.393 | 0.357 |
| string-tagcloud | 256 | 1.265 | 0.263 | 0.208 |
| string-unpack-code | 256 | 0.686 | 0.134 | 0.123 |
| string-validate-input | 256 | 1.933 | 0.500 | 0.409 |

### 从证据可以确认

1. 对这 26 个固定 case，计时边界从原进程外墙钟到进程外 `/N`，再到 JS 内部 `/N`，汇总 ratio 依次 **1.694 → 0.608 → 0.544**；QuickJS median 较低数 **24 → 10 → 5**。新内部 ratio 比原 source-to-finish 低的 case 是 **26/26**；比旧 external 低的为 **25/26**，唯一小幅上升的是 `bitops-bitwise-and`（1.352→1.374）。
2. 从旧 external 到新 internal，五个 case 从 QuickJS median 较低转为 V8 较低：`3d-morph`、`3d-raytrace`、`access-fannkuch`、`bitops-bits-in-byte`、`crypto-aes`。新模式 QuickJS 较低的五项是 `access-nbody`、`bitops-bitwise-and`、`bitops-nsieve-bits`、`crypto-md5`、`crypto-sha1`。`bitops-bits-in-byte` 的新 ratio 0.996 接近 1，不宜夸大差异。
3. `regexp-dna` 的 ratio 为 0.455→0.027→0.023，`string-unpack-code` 为 0.686→0.134→0.123；二者在三模式中都由 V8 median 较低，差距并未因边界收窄而消失。前者包含 regexp，后者含动态解包/`eval`，不能把它们当作解释器 dispatch 的单独证据。

### 不能据此推出 / UNKNOWN

- **不能**说 QuickJS 解释器循环本身比 Ignition 慢约 `1/0.544` 倍；这里只测 interpreter-mode workload execution，仍含 GC、runtime helper、builtins、regexp、循环/计时器开销和部分动态 frontend。
- **不能**将 1.694→0.608 或 0.608→0.544 的差值直接解释为 process startup、VM init、parser 或字节码生成的时间比例。原模式与新模式的源码包装/计时器不同；此外，新模式 V8 增加 `--no-lazy`，旧模式没有。没有做单独的同 flag 边界配对控制。
- `date-format-tofte`、`date-format-xparb`、`string-tagcloud`、`string-unpack-code` 源文件包含运行时 `eval`；`date-format-xparb` 还动态构造 RegExp。对这些 case，“计时段完全没有 frontend 编译”是**已知不成立或至少无法证明**，动态编译的次数与占比为 **UNKNOWN**。`--lazy-eval` 在本次 V8 flag dump 里仍是开启。
- QuickJS/V8 各自的 interpreter loop、自身 dispatch、GC、regex engine、builtins 与 helper 的分项时间均为 **UNKNOWN**。本次热点探针验证 tier 限制，但没有在每一条正式 SunSpider 样本内开启逐函数 trace；不把当前数据归因于 QuickJS dispatch 瓶颈。
- 主机温度、功耗管理与背景活动的精确影响为 **UNKNOWN**。case 顺序随机化、engine 先后交替以及保留全部样本降低了顺序偏差，但不是完整环境隔离。

因此，本轮达到了更窄且可审计的**interpreter-mode execution time** 计时边界，并展示了 ratio 的进一步变化；它仍不是 **pure interpreter-loop self time**，也不能单独证明前两轮差异的因果来源。
