# 跳过重复读取 IC 探测：完整基准单轮对照

本次只新跑未插桩 SKIP_REPROBE：Octane 17 项、SunSpider 26 项，每项一个新进程。原 SPARSE 使用 03_sparse_ctor 的历史单轮成绩。**跨批次单轮筛选**，不把旧数据算成同批新测。

单位 ms/Run，负数为更快。Octane 按 14 suite 分层等权 GM（同 suite 子项先取 GM）；SunSpider 按 26 项等权 GM。保持原输入、N、校验、Setup/Run 边界和首个 Run 计入，无额外热身；CPU 2、Asia/Shanghai、C locale。使用已验证的同一 Release 二进制，未改策略或重新编译。

| 套件 | 新版相对原 SPARSE GM | 原 SPARSE 逐项和 | 新版逐项和 | 更快 / 更慢项数 |
|---|---:|---:|---:|---:|
| octane | +0.28% | 8210.0822 | 8214.3479 | 6 / 11 |
| sunspider | +2.96% | 389.5728 | 396.8143 | 3 / 23 |

逐项和仅作补充，不是整体 GM；它是各表项 ms/Run 的和，不是这批进程的总墙钟时间。

本轮两套完整基准均未取得整体净收益，暂不替换原 SPARSE。微测试已确认重复缓存探测被删掉，但没有带来全集提速。SunSpider 有 23 项变慢，不能只归结于 access-binary-trees 一个项目；具体回退原因本轮没有另跑诊断，跨批次结果也不能把所有差异直接归因于这个补丁。

- octane 最大改善：Typescript -3.34%；最大回退：NavierStokes +6.49%。
- sunspider 最大改善：access-nbody -2.46%；最大回退：access-binary-trees +27.19%。

## Octane

| 表项 | 原 SPARSE | SKIP_REPROBE | 相对原 SPARSE |
|---|---:|---:|---:|
| Richards | 2.2375 | 2.2418 | +0.19% |
| DeltaBlue | 4.8073 | 4.6979 | -2.28% |
| Crypto.Encrypt | 3.7523 | 3.7861 | +0.90% |
| Crypto.Decrypt | 70.4986 | 71.5342 | +1.47% |
| RayTrace | 27.7063 | 26.9621 | -2.69% |
| EarleyBoyer.Earley | 4.5769 | 4.7133 | +2.98% |
| EarleyBoyer.Boyer | 54.7713 | 56.0943 | +2.42% |
| RegExp | 153.6116 | 153.8830 | +0.18% |
| Splay | 1.3423 | 1.3435 | +0.09% |
| NavierStokes | 40.3663 | 42.9845 | +6.49% |
| PdfJS | 119.6804 | 120.6435 | +0.80% |
| Mandreel | 1169.8719 | 1186.3208 | +1.41% |
| Gameboy | 214.6994 | 212.7883 | -0.89% |
| CodeLoad.Closure | 0.4935 | 0.4921 | -0.28% |
| CodeLoad.JQuery | 8.8907 | 8.8810 | -0.11% |
| Typescript | 1488.6636 | 1438.9073 | -3.34% |
| zlib | 4844.1122 | 4878.0743 | +0.70% |
| **整体 GM** | — | — | **+0.28%** |

## SunSpider

| 表项 | 原 SPARSE | SKIP_REPROBE | 相对原 SPARSE |
|---|---:|---:|---:|
| 3d-cube | 13.7683 | 14.3728 | +4.39% |
| 3d-morph | 10.6304 | 11.1234 | +4.64% |
| 3d-raytrace | 10.9748 | 10.9058 | -0.63% |
| access-binary-trees | 6.0916 | 7.7478 | +27.19% |
| access-fannkuch | 25.4244 | 25.8922 | +1.84% |
| access-nbody | 10.4524 | 10.1950 | -2.46% |
| access-nsieve | 14.7010 | 14.7170 | +0.11% |
| bitops-3bit-bits-in-byte | 6.6272 | 6.7392 | +1.69% |
| bitops-bits-in-byte | 16.9849 | 17.2217 | +1.39% |
| bitops-bitwise-and | 6.4512 | 6.9011 | +6.97% |
| bitops-nsieve-bits | 10.2146 | 11.2175 | +9.82% |
| controlflow-recursive | 4.9544 | 5.0274 | +1.47% |
| crypto-aes | 9.5311 | 9.8777 | +3.64% |
| crypto-md5 | 4.9682 | 5.1031 | +2.71% |
| crypto-sha1 | 4.5325 | 4.7001 | +3.70% |
| date-format-tofte | 21.2772 | 21.4160 | +0.65% |
| date-format-xparb | 17.4047 | 17.2255 | -1.03% |
| math-cordic | 16.3772 | 17.1728 | +4.86% |
| math-partial-sums | 8.0861 | 8.3549 | +3.32% |
| math-spectral-norm | 5.8625 | 5.9976 | +2.30% |
| regexp-dna | 73.1627 | 73.2590 | +0.13% |
| string-base64 | 10.5833 | 10.6294 | +0.44% |
| string-fasta | 18.0946 | 18.2491 | +0.85% |
| string-tagcloud | 19.1774 | 19.3505 | +0.90% |
| string-unpack-code | 34.1197 | 34.1887 | +0.20% |
| string-validate-input | 9.1204 | 9.2290 | +1.19% |
| **整体 GM** | — | — | **+2.96%** |

## 复现和原始记录

从本实验 attempt01 目录运行：

```bash
python3 full_bench.py run
python3 full_analyze.py
python3 full_audit.py
```

`full_bench` 已有结果时，跑数脚本拒绝覆盖。重测应在新的 attempt 内保留独立记录。

`runs.jsonl` 保存 43 个新进程的原始计时、stdout/stderr、PID、退出状态和逐项校验；`protocol.json` 保存输入、N、执行顺序、CPU、源码/二进制及旧对照哈希；`comparison.csv` 为完整逐项表，`audit.json` 为记录核对结果。

单轮与跨批次差异不能用于证明显著性；本轮不追加次数，也没有调整方法去改善成绩。
