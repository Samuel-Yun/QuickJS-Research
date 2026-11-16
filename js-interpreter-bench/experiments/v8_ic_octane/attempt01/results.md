# Octane：原版 QuickJS 与 V8 use_ic ON/OFF

数据核对截至 2026-10-26（Asia/Shanghai）。本轮状态为 **COMPLETE：16 项、1440/1440 条正式记录有效**。这是新采集的独立批次，不包含上一轮三案例的 270 条，也没有混入旧 Windows、修改版 QuickJS 或 V8 `--max-opt=0` 的时间。

## 1. 完整逐项结果

三条件为原版 QuickJS、同一个 d8 的 `--jitless --no-lazy --use-ic` 与 `--jitless --no-lazy --no-use-ic`。除 `use-ic` 外，两种 V8 条件的有效参数一致，snapshot/ICU 相同。

下表全部为 COMPLETE，每项每条件 30 个新进程，构成 30 个完整三元组。时间是内部区间除以 N 后的分布中位数，单位 **ms/原始完整 Run**，不是进程总时间或单次属性操作成本。首次 Run 计入，没有计时前 workload 预跑；后续重复中状态和缓存自然演化。

| Run 单元 | N | QJS ms | V8 ON ms | V8 OFF ms | OFF/ON | QJS/ON | QJS/OFF | 有效 n：Q/ON/OFF |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| Richards.Richards | 512 | 3.36702 | 2.05926 | 21.9504 | 10.6594 | 1.63506 | 0.153392 | 30/30/30 |
| DeltaBlue.DeltaBlue | 256 | 6.88878 | 3.57770 | 29.5607 | 8.26249 | 1.92548 | 0.233038 | 30/30/30 |
| Crypto.Encrypt † | 256 | 5.07377 | 4.37105 | 6.01960 | 1.37715 | 1.16077 | 0.842875 | 30/30/30 |
| Crypto.Decrypt † | 16 | 96.0710 | 80.4627 | 121.145 | 1.50560 | 1.19398 | 0.793025 | 30/30/30 |
| RayTrace.RayTrace | 64 | 37.2085 | 17.1198 | 124.674 | 7.28244 | 2.17342 | 0.298447 | 30/30/30 |
| EarleyBoyer.Earley | 512 | 6.73604 | 2.17805 | 8.80690 | 4.04348 | 3.09270 | 0.764859 | 30/30/30 |
| EarleyBoyer.Boyer | 32 | 104.221 | 42.5548 | 329.538 | 7.74386 | 2.44909 | 0.316263 | 30/30/30 |
| RegExp.RegExp | 64 | 176.410 | 27.8052 | 69.3125 | 2.49279 | 6.34450 | 2.54514 | 30/30/30 |
| Splay.Splay | 1024 | 2.12664 | 1.01620 | 4.34544 | 4.27616 | 2.09274 | 0.489396 | 30/30/30 |
| NavierStokes.NavierStokes | 32 | 57.1916 | 67.4731 | 70.7648 | 1.04878 | 0.847620 | 0.808193 | 30/30/30 |
| PdfJS.PdfJS | 16 | 172.816 | 98.4092 | 301.721 | 3.06599 | 1.75610 | 0.572768 | 30/30/30 |
| Mandreel.Mandreel | 1 | 1682.98 | 1457.87 | 7614.28 | 5.22288 | 1.15441 | 0.221029 | 30/30/30 |
| Gameboy.Gameboy | 4 | 317.342 | 292.632 | 1932.17 | 6.60274 | 1.08444 | 0.164241 | 30/30/30 |
| CodeLoad.CodeLoadClosure | 4096 | 0.599085 | 0.300676 | 0.301166 | 1.00163 | 1.99246 | 1.98922 | 30/30/30 |
| CodeLoad.CodeLoadJQuery | 256 | 10.2638 | 4.15186 | 4.29117 | 1.03355 | 2.47209 | 2.39184 | 30/30/30 |
| Typescript.Typescript | 1 | 2072.20 | 1299.96 | 7929.95 | 6.10014 | 1.59405 | 0.261314 | 30/30/30 |

† Crypto 使用新确定性输入 `BENCH_ONLY_XORSHIFT32_PRELOAD_V1`，seed=305419896；其余为本轮冻结的原始 strict 输入。**不能把这两项与旧随机输入批次相除。** 全精度数据、状态和输入标签见 [comparison.csv](summary/comparison.csv)，自动生成表见 [comparison.md](summary/comparison.md)。

比值方向：OFF/ON>1 表示关闭后更慢；QJS/ON 或 QJS/OFF>1 表示对应 V8 条件更快。没有计算总体 GM 或官方 Octane 分数。

## 2. 开关效应与探索区间

每案例以完整三元组为重采样单位，配对 bootstrap 10000 次、固定 seed=20261025；每次重新计算中位数之比，取线性插值的 2.5%/97.5% 分位数。以下区间为逐项探索性区间，未经多重比较校正，不是确认性显著性结论。

| Run 单元 | OFF/ON | 95% 探索区间 | 关闭后中位耗时变化 |
| --- | ---: | --- | ---: |
| Richards | 10.6594 | [10.5155, 10.7690] | +965.94% |
| DeltaBlue | 8.2625 | [8.1879, 8.3732] | +726.25% |
| Crypto.Encrypt † | 1.3772 | [1.3588, 1.4217] | +37.72% |
| Crypto.Decrypt † | 1.5056 | [1.4801, 1.5280] | +50.56% |
| RayTrace | 7.2824 | [7.1700, 7.3421] | +628.24% |
| Earley | 4.0435 | [3.9820, 4.0844] | +304.35% |
| Boyer | 7.7439 | [7.5950, 7.8251] | +674.39% |
| RegExp | 2.4928 | [2.4559, 2.5147] | +149.28% |
| Splay | 4.2762 | [4.1404, 4.4007] | +327.62% |
| NavierStokes | 1.0488 | [1.0356, 1.0594] | +4.88% |
| PdfJS | 3.0660 | [3.0190, 3.0909] | +206.60% |
| Mandreel | 5.2229 | [5.1529, 5.2960] | +422.29% |
| Gameboy | 6.6027 | [6.4965, 6.6622] | +560.27% |
| CodeLoadClosure | 1.0016 | [0.9797, 1.0316] | +0.16%，方向不明确 |
| CodeLoadJQuery | 1.0336 | [0.9968, 1.0454] | +3.36%，方向不明确 |
| Typescript | 6.1001 | [6.0125, 6.2089] | +510.01% |

全部三种比值及其区间均保存在 [ratios.csv](summary/ratios.csv)。上表没有 OFF 更快的点估计；14 项区间全在 1 以上，两项 CodeLoad 跨 1。跨 1 表示本轮方向不明确，不是已经证明二者相同。

## 3. 实际做了什么，数据是否齐全

- 复用冻结的原版 QuickJS 2026-06-04，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，GCC13.3.0、`-O2 -g -fwrapv`；二进制 SHA256 `584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1`。
- 同一官方 d8 15.6.21，SHA256 `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`。路径、snapshot/ICU 和库身份见 [runtime.json](runtime.json)。本轮没有重建或修改任何 VM，没有下载或更换 d8。
- 同一 WSL2 Ubuntu24.04.2/x86_64，Ryzen7 5800H。Octane 固定在 `570ad1ccfe86e3eecba0636c8f932ac08edec517`；原字节、CRLF 恢复与本轮 LF 身份分开保留在 [inputs.json](inputs.json)，没有改写历史哈希。
- N=1/2 正确性 **96/96**、选定 N 后 **48/48**；可信断言来源在 [correctness_contract.md](correctness_contract.md)。225 个 pilot 均正常完成，只有满足该 N 的九个独立 pilot 全部≥1000ms，才冻结共同 N；较短候选也原样保留。
- 正式 **1440/1440** 有效，三条件各 480 条，所有退出码为 0、stderr 为空。每项六种顺序各五次、每条件每个顺序位置各十次；三元组相邻且全部串行，同一采集 boot。没有重跑失败位置、删除异常值或从历史结果补表。
- **34 个正式区间低于 1000ms**，全部照实保留：DeltaBlue ON 27 个、Splay ON 7 个；全体最短区间 893.002ms。不能将“pilot 全达标”写成“正式样本全部≥1s”。
- pilot/选定 N 验证/正式采集及其间输入检查的记录跨度为 **6500.615 秒（约108.34分钟）**，小于8小时预算；跨度来自同一 boot 的父进程单调端点，不拼接不同启动的绝对时钟。初始正确性与初始 Crypto 检查单独留存。采集后 WSL 曾重启；后核验没有新性能样本并入，见 [campaign_timing.json](campaign_timing.json)。
- 两次全新输出目录、**只读 raw 不启动引擎**的统计重放均通过，结果与 Linux 首次发布逐字一致，raw/发布表未变。见 [replay_audit.json](replay_audit.json)、[summary/audit.json](summary/audit.json)。5 项分析单元测试通过。

## 4. Crypto 输入核验

N=1/2，以及 Encrypt N=256、Decrypt N=16，各做三条件的原函数/观察 hook 对照，共 **36 个独立诊断进程**。在 base/crypto 求值前安装固定 PRNG，固定加载期 pool；Setup/Run 不重置已经演化的 RC4。

实际核对初始 pool、128 个随机字、固定密钥、每次密文/实际解密明文和 RC4 i/j/S；观察侧另核对实际随机字节、padding、seed 混入和初始化 key 的规范化流摘要。所有六份门禁均为 PASS_BOUNDED_INPUT_IDENTITY；不只比较调用次数。正式进程没有观察 hook，每个末次密文也核对对应 N 的门禁。原始摘要、有限真实事件和 stdout 流哈希见 [raw/crypto/](raw/crypto/)，门禁见 [crypto/](crypto/)。

该证明范围仅为当前源码、密钥、seed、N 与三条件；未保留全部事件轨迹，不能从摘要重建它们。它不证明任意随机输入相同，确定性 PRNG 也不适用于真实安全加密。诊断输出/额外解密的耗时不进入正式表。

## 5. 从逐项数据能回答什么

1. **开关影响不只出现在 Richards。** Richards、DeltaBlue、Boyer、RayTrace 的 OFF/ON 分别为10.66、8.26、7.74、7.28；Typescript 为6.10。Crypto 的变化较小，NavierStokes 仅约4.88%；两项 CodeLoad 方向不明确。它们不是同一种幅度的收益。
2. **QuickJS 在12项中介于 ON 与 OFF 之间。** 即 Richards、DeltaBlue、Crypto 两项、RayTrace、Earley/Boyer 两项、Splay、PdfJS、Mandreel、Gameboy、Typescript，均为 ON < QJS < OFF；对应两个跨引擎区间也支持这一方向。这不表示 OFF 的内部实现变成了 QuickJS。
3. **三个反例不能略掉。** RegExp 与两项 CodeLoad 即使 OFF 仍快于 QuickJS：QJS/OFF 分别为2.545、1.989、2.392。RegExp 的 JS JIT 与正则 JIT 均受本轮 jitless 策略限制，但正则实现与 builtin 成本仍属于 workload，不能作为纯 dispatch 比较。相反，NavierStokes 中 QuickJS 本来就快于 ON/OFF，QJS/ON=0.848。
4. **ON 相对 QuickJS 的优势不只集中在一个案例，但大小很不均匀。** 15项 ON 中位时间低于 QJS；最大比例为 RegExp 6.34，其次 Earley 3.09；Boyer/JQuery 约2.45/2.47。Gameboy 与 Mandreel 则只有1.08/1.15，而它们各自 OFF/ON 却达到6.60/5.22。不能把开关的巨大影响直接等同于跨引擎差距，也不能用不同 Run 的毫秒差拼出统一贡献比例。
5. **支持继续研究属性相关机制，但尚不能分解原因。** 同一 d8 只改变一个配置，多个负载的净耗时明显变化，值得进一步选具体 site 检查；本轮没有增加逐 site 的命中、覆盖或 self-time 测量，仍不能区分 QuickJS 的覆盖不足、命中实现成本和其它执行差距。

## 6. 机制依据、可能解释与 UNKNOWN

已经重验固定参考源码及上一轮 ON 目标 PC0/FBV[0] 的正证据，见 [reference_evidence.json](reference_evidence.json) 和 [既有源码说明](../../v8_ic_on_off/attempt02/source_notes.md)。参考 `ic.cc` 的 named load 在 `use_ic` 条件下更新/安装缓存；普通查找、取值语义仍在，handler 入口也不是每次直接判断该开关。global/keyed load 与若干 store 路径同样受此配置影响。**本轮准确名称是 use_ic 配置开关对照，不是只关闭 own 读取 IC，也不是移除全部缓存。**

可能解释：一些负载更依赖这些受开关影响的路径，另一些含动态编译或其它主要工作，因此开关净影响不同。这只是与数据相容的解释；CodeLoad 的动态编译确实保留在 Run 内，但其时间占比、RegExp 内部耗时分解以及每个 workload 的具体受影响 site 都仍为 UNKNOWN。

继续保留的限制：

- **OFF 反馈槽没有直接快照：UNKNOWN/null**；不得写成已经证明为空。证据门槛为 PASS_WITH_OBSERVABILITY_LIMITATION，不因这个已披露限制重试失效打印或阻塞已批准比较。
- V8 官方制品的**精确构建源码 commit、完整编译器/GN参数仍 UNKNOWN**。`37fb84941c9be9f9914ee50b1ad366f06a1bd764` 仅为15.6.21固定版本参考，不是制品 commit 证明；build metadata 保留。
- 全部是该 WSL2 cohort 的观测，功耗、频率、温度和运行期间后台负载未完全控制；前后快照不能证明整个期间相同，也不推广为原生 Linux/Windows。
- 内部区间不含进程启动、必需 Setup 和静态加载；仍含循环、原断言、GC/helper/builtin/RegExp、Run 内动态编译等，不是 pure interpreter-loop self time。另存完整进程墙钟统计，但不相减中位数计算初始化成本。
- 所有异常值和偏短正式样本保留；bootstrap 区间是本批次探索性逐项区间，未做多重检验校正、跨批次复现或等效性检验。
- Box2D、zlib、官方 Splay/Mandreel latency 指标没有纳入，理由见 [coverage.csv](summary/coverage.csv)；16个Run不是完整官方Octane总分。

**不能推导** V8 开关收益就是 QuickJS 可得收益；不能把 OFF 视作等价的 QJS 普通查找；不计算跨引擎差距的“IC解释百分比”，也不把总时间差除以访问次数称为单次 hash 或 miss 成本。本轮停在逐项对照，不新增 IC 实现或另一轮研究。

## 7. 复核入口

在本目录运行，Python标准库即可，不要求原 `/home` 下 ELF：

```sh
python test_analysis.py
python analyze.py --output NEW_OUTPUT_DIRECTORY
python replay.py
```

输出目录必须全新。重放不调用引擎；源码/制品运行身份核验由 `prepare.py` / `postflight.py` 分开负责。不要再次对本目录启动正式采样；新采集应新建 attempt，并核验 runtime 映射、cohort 与预算。正式脚本、冻结顺序、命令、输入/制品/脚本哈希、退出码、stdout/stderr、内部与外部时长都已留存。

详细描述统计见 [per_condition.csv](summary/per_condition.csv)：中位数、均值、n−1样本标准差、Tukey-halves Q1/Q3/IQR、min/max。完整进程墙钟另见 [process_wall_diagnostic.csv](summary/process_wall_diagnostic.csv)，最终交付检查见 `delivery_audit.json`。
