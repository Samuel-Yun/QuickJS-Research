# Octane 2.0 补充实验记录

实验日期：2026-09-25；主机和二进制均继承已冻结的 Windows 11 x64 baseline。完整方法、命令和计时边界见 [README.md](README.md)。数值以 [summary.csv](summary.csv) 为准，图见 [ratio_by_suite.svg](plots/ratio_by_suite.svg)。Octane 是官方仓库明确标记已停止维护的 2.0 版本；本实验关心长负载下的解释器受限运行，不声称代表现代 Web 应用整体性能。

## Confirmed observations

1. **来源和交集。** 官方仓库 `https://github.com/chromium/octane.git`，commit `570ad1ccfe86e3eecba0636c8f932ac08edec517`；`README.md` 标注 Octane 2.0，`base.js:99` 得分格式版本 `9`。所有 tracked 文件的 SHA-256 在 [upstream_sha256.txt](upstream_sha256.txt)，清单本身 SHA-256 为 `226ae24b505ce3190584173b7ecd25bb473d7899294fb7f87bddccbb37b969f6`。15 个原始 suite 均试跑：QuickJS 14 PASS、1 因缺少 `read()` 而 UNSUPPORTED（zlib）；d8 15 PASS，无 TIMEOUT。两边都能跑的 Box2D 因上游无输出断言/校验而不进入 correctness-gated 性能交集，所以正式比较是 **13 个 suite**。逐 case 状态和原因见 [compatibility.csv](compatibility.csv)；所有 stderr、退出码和输出见 [compatibility_runs.csv](raw/compatibility_runs.csv)，其中 zlib 的原始运行分类为 FAIL、退出码 1，汇总按缺失 shell API 解释为 UNSUPPORTED。两边 PASS case 的完成标记/benchmark 名称一致。
2. **两种计时边界都完整。** 固定工作量 source-to-finish 与 Octane 原生 harness 内部每次调用时间各有 `13 × 2 × 10 = 260` 条正式样本，合计 **520/520 有效**；52 个 mode/case/engine 组各恰好 10 条，所有退出码 0、stderr 为空、JS 成功标记有效，同一 mode/case 的两引擎脚本 SHA-256 一致。没有删除 outlier。[原始数据](raw/measurements.csv) SHA-256 `28e98f7f9574d396560de8fcdbf67bca5eb87a0b18834730621f358727c95c4a`；[完整统计](summary.csv) SHA-256 `217eb77131c88960ac15b4accc3ed370536eeb2d45e316a0c75a85ef0e629596`。
   校准要求两边的固定工作量墙钟至少 500 ms；正式 260 条固定工作量样本中，DeltaBlue/V8 有 3 条略低于阈值（最低 495.23 ms），照实保留，没有补跑或剔除。
3. **结果方向与短 SunSpider 不同。** 固定工作量 source-to-finish：QuickJS median 更低 **1/13**，V8 更低 **12/13**，13 个 `V8/QuickJS` ratio 的几何均值 **0.510420012**。Octane harness 的 frontend-amortized 每次调用时间：也是 **1/13 vs 12/13**，几何均值 **0.494142675**。唯一 QuickJS median 较低的 suite 是 NavierStokes，ratio 分别 **1.194** / **1.189**。这两个 Octane 汇总远低于已有 SunSpider 26 case source-to-finish 的 **1.693695375（QuickJS 24/26）**，但套件、运行次数、计时边界均不同，不能把这组跨套件比值之差解释为某个阶段的贡献率。
4. **逐 case 吞吐时间。** 表中前两列是固定工作量的进程总墙钟 median（单位 ms），后两列是 Octane 内部报告的单次 `benchmark.run()` 时间 median（单位 ms；多子 benchmark 取几何均值）；ratio 一律 `V8 median / QuickJS median`。所有 mean、样本 stddev、IQR、min/max、未舍入值见 [summary.csv](summary.csv)。

   | Suite | 固定 Q / V ms | 固定 ratio | 原生 Q / V ms/调用 | 原生 ratio |
   |---|---:|---:|---:|---:|
   | Richards | 972.864 / 559.931 | 0.576 | 3.781 / 2.039 | 0.539 |
   | DeltaBlue | 985.835 / 503.864 | 0.511 | 7.664 / 3.649 | 0.476 |
   | Crypto | 3464.004 / 3013.727 | 0.870 | 23.367 / 20.705 | 0.886 |
   | RayTrace | 1261.219 / 577.725 | 0.458 | 39.048 / 16.306 | 0.418 |
   | EarleyBoyer | 3991.432 / 1423.728 | 0.357 | 29.204 / 9.333 | 0.320 |
   | RegExp | 7338.922 / 700.618 | 0.095 | 221.550 / 19.394 | 0.088 |
   | Splay | 1588.163 / 590.809 | 0.372 | 2.275 / 0.909 | 0.400 |
   | NavierStokes | 1017.106 / 1214.198 | 1.194 | 60.147 / 71.491 | 1.189 |
   | PdfJS | 994.182 / 523.056 | 0.526 | 209.300 / 105.300 | 0.503 |
   | Mandreel | 8797.253 / 7301.978 | 0.830 | 1835.250 / 1469.625 | 0.801 |
   | Gameboy | 1481.772 / 1255.640 | 0.847 | 349.417 / 300.750 | 0.861 |
   | CodeLoad | 1465.093 / 629.965 | 0.430 | 2.582 / 1.109 | 0.430 |
   | Typescript | 2280.658 / 1290.444 | 0.566 | 2107.400 / 1173.800 | 0.557 |

5. **两种 Octane 模式的方向一致，未观察到“延长工作量后趋于 QuickJS/V8 接近 1”。** 在同一 13 suite 交集上，source-to-finish 和内部计时的 geomean ratio 分别为 0.510 与 0.494；每个 suite 的获胜方也相同。尤其 RegExp 的两个 ratio 为 0.095/0.088，差距没有收敛。这里的“未收敛”只是本次 Octane 观察，不能推导其他 workload 或解释器循环的普遍规律。
6. **适合后续拆解的 workload（研究建议，不是原因结论）。** RegExp（ratio 极端、含 regexp 引擎而非仅字节码解释）；NavierStokes（唯一 QuickJS 较低）；EarleyBoyer/RayTrace（计算/对象密集且 V8 较低）；CodeLoad（运行时动态加载/解析代码）。这些更值得做独立机制微基准，而不是直接优化 QuickJS dispatch。

## Possible explanations

- 较长 workload 使一次性启动、源文件解析和初始编译的相对份额下降，可能是 Octane 与短 SunSpider 方向差异的**一个**因素；但两套 benchmark 的工作负载结构不同，现有数据不能分离这一因素。
- 原生 harness 内部 ratio 与固定工作量外部 ratio 接近，可能意味着在本批 Octane case 上外部一次性开销相对较小；不过两模式的迭代数与 warmup 策略并不相同，不能用两者差值直接估计 frontend 时间。
- RegExp、CodeLoad、Typescript 等包含正则引擎或运行时解析/编译，可能受 builtin/前端实现影响；不能归结为 Ignition 与 QuickJS 的字节码 dispatch 差异。GC、对象模型、库函数等也可能影响其他 suite，尚未隔离。

## Unknowns

- 启动、VM 初始化、源加载、parser、字节码生成、GC、runtime/builtin 和解释器循环各自的分项耗时，以及短 SunSpider 优势中任何阶段的贡献百分比：**UNKNOWN**。
- Octane 各函数在每次执行中发生的惰性编译/动态 `eval` 数量，以及 regexp native/code path 的实际占比：**UNKNOWN**。
- 固定工作量模式与原生 harness 由于 warmup、执行次数和 timer API 不同造成的单项差异来源：**UNKNOWN**。Octane 原生时间不是“纯解释器时间”，固定模式也不是。
- 当前主机温度、电源管理和并发背景负载对样本的精确影响：**UNKNOWN**。本次没有删异常值；要做正式因果归因需要更严格的控制实验。
- zlib 若移植 `read()` 是否会在 QuickJS 通过全部上游校验：**UNKNOWN**，没有修改 benchmark 试图强行纳入。Box2D 运行输出是否语义正确：**UNKNOWN**，故排除。

## 数据与校验

原始校准：[calibration.csv](raw/calibration.csv)；固定工作量倍数：[selected_work.csv](selected_work.csv)。原始正式数据不覆盖、不筛选。SHA-256 可在项目根目录重新核对：

```powershell
Get-FileHash .\experiments\octane\raw\measurements.csv -Algorithm SHA256
Get-FileHash .\experiments\octane\summary.csv -Algorithm SHA256
```

V8 在正式命令中始终附 `--max-opt=0`；这是此前在当前 d8 上验证过的解释器受限模式，证据见 [V8 interpreter 验证](../../notes/v8_interpreter_validation.md)。本次没有对每条 Octane 样本重新跟踪 tier 事件，也没有使用 Node.js。
