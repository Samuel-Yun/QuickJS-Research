# Octane同批A/M/H/OFF/ON：跨boot停止，交付部分结果

**未完成原定30轮。** WSL外部中断后boot改变，正式完成2181/2550条，全部完成记录有效；
缺369个完成结果，其中1个仅有启动标记、368个未见启动标记。没有跨boot补位或重试。
下表使用全部已完成有效样本（每格25或26），不是伪填30。

|case|A ms/Run (n)|M ms/Run (n)|H ms/Run (n)|OFF ms/Run (n)|ON ms/Run (n)|状态|
|---|---|---|---|---|---|---|
|Richards.Richards|3.349376 (26)|3.156139 (26)|3.250591 (26)|3.341919 (26)|3.236837 (26)|INCOMPLETE|
|DeltaBlue.DeltaBlue|6.946946 (26)|6.701554 (26)|6.661800 (26)|6.953012 (26)|6.639350 (26)|INCOMPLETE|
|Crypto.Encrypt|5.061323 (25)|4.908592 (25)|5.029278 (25)|5.163840 (25)|5.145738 (25)|INCOMPLETE|
|Crypto.Decrypt|95.349529 (25)|92.250643 (25)|94.110578 (25)|97.456842 (25)|96.402178 (25)|INCOMPLETE|
|RayTrace.RayTrace|37.111802 (25)|39.168197 (25)|41.055434 (25)|40.009868 (25)|40.879914 (25)|INCOMPLETE|
|EarleyBoyer.Earley|6.734183 (26)|6.762482 (26)|6.765409 (26)|6.713548 (26)|6.694191 (26)|INCOMPLETE|
|EarleyBoyer.Boyer|103.166430 (26)|101.406742 (26)|104.449040 (26)|102.484394 (26)|102.480170 (26)|INCOMPLETE|
|RegExp.RegExp|177.232051 (25)|201.471973 (25)|176.527800 (25)|176.758117 (25)|176.872360 (25)|INCOMPLETE|
|Splay.Splay|2.072632 (26)|2.202484 (26)|2.218622 (26)|2.211864 (26)|2.191563 (26)|INCOMPLETE|
|NavierStokes.NavierStokes|56.364387 (26)|52.731885 (26)|54.769042 (26)|56.561028 (26)|56.224041 (26)|INCOMPLETE|
|PdfJS.PdfJS|173.757327 (26)|172.925980 (26)|171.623390 (26)|171.860162 (26)|172.652671 (26)|INCOMPLETE|
|Mandreel.Mandreel|1701.528615 (26)|1670.984650 (26)|1708.433860 (26)|1701.533056 (26)|1697.356242 (26)|INCOMPLETE|
|Gameboy.Gameboy|316.613708 (25)|311.826291 (25)|325.488125 (25)|322.665583 (25)|318.800662 (25)|INCOMPLETE|
|CodeLoad.CodeLoadClosure|0.592652 (26)|0.642477 (26)|0.630813 (26)|0.625506 (26)|0.628795 (26)|INCOMPLETE|
|CodeLoad.CodeLoadJQuery|10.277509 (26)|10.870692 (26)|10.550993 (26)|10.601324 (26)|10.641760 (26)|INCOMPLETE|
|Typescript.Typescript|2028.843179 (25)|1980.685404 (25)|1990.024157 (25)|2030.143419 (25)|1984.941928 (26)|INCOMPLETE|
|Box2D.Box2D|未测 (0)|未测 (0)|未测 (0)|未测 (0)|未测 (0)|RUNS_NO_TRUSTED_OUTPUT_GATE|
|zlib.zlib|8067.336835 (26)|8051.162174 (26)|7967.828508 (26)|7862.321494 (26)|7841.133288 (26)|INCOMPLETE|

单位为内部ms/原完整Run，中位数；括号是实际有效新进程数，不是目标配额。
A为无本研究IC补丁的upstream原版；M为own单槽读IC；H为M加受限一层原型data IC；
OFF/ON为同一switch ELF的继承条目填充关闭/开启，own IC始终保留。
首Run包含、无额外workload预跑。不同Run的绝对毫秒不能直接合成引擎分数。
完整Q1/Q3/min/max/mean/样本stddev/IQR与实际n见summary/per_condition.csv，
外部墙钟和子进程CPU为单列metric，不与内部时间相减。

## 各项目相对原版和同ELF开关的变化

|case|M/A变化% [95%区间]|H/A变化% [95%区间]|ON/A变化% [95%区间]|ON/OFF变化% [95%区间]|
|---|---|---|---|---|
|Richards.Richards|-5.77% [-6.36, -4.96]|-2.95% [-3.71, -2.24]|-3.36% [-3.89, -2.00]|-3.14% [-3.88, -1.89]|
|DeltaBlue.DeltaBlue|-3.53% [-4.47, -2.46]|-4.10% [-4.83, -3.10]|-4.43% [-5.12, -3.29]|-4.51% [-5.67, -3.37]|
|Crypto.Encrypt|-3.02% [-4.10, -2.06]|-0.63% [-1.77, +0.02]|+1.67% [+0.11, +3.10]|-0.35% [-1.43, +1.14]|
|Crypto.Decrypt|-3.25% [-3.95, -2.09]|-1.30% [-2.14, +0.58]|+1.10% [+0.26, +3.56]|-1.08% [-2.29, +1.29]|
|RayTrace.RayTrace|+5.54% [+4.48, +6.63]|+10.63% [+9.76, +11.95]|+10.15% [+9.11, +11.75]|+2.17% [+0.86, +3.42]|
|EarleyBoyer.Earley|+0.42% [-1.15, +2.01]|+0.46% [-0.48, +1.36]|-0.59% [-1.67, +0.39]|-0.29% [-1.65, +0.87]|
|EarleyBoyer.Boyer|-1.71% [-2.47, -0.65]|+1.24% [+0.29, +3.39]|-0.67% [-1.67, +0.41]|-0.00% [-0.86, +0.95]|
|RegExp.RegExp|+13.68% [+12.79, +14.32]|-0.40% [-1.16, +0.66]|-0.20% [-0.80, +0.42]|+0.06% [-0.93, +0.53]|
|Splay.Splay|+6.27% [+4.69, +8.49]|+7.04% [+5.42, +8.89]|+5.74% [+4.41, +7.28]|-0.92% [-1.79, +0.71]|
|NavierStokes.NavierStokes|-6.44% [-7.91, -5.75]|-2.83% [-4.49, -2.43]|-0.25% [-1.61, +0.63]|-0.60% [-1.13, +0.30]|
|PdfJS.PdfJS|-0.48% [-1.74, +1.29]|-1.23% [-2.66, -0.85]|-0.64% [-2.08, -0.14]|+0.46% [-0.94, +1.27]|
|Mandreel.Mandreel|-1.80% [-3.07, -1.16]|+0.41% [-0.84, +1.13]|-0.25% [-1.66, +0.45]|-0.25% [-1.14, +0.47]|
|Gameboy.Gameboy|-1.51% [-2.64, -0.23]|+2.80% [+1.29, +4.24]|+0.69% [-0.57, +2.01]|-1.20% [-2.31, +0.22]|
|CodeLoad.CodeLoadClosure|+8.41% [+7.06, +10.75]|+6.44% [+5.20, +7.97]|+6.10% [+4.90, +8.47]|+0.53% [-1.44, +1.63]|
|CodeLoad.CodeLoadJQuery|+5.77% [+3.67, +6.70]|+2.66% [+0.59, +3.44]|+3.54% [+1.84, +4.98]|+0.38% [-0.59, +1.78]|
|Typescript.Typescript|-2.37% [-5.73, -1.14]|-1.91% [-5.93, -0.45]|-2.20% [-5.54, -1.00]|-2.26% [-3.99, -0.87]|
|Box2D.Box2D|RUNS_NO_TRUSTED_OUTPUT_GATE|RUNS_NO_TRUSTED_OUTPUT_GATE|RUNS_NO_TRUSTED_OUTPUT_GATE|RUNS_NO_TRUSTED_OUTPUT_GATE|
|zlib.zlib|-0.20% [-1.30, +0.53]|-1.23% [-2.29, -0.25]|-2.80% [-3.74, -2.01]|-0.27% [-1.01, +0.97]|

上表为耗时变化百分比，负数更快。时间比=分子中位数/分母中位数；变化=100×(比值−1)。
同轮五条件完整组配对bootstrap10000次、seed20261030，95%线性百分位探索性区间，未做多重比较校正。
逐项比值只用该case五条件齐全的25或26轮；绝对时间表使用全部有效样本。
例如Typescript/ON多出的第26轮单条不进入配对比值，因此不能用全样本中位数相除强行核对其配对点估计。
跨1/变化跨0只表示方向不明确，不证明等效；失败和缺失不填数字。
全部八组比较（另含H/M、ON/M、ON/H、OFF/M）见summary/ratios.csv。
对应图在summary/plots/；虚线为比值1，点为中位数之比，线为区间，绿色/红色表示区间低于/高于1，灰色跨1。

## 原定30轮主总体：无法完整估计

|集合|Run/suite数|比较|suite等权时间比|95%区间|变化%|判断|
|---|---|---|---|---|---|---|
|MAIN_FIXED16_WITH_CRYPTO|16/13|M/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|H/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|ON/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|H/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|ON/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|ON/OFF|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|ON/H|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|MAIN_FIXED16_WITH_CRYPTO|16/13|OFF/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|M/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|H/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|ON/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|H/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|ON/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|ON/OFF|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|ON/H|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|SUPPLEMENT_NO_CRYPTO_FIXED14|14/12|OFF/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|M/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|H/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|ON/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|H/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|ON/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|ON/OFF|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|ON/H|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_ADMITTED_17|17/14|OFF/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|M/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|H/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|ON/A|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|H/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|ON/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|ON/OFF|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|ON/H|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|
|EXPLORATORY_COMPLETE_INTERSECTION|0/0|OFF/M|未估计|未估计|未估计|UNAVAILABLE_FIXED_SET_INCOMPLETE|

主集合是原固定16 Run/13suite，包含固定输入Crypto；排除Crypto的14 Run/12suite仅作历史口径补充。
每个suite先对其子项时间比取GM，再对suite等权取GM，不让Crypto/EarleyBoyer/CodeLoad获得双倍权重。
总体每次用所有case共享的完整轮次抽样，重算逐项中位数及上述suite权重。
完整18 Run扩展集合因Box2D缺可信最终结果门禁而不可估计，summary/aggregate.json明确列missing，
没有把17项称成完整18项。可比扩展17 Run/14suite（含zlib）另标EXPLORATORY_ADMITTED_17。
固定集合若有失败或未采满，主总体标无法完整估计；不会以删失败后的更好子集代替。
这里所有既有16项均已覆盖，缺的是计划中的轮次，不是删掉慢项目。

### 中断后另列：共同25轮的探索性总体

以下单独使用rep0—24，所有case×五条件均完整：固定16项2000进程，扩展17项2125进程。
这是按interruption_protocol.md新增的明确标注分析，不替换上面的主总体，也不冒充采样前预声明结果。
仍按同轮块bootstrap10000次重算suite等权中位数比，区间未做多重比较校正。

|固定16项/13suite，25轮|比值|95%区间|耗时变化%|
|---|---|---|---|
|M/A|1.00366|[0.99976, 1.00601]|+0.37|
|H/A|1.00824|[1.00355, 1.01092]|+0.82|
|ON/A|1.00765|[1.00386, 1.01050]|+0.77|
|H/M|1.00456|[1.00083, 1.00772]|+0.46|
|ON/M|1.00397|[1.00163, 1.00749]|+0.40|
|ON/OFF|0.99228|[0.98903, 0.99451]|−0.77|
|ON/H|0.99941|[0.99719, 1.00339]|−0.06|
|OFF/M|1.01178|[1.00973, 1.01567]|+1.18|

|共同25轮补充集合|M/A [95%区间]|H/A [95%区间]|ON/A [95%区间]|
|---|---|---|---|
|14项/12suite，无Crypto|1.00664 [1.00254, 1.00899]|1.00975 [1.00467, 1.01253]|1.00713 [1.00278, 1.00998]|
|17项/14suite，含zlib|1.00330 [0.99951, 1.00552]|1.00677 [1.00218, 1.00943]|1.00503 [1.00146, 1.00773]|

完整24行及每suite分布见summary/exploratory_partial.csv和exploratory_partial.json。
可见当前部分数据不支持H/ON整体优于原版A；但同ELF内开关存在较小的整体增量收益。
M单项改善较多也不等于suite等权整体更快。尚未采满30轮，不能外推最终批次方向必然不变。

|固定16集合比较|区间支持改善|区间支持退化|方向不明确|不可估计/失败|
|---|---|---|---|---|
|M/A|9|5|2|0|
|H/A|5|6|5|0|
|ON/A|4|6|6|0|
|ON/OFF|3|1|12|0|

- M/A最大耗时变化点估计：RegExp.RegExp，+13.68%，区间[+12.79, +14.32]%；判断regression。
- H/A最大耗时变化点估计：RayTrace.RayTrace，+10.63%，区间[+9.76, +11.95]%；判断regression。
- ON/A最大耗时变化点估计：RayTrace.RayTrace，+10.15%，区间[+9.11, +11.75]%；判断regression。
- ON/OFF最大耗时变化点估计：RayTrace.RayTrace，+2.17%，区间[+0.86, +3.42]%；判断regression。

这些计数基于固定16个Run，不是suite数。所谓最大变化是点估计，不代表已证明因果或确认性显著。

## 能否说H/ON整体优于原版A

- M/A：未估计，固定集合缺失，无法完整估计。
- H/A：未估计，固定集合缺失，无法完整估计。
- ON/A：未估计，固定集合缺失，无法完整估计。
- H/M：未估计，固定集合缺失，无法完整估计。
- ON/OFF：未估计，固定集合缺失，无法完整估计。
- ON/H：未估计，固定集合缺失，无法完整估计。

应先看上述相对A的主总体及回归范围，再决定实现是否值得继续，不能用Richards或原型微例一项决定整版去留。
“不可接受的回归”没有预先约定阈值，本报告给出各项及最大回归，不擅自替研究者定义验收线。
本批部分轮次的suite分布见exploratory_partial.json/by_suite；收益集中在哪里应按这些分项阅读，不能仅数获胜Run代替等权总体。
没有分项耗时证据，本轮不能把差距全部归到shape查找、引用维护、24B结构或native布局。

## 实际采集和覆盖

本轮正式完成2181/2550，有效2181，已完成记录中失败0；另1个启动状态UNKNOWN。
缺369个完成结果（1个有启动标记但无完成结果，368个未见启动标记）。
原固定16项有效2051/2400；新增zlib有效130/150。
N1/N2正确性170/170，选定N正确性85/85；pilot实际170条。
正式低于1000ms的0条全部保留，没有删除异常值或重新挑窗口。

计划为17项×5条件×30新进程，seed20261030，case顺序预先打乱、每case五条件相邻。
计划六组随机基序各取五种轮转再打乱、每条件各位置6次；不是覆盖全部120种排列。
中断后实际尚未达到完整30轮的位置平衡，不能把计划平衡写成实际已实现。
共同N、pilot选择依据和选定N正确性见selected_n.csv、pilot_start/、raw/pilot、raw/selected_correctness。
N1/N2不是正式数据，Crypto额外plain/观察诊断也不进入正式时间。

Box2D五条件能运行，但原Run没有可核对最终结果，不能把无框架门禁叫引擎不兼容；
本轮保留五份真实兼容记录及主表空项。zlib用五条件一致--std/read接口通过原断言，
未提前初始化、移动Run内I/O/eval或改压缩算法。其原验证是长度加C strcmp，具有NUL终止限制，
不是本轮新证明100kB所有字节均相等。Splay/Mandreel官方latency不在本Run指标内。

## 输入、环境和限制

Crypto的BENCH_ONLY_XORSHIFT32_PRELOAD_V1 seed305419896在base/crypto前安装，RC4不在Setup或Run重置。
N1/N2及选定N有五条件plain/观察hook的流式真实数据摘要核对，正式无hook，末次密文对门禁。
原RegExp构造但不预跑、NavierStokes计时后补验、Encrypt后校验、Decrypt前置加密均与旧driver一致。
固定源码/adapter/driver与实际脚本SHA在inputs.json、frozen.json，旧时间没有填入本轮。

同一WSL2 Ubuntu24.04.2/x86_64主机，Ryzen7 5800H，固定CPU2；当前查询供电、
电源方案及结束快照见host_windows*.json。没有擅改系统电源/governor/ASLR/WSL设置。
频率、温度、连续宿主后台和虚拟到物理SMT映射仍UNKNOWN，短CPU快照不代表整段负载。
RUSAGE_CHILDREN差分是完整子进程CPU而非JS区间self-time，不能用它筛“受调度影响”的正式样本。
数值控制仅为环境记录，不设停止矩阵的波动门槛。

四个ELF均为冻结身份，没有新引擎构建或IC修改。switch的新sanitizer仍未完成，旧H的安全验证不是switch新PASS。
中断后四个ELF/依赖hash仍匹配，但这是新boot的只读检查，不是原cohort正常收尾连续性证明。
重启具体原因UNKNOWN；Typescript/M待完成位置没有退出结果，不能归为该版本正确性回归。
静态加载/Setup在外，首次与重复原Run在内，包括动态编译、helper、GC、RegExp及原Run断言；不是每次全冷或pure lookup self-time。

## 最后：旧局部机制证据只帮助提出解释

旧四案例的ON/OFF约6.8%收益、旧Richards查找次数下降都不是本轮总体的替代物。
它们只说明受限继承缓存确实能在某些位置生效；本轮是否净优于A必须看本批固定16集合。
若本批某些suite改善而另一些回归，初始化/共用路径、shape保活、工作量与代码生成布局只是候选原因，
没有独立分项时间就不写成确定根因。本轮到此只测量，不实现下一项优化。

复现、缺失清单及新cohort恢复入口见README；公开raw重算不打开Linux ELF、不启动引擎。
