# 原版 QuickJS 与 V8 use_ic 配置开关：实测结果

**COMPLETE；机制证据等级 PASS_WITH_OBSERVABILITY_LIMITATION。** attempt01 保持原 BLOCKED 状态。本轮正式目标/实际/有效均为 **270**，失败0、缺失0、重复0；18项N1/N2正确性、27项pilot和9项选定N独立正确性均通过。正式采集约17.95分钟，pilot至正式末尾约20.23分钟（记录内单调时钟，非UTC相减），在2小时预算内。证据：`summary/audit.json`、`campaign_timing.json`。

## 条件确实改变了什么

同一 WSL2 Ubuntu24.04.2/x86_64 / Ryzen7 5800H。原版 QuickJS 2026-06-04，未含IC补丁；同一官方d8 15.6.21及snapshot/ICU。两边公共参数 `--jitless --no-lazy`，有效flag仅 `use-ic` 不同，JS JIT tiers关闭。材料包6文件SHA256及Git blob SHA1通过；参考源码确认 LoadIC::Load 用 use_ic 门控 UpdateCaches，普通取值仍在，写入/全局/keyed路径也受影响。ON已定位到PC0/FBV[0]的0→1日志；**OFF槽直接状态仍UNKNOWN**，不再将快照作为门槛。参考commit不是二进制精确来源证明；不声称关闭所有缓存。见 `protocol_amendment.md`、`source_notes.md`、`gate.json`、`effective_flags.csv`。

## 三条件时间表

均为30个新进程的中位数，单位 **ms/完整Run**；两个微案例每Run含4096轮。首次Run包含、无额外workload预热，后续缓存自然变热。Setup/静态加载编译在外；Run内GC、helper、builtin和原断言计入。不是单次属性读取或纯解释器循环self-time。

| 案例 | 共同N | 原版QJS | V8 ON | V8 OFF | OFF/ON | OFF用时变化 | QJS/ON | QJS/OFF |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Richards | 512 | 3.613472 | 2.199207 | 23.948081 | 10.889 | +988.94% | 1.643 | 0.151 |
| own_integer | 32768 | 0.061978 | 0.058154 | 0.301343 | 5.182 | +418.18% | 1.066 | 0.206 |
| numeric_control | 32768 | 0.039174 | 0.048859 | 0.048852 | 0.999866 | -0.013% | 0.802 | 0.802 |

OFF/ON>1表示关闭use_ic后用时更长；QJS/ON、QJS/OFF>1表示该V8条件用时更短。以完整三元组为单位配对bootstrap 10000次、seed20261025，探索性95%区间：

| 案例 | OFF/ON区间 | QJS/ON区间 | QJS/OFF区间 |
| --- | --- | --- | --- |
| Richards | [10.690, 11.051] | [1.619, 1.677] | [0.1491, 0.1536] |
| own_integer | [5.092, 5.283] | [1.047, 1.087] | [0.2035, 0.2085] |
| numeric_control | [0.985, 1.013] | [0.780, 0.813] | [0.779, 0.815] |

完整精度见 `summary/comparison.csv`、`ratios.csv`；均值、样本标准差、Tukey-halves Q1/Q3/IQR/min/max见 `per_condition.csv`。完整进程墙钟另列 `process_wall_diagnostic.csv`，不相减中位数来估算初始化成本。

## 可以说什么，还不能说什么

1. Richards和稳定own读取对该V8的use_ic配置有很强的依赖：ON快于原版QJS，OFF则比原版QJS慢。说明这一开关在这些负载中有重要净效果；**不是QuickJS同样能获得这些倍数收益的证明**，也不能据此计算IC解释了跨引擎差距的百分比。
2. 数值控制的OFF/ON区间跨1，方向不明确，不能称等效。QJS在该案例快于两个V8条件。这个控制不支持“关闭use_ic导致所有循环统一变慢”的简单说法；它仍包含driver和每Run函数入口等工作，不是整个进程零属性操作。
3. 本轮是宽范围配置干预，尚未分开named/global/store、普通查找及其它反馈成本，不能用总时间差除读取次数得到单次hash成本，不能估算QuickJS可优化上限。三个案例不代表全Octane或总体引擎排名。

后段出现较长样本，全部保留；未控温/锁频，期间后台负载UNKNOWN，区间未做多重比较校正。采后环境快照来自另一次WSL boot，不能用于恢复正式期间负载。采集的270样本在同一boot内串行，父子时钟只比较时长包围，不拼接绝对原点。未跑诊断版时间，也未混用旧Windows/M/R时间。

独立审计确认每组30条、每案例六排列各5次、各条件各位置10次；正式无trace/native syntax，所有样本>=1秒；runtime/依赖/77源码文件及旧attempt未变。Linux分析后在Windows两个全新目录只读raw重算，六份结果逐字相同，raw和发布汇总未变（`replay_audit.json`）。

**唯一后续建议：**有理由预先选定少量其它原始Octane案例做同配置对照，检验这种负载依赖是否延续；本轮不自动扩大、不实现新IC、不把V8收益换算成QuickJS预期收益。
