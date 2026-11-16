# 同一二进制内，MIC命中直接取值有没有收益？

2026-10-24；WSL2 Ubuntu 24.04.2 / x86_64，GCC 13.3.0，QuickJS底座
`04be246001599f5995fa2f2d8c91a0f198d3f34c`。本轮只研究预先选定的8项，不代表全Octane。

## 做了什么

重新干净构建原版A、上一轮源码字节不变的M，以及从M派生的开关版SW。
ON和LOOKUP都是同一个`SW/qjs`，SHA256为
`53680f048a6f53c1f94cc1dc3c52e1263311fb0a36ea6b93b697547069d65267`。
两者argv和相关环境键相同，只改变等长的`QJS_READ_IC_MODE=1/0`。
native初始化只读取一次环境；命中后，ON直接按offset取当前值，LOOKUP继续实际正常属性查找，且不再次更新缓存。
真正miss的准入和维护相同，不改写路径、容量或JS算法。

每项共同N经过12个新进程pilot核对，内部时间均至少1秒。正式每项32个四元组，共
**1024/1024有效样本**；每条件在每位置8次，每种组内有向相邻顺序8次。
内部是单调时钟测量N次Run、除以N；Setup/静态加载在外，首次Run在内，没有额外workload预跑。
微基准每个完整Run包含4096轮，不把ms/Run当单条读操作成本。
所有进程串行，未删除异常值、未补跑失败，正式样本也全部达到1秒。
证据见[独立审计](analysis/audit.json)、[冻结协议](protocol.json)、[全部原始进程记录](raw/formal/)。

## 正式时间与主要比较

单位为**内部ms/完整Run**；每单元格32个新进程的中位数。
LOOKUP/ON大于1表示ON更快；区间是10000次四元组配对bootstrap的探索性95%区间，不是多重检验校正后的结论。

| 项目 | N | A | M | ON | LOOKUP | LOOKUP/ON [95%区间] |
|---|---:|---:|---:|---:|---:|---|
| own_integer | 32768 | 0.063220 | 0.059326 | 0.062609 | 0.066350 | 1.0598 [1.0415, 1.1018] |
| own_reference | 16384 | 0.083044 | 0.080012 | 0.082895 | 0.086625 | 1.0450 [1.0363, 1.0655] |
| numeric_control | 32768 | 0.039185 | 0.038332 | 0.041310 | 0.040946 | 0.9912 [0.9695, 1.0306] |
| poly2 | 8192 | 0.189413 | 0.201170 | 0.208013 | 0.204359 | 0.9824 [0.9637, 1.0169] |
| Richards | 512 | 3.649502 | 3.468026 | 3.555251 | 3.877514 | 1.0906 [1.0790, 1.0999] |
| RegExp | 8 | 193.577300 | 220.785564 | 234.261752 | 234.566391 | 1.0013 [0.9871, 1.0157] |
| RayTrace | 32 | 40.650639 | 45.248602 | 46.248399 | 47.311326 | 1.0230 [1.0090, 1.0425] |
| CodeLoadClosure | 2048 | 0.643728 | 0.717503 | 0.727953 | 0.716333 | 0.9840 [0.9718, 1.0045] |

三项主比较的完整区间见[时间表](analysis/tables.md)。
[summary.csv](analysis/summary.csv)另含A/ON、A/LOOKUP、时间变化率及其区间；
[statistics.csv](analysis/statistics.csv)包含mean、样本stddev、Tukey Q1/Q3/IQR和min/max。
外部ms/process及区间单列于[end_to_end.csv](analysis/end_to_end.csv)，它是整个N次Run的新进程时间，不是单个Run，也不与内部中位数相减估初始化。
带区间图例如[LOOKUP/ON](analysis/execution_LOOKUP_ON_CI.svg)、[M/ON桥接](analysis/execution_M_ON_CI.svg)。不计算这个有目的小集合的总体GM。

## 六个问题，数据支持到哪里

### 1. 原M相对A的方向有没有保留？

本轮M比A的中位时间：整数读低6.16%、引用读低3.65%、numeric_control低2.18%、Richards低4.97%；
poly2高6.21%、RegExp高14.06%、RayTrace高11.31%、Closure高11.46%。相应A/M区间均未跨1。
Richards的改善和RegExp的回退方向保留，但数值只来自本轮新A/M，未混入历史时间。
无目标读的numeric_control仍改善，已经说明不能把A/M的全部差异归给跳过hash。

### 2. 开关版ON能否当作原M？

不能直接等同。ON相对M的中位时间在整数读高5.53%、引用读高3.60%、numeric_control高7.77%、
poly2高3.40%、Richards高2.52%、RegExp高6.10%；这六项M/ON区间均低于1。
RayTrace、Closure的桥接方向不明确。尤其RayTrace上界实际为1.000025，表中四位小数显示1.0000，不能读成排除了1。

SW新增runtime存储含对齐为8字节，site仍16字节；`.text`比M多304字节。
真实模式分支、PIE/ASLR、GDB中的1/0值及原查找/直接load见[机器码说明](machinecode/notes.md)。
这不是零开销开关。桥接差异包含派生机器码、控制流、布局及运行环境等影响，尚未拆开；
不能把ON/LOOKUP的收益精确搬回原M，更不能与A/M百分比相减算因果占比。

### 3. 稳定读和Richards有没有直接命中路径收益？

在这一SW实现、布局及输入下有支持：ON相对LOOKUP，整数读低5.64%、引用读低4.30%、Richards低8.31%，对应比值区间均高于1。
RayTrace也低2.25%，但仍比A慢13.77%，说明“命中分支有条件收益”和“整体设计有净收益”不是一回事。

独立诊断不是正式时间：N=2的稳定目标8192次查询中，两个模式候选命中均8191、更新均1；
ON的真实目标hash查找为1次，LOOKUP为8192次。[机制门禁](correctness/target_gate_sites.json)直接核实了干预确实发生。
选定工作量的Richards全进程有103358529次查询、82640297次候选命中；
ON的这些命中全部direct，LOOKUP全部forced lookup，维护和候选序列匹配。
这估计两条完整取值路径的条件效果，不是单次hash的self-time。

### 4. 无命中对照有没有反常差异？

numeric_control目标函数读site为0；全进程只有driver等7次查询，候选命中为0。
poly2全进程33554441次查询也没有候选命中，两个模式的查找/维护计数相同。
ON/LOOKUP比值分别0.9912和0.9824，区间都跨1，**本轮无法确定两模式的时间方向**。
不能据点估计声称无命中也因hash省略而改变。另一方面，M/ON桥接在numeric_control仍有清晰差异，必须保留这个非目标命中的影响。

### 5. RegExp说明什么？

独立全进程诊断查询1120922次，候选命中仅14次，普通fallback为1120908次：
inherited 679000、primitive 359477、unhashed 65915、special 16488、descriptor 9、首次合格own miss 19。
LOOKUP比ON多14次实际`find_own_property`调用，与forced lookup数一致。
ON/LOOKUP为1.0013 [0.9871, 1.0157]，方向不明确；改变极少的命中取值没有检出明确的整体变化。
M比A慢14.06%，ON比A慢21.02%，但**尚不能确定退化分别有多少来自无效入口、probe、生成代码或其它工作**。

### 6. 创建、保活和内存有哪些直接证据？

诊断中每个site仍16字节，ON/LOOKUP的创建、峰值直接请求、shape边及释放均匹配；所有报告释放后live与shape边为0。
这些是实际维护活动证据，不是维护时间。完整数值见[诊断表](analysis/diagnostic_comparison.csv)。

Closure双方诊断预先同限N=8，而正式N=2048，不能外推诊断总量：创建1913个site、105个被查询，
155次查询仅7次候选命中；直接请求累计38992字节、峰值30816字节，shape边峰值27。
它确实创建了不少未使用读点，但初始化耗时和间接保活对象图字节仍UNKNOWN。

独立GNU time RSS各条件每项仅3进程，单位KiB：

| 项目 | A中位数 | M中位数 | ON中位数 | LOOKUP中位数 |
|---|---:|---:|---:|---:|
| Richards | 3244 | 3396 | 3256 | 3396 |
| RegExp | 6816 | 6688 | 6672 | 6768 |
| Closure | 61812 | 69064 | 69016 | 69156 |

原分布见[memory.csv](analysis/memory.csv)。Closure的M/开关版RSS均比A高，不能只归因于16字节site；
另外两项的小样本有重叠，既不能证明相等，也不能精确归因。RSS不是请求字节、shape间接保活字节或GC时间。

## 正确性、输入与复现

四条件通过既有952条legacy断言、9个multislot场景/28151条断言、7个read场景/287条断言、
15个site场景/23211条断言；断言不是独立场景数。
另各12个smoke、11项可用上游test入口、1800个函数GC循环、192个OOM预算、激活后保存加载及qjsc嵌入通过。
ON/LOOKUP实际各跑共享sanitizer ELF的针对检查；未声称完整test262。[正确性记录](correctness/gate.json)。
非法/缺失mode实际拒绝；初始化后改环境不能改变新旧runtime模式。[机制门禁](correctness/mechanism_gate.json)。

16个workload诊断和12个机制诊断均压缩保留，压缩/原文双SHA通过核验。
候选序列、维护、创建、占用及shape引用按规范源码/字节码/atom/最终PC匹配，而非跨进程指针；
重复compile实例按签名多重集合核对。序列FNV摘要只是附加核验，不是无碰撞的密码学证明。

Crypto不进正式矩阵。预声明3个seed、N=2，四条件及无hook/观察hook各跑一次，共48条身份/正确性记录：
加载前固定随机协议后，实际pool、RC4、padding、字节、密文和明文结果匹配，改变seed实际改变密文。
这只覆盖冻结源码、固定密钥及指定N/seed，不解除历史Crypto输入限制，不证明任意N，不能用于安全加密。
见[独立Crypto报告](crypto/results.md)。

数据重算与ELF身份检查分离。新`portable_check.py`每次在新目录输出，比较数值/结构（rel/abs=1e-12），不比较历史host字符串；
从raw重建RSS和其它中间表，不读取旧ELF。实际在Windows Python分别连续重算本轮20个输出两次、上轮兼容格式29个输出两次，均通过。
重放快照与各自审计在[replays/](replays/)，不改旧attempt的raw、哈希或报告。
复现命令及源码恢复入口见[README](README.md)。

## 仍未知与下一轮只问一个问题

WSL宿主后台调度、功耗/频率未受控；探索性区间不消除系统偏差，也不是跨平台规律。
正式ELF无计数；独立插桩只能证明相应诊断运行，不逐次证明正式路径。间接保活字节、hash/GC/引用管理独立时间仍UNKNOWN。

**下一轮最值得问：为什么没有目标属性读的numeric_control，从M换为ON后仍慢约7.77%？**
先针对原M与开关派生版的实际热点机器码/布局和运行波动定位，不把它提前归因于mode分支或hash。
只有弄清这个桥接影响，才更有把握判断原M应保留多少命中收益。本轮不继续实现任何优化。
