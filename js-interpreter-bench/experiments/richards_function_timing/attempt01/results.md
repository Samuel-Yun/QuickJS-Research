| 测量对象 | QuickJS median | V8 median | V8/QJS | 单位与边界 |
| --- | ---: | ---: | ---: | --- |
| A：原始 Richards 完整 Run | 3.3892 | 2.0602 | 0.6079 | ms/Run，内部完整执行 |
| B：原函数左真、右短路（state=4） | 65.158 | 40.023 | 0.6142 | ns/次，含批量调用框架 |
| B：原函数左假、右真（state=2） | 69.102 | 46.753 | 0.6766 | ns/次，含批量调用框架 |
| B：原函数两侧均假（state=0） | 68.934 | 45.456 | 0.6594 | ns/次，含批量调用框架 |

以上为**正式数据**：每行每引擎30个独立新进程，共240/240有效。每个进程只围绕整批读两次内部单调时钟；表中的median是“各进程批量平均”的中位数，不是逐次调用计时的中位数。A用共同N=256，B三条路径均用共同M=8,388,608。错误0、超时0、删除样本0，正式批次323.195–928.308ms。完整数值见[summary.csv](summary.csv)，原始批次、命令、输出及校验见[raw/formal.csv](raw/formal.csv)和raw/formal/。

## 正式数据的离散程度与区间

| 测量对象 | QJS Q1–Q3（IQR） | V8 Q1–Q3（IQR） | V8/QJS bootstrap 95%区间 |
| --- | --- | --- | --- |
| A，ms/Run | 3.3457–3.4329（0.0872） | 2.0432–2.0859（0.0427） | 0.6028–0.6150 |
| B，左真，ns/次 | 64.054–65.757（1.704） | 39.464–40.301（0.837） | 0.6061–0.6200 |
| B，左假右真，ns/次 | 68.290–70.352（2.062） | 45.804–47.086（1.282） | 0.6607–0.6841 |
| B，两侧假，ns/次 | 68.199–69.359（1.160） | 44.882–46.270（1.388） | 0.6553–0.6694 |

Q1/Q3使用(n−1)p线性插值；IQR=Q3−Q1。每组n=30，样本单位始终是独立进程。比值是V8中位数/QJS中位数，两组进程独立有放回重采样10,000次，使用percentile区间，seed及实现见[bootstrap.json](bootstrap.json)、[run.py](run.py)。这不是对总体性能或因果差距的置信声明。

## C：原始程序内部的归因，不能与A/B混成同一指标

| 引擎 | 本轮复核调用/Run | 原程序内目标函数累计时间/Run | 占比及分母 | 方法、样本与状态 |
| --- | ---: | --- | --- | --- |
| QuickJS | 10,671 | **UNAVAILABLE** | UNAVAILABLE | 现成工具仅native PC/属性site上下文，不能还原整函数；未开发新探针 |
| V8 | 10,671 | **仅诊断粗估约0.19–0.25ms/Run**，不是正式真值 | 约9.4%–11.3%，分母为本次profile内部保守窗口的时间区间归属总量 | DIAGNOSTIC_ONLY；3独立进程，每批2048Run，361–444个目标样本；下表逐次列出 |

**已获得整体正式耗时与原函数受控微基准耗时；尚未获得原始 Richards 内目标函数的可靠累计耗时及占比。**这里指可直接作无诊断正式结果的两引擎C值：QuickJS完全不可得；V8额外保留下面的粗略采样估计，不能将其提升为精确或无扰动的函数计时。不能据此填写“这个函数解释了多少跨引擎差距”。

### V8现成profiler实际取得了什么

实际binary提供`console.profile/profileEnd`和`d8.profiler.setOnProfileEndListener`，返回CPU profile JSON。没有下载/重建V8，也没有替换原函数。`--help`确认`--cpu-profiler-sampling-interval`存在后才使用；冻结的`--max-opt=0 --no-lazy`不变。`--prof`虽可用，本轮取得结构化API数据后没有再启动另一套整进程CLI采样。能力查询及全部原始输出见[raw/C/](raw/C/)。官方[V8采样说明](https://v8.dev/docs/profile)仅作能力背景，实际接口、命令及结构以本制品输出为准。

| 独立诊断 | 请求/实际中位间隔 | 目标/全部样本 | 未计入目标的GC等特殊样本 | 区间归属比例 | 区间归属摊销ms/Run | on/off内部耗时变化 |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| rep1 | 1000/1117µs | 444/3927 | 1 | 11.32% | 0.2458 | +4.53% |
| rep2 | 1000/1129µs | 405/3977 | 8 | 10.22% | 0.2270 | +8.36% |
| rep3 | 1000/1095µs | 361/3823 | 6 | 9.45% | 0.1938 | +0.35% |
| 改一次频率 | 2000/2097µs | 209/1981 | 2 | 10.55% | 0.2151 | 无该档独立off对照，不填 |

本表全部**诊断数据，不是正式性能样本**。范围是独立运行间的实际范围，不是IQR或95%区间；3次不足以描述采样系统误差，不将几千个相关采样点当独立进程来bootstrap。1ms档观测最大间隔2.234/2.534/2.274ms，2ms档最大3.287ms；未出现旧SIGPROF约10ms的粒度，但丢样/节流计数器未暴露，仍为UNKNOWN。详细分布、特殊节点、原始profile与身份见[diagnostics/C_profile_analysis.json](diagnostics/C_profile_analysis.json)及[C_profile_summary.csv](diagnostics/C_profile_summary.csv)。

目标函数在profile中匿名，按**本次诊断脚本URL、0基行700、列56**唯一匹配，不能仅按空函数名聚合。该行逐字对应原始赋值；原函数SHA256为`d75a4572f184bf1403229f373888ea8fc0d6ad2c48e9de35793cc5ab3eceb485`。目标节点在这些采样树中无子节点，故观测到的self/inclusive节点计数相同；不据此断言每次调用没有helper。

时间含义是**sampled JS-frame residence的粗略elapsed区间归属估计**：把每个timeDelta对应的区间交给该区间末尾的sample栈；在目标节点或其后代才记给目标。它不是入口/出口秒表计时，也不是CPU样本占比乘A正式wall time。原程序中进入callee前的receiver方法读取和调用分派不在目标JS帧内；helper只有采样栈保留该帧时才被记入；根GC/特殊节点单列、不强分给目标，未知归属与丢样不补数。

profiler在原A批次timer前开启、timer后停止，启动/静态加载不进入该profile。额外读取时钟只用于独立诊断的窗口括界，A/B仍严格两次。profile跨度比内部批次长2.213/2.653/2.829/2.527ms；分析排除前后括界的保守边带，不假设profile绝对时间与benchNow有同一原点。余下窗口按同速单调时钟的相对跨度核对；对该时钟关系的完整源码/构建证明、采样偏差仍UNKNOWN，所以只给粗范围，不能称无扰动真实占比。三次相邻off/on的扰动为+0.35%至+8.36%，没有扣除，也不把“接近”视作无扰动。C的WSL boot与A/B不同，逐次bootID/时间戳保留，不将C耗时与A正式耗时合并。

QuickJS实际`--help`没有可用JS函数级profiler；现有安全采样结构仅`pc/ns/site`，site是属性操作，不是完整当前JS函数。当前WSL的`command -v perf`无结果，`perf_event_paranoid=2`，不安装新工具、不改sysctl/申请root。即使只有原生符号的perf可用，也不足以把handler时间归到此JS函数。具体命令与输出见raw/C/platform_capabilities.json和diagnostics/C_source_notes.json。**旧85/9查找样本没有被当作C，也没有使用B×10,671。**

## 做了什么，计时包含什么

沿用冻结WSL2 Ubuntu24.04.2/x86_64、QuickJS upstream2026-06-04（commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，GCC13.3、-O2）与官方Linux d8/V8 15.6.21。完整路径/SHA256、snapshot/ICU/动态库、adapter、flags见[manifest.json](manifest.json)。正式QJS SHA256：`140d5233b0337d91cb0f994ae4a051e49aa04da8802acfaedf0a01b81a620b79`；d8 SHA256：`83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`。V8原有mode证据及本轮实际flag dump分别保存；未改成jitless/Node，未开启任何正式trace/profile/IC日志。

A逐字复用上一轮未改写Richards standalone，仅替换batch N。内部包含原runRichards构造、调度及原有2322/928断言；静态加载、编译、ResetRNG/Setup/TearDown及输出在外。B逐字加载同一upstream base.js/richards.js，目标方法不手写；原TCB构造器、真实IdleTask/Scheduler实例和固定state在timer外创建，timer内每次直接`receiver.isHeldOrSuspended()`，布尔值累加后检查。对象不是临时`{state:...}`，未用.call/.bind、未缓存方法。

无计时前workload调用，**首次调用在内**；随后N/M次自然形成反馈与运行状态，不是每次冷启动。B的数十ns是整批摊销，包含循环、方法读取、receiver调用、布尔累加及实际helper/GC；不是原函数self-time，更不是一次state读取成本。两条state读取路径比左真路径的点估计更长，但不能把时间差叫“第二次查找成本”，其中还有分支、比较、控制流等区别。

## 正确性、数量级与统计检查

- 独立correctness 24/24 PASS，两边原断言/布尔checksum及receiver shape检查通过；不在正式进程预跑求expected。时钟探针两边均无倒退；最小正差QJS约150ns、V8约1µs，正式计时是几百ms整批，不是按单个短调用读时钟。
- 独立dump确认仍为QJS16条/29B、V8 14条/31B。原始与目标筛选输出均保留，不用诊断版耗时替代release结果，未编辑dump凑条数。见diagnostics/bytecode_check.json。
- 另用明确标记的JS计数副本在两引擎各跑N1/N2：10,671/21,342次；原state分布也完全翻倍。计数副本多了入口计数与state读取，不进入任何正式计时或原dump。每Run state 0/1/2/3/4/5分别为2464/1783/3542/2326/17/539；对应左真556、左假右真3542、两假6573。B三种固定state不是这个动态分布或顺序。
- 校准先按2倍增长，再用额外独立进程确认时长；M/2、M、2M各3进程/引擎。三档median的最大/最小比：QJS约1.021–1.047，V8约1.007–1.084。数量级基本一致但有波动，尤其左真V8约8.4%；没有挑选最快一档。见scaling_summary.csv。
- 固定seed20261018随机化case与两引擎顺序，各组QJS先/V8先各15轮。没有并行跑竞争任务，没有删除outlier。每进程一个样本，mean/样本std/min/max等保留于CSV。
- [audit.json](audit.json)与独立[check_results.py](check_results.py)/[independent_audit.json](independent_audit.json)验证数量、唯一位置、顺序、共同JS/hash、原flags、单位、checksum、原算法身份和统计。失败的过滤器/解析过程及未执行的C换行稿均保留，不覆盖旧数据。

## 可以说什么，还缺什么

这台机器与该口径下，V8在原始Richards整Run和这三种原函数批量调用中都更短；这是本轮数据，不是单条指令或所有JS程序的排名。三种短路路径在两边都有可见的点估计差异，但B不能直接外推原程序，函数占比也不能当作跨引擎差距贡献。

V8已有能识别确切JS函数的低成本现成采样接口，提供了约十分之一采样窗口的诊断线索。QuickJS尚缺同一原程序中可靠的函数上下文归因，故**不能计算两边该函数累计时间差，更不能说它解释了总体差距的某个比例**。下一步若继续做C，最有价值的是在低扰动、可核对的函数上下文下补QJS对应诊断，并检验采样偏差；本轮未开发该工具。

主机功耗/频率与后台负载未受控，完整V8制品源码/编译参数仍UNKNOWN；本轮不扩展研究范围、不据此实现优化。汇报可直接使用[ppt_summary.md](ppt_summary.md)的四行A/B表，C另列并加诊断标注，不改现有PPT。
