# Experiment definition

新增 **Octane strict interpreter-mode execution time**。每 sample 新进程，必需Setup一次在计时外；Date.now只包住官方 Benchmark.run × 校准N；第一次Run计入，不做性能warmup。
source loading/VM initialization/主要初次静态frontend在timer前；GC/helper/builtin/regexp、动态eval及Run原断言/统计仍在timed region。不是pure interpreter-loop self time。
正式单位16个subbenchmark；双engine相同脚本、相同N，V8固定`--max-opt=0 --no-lazy`。
特殊setup、状态及预先定义的敏感性名单见 `../harness_audit.md`。计时外 Crypto/Decrypt 输入生成可能预热共享RSA helper，不能称整体VM全冷。

# Evidence / gates

- Frozen binaries/dependencies, Octane commit/upstream hashes: `config.json`, `environment.txt`; verified before and after sampling. Old artifacts hash preservation is in `audit.json`.
- Actual effective flags: `probes/v8_tier/flag_values/`; fresh 500,000-call probe: `probes/v8_tier/hot_trace/`, checksum1301262660; Sparkplug/Maglev/TurboFan/OSR all0, interpreted status333, plus `hot_bytecode/`. `--lazy-eval`, `--flush-bytecode`, `--no-regexp-interpret-all` remain effective; no claim that dynamic compilation, re-compilation, or regexp native execution is disabled.
- All16 actual Benchmark.run bytecode traces precede line-anchored timer markers: `probes/frontend_order/*.final/`. QuickJS recursive compilation source excerpts/hash: `probes/frontend_order/quickjs_source.txt`, `summary.json`. Dynamic eval is not claimed excluded.
- Timer native availability/resolution tests precede base.js fallback: `probes/timer/`. Common Date.now has1ms observed steps; QuickJS Windows performance.now uses gettimeofday, so its monotonic semantics are not presumed.
- Independent correctness N1/N2/selected: `correctness.csv`; original Run assertions and official post-region TearDown retained. No invented checksum; NavierStokes low-N reaches frame15 after timer; formal Encrypt validates last ciphertext after timer.

- Completeness audit **PASS**：960/960 valid，13 suites，16 subbenchmarks；原始候选预算960。0失败记录，0缺失位置，0审计错误。0正式样本低于校准目标仍保留；无outlier剔除。
- 统计：sample stddev n−1，Tukey median-of-halves IQR，CV=std/mean；ratio=V8 median/QJS median；subbenchmark ratio→suite GM→overall等suite权重GM。旧native先对sample内subtime取GM再取median，不完全可交换。

# Confirmed observations

只有已完成、已通过审计的suite参与数值表；审计不是PASS时，不宣称全部完成。
strict QJS lower **1/13**，V8 lower **12/13**，tie **0**，V8/QJS GM **0.498093**。
旧Octane fixed **0.510420**，native **0.494143**；三模式原值保留（旧各10reps，新各30reps）。matched intersection汇总见audit.mode_summary，不以不同交集混比。
相对native获胜方向变化：无（对已完整strict交集）。
V8 在 12/13 个 suite 的聚合 median ratio 较低，方向与旧 Octane 主体一致。
ratio相对native对数变化最大的3项：Typescript 0.556990 → 0.590120; PdfJS 0.503106 → 0.528472; Richards 0.539171 → 0.559217。

| Suite | Fixed-work ratio | Native per-call ratio | Strict ratio |
|---|---:|---:|---:|
| Richards | 0.575549 | 0.539171 | 0.559217 |
| DeltaBlue | 0.511104 | 0.476076 | 0.484415 |
| Crypto | 0.870013 | 0.886087 | 0.886990 |
| RayTrace | 0.458069 | 0.417599 | 0.426791 |
| EarleyBoyer | 0.356696 | 0.319593 | 0.318666 |
| RegExp | 0.095466 | 0.087539 | 0.085079 |
| Splay | 0.372008 | 0.399676 | 0.402300 |
| NavierStokes | 1.193778 | 1.188599 | 1.164331 |
| PdfJS | 0.526117 | 0.503106 | 0.528472 |
| Mandreel | 0.830029 | 0.800776 | 0.804175 |
| Gameboy | 0.847390 | 0.860720 | 0.829951 |
| CodeLoad | 0.429983 | 0.429558 | 0.428496 |
| Typescript | 0.565821 | 0.556990 | 0.590120 |

下表为各Run的median(ms/call)，多subbenchmark不会假装为一个整体函数；mean/std/IQR/min/max/CV完整未舍入数值见 `strict_summary.csv`。

| Suite/Benchmark | N | QJS median ms/Run | V8 median ms/Run | V8/QJS |
|---|---:|---:|---:|---:|
| Richards/Richards | 512 | 3.792969 | 2.121094 | 0.559217 |
| DeltaBlue/DeltaBlue | 512 | 7.582031 | 3.672852 | 0.484415 |
| Crypto/Encrypt | 256 | 5.386719 | 4.810547 | 0.893038 |
| Crypto/Decrypt | 16 | 101.875000 | 89.750000 | 0.880982 |
| RayTrace/RayTrace | 64 | 40.125000 | 17.125000 | 0.426791 |
| EarleyBoyer/Earley | 512 | 7.358398 | 2.147461 | 0.291838 |
| EarleyBoyer/Boyer | 32 | 116.078125 | 40.390625 | 0.347961 |
| RegExp/RegExp | 64 | 228.187500 | 19.414062 | 0.085079 |
| Splay/Splay | 2048 | 2.229004 | 0.896729 | 0.402300 |
| NavierStokes/NavierStokes | 32 | 61.328125 | 71.406250 | 1.164331 |
| PdfJS/PdfJS | 16 | 201.406250 | 106.437500 | 0.528472 |
| Mandreel/Mandreel | 1 | 1820.500000 | 1464.000000 | 0.804175 |
| Gameboy/Gameboy | 4 | 357.250000 | 296.500000 | 0.829951 |
| CodeLoad/CodeLoadClosure | 4096 | 0.601196 | 0.288818 | 0.480406 |
| CodeLoad/CodeLoadJQuery | 256 | 10.925781 | 4.175781 | 0.382195 |
| Typescript/Typescript | 1 | 2044.500000 | 1206.500000 | 0.590120 |

敏感性（主结果不删specialized suite）：窄版预先排除RegExp/CodeLoad，11suite，GM **0.592958**；宽版另排除Mandreel/Typescript，9suite，GM **0.573525**。这些不是builtin占比测量，也不是替代主结果。
SunSpider strict既有结果QJS5/26、V8 21/26、GM0.544284。只比较方向、分布及定性一致性；suite结构不同，不相减估计frontend百分比。

# Possible explanations

UNKNOWN causal attribution：lazy compilation policy、warmup/IC状态、N和state progression、runtime行为及interpreter设计均可能影响模式差异；本次同时改变多个控制条件，没有独立消融实验，不能分配startup/frontend/warmup各自贡献。
RegExp/CodeLoad等机制可能影响ratio分布；机制敏感性不等于证明解释器dispatch是瓶颈。

# Unknowns

pure interpreter-loop self time、GC contribution、builtin contribution、regexp contribution、dynamic frontend contribution、IC/runtime state contribution全部 **UNKNOWN**。
未对每个正式Octane样本做tier tracing（会扰动计时）；来自冻结flags和全新hot probe，而非逐样本事件计数。潜在动态代码路径未逐调用追踪，不能由函数定义存在推断本次执行次数。
每个sample的CPU温度/实际频率/后台负载及墙钟调整精确影响UNKNOWN；power plan只记录一次。无统计显著性/跨主机泛化结论。
`--flush-bytecode`仍开启；是否在timed region因GC/code flushing发生再次编译及其成本 **UNKNOWN**，本次只证明主要初次静态编译顺序，不证明所有frontend活动绝对为零。更多潜在执行期动态路径及证据见 `../probes/frontend_order/dynamic_paths_addendum.md`。

# Limitations

Octane strict与SunSpider strict架构并不完全相同：Setup状态、Run颗粒度、嵌入式断言、typed arrays/browser mocks、运行期动态frontend、内建函数和regexp均不同。Date.now量化约1ms，1s目标仅降低量化相对尺度，不保证总误差≤0.1%。
Crypto rng_pool于脚本加载时初始化，ResetRNG不回填它；Decrypt必需ciphertext样本可能不同。Splay/NavierStokes状态持续演进，PDF logs随N积累；沿用upstream机制，不声称逐次状态完全相同。
原Encrypt仅独立correctness逐次decrypt，正式末次校验；NavierStokes仅frame15校验。全体PASS表示通过原验证机制，不是穷尽语义证明。
预定义敏感性子集仍保留Gameboy/PdfJS等潜在动态Function/eval路径，不是完全排除所有specialized workload的“净化”结果；不得称为pure interpreter时间。
旧native与新strict的median/GM聚合次序不同，旧suite共享进程/顺序，新每subbenchmark新进程；flags、warmup、预算一起变化。不能把差值直接解释为某一开销。
官方V8 artifact的精确source revision/toolchain细节仍继承baseline UNKNOWN；没有更新/重编译。zlib、Box2D仍排除，见compatibility.csv。

# Next step

仅建议在用户确认后做独立profiling与literature gap analysis；先分解GC/runtime/builtin/dynamic frontend与bytecode执行，再设计因果微基准。本任务不开始这些工作，也未发现或实施QuickJS优化点。
