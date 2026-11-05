# 独立诊断计数（不是正式性能样本）

范围：整个新JS进程，包括脚本、adapter、Setup、计时驱动、workload与验证/TearDown。不是仅timed region的统计。
单位：每个compiled function + atom；同atom的多个site及读写共享。cache_id为进程内唯一编译实例，不跨进程对齐。
queries仅含已经重写的IC opcode；首次普通opcode、未能重写的原型/getter等操作不计入queries。
read/write queries = accepted hits + fallback；shape hit还须满足write descriptor guard，不能全部当成功写hit。
probes为IC前置shape比较，update_probes是回退后更新扫描；不是native instructions。
requested/peak live为诊断布局的IC malloc请求字节，不含libc malloc管理开销、shape间接保活或记录器内存，不是RSS，也不冒充正式A/B内存。
未提供生命周期安全的全部shape多样性/超容量计数，记UNKNOWN。max_filled是实测已填槽数，不等于见过的shape数。

| 单元 | IC queries | accepted hit % | lookup probes/query | update probes | max filled |
|---|---:|---:|---:|---:|---:|
| Richards.Richards | 108541826 | 100.00 | 1.000 | 355 | 1 |
| DeltaBlue.DeltaBlue | 55477237 | 99.91 | 1.003 | 98736 | 1 |
| Crypto.Encrypt | 4878761 | 99.07 | 1.028 | 173265 | 1 |
| Crypto.Decrypt | 8679831 | 99.66 | 1.010 | 110444 | 1 |
| RayTrace.RayTrace | 24720110 | 94.22 | 1.173 | 5142402 | 1 |
| EarleyBoyer.Earley | 5518262 | 100.00 | 1.000 | 268 | 1 |
| EarleyBoyer.Boyer | 28811669 | 100.00 | 1.000 | 287 | 1 |
| RegExp.RegExp | 679013 | 100.00 | 1.000 | 69 | 1 |
| Splay.Splay | 29201147 | 71.25 | 1.862 | 30173242 | 1 |
| NavierStokes.NavierStokes | 1976 | 100.00 | 1.000 | 109 | 1 |
| PdfJS.PdfJS | 8969385 | 99.82 | 1.005 | 65532 | 1 |
| Mandreel.Mandreel | 1940 | 100.00 | 1.000 | 162 | 1 |
| Gameboy.Gameboy | 76201934 | 100.00 | 1.000 | 13742 | 1 |
| CodeLoad.CodeLoadClosure | 2047 | 100.00 | 1.000 | 32833 | 1 |
| CodeLoad.CodeLoadJQuery | 9855 | 97.40 | 1.078 | 41793 | 1 |
| Typescript.Typescript | 68369455 | 95.43 | 1.137 | 12220357 | 1 |

## 代表函数/atom（按查询数，不是耗时排名）

### largest_speedup: Mandreel.Mandreel
- cache 705, function `_ZN20btAxisSweep3InternalItE11createProxyERK9btVector3S3_iPvssP12btDispatcherS4_`, atom `now`: queries=1921, hit=1.0000, replacements=0, max_filled=1.
- cache 33, function `runMandreel`, atom `now`: queries=19, hit=1.0000, replacements=0, max_filled=1.
- cache 1, function `<eval>`, atom `GeometricMean`: queries=0, hit=N/A (zero queries), replacements=0, max_filled=0.
- cache 1, function `<eval>`, atom `prototype`: queries=0, hit=N/A (zero queries), replacements=0, max_filled=0.
- cache 1, function `<eval>`, atom `now`: queries=0, hit=N/A (zero queries), replacements=0, max_filled=1.
- cache 1, function `<eval>`, atom `atob`: queries=0, hit=N/A (zero queries), replacements=0, max_filled=0.
- cache 1, function `<eval>`, atom `CountBenchmarks`: queries=0, hit=N/A (zero queries), replacements=0, max_filled=0.
- cache 1, function `<eval>`, atom `RunSingleBenchmark`: queries=0, hit=N/A (zero queries), replacements=0, max_filled=0.

### largest_regression: RayTrace.RayTrace
- cache 54, function ``, atom `y`: queries=1254142, hit=1.0000, replacements=0, max_filled=1.
- cache 54, function ``, atom `z`: queries=1254142, hit=1.0000, replacements=0, max_filled=1.
- cache 54, function ``, atom `x`: queries=1254142, hit=1.0000, replacements=0, max_filled=1.
- cache 56, function ``, atom `y`: queries=835710, hit=1.0000, replacements=0, max_filled=1.
- cache 56, function ``, atom `z`: queries=835710, hit=1.0000, replacements=0, max_filled=1.
- cache 56, function ``, atom `x`: queries=835710, hit=1.0000, replacements=0, max_filled=1.
- cache 89, function ``, atom `shapes`: queries=745470, hit=1.0000, replacements=0, max_filled=1.
- cache 91, function ``, atom `RayTracer`: queries=565425, hit=1.0000, replacements=0, max_filled=1.

### unclear_nearest_one: 该类不存在
