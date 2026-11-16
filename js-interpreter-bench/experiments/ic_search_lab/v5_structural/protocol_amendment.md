# 执行环境中断后的有界恢复

2026-11-06，本轮完整初筛已结束。五条件独立复测在记录372/425条后，控制会话消失，Linux 采样器也已不在进程表。原始 process_start/result 和372条数值有效记录保留。

`environment_discontinuity.json` 核验到旧独立批次的 `Mandreel/d04/rep3/pos2` 内，UTC跨度2928.434171秒，外部单调跨度5.243574287秒，差约2923秒。boot保持相同。具体原因为 UNKNOWN，后段多个案例时长也明显变化。该批次整体标记 `INVALID_ENVIRONMENT_DISCONTINUITY_PARTIAL`，不取其有利子集计算改善或置信区间。

允许一次恢复。先用同一个 s001 文件的两个标签，对4个固定案例做独立空对照。任一对照最大/最小超过1.15则停止，保存具体阻碍。通过后以原二进制、原输入、完整 N 重启全部五条件五轮，campaign为 `recovery.v5.octane`，不与旧372条合并。

新增进程内 UTC/单调跨度差1秒门槛，触发即保留原始结果并停止。后续长任务使用独立 session、文件输出及显式 exit 文件，避免依赖会话输出连接。该恢复保持代码与算法不变，只处理执行可靠性，不根据候选表现择优重测。

第一次恢复启动时已检测到新的 boot `97b464b7-20de-4375-8a35-0e8dfd4a86c8`，门禁以 `BOOT_CHANGED` 退出，产生0条新性能样本，记录于 recovery01.job/exit.json。随后保存独立 environment_recovery.json，核对 OS、compiler 及5个冻结 binary SHA256，启用同机同 OS 的新 boot cohort。recovery02 执行上述唯一一次实际恢复采样。原 environment.json 与旧原始数据均保留。
