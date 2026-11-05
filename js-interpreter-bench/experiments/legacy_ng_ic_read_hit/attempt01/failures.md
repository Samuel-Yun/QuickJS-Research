# 保留的工程失败和限制

- 初次bootstrap因一个无意义的字符串存在性断言（run.py中的expected）失败。
  修正生成工具后继续；此时尚无runtime构建/性能数据，不涉及测试结果筛选。
- 一次WSL correctness启动的自动权限审核超时，未启动VM；按工具允许重试一次后成功。
  不能把权限审核超时算作引擎correctness失败。
- 早期目标dump提取器将后续函数纳入.targets.txt。原始stdout始终保留，
  修正边界后另输出.target_only.txt；前者明确标为非权威派生片段，不重跑性能。
- 初版独立审计把UTC开始戳与perf_counter单调时长相加，断言失败。
  具体记录在analysis/audit_attempt01_failure.json。保留82处不一致及原始数据；
  改为分别核对UTC开始顺序、1440个Octane绝对单调区间，以及冻结阻塞runner。
  微基准缺绝对单调起止端点，原因及完整进程绝对时序不能补造。
- 原diagnostic_manifest的generator_scope文字漏述了D声明匹配anchor适配；
  实际生成代码保留force_inline，计数实现/布局相同。原manifest不改，
  更正见diagnostic_generator_addendum.json及当前diagnostic.py。
- 正式采样无引擎失败、无自动重试；1890条全保留，包含偏长样本。
- 无perf可执行文件，PMU补充UNKNOWN；不安装大型工具链、不迁移平台。
- 最终Git卫生脚本初次使用Windows反斜杠safe.directory参数而返回128；
  改用显式as_posix路径后通过，未修改全局Git配置或工作区旧文件。
- Crypto输入限制保留；唯一未逐字节一致的Windows派生重算是aggregate.json浮点末位，
  在1e-12数值容差内匹配，原Linux派生数据未改。
