# 原版 QuickJS / V8 use_ic 对照：本轮结果

**状态：BLOCKED_IC_INTERVENTION。** 日期：2026-10-25。正式目标 270 条，实际执行 0 条、有效 0 条、失败 0 条；pilot 0 条。没有正式耗时表、比值或 bootstrap 区间，不是 COMPLETE。

## 实际做了什么

在同一 WSL2 Ubuntu 24.04.2 / x86_64 环境复用原版 QuickJS 2026-06-04 和官方分发的 V8 15.6.21 d8，未构建或修改 VM。QuickJS 的 77 个源码文件与既有原版 A 身份一致；二进制和 V8 数据依赖前后校验通过（`runtime.json`、`identity_after.json`）。未使用 MIC/PIC 或退出策略版本，也未混入历史时间。

实际运行的 V8 两条件是 `--jitless --no-lazy --use-ic` 和 `--jitless --no-lazy --no-use-ic`。普通探针均 exit 0、stderr 为空；有效参数均显示 jitless=true、lazy=false、Sparkplug/Maglev/TurboFan=false，RegExp 强制解释且关闭 tier-up。两边有效参数的唯一差异是 use-ic。详见 `raw/capability/V8_IC_{ON,OFF}_{basic,flags}.1.json` 和 `summary/effective_flags.csv`。这是参数接受及有效设置证据；对应版本源码核验尚未完成，因此不宣称整个机制门禁通过，更不把 jitless 称为整个进程没有机器码。

## 干预证据到哪一步

稳定 own 读取 `function stableOwn(obj) { return obj.x; }` 两边均返回累计 30000。真实 dump 将读操作定位到函数内 PC=0、`GetNamedProperty a0, [0:"x"], FBV[0]`。ON 的同进程字节码地址能对应到一条 LoadIC 状态码 **0→1** 的日志（`summary/selected_site_transitions.csv`）。这是该位置建立反馈的正证据，不是逐次命中率。

OFF 没有该位置的转换日志，但这不足以证明阻止缓存建立。此 release 制品的 `%DebugPrint` 只输出简略函数身份，`%GetFeedback` 在 ON/OFF 均返回 undefined；`--log-feedback-vector` 也未给出可定位的槽状态。**OFF 目标槽的未初始化/无缓存状态仍为 UNKNOWN**（`summary/selected_site_observations.json`）。未强行分配/清空反馈向量，未换二进制或新建插桩 V8。

此外，固定版本参考源码的五个小文件获取均因 TLS 证书链不受信任失败（`source/fetch.json`），未关闭证书校验。官方 tag 15.6.21 可对应到参考 commit，但不是制品构建 commit 的证明。use_ic 对 named/keyed/global load/store 的确切范围、关闭后保留什么缓存及 jitless 源码规则仍为 UNKNOWN。

## 正确性与能说的结论

Richards、own_integer、numeric_control × 三条件 × N=1/2 的 **18/18 检查通过**，原 Richards 的 queueCount=2322、holdCount=928 断言保留。三个独立时钟小检查通过单调性和时长包围检查；未假设父子时钟原点相同。详见 `summary/correctness.csv`、`summary/clock_capability.csv`。它们不是 pilot 或正式性能样本。

目前不能回答三个案例的绝对执行时间、OFF/ON 代价或与原版 QuickJS 的性能差距；也不支持或推翻“IC 是主要差距来源”。两个新目录中的 raw-only 重放得到七份逐字一致的能力/正确性汇总，**不是性能统计复算**。

唯一后续建议：先恢复固定版本源码的可信获取，并取得同一 d8、同一目标槽在 OFF 下阻止缓存建立的正证据，再启动本三案例的 pilot；目前不扩大到更多 Octane 案例。恢复条件和命令见 `README.md`。
