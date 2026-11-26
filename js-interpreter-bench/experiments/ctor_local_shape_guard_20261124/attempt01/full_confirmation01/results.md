# CTOR_LOCAL_SHAPE_GUARD 追加全集：同批单轮

按用户要求追加，独立于此前的定向筛选门槛。原 SPARSE 与候选均现场新测，复用原未插桩 Release，不重编译。每版每项一个新进程；原输入、固定 N、校验、Setup/Run 边界、首个 Run 计入，无额外热身；CPU 2、Asia/Shanghai、C locale。

| 套件 | 整体耗时 GM 变化 | 改善 / 回退项数 | 最大单项回退 |
|---|---:|---:|---|
| octane | +1.19% | 3 / 14 | EarleyBoyer.Boyer +5.02% |
| sunspider | +2.04% | 4 / 22 | bitops-nsieve-bits +10.12% |

负数表示耗时下降。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权，不合并两套分数。这是单轮筛选，不自动替换冻结 SPARSE。

此前的独立计数在原白盒、Boyer、Tree 上局部守卫覆盖为 0；本次全集仅计时，没有新增命中率诊断。耗时变化与已测到的机制证据分别报告。此前定向报告、decision.json 和原始时间全部保留。

## Octane

| 表项 | 原 SPARSE ms/Run | 局部守卫版 ms/Run | 相对 SPARSE |
|---|---:|---:|---:|
| Richards | 2.2815 | 2.2376 | -1.93% |
| DeltaBlue | 4.8110 | 4.9121 | +2.10% |
| Crypto.Encrypt | 3.7420 | 3.7762 | +0.91% |
| Crypto.Decrypt | 70.4398 | 70.7975 | +0.51% |
| RayTrace | 27.8288 | 28.4370 | +2.19% |
| EarleyBoyer.Earley | 4.5835 | 4.6763 | +2.02% |
| EarleyBoyer.Boyer | 54.5300 | 57.2693 | +5.02% |
| RegExp | 153.9753 | 154.2410 | +0.17% |
| Splay | 1.3390 | 1.3401 | +0.08% |
| NavierStokes | 41.3001 | 42.6079 | +3.17% |
| PdfJS | 119.4077 | 121.3777 | +1.65% |
| Mandreel | 1172.9292 | 1213.6320 | +3.47% |
| Gameboy | 218.8549 | 210.9620 | -3.61% |
| CodeLoad.Closure | 0.4923 | 0.4908 | -0.30% |
| CodeLoad.JQuery | 8.8741 | 8.8993 | +0.28% |
| Typescript | 1462.7344 | 1499.2856 | +2.50% |
| zlib | 4833.0455 | 4973.6836 | +2.91% |
| **整体 GM** | **47.5533** | **48.1181** | **+1.19%** |
| **逐项耗时之和** | **8181.1693** | **8398.6260** | — |

## SunSpider

| 表项 | 原 SPARSE ms/Run | 局部守卫版 ms/Run | 相对 SPARSE |
|---|---:|---:|---:|
| 3d-cube | 13.9624 | 14.5380 | +4.12% |
| 3d-morph | 10.5703 | 11.0827 | +4.85% |
| 3d-raytrace | 12.1707 | 11.0758 | -9.00% |
| access-binary-trees | 7.7264 | 7.8219 | +1.24% |
| access-fannkuch | 25.4206 | 26.2242 | +3.16% |
| access-nbody | 10.6701 | 10.8234 | +1.44% |
| access-nsieve | 14.5311 | 14.8038 | +1.88% |
| bitops-3bit-bits-in-byte | 6.6783 | 6.7185 | +0.60% |
| bitops-bits-in-byte | 16.5941 | 16.8159 | +1.34% |
| bitops-bitwise-and | 6.3385 | 6.7811 | +6.98% |
| bitops-nsieve-bits | 10.2613 | 11.3000 | +10.12% |
| controlflow-recursive | 4.9467 | 5.0152 | +1.39% |
| crypto-aes | 9.5177 | 9.9998 | +5.07% |
| crypto-md5 | 4.9505 | 4.9768 | +0.53% |
| crypto-sha1 | 4.5213 | 4.5893 | +1.51% |
| date-format-tofte | 21.2460 | 21.6383 | +1.85% |
| date-format-xparb | 17.2989 | 17.0502 | -1.44% |
| math-cordic | 16.3627 | 17.4712 | +6.77% |
| math-partial-sums | 8.1108 | 8.7476 | +7.85% |
| math-spectral-norm | 5.9228 | 5.8146 | -1.83% |
| regexp-dna | 72.7263 | 72.8779 | +0.21% |
| string-base64 | 10.6192 | 10.8064 | +1.76% |
| string-fasta | 17.9483 | 18.1771 | +1.27% |
| string-tagcloud | 19.1299 | 19.2576 | +0.67% |
| string-unpack-code | 34.0950 | 34.0493 | -0.13% |
| string-validate-input | 9.0942 | 9.3146 | +2.42% |
| **整体 GM** | **11.9317** | **12.1748** | **+2.04%** |
| **逐项耗时之和** | **391.4139** | **397.7711** | — |

原始命令和完整 stdout：raw/*.run.json；逐项 CSV：comparison.csv；完整进程顺序和哈希：protocol.json。

复现：仓库根执行 `python3 js-interpreter-bench/experiments/ctor_local_shape_guard_20261124/attempt01/full_confirmation.py`，自动建立下一个 full_confirmationNN 目录，不覆盖旧数据。
