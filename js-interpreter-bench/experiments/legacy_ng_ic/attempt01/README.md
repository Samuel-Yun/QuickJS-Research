# QuickJS legacy NG IC port / attempt01

本轮独立实验，2026-10-22 开始。跨午夜采集日期按 raw UTC 时间戳换算为 Asia/Shanghai。
结果与完成状态以 `results.md`、`analysis/completion.json` 为准；正式数据审计另见 `analysis/audit.json`。

**已实际完成**：16个Run单元、每边30个新进程，960/960有效；14项退化、2项小幅加速。
suite等权A/B几何平均0.925287（不是官方Octane总分）。独立16项机制诊断、9个微测试、
102次未插桩制品内存检查已完成。完整逐项表见 `analysis/final_table.md` / `final_table.csv`。
正式wait4 RSS有启动器高水位污染，Crypto随机padding没有逐对固定，限制不能省略；见 `protocol_addendum.md`。

底座固定为 upstream QuickJS `04be246001599f5995fa2f2d8c91a0f198d3f34c`
（2026-06-04）。使用现有 WSL2 Ubuntu/x86_64，但 A、B 均独立重新构建。
旧 Windows/WSL binary、旧 raw/summary 不覆盖、不参与本轮 A/B。

正式 A：无 IC 改动的同 revision 干净构建。
正式 B：仅移植 NG 删除 IC 前第一父提交的相关实现。
诊断与 sanitizer 构建不得用于正式性能结果。

仓库开始状态：myx，`01377f432f448830957219380e1cd8c903a6de46`，工作区干净。
无适用 AGENTS.md。附件明确授权本轮 VM IC 移植，早期“不优化 VM”阶段限制不覆盖本轮。

网络初始检查：Windows sandbox 内 HTTPS git 连接失败；WSL git 报证书链错误。
Windows 获准网络环境下 `git ls-remote https://github.com/quickjs-ng/quickjs.git HEAD`
成功。没有关闭 TLS 校验。

## 实际入口

以下路径相对于 `js-interpreter-bench`。除获取源码可在 Windows 执行外，其余命令在
同一 Ubuntu WSL2 中运行：

```sh
cd /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench
E=experiments/legacy_ng_ic/attempt01
python3 -B "$E/prepare_sources.py"
python3 -B "$E/port.py" --destination /home/mzyx/legacy_ng_ic_attempt01/B_port2
python3 -B "$E/build.py" release
python3 -B "$E/check.py" regression
python3 -B "$E/build.py" test
python3 -B "$E/check.py" sanitizer
python3 -B "$E/extra_checks.py"
python3 -B "$E/run.py" init
python3 -B "$E/run.py" correctness
python3 -B "$E/run.py" calibrate
python3 -B "$E/run.py" formal
python3 -B "$E/analyze.py"
python3 -B "$E/diagnostic.py" build
python3 -B "$E/diagnostic.py" run
python3 -B "$E/diagnostic_micro.py"
python3 -B "$E/diagnostic_analysis.py"
python3 -B "$E/memory_check.py"
python3 -B "$E/final_evidence.py"
python3 -B "$E/finalize.py"
```

必要前置源码：`source_history.git` 是官方 NG bare clone（完整历史），
`engines/quickjs-upstream` 是原来冻结的 clean git checkout。
初次获取命令：

```sh
git clone --bare https://github.com/quickjs-ng/quickjs.git "$E/source_history.git"
```

本目录的 source tar、原始元数据与 SHA256 也已保存；不靠 latest 分支重现旧实现。
`prepare_sources.py` 不切分支，直接 git archive 固定 SHA。

**不要在已有结果上重跑整个初始化序列。** `port.py` 要求全新 destination；
可单独在新 destination 重建 B，或为完整新 campaign 建新 attempt。
`run.py formal` 可恢复：已有记录位置不重复，失败位置也不自动重试。
所有 raw、pilot、formal、diagnostic 分目录且不可覆写。首次构建失败的 B_port1 及日志保留，
不用于正式 A/B；最终为 B_port2 / v2 patch。

这些是各阶段的实际入口。`calibrate`同时完成2倍增长校准、每项3对pilot、所选N正确性与正式配置冻结。
在本attempt里只需复核统计时，可运行 `analyze.py`、`diagnostic_analysis.py`、`finalize.py`；
它们不启动JS性能样本。不要用相同目录开始第二次campaign。

如仅检查可重建性，可在全新的Linux输出路径运行：

```sh
python3 -B "$E/port.py" --destination /home/mzyx/legacy_ng_ic_rebuild_check
make -C /home/mzyx/legacy_ng_ic_rebuild_check -j2 qjs qjsc
```

该命令不替换正式A/B、不创建新性能结果。`port.py`同时从固定NG源码复制LICENSE.NG；
若手工使用v2 patch，也必须随附 `sources/ng_parent/LICENSE`。补丁只有两个源码文件，
不能遗漏许可证。脚本与精确tar均在本目录，不需要跟随任何latest版本。

## 机制与边界

- 历史及策略先见 `legacy_design.md`；适配及安全差异见 `porting_map.md`。
- 正式A/B没有本轮计数器；编译器、-O2、无LTO/PGO及运行选项相同。
- 复用既有 monotonic adapter 和 strict Octane driver，**不使用官方自适应计分控制器**。
  必需Setup在外，首次Run与后续N次在内，验证/TearDown在外；无额外性能warmup。
- 每个Run单元3对独立pilot；共同N为2的幂，两边每个pilot均达到1s后冻结。
- 正式每单元30对（每边30新进程），15 AB + 15 BA，seed20261023。
- 16个有既有正确性断言的Run单元参与；Box2D有运行但无可靠结果门禁；zlib缺read()。
  Splay/Mandreel官方latency分数不由本mode定义，不伪装成完整Octane总分。
- speedup=median(A)/median(B)，>1为移植B更快。CI按30对进程配对bootstrap，
  10000次、固定seed；跨1标方向不明确，不是经多重校正的确认性检验。
- 三种成本分开：内部ms/Run；新进程wall ms/process；wait4 peak RSS KiB。
  wait4受fork/pre-exec高水位影响，另列GNU time内存检查，每项每版本n=3，
  不将其时间并入30对正式样本。诊断的请求分配字节与RSS分开。
- 仅保证本WSL2/CPU/版本/口径下的结果，不与旧Windows或V8时间混比。

## 文件

`manifest.json`、`protocol.json`、`frozen_config.json`、`schedule.json` 保持冻结字节不变；
`manifest_supplement.json`、`protocol_addendum.md`补充后续校验和已发现的限制；
`coverage*.csv` 保留全清单；`correctness/` 保存新增明确断言；
`raw/{build,calibration,pilot,correctness,selected_correctness,formal,diagnostic,diagnostic_micro,memory,environment}`
保存实际运行；`analysis/` 保存脚本导出的CSV、CI、SVG及审计。
`artifacts/{A,B}/`保存本轮正式binary与关键源码；实际运行绝对路径仍以manifest为准。
失败与恢复说明见 `failure_notes.md`。本轮不实现results.md列出的下一轮候选。
