# V8关键IC机制迁移：A / E / V8_ON 同批结果

## 1. 做了什么，哪些确实实现

E从冻结原版A重新接入，不是M/H改名。新增最终字节码实例逐位置反馈、
按第8次目标属性操作延后建立vector、内嵌单态entry、按需四项PIC、第五种shape
转普通GENERIC，以及own data读取、最多三层完整shape链守卫的prototype data读取、
已有own writable data写入handler。特殊操作沿原语义回退。

实现依据为固定V8参考提交37fb84941c9be9f9914ee50b1ad366f06a1bd764的21份
实际归档文件；[机制映射](mechanism_mapping.md)逐项列入口、依赖和差异，
[实际调用链](v8_call_chain.md)及[设计](design.md)说明读端、更新、修改端保护及生命周期。未迁移validity cell、弱Map/holder、
constant handler、共享mega stub cache、keyed/global handler；不是完整V8 IC移植。
E链守卫仍需逐层检查，强引用仍会保活并增加COW/GC边，不能称与V8成本等价。

首次attempt01在新增C API回归中失败，原558条数据保留但不用于性能结论。
attempt02只修复store miss的提交/缓存更新顺序并重新构建、验证；其169条时间因
外部中断/WSL重启保留为独立不完整cohort。attempt03复用同一精确修复版E，
重新完成本表的新cohort，不跨boot补位，不按正式结果调参或混入旧时间。
[cohort说明](cohort_notes.md)、[修复说明](repair_notes.md)及
[最小差异](attempt01_to_attempt02_safety.patch)保留可复查原因。

## 2. 本批身份、计时和正确性

- cohort：`WSL2_V8_INSPIRED_IC_20261031_attempt03_958f13bd`，WSL2 Ubuntu24.04.2/x86_64；单一boot，CPU affinity [2]。
- A：QuickJS2026-06-04，upstream04be246001599f5995fa2f2d8c91a0f198d3f34c；SHA `584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1`。
- E Release：SHA `3d36ec898484efca3a3a445662d1e9cfec1ec83c1fcce98e8cf8e0c7b908e482`；GCC13.3，沿原Makefile的-O2/-g/-fwrapv，无新增LTO/PGO/NDEBUG。
- V8：d8 15.6.21，SHA `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`，`--jitless --no-lazy --use-ic`，冻结snapshot/ICU。
  实际d8构建commit/toolchain/GN全参数UNKNOWN；固定参考源码不能补成制品身份。
- 内部原生单调performance.now计N个完整Run，报告ms/Run；第一次Run包含，无额外workload预跑。
  静态加载、必需Setup、后验验证在外；原Run动态编译、GC/helper/builtin/RegExp和原断言在内。
  Setup可能有自身预备行为；N次重复自然变热，不称每次冷访问或pure interpreter-loop self time。
- 新语义脚本三条件各16场景/4131断言；复用语义门禁共18个进程通过。
  E内部12场景/1341断言验证1/2/4槽、5–8shape泛型、不同PC、两层C API修改、unhashed拒绝、可选分配失败。
  新E的上游make test、Release与ASan/UBSan定向GC/OOM/roundtrip、qjsc嵌入、热bytecode双向copy/ROM均通过。
  新增finalizer回归在A/E/E_san通过；没有宣称完整test262或所有嵌入行为已覆盖。
  这些安全门禁来自同一精确E、同一主机的attempt02实际运行，本attempt明确复用，
  不是冒充本boot重跑；[artifact_reuse.json](artifact_reuse.json)记录identity与来源。
- 17 Run×三条件×N1/N2 =102个独立correctness记录通过；选定N再查，Crypto三条件N1/N2及selectedN实际输入流一致。
  保留原RegExp、NavierStokes补验、Encrypt后验和Decrypt前置加密规则。

计时协议、冻结源码和排列见[protocol.json](protocol.json)、[frozen.json](frozen.json)、[schedule.json](schedule.json)。
前后binary/依赖/源码SHA均核验；正式无计数/trace。Windows供电/负载只是前后可知观测，
频率、温度、连续后台隔离UNKNOWN，未改电源/governor/ASLR等系统设置。

## 3. 全部逐项时间

以下是一次完整原Run的内部中位ms，不是一个属性操作的时间。N为同case三条件共用的
进程内重复数；每条件30个新进程。同case三条件相邻，六种顺序各5次，seed20261031。

|Run|N|A ms/Run|E ms/Run|V8_ON ms/Run|有效n(A/E/V8)|
|---|---:|---:|---:|---:|---|
|Richards.Richards|512|3.485667|3.467254|2.092929|30/30/30|
|DeltaBlue.DeltaBlue|512|7.113793|6.769980|3.708459|30/30/30|
|Crypto.Encrypt|256|5.220853|5.234742|4.427980|30/30/30|
|Crypto.Decrypt|16|98.525193|99.535982|82.669469|30/30/30|
|RayTrace.RayTrace|64|38.418657|39.948905|17.215180|30/30/30|
|EarleyBoyer.Earley|512|7.055376|7.075267|2.233311|30/30/30|
|EarleyBoyer.Boyer|32|108.248337|107.111456|44.997547|30/30/30|
|RegExp.RegExp|64|182.660533|181.136197|29.026453|30/30/30|
|Splay.Splay|1024|2.254810|2.402396|1.852553|30/30/30|
|NavierStokes.NavierStokes|32|58.403663|57.621671|69.903891|30/30/30|
|PdfJS.PdfJS|16|179.575707|178.948723|100.923250|30/30/30|
|Mandreel.Mandreel|1|1753.731440|1776.200023|1475.976500|30/30/30|
|Gameboy.Gameboy|4|325.005142|340.351052|299.886375|30/30/30|
|CodeLoad.CodeLoadClosure|4096|0.626954|0.644524|0.319328|30/30/30|
|CodeLoad.CodeLoadJQuery|256|10.655584|11.026771|4.601184|30/30/30|
|Typescript.Typescript|1|2152.964634|2227.024333|1392.222000|30/30/30|
|zlib.zlib|1|8382.489506|8483.906934|7361.491500|30/30/30|

完整mean、样本stddev、Q1/Q3、IQR、min/max以及外部进程wall和CPU时间见
[statistics.csv](summary/statistics.csv)。Q1/Q3用排序后上下各半的中位数；
外部wall/CPU不与内部中位数相减来估算初始化成本。所有异常值保留。

以下为辅助整进程中位数，单位ms/process；包含启动、Setup、N次Run、校验和退出。
CPU为同一子进程user+system之和；不是内部区域CPU，不与ms/Run混用。

|Run|wall A/E/V8|CPU A/E/V8|
|---|---:|---:|
|Richards.Richards|1791.87/1782.83/1100.10|1754.25/1740.50/1070.90|
|DeltaBlue.DeltaBlue|3649.51/3473.75/1928.52|3560.55/3393.59/1883.19|
|Crypto.Encrypt|1448.53/1446.78/1249.47|1410.71/1409.52/1214.34|
|Crypto.Decrypt|1590.37/1607.00/1358.70|1553.16/1568.83/1319.49|
|RayTrace.RayTrace|2466.30/2564.27/1130.99|2411.50/2504.43/1100.43|
|EarleyBoyer.Earley|3629.86/3640.26/1183.62|3548.48/3576.88/1145.18|
|EarleyBoyer.Boyer|3481.54/3447.84/1487.08|3403.65/3370.60/1439.21|
|RegExp.RegExp|11716.27/11619.10/1905.94|11449.77/11375.21/1859.93|
|Splay.Splay|2821.46/3001.92/2070.86|2762.30/2928.96/2018.84|
|NavierStokes.NavierStokes|1880.96/1855.69/2264.89|1830.23/1813.22/2210.02|
|PdfJS.PdfJS|3086.87/3085.18/1838.22|3013.15/3005.93/1743.44|
|Mandreel.Mandreel|3205.82/3247.24/3062.07|3119.18/3158.59/2819.31|
|Gameboy.Gameboy|1340.96/1405.04/1267.99|1304.49/1374.84/1220.14|
|CodeLoad.CodeLoadClosure|2700.26/2775.93/1392.80|2638.39/2709.46/1354.49|
|CodeLoad.CodeLoadJQuery|2736.86/2831.84/1216.86|2672.80/2764.08/1183.31|
|Typescript.Typescript|2370.23/2448.93/1562.47|2302.10/2377.92/1432.15|
|zlib.zlib|8395.86/8496.33/7395.46|8191.77/8313.75/7221.11|

反馈释放、原生资源清理和TearDown可能在内部计时外，因此只看内部比值不能代表
所有维护代价已计入；整进程辅助表也不能通过中位数相减给它们精确归因。

## 4. 比值、探索性区间及净结果

<1表示分子更快；百分比耗时变化=100×(ratio−1)。逐项以完整同轮三元组为单位
重采样10000次，固定seed20261031，计算中位数之比及线性百分位95%区间。
跨1只写方向不明确；未经多重检验校正，也不是等效检验。

|Run|E/A [95%]|E/V8_ON [95%]|A/V8_ON [95%]|
|---|---:|---:|---:|
|Richards.Richards|0.9947 [0.9800, 1.0095]|1.6567 [1.6324, 1.6732]|1.6654 [1.6405, 1.6823]|
|DeltaBlue.DeltaBlue|0.9517 [0.9450, 0.9601]|1.8256 [1.7903, 1.8388]|1.9183 [1.8778, 1.9313]|
|Crypto.Encrypt|1.0027 [0.9885, 1.0184]|1.1822 [1.1648, 1.1986]|1.1791 [1.1664, 1.1927]|
|Crypto.Decrypt|1.0103 [0.9869, 1.0202]|1.2040 [1.1819, 1.2140]|1.1918 [1.1833, 1.2060]|
|RayTrace.RayTrace|1.0398 [1.0257, 1.0519]|2.3206 [2.2723, 2.3418]|2.2317 [2.1792, 2.2638]|
|EarleyBoyer.Earley|1.0028 [0.9946, 1.0177]|3.1681 [3.1134, 3.2090]|3.1592 [3.1016, 3.1871]|
|EarleyBoyer.Boyer|0.9895 [0.9766, 0.9975]|2.3804 [2.3486, 2.4247]|2.4056 [2.3757, 2.4561]|
|RegExp.RegExp|0.9917 [0.9882, 0.9969]|6.2404 [6.1998, 6.2804]|6.2929 [6.2401, 6.3257]|
|Splay.Splay|1.0655 [1.0275, 1.0943]|1.2968 [1.2518, 1.3421]|1.2171 [1.1917, 1.2419]|
|NavierStokes.NavierStokes|0.9866 [0.9761, 0.9972]|0.8243 [0.8176, 0.8313]|0.8355 [0.8278, 0.8437]|
|PdfJS.PdfJS|0.9965 [0.9890, 1.0129]|1.7731 [1.7476, 1.8036]|1.7793 [1.7478, 1.7957]|
|Mandreel.Mandreel|1.0128 [0.9985, 1.0203]|1.2034 [1.1821, 1.2144]|1.1882 [1.1755, 1.2025]|
|Gameboy.Gameboy|1.0472 [1.0329, 1.0613]|1.1349 [1.1227, 1.1479]|1.0838 [1.0683, 1.0954]|
|CodeLoad.CodeLoadClosure|1.0280 [1.0097, 1.0459]|2.0184 [1.9892, 2.0694]|1.9634 [1.9250, 2.0204]|
|CodeLoad.CodeLoadJQuery|1.0348 [1.0143, 1.0467]|2.3965 [2.3353, 2.4306]|2.3158 [2.2591, 2.3622]|
|Typescript.Typescript|1.0344 [1.0186, 1.0500]|1.5996 [1.5816, 1.6209]|1.5464 [1.5274, 1.5713]|
|zlib.zlib|1.0121 [1.0055, 1.0200]|1.1525 [1.1473, 1.1592]|1.1387 [1.1304, 1.1456]|

按suite内子项GM、suite等权GM聚合：核心16项/13suite是主集合，含zlib的17项/14suite
另列。全套包含Crypto；Crypto/Earley/CodeLoad不因子项多而加权。总体bootstrap使用
所有case共享的同轮block索引，不跨case加毫秒，不是官方Octane总分。

|固定集合|E/A [95%]|E/V8_ON [95%]|A/V8_ON [95%]|
|---|---:|---:|---:|
|core16_13suite|1.0115 [1.0077, 1.0148]|1.7366 [1.7282, 1.7421]|1.7169 [1.7101, 1.7214]|
|expanded17_14suite|1.0115 [1.0082, 1.0145]|1.6865 [1.6791, 1.6913]|1.6673 [1.6611, 1.6712]|

核心16项按E/A逐项探索性区间：改善4、退化6、方向不明确6。含zlib17项：改善4、退化7、方向不明确6，版本独有正式失败0。
最大耗时增加点估计为Splay.Splay，E/A=1.0655（+6.55%）；最小为DeltaBlue.DeltaBlue，E/A=0.9517（-4.83%）。

core16_13suite：整体净耗时增加。E相对A耗时点变化+1.15%。归一化到V8的耗时由1.7169变为1.7366，差值-0.0197个V8单位；E仍慢于V8_ON，E相对V8_ON耗时点变化+73.66%。这不是IC单项成本或纯执行成本分解。

expanded17_14suite：整体净耗时增加。E相对A耗时点变化+1.15%。归一化到V8的耗时由1.6673变为1.6865，差值-0.0192个V8单位；E仍慢于V8_ON，E相对V8_ON耗时点变化+68.65%。这不是IC单项成本或纯执行成本分解。

图：[E/A](plots/E_over_A.svg)、[E/V8_ON](plots/E_over_V8_ON.svg)、[A/V8_ON](plots/A_over_V8_ON.svg)。
不把区间跨1写成已经一样快，也不把旧V8 OFF/ON倍率当作E本应获得的收益。

## 5. E实际路径与直接缓存代价

下表来自另一个诊断构建、每case一个N1进程。scope含加载/Setup/Run/校验/释放，
不是正式30轮timed-region命中率，也不是各类操作的耗时比例。

|Run|查询|own/proto/store命中|回退|mono/poly/generic转换|直接缓存峰值KiB|
|---|---:|---:|---:|---:|---:|
|Richards.Richards|252685|161242/40414/50515|514|158/1/0|15.49|
|DeltaBlue.DeltaBlue|338193|198216/108078/17889|14010|274/61/48|34.61|
|Crypto.Encrypt|642136|548914/76524/10056|6642|274/23/16|37.36|
|Crypto.Decrypt|642136|548914/76524/10056|6642|274/23/16|37.36|
|RayTrace.RayTrace|1193245|726776/54461/40631|371377|551/39/62|41.70|
|EarleyBoyer.Earley|43057|19044/0/2318|21695|70/0/2|17.74|
|EarleyBoyer.Boyer|2318037|1800520/0/0|517517|124/0/2|19.62|
|RegExp.RegExp|340405|0/0/0|340405|14/0/759|39.38|
|Splay.Splay|1880219|1290840/69522/245735|274122|107/51/14|14.39|
|NavierStokes.NavierStokes|1691|1146/0/0|545|24/0/10|5.19|
|PdfJS.PdfJS|2729462|897478/150314/348919|1332751|754/53/260|128.97|
|Mandreel.Mandreel|354686|1926/0/0|352760|29/0/9|19.64|
|Gameboy.Gameboy|24988591|19724188/727309/4160484|376610|2562/55/25|241.69|
|CodeLoad.CodeLoadClosure|141|0/0/0|141|17/0/0|9.28|
|CodeLoad.CodeLoadJQuery|1430|70/0/0|1360|73/0/29|46.53|
|Typescript.Typescript|82960788|52515241/7604547/9756331|13084669|14199/1153/895|1216.24|
|zlib.zlib|14826|63/0/9|14754|109/6/6|18.30|

本N1诊断中，最大直接缓存请求峰值在Typescript.Typescript，1245432B；无反馈/GENERIC后的写入重查次数最多在Typescript.Typescript，650285次（该case全部写入后重查651635次）。这只是本scope的实际计数，不是耗时排名。

完整named/keyed及绑定类opcode、handler更新、分配与释放见[diagnostic_summary.csv](diagnostic_summary.csv)。
binding_varref仅按get_var/put_var等实际opcode定义，不冒充源码global精确次数；
精确global分类仍UNKNOWN，get_array_el3的复合赋值读已纳入keyed read。
位点按函数debug源码SHA、进程内实例、真实opcode-start PC对应，见[diagnostic_sites.csv](diagnostic_sites.csv)；
仅最先释放且查询≥1000的最多32位点/进程，不是耗时Top排名。源码截断时SHA留null。
所有17个诊断均验证queries=hits+fallback、直接请求/释放平衡、shape引用/释放平衡、最终直接live=0。

实测metadata8B、site40B、entry24B、三层chain32B。GDB对实际Release制品读取的
完整JSFunctionBytecode sizeof由A的128B增为E的152B（见post_identity.json）；
新增头字段为24B，实际分配还受可选debug部分与allocator舍入影响，不能只数site结构。
诊断新增旁数组/头字段会改变布局和GC，不参与Release计时。峰值只覆盖本N1轨迹中E请求的
metadata/vector/PIC/chain字节，不包含shape保活、RSS或正式selectedN峰值；这些仍UNKNOWN。
原生回归还实际观测到：A在第五对象写入前已释放4个原型图中的资源，
E在此时尚未释放，转GENERIC后才释放4个（additional_gate的before/after记录）。
这证明强引用延长了该测试中资源生命周期；最终释放不等于间接保活没有代价，
也不能把这4个对象的小测试数量外推成Octane峰值。
高命中不等于净收益：入口判断、vector/state维护、强引用/COW、分配及普通回退都可能付费，
本轮总时间并未分别量出它们，不能反算“每次miss”或某helper的精确成本。

修复后的own-store miss在写入后重查当前属性以免保留失效指针。
store_refresh及store_refresh_inactive单列该重查总数、其中无反馈/已GENERIC的次数；
这是本冻结实现真实保留的工作，不为追求结果而在中途删除。

## 6. 覆盖、限制与下一步

Box2D三条件均可运行，但world保存在函数局部、原20次step没有独立完整最终结果oracle，
保留RUNS_NO_TRUSTED_OUTPUT_GATE覆盖行，不伪造checksum也不称引擎不兼容。
zlib纳入扩展集合，冻结源码/数据不变，原长度与strcmp断言仍有NUL边界限制。
zlib独立N1观察三条件read_events均为空，正式zlib的N也为1，未进入两shell的
binary-read返回类型差异路径，见[zlib_host_diagnostic.json](zlib_host_diagnostic.json)。
这不代表qjs的Uint8Array与d8的ArrayBuffer宿主API一般等价。
Splay/Mandreel官方latency指标未纳入本Run毫秒指标。

这些结果只回答本平台、此冻结实现和此协议下的整体净成本及距V8的距离。
keyed/global仍用A路径，原型链没有validity cell，反馈强引用与V8弱引用不同；
代码布局、编译器决策和GC变化未被单独隔离。不能把剩余差距全归IC、dispatch或某个helper，
也不能把本实现未获收益推广成IC不能优化QuickJS。

另有可知时钟限制：1530条的原生单调序列无重叠；UTC标签出现回跳，其跨度比单调
跨度少约91.25秒，原因UNKNOWN。UTC仅作溯源，未用于N校准、内部时间或ratio。
所有原生内部区间仍通过外部单调区间包围检查。详见[时钟说明](clock_limitations.md)，
不将本WSL单批约1.15%的差异推广为跨主机/OS的普遍结论。

下一步只建议检查“无反馈/已GENERIC的named-store为何仍支付更新前重查”：
已有独立计数可以定位其实际频率，但还没有该步骤的独立净耗时证据。
如需验证，必须预先定义新的受控干预；本轮不自动修改命中路径或增加优化变体。

## 7. 完成与复现

独立审计PASS_COMPLETE：1530/1530正式记录有效，每case每条件30条，六排列各5、
每条件每位置10；无缺失/重复；命令、flags、脚本/制品hash、同boot和串行次序一致。
正式偏短记录保留，数目见[summary/audit.json](summary/audit.json)。
只读重算：`python analyze.py --output replay_01`，无需WSL或旧/home二进制；
构建/采集入口另见[README](README.md)。attempt01未混入，原A/d8未替换，未提交/推送。
Windows独立重算已实际完成，17项时间、51项比值与6个suite聚合与WSL输出在
1e-12容差内一致；[delivery_audit.json](delivery_audit.json)记录检查及文件规模。
