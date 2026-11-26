首次准入/建制品阶段：2026-10-29。H 构建首次请求未被执行，审批服务
返回 usage-limit/review-failure，不是构建失败或安全拒绝。用户在 20:44
后明确要求继续，随后原构建命令成功执行。原始 started.json 不改写；
总 6h 预算仍从其时间起算。准入有效诊断很短，未因暂停放宽限定条件。

准备阶段各 WSL 调用可能重新启动 distro；每条 command 均保留 boot_id。
正式 campaign 在单一持续 WSL 进程及同一 boot 内运行，不拼接 boot 的
绝对单调时钟；未执行位置不补写。是否完成以实际 raw 和 audit 为准。

Git safe.directory 只按单次命令显式指定当前仓库；未修改全局 Git 设置。
活动工作区仍为 C:/Users/mzyx/Desktop/0921；F 盘历史副本未被覆盖或更新。
