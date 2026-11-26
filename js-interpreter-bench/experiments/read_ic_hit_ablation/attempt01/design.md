# MIC hit ablation：实现前设计与预声明

2026-10-24，初始 myx/94fd9872ab90832621b516c5e7d6de4beae5d302，工作区干净；未发现AGENTS.md。
本文件在实现、pilot、正式时间之前写下。只回答同布局内两条完整取值路径的条件效果，不宣称纯hash查找self-time。
沿用upstream2026-06-04/04be246001599f5995fa2f2d8c91a0f198d3f34c、WSL2 Ubuntu24.04.2 x86_64、GCC13.3.0。
旧结果仅背景，不与本轮新样本混合，不加入P、不调准入/容量/写IC/原型IC/热度或替换策略。

## A / M / ON / LOOKUP

A/M从校验过的冻结源字节恢复后分别干净构建；M与上一轮正式M所有源码字节核对。开关版SW从M派生。
ON/LOOKUP的命令路径、argv、ELF完全相同；环境键集合相同，仅QJS_READ_IC_MODE的等长值1/0不同。
A/M也收到值1但忽略它。正式不设置诊断环境变量。环境全量快照记录并hash，不把mode藏在不同argv中。

SW在native JS_NewRuntime2经pthread_once读取进程环境一次；值必须恰好1或0，缺失/其它值报错并拒绝创建runtime。
缓存结果在进程中不再改变，每个runtime创建时复制到末尾私有mode字段，无JS设置API。qjsc/嵌入/构建也显式提供环境。
mode字段大小、padding、runtime增量、全局once状态、机器码实际取mode/分支在构建后测量，不预先假定为零成本。
不在属性读取时getenv/解析字符串/调用JS配置。新增开关可能改变M的代码生成，必须由M/ON桥接检查。

## 成功guard后的干预

沿用16字节逐最终PC单槽、eager分配、opcode重写、atom/shape引用、GC、加载/保存和正常写路径。
两模式都做同样object/class/exotic检查与shape probe，保存candidate_valid/offset。
候选有效且mode=ON：从当前对象prop[offset]取值、JS_DupValue，进入原返回/receiver处理。
LOOKUP候选有效：仍用原find_own_property及正常搜索读真实pr值，不能用offset模拟；不再update/dup/free shape。
真miss：两模式均走原正常查找与原M准入/更新。get_field/get_field2语义保持。
因此比较包括分支/控制流/局部性，不可相减其它百分比算“解释了总收益多少”。无法匹配则BLOCKED_CONTROL，不跑正式。

## 独立诊断门禁

同一个诊断SW ELF也用1/0；正式无诊断宏、trace或日志。cold首次查询在分母。
统计candidate_hit/miss、direct_returns、forced_lookup_on_candidate_hit、normal_fallback、更新/替换/占用/创建、shape边和释放。
按site滚动记录候选有效性序列的64位FNV摘要（非密码学证明），以辅助核对序列；不输出巨量事件。
正常find_own_property用诊断专用thread-local计数上下文，分别计函数调用/hash bucket装载/实际链结点比较，不用shape probe冒充hash。
上下文仅包围无JS调用的原find_own_property，保存/恢复；不在formal加入计数。
守恒：q=direct+forced+normal；candidate_hit=direct+forced；candidate_miss=normal。
ON forced=0；LOOKUP direct=0且forced=candidate_hit；两边缓存维护/创建/占用/shape生命周期匹配。
源SHA+规范最终字节码/atom映射+最终PC定位；不跨进程使用instance_id/裸shape地址。相同源码重复compile按实例签名多重集合核对，不能假装唯一实例映射。
numeric_control目标函数无读点；区分driver/Setup读。CodeLoad正式N不变，独立诊断双方N统一上限8，明确不外推成正式总量。
间接保活对象图字节UNKNOWN。诊断不计入正式时间。

## 正确性与机器码

继承前轮语义、上游、GC/OOM、保存加载/qjsc嵌入检查；A/M/ON/LOOKUP输出一致。
SW sanitizer共用一个ELF，但ON/LOOKUP都实际运行ASan+UBSan针对检查。
补非法/缺失mode拒绝，以及初始化后修改环境不会改变当前或新runtime模式的native检查。
审计同ELF .text相对布局、mode分支、直接load和正常hash搜索真实存在；记录PIE/ASLR与可取得加载基址。
不特权关闭ASLR/频率；不同进程绝对基址不要求相同。M与SW增量独立披露。

## 固定8项与采样协议

M1.own_integer、M2.own_reference、M4.numeric_control、M6.poly2；
Richards.Richards、RegExp.RegExp、RayTrace.RayTrace、CodeLoad.CodeLoadClosure。
workload和驱动来自冻结前轮，微基准每完整调用4096轮；仅新campaign模式标签变化，不改算法。
Setup/静态加载编译在内计时外，第一次Run在N次中，无额外workload预热；动态编译/GC/helper/builtin仍在原Run内。
从前轮N起步，共同N翻倍；pilot预固定为[A,M,ON,LOOKUP]、[M,LOOKUP,A,ON]、[ON,A,LOOKUP,M]三组，12进程内部均>=1000ms后冻结。
上限N131072、单进程timeout300s；不足门槛继续共同翻倍，不按方向改代码/集合。校准/失败raw保留。
32四元组：24全排列各一次，加两份平衡块；块为[0,1,3,2]分别加0/1/2/3 mod4，标签[A,M,ON,LOOKUP]。
每条件各位置8次；每有向相邻对8次（组内，不跨组），离线断言后固定seed20261024打乱各case组分配与每轮case顺序。
目标8*32*4=1024；组内相邻、全进程串行，不与构建/诊断/RSS/Crypto同时运行。
失败不自动重试、不给epsilon、不删outlier；版本独有失败报告回归。真正时钟异常写BLOCKED_TIMER并停。
父perf_counter_ns绝对起止、子native CLOCK_MONOTONIC毫秒start/stop/elapsed；UTC只日期。
验证内外同域包含（1ms边界容差）、严格串行、boot；保留argv/env/mode、源/输入/脚本/ELF哈希和全部输出。

## 统计、RSS和复现

主比较LOOKUP/ON、A/M、M/ON；另A/ON、A/LOOKUP。均为前者中位数/后者中位数，>1后者更快。
每项10000次四元组配对bootstrap、seed20261024+case索引；95%线性插值分位区间，跨1方向不明确。
描述统计n-1样本std、Tukey-halves Q1/Q3/IQR、min/max/mean/median；内部ms/Run和外部ms/process分开。
不算这8项的总体GM，不相减两个中位数估单次查找/GC/初始化成本，不相减两种干预百分比作因果占比。
Richards/RegExp/Closure四条件各3次GNU time RSS，36个新进程、KiB、单列小样本限制。
公开raw+stdlib重算，数值容差rel=abs=1e-12；每次新输出目录/审计快照，连续重放两次，不改历史raw/hash/host记录。
源重建、数据重放、当前制品身份三入口分离；大JSON只压缩归档双SHA，ELF留独立Linux目录，不自动提交/推送。

## Crypto仅输入/正确性诊断

不进入正式1024矩阵。先审阅冻结crypto.js/base.js的所有random/time入口。
预声明seed [1,305419896,3735928559]，N=2；加载前安装确定性benchmark-only随机/时间协议，算法与断言不改。
诊断副本只观察加载/Setup/逐Run真实随机状态、字节和代表密文，计时外规范hash；同seed四条件一致，异seed相关输入必须变化。
不能完整覆盖则明确CRYPTO_INPUT_LIMITATION，不自动纳入任何GM，更不用于真实安全加密。

最终逐项回答M/A是否保留、开关桥接是否改变、稳定命中/无命中对照、RegExp边界和创建/保活证据；下一轮只推荐一个问题，不继续优化。
