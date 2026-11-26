# 两次失配版完整 Octane / SunSpider 单轮筛选

按用户后半段要求，只新测 TWICE：Octane 17 项、SunSpider 26 项，每项一个独立 Release 进程。A 与 V8_ON --jitless 使用历史 30 进程中位数，原 SPARSE 使用已有历史单轮。**这是跨批次单轮筛选，不是四版同一批次交错计时。** 新版的两套负载按表项交错执行。

单位 ms/Run，越小越快。SPARSE 和两次失配版括号里均为相对 A 的耗时变化；整体 GM 行仅列相对 A 的百分比。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权。

| 套件 | 表项 | A | 原 SPARSE | 两次失配版 | V8_ON --jitless |
|---|---|---:|---:|---:|---:|
| Octane | Richards | 2.6391 | 2.2375 (-15.22%) | 2.1991 (-16.67%) | 1.8661 |
| Octane | DeltaBlue | 5.8309 | 4.8073 (-17.56%) | 4.7986 (-17.70%) | 3.0866 |
| Octane | Crypto.Encrypt | 3.8104 | 3.7523 (-1.52%) | 3.7822 (-0.74%) | 3.3360 |
| Octane | Crypto.Decrypt | 72.0293 | 70.4986 (-2.13%) | 71.5979 (-0.60%) | 62.7069 |
| Octane | RayTrace | 30.3557 | 27.7063 (-8.73%) | 27.2429 (-10.25%) | 12.5062 |
| Octane | EarleyBoyer.Earley | 5.5095 | 4.5769 (-16.93%) | 4.6490 (-15.62%) | 1.7134 |
| Octane | EarleyBoyer.Boyer | 81.1169 | 54.7713 (-32.48%) | 56.0860 (-30.86%) | 34.8305 |
| Octane | RegExp | 152.9454 | 153.6116 (+0.44%) | 154.7429 (+1.18%) | 22.3485 |
| Octane | Splay | 1.4538 | 1.3423 (-7.67%) | 1.3553 (-6.78%) | 1.2154 |
| Octane | NavierStokes | 43.9440 | 40.3663 (-8.14%) | 42.5868 (-3.09%) | 54.8129 |
| Octane | PdfJS | 123.4331 | 119.6804 (-3.04%) | 120.5370 (-2.35%) | 76.0932 |
| Octane | Mandreel | 1233.3820 | 1169.8719 (-5.15%) | 1198.1993 (-2.85%) | 1004.2215 |
| Octane | Gameboy | 226.9138 | 214.6994 (-5.38%) | 218.5012 (-3.71%) | 222.6507 |
| Octane | CodeLoad.Closure | 0.4795 | 0.4935 (+2.92%) | 0.4913 (+2.46%) | 0.2099 |
| Octane | CodeLoad.JQuery | 8.8014 | 8.8907 (+1.01%) | 8.8762 (+0.85%) | 3.4079 |
| Octane | Typescript | 1540.6784 | 1488.6636 (-3.38%) | 1467.6169 (-4.74%) | 962.1320 |
| Octane | zlib | 5220.1203 | 4844.1122 (-7.20%) | 5070.4441 (-2.87%) | 4513.6075 |
| **Octane** | **整体 GM 相对 A** | **0.00%** | **-7.86%** | **-6.91%** | **-39.80%** |
| SunSpider | 3d-cube | 14.8912 | 13.7683 (-7.54%) | 14.5074 (-2.58%) | 12.3616 |
| SunSpider | 3d-morph | 11.5679 | 10.6304 (-8.10%) | 10.7385 (-7.17%) | 14.2064 |
| SunSpider | 3d-raytrace | 11.4081 | 10.9748 (-3.80%) | 11.3491 (-0.52%) | 11.4897 |
| SunSpider | access-binary-trees | 9.1886 | 6.0916 (-33.71%) | 7.7627 (-15.52%) | 4.8978 |
| SunSpider | access-fannkuch | 27.7821 | 25.4244 (-8.49%) | 26.2911 (-5.37%) | 27.5312 |
| SunSpider | access-nbody | 10.4995 | 10.4524 (-0.45%) | 11.6748 (+11.19%) | 14.1484 |
| SunSpider | access-nsieve | 14.9587 | 14.7010 (-1.72%) | 14.6547 (-2.03%) | 8.8940 |
| SunSpider | bitops-3bit-bits-in-byte | 6.9940 | 6.6272 (-5.24%) | 7.0659 (+1.03%) | 6.2623 |
| SunSpider | bitops-bits-in-byte | 16.7298 | 16.9849 (+1.52%) | 15.7217 (-6.03%) | 16.8581 |
| SunSpider | bitops-bitwise-and | 6.8071 | 6.4512 (-5.23%) | 6.0572 (-11.02%) | 8.7662 |
| SunSpider | bitops-nsieve-bits | 11.5619 | 10.2146 (-11.65%) | 11.0115 (-4.76%) | 17.7094 |
| SunSpider | controlflow-recursive | 5.0073 | 4.9544 (-1.06%) | 4.9486 (-1.17%) | 5.7765 |
| SunSpider | crypto-aes | 9.9901 | 9.5311 (-4.59%) | 9.9144 (-0.76%) | 9.9418 |
| SunSpider | crypto-md5 | 5.2104 | 4.9682 (-4.65%) | 5.1254 (-1.63%) | 6.2463 |
| SunSpider | crypto-sha1 | 4.7040 | 4.5325 (-3.65%) | 4.7000 (-0.09%) | 7.0925 |
| SunSpider | date-format-tofte | 21.9732 | 21.2772 (-3.17%) | 21.4201 (-2.52%) | 7.2766 |
| SunSpider | date-format-xparb | 16.7536 | 17.4047 (+3.89%) | 17.1930 (+2.62%) | 3.4179 |
| SunSpider | math-cordic | 17.1500 | 16.3772 (-4.51%) | 17.0835 (-0.39%) | 14.8989 |
| SunSpider | math-partial-sums | 8.2638 | 8.0861 (-2.15%) | 8.1495 (-1.38%) | 8.4759 |
| SunSpider | math-spectral-norm | 6.1894 | 5.8625 (-5.28%) | 6.0677 (-1.97%) | 6.6133 |
| SunSpider | regexp-dna | 72.9556 | 73.1627 (+0.28%) | 72.9923 (+0.05%) | 7.2359 |
| SunSpider | string-base64 | 10.4522 | 10.5833 (+1.25%) | 10.4111 (-0.39%) | 4.8911 |
| SunSpider | string-fasta | 18.2869 | 18.0946 (-1.05%) | 18.1408 (-0.80%) | 8.7005 |
| SunSpider | string-tagcloud | 19.2558 | 19.1774 (-0.41%) | 19.1528 (-0.53%) | 5.8061 |
| SunSpider | string-unpack-code | 34.3425 | 34.1197 (-0.65%) | 34.0818 (-0.76%) | 5.6811 |
| SunSpider | string-validate-input | 8.9260 | 9.1204 (+2.18%) | 9.4803 (+6.21%) | 5.0777 |
| **SunSpider** | **整体 GM 相对 A** | **0.00%** | **-4.45%** | **-1.90%** | **-31.00%** |

## 新版相对原 SPARSE

- octane 整体 GM：+1.03%；最大改善 Richards -1.72%，最大退化 NavierStokes +5.50%。
  逐项耗时之和（ms）：A 8753.4435；SPARSE 8210.0822；TWICE 8453.7067；V8_ON 6980.7452。
- sunspider 整体 GM：+2.66%；最大改善 bitops-bits-in-byte -7.44%，最大退化 access-binary-trees +27.43%。
  逐项耗时之和（ms）：A 401.8500；SPARSE 389.5728；TWICE 395.6959；V8_ON 250.2571。

## 版本与输入

使用 attempt03/TWICE.release.manifest.json 中已通过微基准、语义与汇编检查的原二进制，未重新编译或调整策略。输入逐字节等同 native_confirmation_20261108/attempt02 的冻结 measure 脚本，固定 N、Setup/Run 边界、校验和、首个 Run 计入、无额外预热均保持原样。CPU 2、Asia/Shanghai、LC_ALL/LANG=C；zlib 使用同一读取接口。计时不带诊断计数。

原始计时、退出码、stdout/stderr、校验及 PID 在 runs.jsonl；protocol.json 保存输入/源码/二进制哈希与顺序。comparison.csv 为 43 项可导入 Excel 的完整表，summary.json 保存 GM 与逐项和。旧对照来自 03_sparse_ctor/analysis/{octane,sunspider}.csv；A/V8 数字另与原 30 轮 statistics.csv 核对。没有额外启动旧对照、补跑慢点或自动加轮；单轮差异不作为显著性结论。
