# 旧实验的局部亮点回看

本次只读取历史CSV/报告和诊断计数，没有构建或执行任何benchmark。回看范围包括早期B/C/D/M/P/R/E/SW实验、ic_search_lab初版及v2～v7；v3的288个计划行中，实际248个配置执行过短测，28个进入完整单轮、4个进入独立四轮。配置数不等于互不相同的算法数。

`python3 -B review.py`仅离线提取29份旧CSV，得到2445条重复测量的派生比较及123条直接同批V8比较。每行保留来源文件、行号、轮数、对照和已有质量标签，文件哈希见sources.json。这些是比较行数，不是新增性能样本数；同一候选/案例可能在多个独立campaign出现。各批次独立解读，不合并为跨批次冠军榜。没有覆盖每个旧进程的重新原始审计；优先利用已有的冻结统计与审计结果。

以下时间均为ms/完整Run的各自中位数；变化率为候选/对照−1，负数较快。除另述外，这些旧结果来自Windows宿主上的WSL2 Ubuntu24.04.2、Ryzen5800H、GCC13.3；不是当前原生Ubuntu的新结果。V8_ON固定为旧官方15.6.21制品及`--jitless --no-lazy --use-ic`。

有直接同批V8对照的亮点：

|实验/版本|案例|每条件进程数|A|候选|V8_ON|候选相对A|候选相对V8_ON|
|---|---|---:|---:|---:|---:|---:|---:|
|v2正式/s001|Octane NavierStokes|30|57.390285|53.611836|68.468844|-6.58%|-21.70%|
|v2正式/s001|Octane Gameboy|30|307.633280|301.825527|286.891188|-1.89%|+5.21%|
|v2正式/s001|Octane zlib|30|8150.366211|7720.333469|7211.323500|-5.28%|+7.06%|
|ic_mechanism_audit/M|own_integer微基准|30|0.068878|0.063509|0.061308|-7.79%|+3.59%|

前三行来源[v2正式逐项数据](../../experiments/ic_search_lab/v2_20261105/final.octane.per_case.csv)，第四行来源[机制对照报告](../../experiments/ic_mechanism_audit/attempt01/results.md)。micro每完整Run含4096轮，不能与Octane跨行比绝对时间。own_integer的M/V8比值95%探索区间为[0.967113,1.062751]，可以说点估计接近，不能据跨1证明等效。NavierStokes的A原本就比V8快16.18%，s001再减少6.58%；不能把全部21.70%称为新增IC收益。

另外，旧同批SunSpider的M在access-nbody比V8少25.24%耗时，bitops-nsieve-bits少37.88%。但A原本分别少23.85%、38.60%；后者M反而比A多1.17%。这是QuickJS已有的负载优势，不是新IC版本获得37.88%增量。来源[U/M/A/V8同批SunSpider](../../experiments/ic_fast_slow_20261102/attempt01/sunspider/analysis/comparison.csv)。

整体平均掩盖的局部变化：

|版本|案例|轮数|相对A|相对该批s001或M|判断|
|---|---|---:|---:|---:|---|
|d04：八种准备后借用加载融合|Richards|5|-12.68%|-7.90% / s001|明确的局部信号；不是整体赢家|
|d04|Gameboy|5|-8.48%|-6.74% / s001|宽覆盖融合值得作为局部材料保留|
|d03：八种动态lookahead融合|Richards|5|-10.68%|-5.78% / s001|解释了后来收窄到B2的演进方向|
|L030：六槽分离shape数组、u16下标|RayTrace|4|+1.45%|-7.79% / s001|主要回收父版退化，尚未超过A|
|P013：四槽缓存|RayTrace|4|+1.34%|-5.90% / s001|同样要注意分母|
|R：连续32次失配永久退出IC|own_method微基准|30|-12.02%|-10.61% / M|真有较大时间变化，但此案例没有退出，原因未归于退出策略|
|R|RegExp|30|-0.41%|-12.25% / M|主要回收M的退化；相对A区间跨零|

d03/d04见[v5完整Octane](../../experiments/ic_search_lab/v5_structural/comparison_octane.csv)，v3见[四轮逐项比值](../../experiments/ic_search_lab/v3_mass_search/exploration.level3.ratios.csv)，R见[三十轮报告](../../experiments/read_ic_dequickening/attempt01/results.md)。d04的RegExp比s001慢12.74%，SunSpider regexp-dna慢21.38%，所以不能只凭Richards选作默认底座。L030/RayTrace相对s001比值区间[0.915852,0.936105]，相对A为[0.978276,1.050063]；父版比较成立不等于超过无IC原版。上表无新增同批V8的项目均不推算V8差距。

另一个表面更大的数是expand01三轮中P1/CodeLoadClosure相对A降低18.63%，但同批s001相对A也降低19.33%，P1实际比s001慢0.87%；不能把18.63%叫P1新增优化。该方向还与当前原生Ubuntu中P1的Closure回退相反。来源[v6完整十条件](../../experiments/ic_search_lab/v6_targeted_ic/full_expand01_octane.times_and_parent_ratios.csv)。

时间之外的突出数据：

|版本/场景|测得的工作量变化|代价或限制|
|---|---|---|
|IO2/Splay|属性数组分配/重分配请求582575→49021，减少91.59%|普通对象+数组累计请求字节未减少；完整套件未变快|
|IO4/Splay|同类请求582575→33，减少99.9943%|两类累计请求字节53974320→68305952，增加26.55%|
|IO2_LAYOUT/Splay|独立N=1全进程峰值RSS中位数147176→143376 KiB，减少2.58%|每条件仅3个新进程；不代表正式固定N的峰值|
|AP1/Splay|own命中704113→1290876，增加约83.33%|三轮Splay相对s001时间只降低约2.00%，扩展Octane整体变慢3.13%|
|s004/两布局交替读取|8192次普通查找中的hash路径8192→2|MIC本身仍全失配；shape头56→64B；未取得整体明确收益|

IO/AP1来自[v7诊断与限制](../../experiments/ic_search_lab/v7_adaptive_layout/results.md)及memory_counts/mechanism_counts JSON，均为独立N=1全进程计数，包含Setup、校验和清理，不是计时区间耗时占比；数组请求含realloc。v7还有时钟受限和OOM补测失败记录，常规检查通过不等于完整安全验收。s004来自[真实hint诊断](../../experiments/ic_search_lab/v2_20261105/explanation.md)。

搜索数据中还保留了H027/Splay相对A约-31.57%等很大的短测值，但对应行标为UNSTABLE；模板控制CTRL000也出现约-29.91%的表面变化。这些不能作为优化亮点或重新挑选赢家的依据，原行在v3_screening_points.csv中原样保留。

当前最值得保留的历史线索是d04的局部融合覆盖，以及IO2以较少数组请求改善存储组织的方向；若以后继续，仍需独立验证与可靠计时。没有发现可以直接从旧数据认定为“相对A获得几十个百分点新IC收益，并在这些重度对象型Octane中整体追平V8”的遗漏赢家。稳定own读取接近V8、NavierStokes超过V8、以及数值类SunSpider优势，都是更窄但实测存在的事实。
