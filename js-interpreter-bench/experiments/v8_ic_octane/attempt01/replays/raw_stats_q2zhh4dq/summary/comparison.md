# 16 Run units: same-batch three-condition results

ms/original complete Run; first call included, no extra workload warmup.

| Octane unit | status/input | N | QJS ms | V8 ON ms | V8 OFF ms | OFF/ON | QJS/ON | QJS/OFF | valid n Q/ON/OFF |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Richards.Richards | COMPLETE / FROZEN_ORIGINAL_STRICT | 512 | 3.36702 | 2.05926 | 21.9504 | 10.6594 | 1.63506 | 0.153392 | 30/30/30 |
| DeltaBlue.DeltaBlue | COMPLETE / FROZEN_ORIGINAL_STRICT | 256 | 6.88878 | 3.5777 | 29.5607 | 8.26249 | 1.92548 | 0.233038 | 30/30/30 |
| Crypto.Encrypt | COMPLETE / BENCH_ONLY_XORSHIFT32_PRELOAD_V1 seed305419896 | 256 | 5.07377 | 4.37105 | 6.0196 | 1.37715 | 1.16077 | 0.842875 | 30/30/30 |
| Crypto.Decrypt | COMPLETE / BENCH_ONLY_XORSHIFT32_PRELOAD_V1 seed305419896 | 16 | 96.071 | 80.4627 | 121.145 | 1.5056 | 1.19398 | 0.793025 | 30/30/30 |
| RayTrace.RayTrace | COMPLETE / FROZEN_ORIGINAL_STRICT | 64 | 37.2085 | 17.1198 | 124.674 | 7.28244 | 2.17342 | 0.298447 | 30/30/30 |
| EarleyBoyer.Earley | COMPLETE / FROZEN_ORIGINAL_STRICT | 512 | 6.73604 | 2.17805 | 8.8069 | 4.04348 | 3.0927 | 0.764859 | 30/30/30 |
| EarleyBoyer.Boyer | COMPLETE / FROZEN_ORIGINAL_STRICT | 32 | 104.221 | 42.5548 | 329.538 | 7.74386 | 2.44909 | 0.316263 | 30/30/30 |
| RegExp.RegExp | COMPLETE / FROZEN_ORIGINAL_STRICT | 64 | 176.41 | 27.8052 | 69.3125 | 2.49279 | 6.3445 | 2.54514 | 30/30/30 |
| Splay.Splay | COMPLETE / FROZEN_ORIGINAL_STRICT | 1024 | 2.12664 | 1.0162 | 4.34544 | 4.27616 | 2.09274 | 0.489396 | 30/30/30 |
| NavierStokes.NavierStokes | COMPLETE / FROZEN_ORIGINAL_STRICT | 32 | 57.1916 | 67.4731 | 70.7648 | 1.04878 | 0.84762 | 0.808193 | 30/30/30 |
| PdfJS.PdfJS | COMPLETE / FROZEN_ORIGINAL_STRICT | 16 | 172.816 | 98.4092 | 301.721 | 3.06599 | 1.7561 | 0.572768 | 30/30/30 |
| Mandreel.Mandreel | COMPLETE / FROZEN_ORIGINAL_STRICT | 1 | 1682.98 | 1457.87 | 7614.28 | 5.22288 | 1.15441 | 0.221029 | 30/30/30 |
| Gameboy.Gameboy | COMPLETE / FROZEN_ORIGINAL_STRICT | 4 | 317.342 | 292.632 | 1932.17 | 6.60274 | 1.08444 | 0.164241 | 30/30/30 |
| CodeLoad.CodeLoadClosure | COMPLETE / FROZEN_ORIGINAL_STRICT | 4096 | 0.599085 | 0.300676 | 0.301166 | 1.00163 | 1.99246 | 1.98922 | 30/30/30 |
| CodeLoad.CodeLoadJQuery | COMPLETE / FROZEN_ORIGINAL_STRICT | 256 | 10.2638 | 4.15186 | 4.29117 | 1.03355 | 2.47209 | 2.39184 | 30/30/30 |
| Typescript.Typescript | COMPLETE / FROZEN_ORIGINAL_STRICT | 1 | 2072.2 | 1299.96 | 7929.95 | 6.10014 | 1.59405 | 0.261314 | 30/30/30 |

Ratios: OFF/ON>1 means OFF takes longer; QJS/ON or QJS/OFF>1 means that V8 condition takes less time. Exploratory 95% paired-triple intervals: ratios.csv. Crypto uses a new deterministic input mode; no historical timing comparison.
