# GLOBAL_OWN_OFFSET_CACHE 追加全集：同批单轮

按用户要求追加，独立于此前的定向筛选门槛。原 SPARSE 与候选均现场新测，复用原未插桩 Release，不重编译。每版每项一个新进程；原输入、固定 N、校验、Setup/Run 边界、首个 Run 计入，无额外热身；CPU 2、Asia/Shanghai、C locale。

| 套件 | 整体耗时 GM 变化 | 改善 / 回退项数 | 最大单项回退 |
|---|---:|---:|---|
| octane | +1.40% | 4 / 13 | Gameboy +6.12% |
| sunspider | +2.67% | 5 / 21 | access-nbody +13.74% |

负数表示耗时下降。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权，不合并两套分数。这是单轮筛选，不自动替换冻结 SPARSE。

此前定向诊断已确认二级命中；本次全集只测未插桩 Release 耗时，不新增全集命中率诊断。耗时变化与已测到的机制证据分别报告。此前定向报告、decision.json 和原始时间全部保留。

## Octane

| 表项 | 原 SPARSE ms/Run | 共享二级缓存版 ms/Run | 相对 SPARSE |
|---|---:|---:|---:|
| Richards | 2.2394 | 2.3131 | +3.29% |
| DeltaBlue | 4.8035 | 4.7823 | -0.44% |
| Crypto.Encrypt | 3.7386 | 3.8642 | +3.36% |
| Crypto.Decrypt | 70.4955 | 72.7321 | +3.17% |
| RayTrace | 28.0017 | 27.9401 | -0.22% |
| EarleyBoyer.Earley | 4.5734 | 4.6687 | +2.08% |
| EarleyBoyer.Boyer | 54.6568 | 57.2856 | +4.81% |
| RegExp | 154.2192 | 154.8635 | +0.42% |
| Splay | 1.3310 | 1.3328 | +0.14% |
| NavierStokes | 40.3183 | 42.5038 | +5.42% |
| PdfJS | 119.3538 | 121.6818 | +1.95% |
| Mandreel | 1199.9841 | 1173.1895 | -2.23% |
| Gameboy | 213.9330 | 227.0189 | +6.12% |
| CodeLoad.Closure | 0.5097 | 0.4920 | -3.48% |
| CodeLoad.JQuery | 8.8850 | 8.9238 | +0.44% |
| Typescript | 1452.3449 | 1457.5063 | +0.36% |
| zlib | 4818.4502 | 4823.1232 | +0.10% |
| **整体 GM** | **47.4346** | **48.1001** | **+1.40%** |
| **逐项耗时之和** | **8177.8383** | **8184.2216** | — |

## SunSpider

| 表项 | 原 SPARSE ms/Run | 共享二级缓存版 ms/Run | 相对 SPARSE |
|---|---:|---:|---:|
| 3d-cube | 13.7646 | 14.8859 | +8.15% |
| 3d-morph | 10.8446 | 10.9117 | +0.62% |
| 3d-raytrace | 10.8226 | 11.8765 | +9.74% |
| access-binary-trees | 7.7122 | 7.9937 | +3.65% |
| access-fannkuch | 25.4060 | 26.5449 | +4.48% |
| access-nbody | 10.4415 | 11.8760 | +13.74% |
| access-nsieve | 14.5039 | 14.7142 | +1.45% |
| bitops-3bit-bits-in-byte | 6.6772 | 6.6200 | -0.86% |
| bitops-bits-in-byte | 16.6277 | 16.7878 | +0.96% |
| bitops-bitwise-and | 6.3452 | 6.7831 | +6.90% |
| bitops-nsieve-bits | 10.2000 | 11.2354 | +10.15% |
| controlflow-recursive | 4.9633 | 4.9931 | +0.60% |
| crypto-aes | 9.5182 | 9.7482 | +2.42% |
| crypto-md5 | 4.9562 | 4.9676 | +0.23% |
| crypto-sha1 | 4.5181 | 4.5489 | +0.68% |
| date-format-tofte | 21.5392 | 21.7156 | +0.82% |
| date-format-xparb | 17.2770 | 17.5007 | +1.29% |
| math-cordic | 16.3816 | 16.5717 | +1.16% |
| math-partial-sums | 8.0587 | 8.2532 | +2.41% |
| math-spectral-norm | 5.8562 | 5.8173 | -0.66% |
| regexp-dna | 72.9229 | 72.7749 | -0.20% |
| string-base64 | 10.5288 | 10.5753 | +0.44% |
| string-fasta | 17.8527 | 18.3427 | +2.74% |
| string-tagcloud | 19.3463 | 19.2390 | -0.55% |
| string-unpack-code | 34.1494 | 33.9754 | -0.51% |
| string-validate-input | 9.2107 | 9.3339 | +1.34% |
| **整体 GM** | **11.8763** | **12.1935** | **+2.67%** |
| **逐项耗时之和** | **390.4247** | **398.5865** | — |

原始命令和完整 stdout：raw/*.run.json；逐项 CSV：comparison.csv；完整进程顺序和哈希：protocol.json。

复现：仓库根执行 `python3 js-interpreter-bench/experiments/global_own_offset_cache_20261124/attempt01/full_confirmation.py`，自动建立下一个 full_confirmationNN 目录，不覆盖旧数据。

结论：本批 Octane 整体耗时增加 1.40%，SunSpider 增加 2.67%，没有支持替换原 SPARSE 的整体收益。重点三项 RayTrace −0.22%、Splay +0.14%、PdfJS +1.95%；两项接近持平，PdfJS 更慢。保留为实验版，不扩容、不调整替换策略。
