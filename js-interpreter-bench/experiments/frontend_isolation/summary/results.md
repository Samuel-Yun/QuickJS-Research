# SunSpider frontend-amortized 实验结果

执行日期：2026-09-24 至 2026-09-25（Windows 11 x64 原生主机）。本文件只解释已保存数据，不修改第一轮 benchmark。方法与机制证据见 [实验说明](../README.md)；全部统计字段见 [repeated_summary.csv](repeated_summary.csv)，全部正式样本见 [repeated.csv](../raw/repeated.csv)。

## 门槛与计时定义

| 项目 | 结果 / 证据 |
|---|---|
| 冻结 binary / workload | 每次正式 runner 启动前调用 `scripts/run_sunspider.py:verify_frozen_inputs`，核对 qjs/d8/snapshot/ICU/SunSpider manifests；`run_repeated_mode.py:checked_inputs`。|
| Mode 1 原 source-to-finish | 已有 `results/raw/sunspider.csv`：26×2×30 = 1560/1560 有效；没有重跑。|
| Mode 3 correctness | `correctness/repeated.csv`：26×2×2 = 104/104 PASS（每 case/engine 的 N=1、2 追加 checksum 检查，以及原文件**已有**的断言；原来无断言的 case 不因此获得独立 oracle）；`3d-raytrace` 两引擎分别为 20969、20970，符合已有双长度哨兵。最初 crypto-aes 用密文长度作 checksum 失败，已保留 `correctness/repeated_attempt1_crypto_aes_failure.csv`；随后改用解密明文长度，并保留原明文相等断言。|
| Mode 3 正式样本 | `raw/repeated.csv`：26×2×30 = 1560/1560 有效；每组 30 次，两个引擎同一 case 使用同一个 `N`、同一个 JS 文件 SHA-256；`N=8..128`。未删除 outlier。|
| N=1 包装对照 | `raw/wrapped_once_control.csv`：26×2×30 = 1560/1560 有效；所用 JS 与 Mode 3 的 N=1 文件相同。|
| 自适应阈值 | pilot 选择 N 时要求两个引擎都 ≥200 ms。正式样本 51/1560 条略低于 200 ms，最低 187.868 ms；没有隐藏或补采。低于阈值的样本来自 `3d-morph` 与 `access-nsieve`。|
| 统计 | 每 case/engine 对 `wall_time_ns/N` 计算 median、mean、样本 stddev（n−1）、Tukey median-of-halves IQR、min/max；ratio = V8 median / QuickJS median；跨 case geomean = `exp(mean(log(ratio)))`。这与第一轮相同的 ratio 方向，但 Mode 3 是摊薄后的总墙钟时间/调用，**不是纯 interpreter time**。|

## 汇总

| 测量 | QuickJS median 较低 | V8 median 较低 | 26 个 ratio 的几何均值 |
|---|---:|---:|---:|
| Mode 1：原 source-to-finish | 24/26 | 2/26 | 1.693695375 |
| N=1：同一函数包装对照 | 24/26 | 2/26 | 1.679296864 |
| Mode 3：same-process repeated execution | 10/26 | 16/26 | 0.608303510 |

几何均值先按每个 case 的两引擎 median 之比计算，再对 26 个正 ratio 取 `exp(mean(log(ratio)))`；**不是**两组时间的算术平均之比。Mode 1 和 Mode 3 的计时边界/执行形态不同，不能把几何均值之差转写成某一 frontend 阶段的“百分比贡献”。

## 逐 case 结果

表中 median 为 `wall_time_ns / N` 的样本 median，单位 ms。完整的两引擎 `mean/stddev/IQR/min/max` 等 16 列、未四舍五入值在 [repeated_summary.csv](repeated_summary.csv)。原始每次墙钟时间与 checksum 在 [repeated.csv](../raw/repeated.csv)；原始第一轮完整统计在 `results/processed/sunspider_summary.csv`。

| Case | N | Q median ms | V8 median ms | V8/Q ratio |
|---|---:|---:|---:|---:|
| 3d-cube | 16 | 31.631 | 21.539 | 0.681 |
| 3d-morph | 8 | 23.699 | 25.173 | 1.062 |
| 3d-raytrace | 16 | 15.944 | 17.262 | 1.083 |
| access-binary-trees | 32 | 12.567 | 6.678 | 0.531 |
| access-fannkuch | 8 | 37.650 | 39.561 | 1.051 |
| access-nbody | 16 | 16.077 | 20.810 | 1.294 |
| access-nsieve | 16 | 24.719 | 12.539 | 0.507 |
| bitops-3bit-bits-in-byte | 32 | 9.954 | 8.307 | 0.835 |
| bitops-bits-in-byte | 16 | 20.552 | 22.063 | 1.073 |
| bitops-bitwise-and | 32 | 7.893 | 10.672 | 1.352 |
| bitops-nsieve-bits | 16 | 15.015 | 25.518 | 1.699 |
| controlflow-recursive | 32 | 8.719 | 7.939 | 0.911 |
| crypto-aes | 16 | 15.763 | 16.452 | 1.044 |
| crypto-md5 | 32 | 7.616 | 8.953 | 1.175 |
| crypto-sha1 | 32 | 7.250 | 9.800 | 1.352 |
| date-format-tofte | 32 | 30.957 | 9.640 | 0.311 |
| date-format-xparb | 64 | 20.261 | 4.801 | 0.237 |
| math-cordic | 16 | 22.717 | 19.422 | 0.855 |
| math-partial-sums | 16 | 18.142 | 13.962 | 0.770 |
| math-spectral-norm | 32 | 9.641 | 8.506 | 0.882 |
| regexp-dna | 128 | 81.658 | 2.243 | 0.027 |
| string-base64 | 32 | 22.596 | 7.567 | 0.335 |
| string-fasta | 32 | 27.472 | 10.791 | 0.393 |
| string-tagcloud | 32 | 27.731 | 7.288 | 0.263 |
| string-unpack-code | 32 | 60.345 | 8.110 | 0.134 |
| string-validate-input | 32 | 14.133 | 7.064 | 0.500 |

## 关键观察（只作描述，不作瓶颈归因）

1. 原来的 24/26 与 1.69 **不再适用于**同进程重复模式：当前为 QuickJS 10/26、ratio geomean 0.608。26/26 个 case 的 ratio 都比第一轮低，14 个从 QuickJS median 较低转为 V8 median 较低。详见 [comparison.csv](comparison.csv)。
2. N=1 包装对照仍为 24/26、1.679，与原 24/26、1.694 接近。由此可以说“本批数据的总体反转不是仅由函数包装这一步单独造成”，不能说包装对每个 case 无影响（例如 `bitops-bitwise-and` 的 source/包装 N=1 ratio 约 2.285/2.832）。
3. 按 ratio 从小到大排序，位次变化最大的是 `access-fannkuch`（10→18，+8）、`math-spectral-norm`（23→15，−8）、`3d-morph`（12→19，+7）、`bitops-3bit-bits-in-byte`（20→13，−7）、`string-validate-input`（15→8，−7）。排序是跨 mode 的描述性排名，接近 1 的 case 不宜过度解读。
4. `regexp-dna` 的 V8/Q ratio 从 0.455 降到 0.027；`string-unpack-code` 从 0.686 降到 0.134。两者仍是 V8 median 较低，且相对差距扩大；它们不支持“所有 workload 都是 QuickJS 解释器更快”。`string-unpack-code` 内含动态 `eval`，`regexp-dna` 含 RegExp/builtin 操作，不能当作纯解释器循环证据。
5. 当前数据表明第一轮的 QuickJS **端到端**优势在重复模式下明显缩小、总体转向；与一次性开销、进程内缓存/状态、动态编译等都相容。没有逐阶段计时或对称的 precompiled artifact 模式，**不能确认上一轮优势“主要来自 startup/frontend”**，更不能给出 startup、VM init、source parse、bytecode generation、interpreter execution 各自的百分比。

## 可说 / 不可说 / UNKNOWN

- 可说：当前冻结配置下，Python 进程级墙钟计时的第一轮 source-to-finish 与同进程重复模式给出不同的 26-case 描述性排名；N=1 包装对照在总体上保留第一轮趋势；QuickJS `qjsc` 嵌入字节码路径可通过 checksum smoke；d8 `--cache=code` 进入两个标注的运行段。
- 不可说：Mode 3 是“纯解释器时间”；`--max-opt=0` 使 RegExp native code 也停止；d8 的 Code Cache 是裸 Ignition 字节码；Mode 2 已形成公平的双方预编译对照；两个 mode 的时间差或 ratio 差就是 parse/compile/startup 的量化贡献；QuickJS 的 dispatch 是当前瓶颈。
- UNKNOWN：d8 `--cache=code` 在本 smoke 中缓存实际接受/命中状态；其缓存能否由当前 d8 CLI 独立保存为固定文件并跨进程只消费；具体 startup、VM 初始化、source loading、parse、bytecode generation、interpreter loop 的分项耗时；函数包装对每一 case 的微观行为影响；系统电源/温度/背景负载对跨天对比的贡献。

因此，本阶段成功建立了**frontend-amortized 同进程重复实验**，但没有真正、对称地隔离 frontend，更没有实现跨引擎裸字节码比较。后续若要量化贡献，应先设计额外仪器化/控制实验，不能直接从此处两个 ratio 倒推。
