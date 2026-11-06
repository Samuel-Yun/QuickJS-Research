# 按机制验证 IC 候选

## 最新：2026-11-07十条件完整比较

用户要求补齐另外五个候选后，新建独立 expand01 批次。
A、s001、B2、K1、L1、W1、P1、C1、ID_CTRL、ID_READ 使用同一 boot、输入与固定工作量。
冻结清单只有 L1，用户提及的 L2 本次按 L1 处理。
Octane 17 项每条件三轮，共 510 条；SunSpider 按用户中途调整每条件一轮，共 260 条。
770/770 条有效，零缺失、零重复、零不足 1000ms 样本，106 个当前文件身份通过核对。
SunSpider 在第一轮边界停止，第二轮子进程启动数为零，原三轮计划及停止记录均保留。

三个聚合的最低点估计均为 s001，相对 A 的核心 Octane、完整 Octane 和 SunSpider
耗时变化分别为 -3.57%、-3.83%、-6.71%。Octane 为三轮探索性统计，SunSpider 为单轮点估计。

- [完整逐项和聚合比较](results.expand01.md)
- [Octane 十条件时间与相对 A 变化](octane.all_conditions.expand01.csv)
- [SunSpider 十条件时间与相对 A 变化](sunspider.all_conditions.expand01.csv)
- [聚合与区间](all_conditions.expand01.aggregate.csv)
- [独立原始数据及当前文件核验](audit.expand01.files.json)
- [本批原始归档](performance_expand01.runs.jsonl.gz)
- [扩展协议](protocol_amendment.expand01.md)及[SunSpider 一轮调整](protocol_amendment.expand01_sunspider_one_round.md)

离线重算，在本目录运行

```powershell
python performance_report.py summary --epoch expand01 --campaign full_expand01_octane
python finish_expand01.py
```

附加本机文件核对使用 `python finish_expand01.py --check-files`。
新采集必须使用新 epoch，保留本批及旧 accept01/accept02 原始记录。

## 此前：2026-11-07完整复测已完成

新accept02已通过时钟和实际负载预检，完整SunSpider为390/390条有效记录。
与之前已完成的短测144条、Octane255条合计接受789条；旧失败SunSpider的2条仍隔离。
不同boot的suite分别报告，不混合样本或GM。独立审计已核对全部位置、命令、flags、
同一JS身份、时钟/结果与24项聚合值；另核对120个本地文件身份。

完整结果：[performance_results.complete.md](performance_results.complete.md)。
逐想法状态：[ideas.performance_complete.csv](ideas.performance_complete.csv)。
孙蜘蛛逐项：[full_accept02_sunspider.parent_summary.csv](full_accept02_sunspider.parent_summary.csv)。
原始快照：[performance_accept02.runs.jsonl.gz](performance_accept02.runs.jsonl.gz)。
审计：[independent_audit.complete.files.json](independent_audit.complete.files.json)。

离线重算：`python performance_report.py summary --epoch accept02`；
独立统计审计：`python audit_performance_complete.py`（无需WSL/ELF）。
本机附加文件核验：`python audit_performance_complete.py --check-files`。
三个入围候选未整体超过s001，不晋级、不启动正式30轮，不扩大候选。
下方“SunSpider2/390”等为之前故障的历史记录。

## 性能续跑：2026-11-06

已复用原制品完成实际负载预检、144/144条短测及255/255条完整Octane三轮复测。
SunSpider在2/390条后丢失进程退出记录；随后WSL返回
`Wsl/Service/CreateInstance/CreateVm/WSAENOTCONN`，唯一一次可用性重试失败。
Windows另外报告`0x800705AF`（页面文件太小）；因果关系UNKNOWN，未调整系统配置。

最新状态与逐项时间见[performance_results.accept01.md](performance_results.accept01.md)，
全部候选相对实际parent的短测数据见[short_accept01.parent_summary.csv](short_accept01.parent_summary.csv)，
入围完整Octane见[full_accept01_octane.parent_summary.csv](full_accept01_octane.parent_summary.csv)。
原始数据独立保存在[performance_accept01.runs.jsonl.gz](performance_accept01.runs.jsonl.gz)，
新交付核验为[performance_delivery.accept01.json](performance_delivery.accept01.json)。

离线重算使用`python performance_report.py summary --epoch accept01`，无需WSL/旧ELF。
恢复命令见[next_commands.accept02.md](next_commands.accept02.md)。不补接2条部分SunSpider，
不覆盖旧STOP、隔离数据或旧冻结审计。本次没有新候选晋级，默认仍为s001。
下方“0/144”和原analyze.py等说明是续跑前历史状态，当前进度以上述新文件为准。

## 续跑前冻结说明

本轮从 `8e42cc8bb8e69429f6c901ee4282df86659ad5aa` 的干净 myx 工作区开始。
旧 v5 的 STOP、11 条 d05 部分记录及全部历史样本保持不变。
只在本目录维护一份活动源码，性能始终使用另存、校验过的制品。

平台继续使用本机 Ubuntu WSL2 x86_64、GCC13.3，
`-O2 -g -fwrapv -DHAVE_CLOSEFROM`，不加入 NDEBUG/LTO/PGO。
主指标为首次 Run 包含在内的内部 CLOCK_MONOTONIC 完整 Run 时间。
加载和必需 Setup 在外，无额外 workload 预跑。
诊断制品单独编译，其时间不进入性能统计。

根README/早期实验协议中的“不优化源码”属于冻结/白盒阶段历史说明。
本轮用户已明确授权本目录的解释器IC实现尝试；不修改A或旧数据定义。

入口（在本目录内、WSL 中执行）

以下prepare/build展示首次建立流程。当前目录已经冻结，不重复prepare或覆盖同名制品。

```sh
python3 experiment.py prepare
python3 experiment.py preflight
python3 experiment.py build B2
python3 experiment.py campaign --name NAME --labels A s001 d03 d05 B2 --stage short
python3 experiment.py summarize NAME
```

## 当前完成情况

8个新版本已构建并通过基本语义与针对性安全检查；6个关键版本通过ASan+UBSan定向检查。
84个N1机制诊断、63个独立RSS观测完成，未跑完整test262。
新d05完整初筛51条保存，因同boot随后反复时钟异常保守隔离，不作晋级依据。
两次STOP和最后30秒失败复查保留。新短测0/144，完整复测和正式30均未启动。
当前 `BLOCKED_PERFORMANCE_ENVIRONMENT`，净收益UNKNOWN，未提升新底座。

主结果见 [results.md](results.md)、[ideas.csv](ideas.csv)、
[机制说明](mechanism_notes.md)、[计数全表](mechanism_summary.csv)。

## 三种复现工作分开

1. **重算现有数据，不需要Linux/旧ELF**

```sh
python analyze.py
```

读取本目录raw gzip、协议、diagnostics和identity/safety JSON。
不运行VM、不读取旧/home、不覆盖原raw。输出存在时必须逐字节一致。
计时批次仍标隔离，不能通过重算把它变成有效收益。
早期Python控制器快照未全部保存，见controller_history_limitations.json；
不能声称逐版执行控制器完全可重放。正式/诊断VM源码均已逐文件hash恢复核对。

2. **恢复精确候选源码**

```sh
python recover.py B2 --destination NEW_EMPTY_SOURCE_DIRECTORY
```

依赖仓库已跟踪的共享 `../v3_mass_search/seed_M.tar.gz`、
`patches/seed_s001.patch`和generate.py，以及本目录candidate patch/identity。
严格应用补丁并核对全部32文件SHA，要求目的目录不存在。
这是源码恢复，不保证不同路径/系统下GCC输出相同ELF SHA。
新构建必须使用新identity，不覆盖当前冻结制品。
实际HAVE_CLOSEFROM检测需兼容测试文件，见共享build_support.tar.gz。

3. **修复环境后启动全新采集**

先定位/排除负载下时钟异常；本轮不再重复尝试，也不删除任何STOP。
不能只看一次空闲检查通过就宣称长期计时可靠。
在确认外部环境恢复后，用新的epoch/campaign名称，例如stable01。
在本目录、已恢复既有固定制品路径的WSL中，保活进程单独运行。

```sh
python3 keeper.py stable01
python3 clock_check.py stable01
V6_EPOCH=stable01 python3 experiment.py preflight
V6_EPOCH=stable01 python3 experiment.py campaign --name short_stable01 --labels A s001 d03 d05 B2 ID_CTRL ID_READ W1 P1 L1 K1 C1 --stage short
```

这些是恢复命令，不代表本轮已运行stable01。clock check失败时禁止继续后面的命令。
采集入口复用本机冻结路径；换机器必须显式恢复/映射实际制品并建立新身份，
不能把重新构建的ELF冒充旧SHA。完整N与Crypto密文门禁仍来自冻结输入。
性能采集不与构建、计数、sanitizer、RSS或其他benchmark并行。

未完成项见results和analysis_audit，不改基准、V8、私有JWST，不自动提交或推送。
