# 当前停点与恢复

当前为 BLOCKED_TIMING_DRIFT。原始短N及统一N×4的复核均已保存。没有完整288项筛选结果，也没有正式确认。当前阶段的 candidate ratio 不应用于选赢家。

只重算现有记录，可用 Windows Python 或 Linux Python，在仓库根目录运行：

```text
python js-interpreter-bench/experiments/ic_search_lab/v3_mass_search/search.py analyze
python js-interpreter-bench/experiments/ic_search_lab/v3_mass_search/search.py audit
```

原 runs.jsonl 不在时自动读公开 runs.jsonl.gz。raw_archive.json 给出压缩和原始字节SHA256。分析不启动引擎。

恢复某个真实已构建配置的源码，目标必须不存在：

```text
python js-interpreter-bench/experiments/ic_search_lab/v3_mass_search/recover.py P012 NEW_SOURCE_DIRECTORY
```

之后在恢复目录使用既定 Linux GCC13.3 `make -j1 qjs qjsc`。新的路径/工具链可能产生不同binary字节，须记录新身份。旧冻结A/M/s001仍为原制品，不重建替换。

先核实主机负载、供电及其它可能条件。确认环境有变化后，在同一 WSL distro 的本实验目录显式执行：

```text
python3 resume.py check
```

它只对冻结A/s001执行8项、各3个新进程的环境检查，使用共同长N，不做候选排名。证据写入新的 recovery.<tag>.json 和新campaign，原STOP及旧失稳块保留。检查通过后，一小时内可执行：

```text
python3 resume.py collect
```

该入口保存不可变顺序，复用14份冻结候选，其余按需串行构建。它为所有可用初始配置收集新campaign端点和短测，不混入旧失稳块。每块至多一次重复，仍超15%即停止。若出现partial block而无完整block JSON，入口会保留记录并报错，不会假装该位置已完成；届时需在新recovery tag重新取得同块数据。

本轮未执行这些恢复命令。不能把脚本存在写成恢复成功。第2层入口在layers.py，尚未采样；第3层与正式确认尚未安排或完成，不能宣称这些门禁通过。
