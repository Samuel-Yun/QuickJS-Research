# Octane A/B：正式数据汇总

| 单元 | A ms/Run | B ms/Run | A/B | 95%区间 | 方向 | A/B peak KiB |
|---|---:|---:|---:|---|---|---|
| Richards.Richards | 3.257707 | 3.854753 | 0.8451 | [0.8345, 0.8539] | B slower | 40752/40752 |
| DeltaBlue.DeltaBlue | 6.706532 | 7.311222 | 0.9173 | [0.9108, 0.9257] | B slower | 40744/40744 |
| Crypto.Encrypt | 4.976916 | 5.174311 | 0.9619 | [0.9506, 0.9734] | B slower | 40752/40752 |
| Crypto.Decrypt | 94.033911 | 98.417734 | 0.9555 | [0.9489, 0.9638] | B slower | 40752/40752 |
| RayTrace.RayTrace | 36.268904 | 42.952647 | 0.8444 | [0.8339, 0.8540] | B slower | 40752/40752 |
| EarleyBoyer.Earley | 6.582762 | 6.789894 | 0.9695 | [0.9512, 0.9831] | B slower | 40752/40752 |
| EarleyBoyer.Boyer | 102.040769 | 109.284439 | 0.9337 | [0.9213, 0.9410] | B slower | 40754/40754 |
| RegExp.RegExp | 173.712952 | 176.837155 | 0.9823 | [0.9746, 0.9964] | B slower | 40752/40752 |
| Splay.Splay | 2.066955 | 2.330618 | 0.8869 | [0.8729, 0.9093] | B slower | 147244/147238 |
| NavierStokes.NavierStokes | 55.153562 | 54.637542 | 1.0094 | [1.0032, 1.0175] | B faster | 40754/40754 |
| PdfJS.PdfJS | 167.700147 | 173.204839 | 0.9682 | [0.9632, 0.9818] | B slower | 40754/40754 |
| Mandreel.Mandreel | 1657.582796 | 1627.275914 | 1.0186 | [1.0046, 1.0360] | B faster | 58230/58244 |
| Gameboy.Gameboy | 311.561825 | 364.846773 | 0.8540 | [0.8466, 0.8662] | B slower | 40752/40752 |
| CodeLoad.CodeLoadClosure | 0.575907 | 0.631574 | 0.9119 | [0.9031, 0.9254] | B slower | 61702/89712 |
| CodeLoad.CodeLoadJQuery | 10.047292 | 10.511015 | 0.9559 | [0.9471, 0.9652] | B slower | 40752/40752 |
| Typescript.Typescript | 2032.665233 | 2302.850056 | 0.8827 | [0.8725, 0.8877] | B slower | 100936/104398 |

正式样本 960/960；完整交集 16 Run单元、13 suites。
先子项等权GM、再suite等权GM：0.9253。不是官方Octane总分。
正式低于1000ms的样本：0，全部保留。
完整 mean / sample stddev / Q1 / Q3 / IQR / min / max 见 statistics.csv；外部墙钟和RSS见 summary.csv。
