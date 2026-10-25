# 协议修订：use_ic 配置开关对照

日期：2026-10-25。来源：本轮用户明确授权及外部材料包 `CONTINUE_PROMPT.md`。本修订先于任何 pilot/正式采集写入。

保留 attempt01 的 BLOCKED_IC_INTERVENTION、原始数据、哈希和旧门禁，不追认其已完成。本轮在 attempt02 独立采集，研究名称为 **use_ic 配置开关对照**。

原要求直接打印 OFF 目标反馈槽快照，依赖该 release 制品不可用的观测能力。本轮不再把此项设为必要门槛。满足以下条件可标 `PASS_WITH_OBSERVABILITY_LIMITATION` 并开展计时：

1. d8、snapshot、ICU 与 attempt01 的冻结 SHA256 相同；不构建或替换 V8。
2. 实际有效参数均为 jitless=true、lazy=false，JavaScript JIT tiers 关闭；ON/OFF 的有效参数只差 use-ic。
3. 同一稳定 own 目标位置已有可定位的 ON 0→1 正证据；不把转换日志当逐次命中率。
4. 用户提供的固定版本参考源码及许可证 SHA256 核验通过；开关实现与已有实际行为一致，没有新矛盾。

`selected_OFF_no_cache_state_verified` 始终保留 null/UNKNOWN，不能写成已证明为空。OFF 没日志仅为辅助证据。参考 tag/commit 不等于精确二进制构建来源证明；该字段继续 UNKNOWN。只研究 use_ic 配置的净影响，不声称关闭 V8 的所有缓存，不计算 IC 解释跨引擎差距的百分比。

其余继承 attempt01/protocol.json：仅 Richards、own_integer、numeric_control；仅 QJS_ORIGINAL、V8_IC_ON、V8_IC_OFF。共同 N、三个独立 pilot/条件均 >=1000ms、无额外 workload 预热、首次 Run 计入、每条件30个新进程、六种排列各5次、seed=20261025、超时60秒、N上限131072、pilot与正式合计7200秒。保持原算法/断言与内部单调计时；Setup/加载/静态编译在外，Run 的 GC/helper/builtin/动态工作在内。

正式样本不带 trace、计数或 native-syntax。失败不自动重试，保留异常值与偏短样本。出现新的参数、正确性、身份或源码矛盾即保存证据并停止；不再仅因 OFF 快照不可读而停止。

汇总 ms/完整Run，中位数/均值/样本标准差/Tukey-halves Q1/Q3/IQR/min/max。完整三元组配对 bootstrap 10000次，seed=20261025，探索性95%百分位区间；OFF/ON、QJS/ON、QJS/OFF；不算 GM，不导入历史时间。
