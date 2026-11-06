# 按机制验证 IC 候选

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
