继续完成原版 QuickJS / V8 use_ic ON/OFF 三条件实验。

先阅读最新提交 0bf70fbee135b3b3ebf35040cb9cddc33e543969 下：
js-interpreter-bench/experiments/v8_ic_on_off/attempt01/results.md
以及 README.md、protocol.json、summary/audit.json。保留 attempt01 的 BLOCKED 状态与原始记录，另建 attempt02 继续，不覆盖旧数据。

一、补齐固定版本源码
我提供的压缩包包含官方镜像固定 commit 37fb84941c9be9f9914ee50b1ad366f06a1bd764 的五份参考源码、LICENSE、获取来源与 SHA256 清单。解压并核验后用于源码检查，记录这是外部提供的参考材料，不伪称本机下载成功，也不把版本 tag 映射当作官方二进制精确构建来源证明。
优先使用这些材料，不再反复请求已因证书失败的同一 URL；不关闭 TLS 校验，不改系统信任，不构建或替换 V8。

二、修正观测要求，明确新实验的结论范围
上轮要求必须直接读到 OFF 反馈槽快照，这依赖该 release 制品未提供的观测能力。本轮明确调整该要求，开展“use_ic 配置开关对照”，不再把 OFF 槽快照设为正式计时的必要条件。

先核查参考源码：
1. runtime-test.cc 中 Runtime_GetFeedback 的 OBJECT_PRINT / V8_JITLESS 编译条件，以及 DebugPrintImpl 的简略输出分支。GetFeedback 返回 undefined 不能据此判断槽是否为空。
2. flag-definitions.h 的 jitless、use_ic 定义及隐含设置。
3. GetNamedProperty → AccessorAssembler → LoadIC 普通读取/更新链路，明确 v8_flags.use_ic 如何控制缓存更新，及它影响的范围。

以下条件全部成立，即可开展配置对照：
- 同一 d8 和 snapshot/ICU，SHA256 与 attempt01 对应制品一致。
- 两边实际有效 jitless=true、lazy=false，JavaScript JIT 层关闭；有效设置仅 use-ic 不同。
- ON 在相同稳定 own 目标位置已有或重新取得可定位的 0→1 正证据。
- 参考源码中的开关作用与现有行为一致，没有发现互相矛盾的证据。

此时将新实验证据状态标为 PASS_WITH_OBSERVABILITY_LIMITATION；明确这不是直接测得 OFF 槽为空。selected_OFF_no_cache_state_verified 继续保留 null/UNKNOWN；二进制精确源码 commit 的未知也保留。OFF 无日志只能作辅助证据，不能单独当证明。
若实际参数、正确性或源码行为出现矛盾，应停止并报告具体证据。不要继续盲试同类打印接口，也不要求为了槽快照重编译 V8。

在 attempt02/protocol_amendment.md 中先记录上述调整、理由和推论范围，再开始 pilot。不要修改 attempt01 的门禁或追认旧实验已完成。

三、实际完成剩余性能实验
继承 attempt01/protocol.json 的其余规则，只测：
QJS_ORIGINAL、V8_IC_ON、V8_IC_OFF；
Richards、own_integer、numeric_control。
不加入修改版 QuickJS，不扩展全 Octane。

重新核对必要身份与 N=1/2 正确性，生成并公开保存本轮正式脚本；使用同一 workload/driver，计时前捕获 Run 和原生单调时钟，不改 Richards 内部属性/方法访问。
每案例冻结三条件共同 N，三个独立 pilot/条件均至少 1 秒；首次 Run 计入，无额外 workload 预热。
每案例每条件 30 新进程，六种条件排列各 5 次，seed=20261025，串行采集，共 270 条正式记录。沿用原超时、N 上限和采样预算。
正式程序不带日志、native syntax 或调试打印。失败和慢样本保留，不自动重试、不删异常值。不要把之前正确性进程的耗时当正式数据。
请实现并运行必要的 collector、analyzer，不只交付新的门禁占位脚本。

四、结果与复核
给出 ms/完整 Run 中位数，以及配对完整三元组 bootstrap 10000 次的探索性 95% 区间，主要比较 OFF/ON、QJS/ON、QJS/OFF。
只解释 use_ic 开关在该 V8 和案例中的净效果；不声称移除了所有缓存，不计算“IC 解释了跨引擎差距的百分比”，不将 V8 收益直接当 QuickJS 预期收益，不算三案例 GM。

顺便修正新复核入口的跨平台问题：显式固定排序键；Richards 旧探针的原始混合行尾与 Git 的 LF 身份分开。审计侧已验证，按冻结 base.js/richards.js 原字节可恢复 N1/N2 的已发布脚本 SHA。不要修改旧 raw、哈希或汇总来迁就新平台。新 attempt 的脚本直接冻结自身真实字节，data-only 重放不依赖旧 /home 路径。

完成后交付通俗 results.md、三条件时间表、干预范围与观测限制、实际执行量、raw 和可重放入口。若受阻，报告新的具体阻塞，不能再次仅以“release 读不到 OFF 槽快照”为理由停下。
不自动 commit/push，不启动第二轮优化。

