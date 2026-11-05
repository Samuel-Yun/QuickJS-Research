# V8 use_ic 实验续跑材料

本包用于恢复 QuickJS-Research/myx 提交 0bf70fbee135b3b3ebf35040cb9cddc33e543969 中暂停的三条件实验。先把 CONTINUE_PROMPT.md 交给 coding 工具，并将本包解压位置告诉它。

source/ 中五份源码与 LICENSE 在报告审计环境通过正常校验 TLS 的 HTTPS，从 V8 官方 GitHub 镜像固定 commit 37fb84941c9be9f9914ee50b1ad366f06a1bd764 获取。来源与 SHA256 在 source_manifest.json。它们是版本参考材料，不是现有 d8 精确构建源码的证明。本包不含 ELF，也不修改用户仓库。

核对发现：
- 最新实验没有性能结果：pilot 0 条，正式 0/270；18 项 N1/N2 正确性已通过。
- 实际 flags 支持严格 jitless；两边仅 use-ic 有差异；ON 有可定位的 0→1 日志。
- 固定参考源码中的 GetFeedback 在缺少 OBJECT_PRINT 时直接返回 undefined；DebugPrintImpl 同样有简略输出分支。因此打印能力受限不能等同于反馈为空。
- 修订后的协议仅研究同一 binary 的 use_ic 配置开关效果，保留 OFF 槽快照未知，不将有限互证冒充逐次命中实测。

另一个复核问题：clean Linux checkout 的 replay.py 在 correctness.csv 字节比较失败。存在 Windows/Linux 路径排序差异，以及 Richards 探针原始内嵌 CRLF 与外层 LF 混合、发布 Git 规范化后的身份差异。审计侧已按冻结输入重建并核对：
Richards.N1.js 原 SHA256：02048363db7e20e791b0e809ba671adef1ca33aaa7c8a447fe78dfc1b831ef7d
Richards.N2.js 原 SHA256：1fe5fa84d20dc9e717e8ae6c86296bd64d304435a8719e074dbf4b7ccf2621d0
修复这项历史重放问题不需要重新采集历史记录；应在新复核入口中明确恢复规则、固定排序，保留旧字节身份。

执行 python3 verify_bundle.py 可检查源码和许可证 SHA256。CONTINUE_PROMPT.md 说明新的观测门槛、270 条采样和报告边界。

