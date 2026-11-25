# STORE_TRANSITION_IC 追加全集：同批单轮

按用户要求追加，独立于此前的定向筛选门槛。原 SPARSE 与候选均现场新测，复用原未插桩 Release，不重编译。每版每项一个新进程；原输入、固定 N、校验、Setup/Run 边界、首个 Run 计入，无额外热身；CPU 2、Asia/Shanghai、C locale。

| 套件 | 整体耗时 GM 变化 | 改善 / 回退项数 | 最大单项回退 |
|---|---:|---:|---|
| octane | +3.25% | 0 / 17 | Richards +6.31% |
| sunspider | +2.62% | 5 / 21 | access-nbody +17.38% |

负数表示耗时下降。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权，不合并两套分数。这是单轮筛选，不自动替换冻结 SPARSE。

此前定向诊断中 RayTrace / Tree 的新增写入 IC 命中均为 0；Tree 原整函数构造命中分布发生变化，不能把 Tree 时间改善算成新写入 IC 命中的收益。本次全集只测未插桩 Release 耗时，不新增全集命中率诊断。耗时变化与已测到的机制证据分别报告。此前定向报告、decision.json 和原始时间全部保留。

## Octane

| 表项 | 原 SPARSE ms/Run | 写入转换 IC 版 ms/Run | 相对 SPARSE |
|---|---:|---:|---:|
| Richards | 2.2968 | 2.4417 | +6.31% |
| DeltaBlue | 4.7869 | 4.9849 | +4.14% |
| Crypto.Encrypt | 3.7549 | 3.7661 | +0.30% |
| Crypto.Decrypt | 70.6947 | 71.7792 | +1.53% |
| RayTrace | 28.2139 | 28.5147 | +1.07% |
| EarleyBoyer.Earley | 4.5783 | 4.6140 | +0.78% |
| EarleyBoyer.Boyer | 54.6339 | 55.6722 | +1.90% |
| RegExp | 154.0592 | 156.3767 | +1.50% |
| Splay | 1.3333 | 1.4153 | +6.15% |
| NavierStokes | 40.3295 | 42.7121 | +5.91% |
| PdfJS | 119.2329 | 122.9270 | +3.10% |
| Mandreel | 1169.1103 | 1222.6318 | +4.58% |
| Gameboy | 217.7594 | 221.3696 | +1.66% |
| CodeLoad.Closure | 0.4902 | 0.4999 | +1.98% |
| CodeLoad.JQuery | 8.8659 | 8.8874 | +0.24% |
| Typescript | 1456.4247 | 1525.1791 | +4.72% |
| zlib | 4853.4999 | 5013.1197 | +3.29% |
| **整体 GM** | **47.4833** | **49.0271** | **+3.25%** |
| **逐项耗时之和** | **8190.0646** | **8486.8915** | — |

## SunSpider

| 表项 | 原 SPARSE ms/Run | 写入转换 IC 版 ms/Run | 相对 SPARSE |
|---|---:|---:|---:|
| 3d-cube | 13.7733 | 15.0605 | +9.35% |
| 3d-morph | 10.5492 | 10.9958 | +4.23% |
| 3d-raytrace | 10.8293 | 11.3031 | +4.37% |
| access-binary-trees | 7.7103 | 6.3433 | -17.73% |
| access-fannkuch | 25.5670 | 26.4350 | +3.39% |
| access-nbody | 10.7138 | 12.5756 | +17.38% |
| access-nsieve | 14.5379 | 14.7040 | +1.14% |
| bitops-3bit-bits-in-byte | 6.6129 | 7.4386 | +12.49% |
| bitops-bits-in-byte | 16.6492 | 16.8533 | +1.23% |
| bitops-bitwise-and | 6.3425 | 6.4874 | +2.28% |
| bitops-nsieve-bits | 10.2059 | 11.4169 | +11.87% |
| controlflow-recursive | 4.9440 | 4.9887 | +0.90% |
| crypto-aes | 9.5036 | 9.9535 | +4.73% |
| crypto-md5 | 4.9622 | 5.1405 | +3.59% |
| crypto-sha1 | 4.5253 | 4.6726 | +3.25% |
| date-format-tofte | 21.2053 | 21.7815 | +2.72% |
| date-format-xparb | 18.1041 | 17.0790 | -5.66% |
| math-cordic | 16.3899 | 17.0214 | +3.85% |
| math-partial-sums | 8.0845 | 8.3531 | +3.32% |
| math-spectral-norm | 5.9021 | 6.1791 | +4.69% |
| regexp-dna | 72.9142 | 72.9733 | +0.08% |
| string-base64 | 10.6308 | 10.5222 | -1.02% |
| string-fasta | 18.1140 | 18.2358 | +0.67% |
| string-tagcloud | 19.1985 | 19.1268 | -0.37% |
| string-unpack-code | 34.0562 | 34.0065 | -0.15% |
| string-validate-input | 9.0932 | 9.3262 | +2.56% |
| **整体 GM** | **11.8948** | **12.2066** | **+2.62%** |
| **逐项耗时之和** | **391.1193** | **398.9738** | — |

原始命令和完整 stdout：raw/*.run.json；逐项 CSV：comparison.csv；完整进程顺序和哈希：protocol.json。

复现：仓库根执行 `python3 js-interpreter-bench/experiments/store_transition_ic_20261124/attempt01/full_confirmation.py`，自动建立下一个 full_confirmationNN 目录，不覆盖旧数据。
