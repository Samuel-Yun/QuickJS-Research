# 原生 Ubuntu Octane 复测

用户授权在本机复现已有 IC 中相对 A 较有收益的实现，同时复测 A 和 V8_ON。仅 Octane，不运行 SunSpider 和 V8_OFF。本目录是独立 native Linux cohort，不向旧 WSL/Windows 表追加样本。

预先选定五个候选：s001（PC 相对定位）、mx019（受检字段预测和 receiver 释放修正）、d03（短加载与字段读取动态融合）、B2（arg0/loc0 的准备后融合）、P1（一层原型方法读取）。另外保留 ID_CTRL 布局版本维护控制，以及未打 IC 补丁的 A、官方 V8 15.6.21。ID_CTRL 不作为独立 IC 优化算法排名。

选择依据分别来自 v2 正式结果、v4/v5 独立复核、v6 expand01；它们整体相对 A 的既有信号约为 1%–4%，不是按微基准最高倍数挑选。mx019/d03 等也有单项回归，完整 17 项保留，不因结果不利删 case。

每个 case 每个条件 5 个新进程，合计 680 条。每轮打乱 case 顺序，case 内条件按固定随机基序轮转，五轮中每条件在五个不同位置运行；五轮不足以覆盖全部八种位置。保留旧公共 N 与输入，首次 Run 计入，不在同进程额外预跑 workload。核心 16 项/13 suite 与包含 zlib 的扩展 17 项/14 suite 分开作分层几何平均，不是官方 Octane 分数。

所有 QuickJS 由本机 GCC 15.2 以相同 upstream 默认选项串行重建。历史源码 SHA 对照、完整源文件清单及构建后未变化检查分别在 source_manifest.json 和 postbuild_source_identity.json；A 对照归档中的未修改 upstream，s001 从冻结 M 种子和严格补丁恢复。V8 保持原官方 Linux ZIP 的二进制与数据哈希，flags 为 `--jitless --no-lazy --use-ic`。

原生 Ubuntu 26.04.1、i9-14900，固定逻辑 CPU 2（同胞为 CPU 3）；不调整系统服务、电源或时钟源。环境前后快照单独保留。旧对照是 Windows 主机中的 WSL2 Ubuntu 24.04.2、5800H、GCC 13.3；输入 SHA 清单和 N 要逐批核对一致，但 CPU/OS/compiler 的变化无法单独分解。

采集命令为 `python3 -u -B run.py all`。已有协议、相同 boot 内可以跳过完整有效位置；有失败调用或 unmatched start 时拒绝隐式重试。换 boot、改 runner、改输入或新采集应新建 attempt。`work/` 是本机源码和 runtime，`scripts/` 是可重新生成的 JS；两者不进 Git。原始现场 JSONL 最后归档到 `raw/runs.jsonl.gz`，完整命令/身份/输出/内部和外部时间均保留。

完成后运行 `python3 -B compare.py` 产生 results.md、旧新逐项及聚合比较。离线重算 `python3 -B run.py analyze`，无需旧 `/home/mzyx`、WSL 或运行 ELF。区间为五轮整轮配对 bootstrap 的探索性区间，保留全部异常值；小差异和点估计第一不等于已经证明算法最优。
