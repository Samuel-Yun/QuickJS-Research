# P1 独立复测与四个方向：恢复过程的历史说明

## 最新状态：已按用户授权继续受限计时探索

当前使用 `explore01`、`EXPLORATORY_CLOCK_LIMITED`。RAW/UTC交叉差异只记录警告；
旧STOP、旧73条隔离数据和严格恢复说明保留。新的完整批次与旧记录不拼接。
进度和结果以 `results.md`、`audit.json`、comparison CSV为准。
已冻结A/s001/P1不重建；生成脚本、活动树、编译制品忽略Git，patch/身份/压缩raw保留。

以下命令供串行恢复使用，**已有worker运行时不要再启动第二个**：

```sh
V7_EPOCH=explore01 V7_WARN_CLOCK=1 python3 -u run.py pipeline --labels all
# 全部指定候选初筛后，完成P1剩余轮次和有信号代表的有限复测：
V7_EPOCH=explore01 V7_WARN_CLOCK=1 python3 -u run.py finish
python3 analyze.py
```

本模式不能确认约1%收益；探索性bootstrap不包含系统时钟误差。
详见 `protocol_clock_warning.md`。下方原严格恢复部分是历史说明，不是当前执行状态。

从 myx 的 35c6b80445ca95e1b052574900625fd0a4cbc09c 开始。
冻结 A、s001、P1 沿用 v6 制品，新增候选保持 GCC13.3 / -O2 -g -fwrapv -DHAVE_CLOSEFROM。
完整固定 Octane 17 项、SunSpider 26 项，内部 CLOCK_MONOTONIC，首次 Run 计入，无额外 workload 预跑。

P1 独立确认计划在首轮前冻结五轮，首轮先交付，余下轮次在新方向初筛后续跑。
IO2/IO4 LAYOUT 和 DIRECT、AQ1、AP1、ST1 逐个实现、检查并完整初筛。
本目录保持一个 active 源码树，patch 与制品身份分别保存，旧实验保留。

入口在 WSL 中运行 `python3 run.py`。
先 init、hold（独立空闲进程）、precheck，再执行以下首轮。

```sh
python3 run.py sample --name p1_independent --labels A s001 P1 --rounds 5 --round-limit 1
```

恢复同一 boot 的剩余四轮使用相同命令并改为 `--round-limit 5`。
每个已完成位置由原始记录识别，失败样本保留待核对。
## 当前状态：环境中断，未完成 v7

已实际采集 P1 首轮的 **73/129** 条 measurement；第74个进程的结果单独保留，
触发 STOP 后未将它补为有效 measurement。5轮计划是645条，未完成任何完整一轮。
第一次预检6条、第二次2条负载是独立诊断，不混进这73条。
整批 `QUARANTINED_ENVIRONMENT`，不用于候选排名或完整GM。

第二次预检不只是发现UTC校时：Linux MONOTONIC 内层47.069秒超出 Windows
Stopwatch 外层46.639秒，且与RAW明显分离。见 `protocol_amendment.md` 和
`precheck.2.{raw,host}.json`。没有自动关闭WSL、改变系统设置或提高旧门槛。

`variants.py` 仅写了 IO2/IO4 初稿，尚未构建、运行或通过sanitizer；不是已验证实现。
AQ1/AP1/ST1尚未实现。所有候选均无新性能结论。不得把缺数据解释为方向无效。

### 离线重算（不需要旧二进制路径存在）

```sh
python3 analyze.py --use-archive
```

原始记录可从 `raw/initial.runs.jsonl.gz` 直接读取。归档SHA和未压缩SHA见
`raw/archive.json`。CSV里空白表示未测，非零、非epsilon。已有数值属于隔离批次。

### 恢复整批，而非跨boot补样本

先保存其他WSL任务。由用户在Windows手动执行 `wsl --shutdown`（会关闭所有WSL
发行版及其中任务），再重新进入Ubuntu。程序不自动执行该操作。

在仓库的Linux挂载目录执行：

```sh
cd js-interpreter-bench/experiments/ic_search_lab/v7_adaptive_layout
V7_EPOCH=restored01 python3 -u run.py recover
V7_EPOCH=restored01 python3 -u run.py sample --name p1_restored01 --labels A s001 P1 --rounds 5 --round-limit 1
python3 analyze.py
# 在新方向初筛后，以相同协议完成剩余四轮：
V7_EPOCH=restored01 python3 -u run.py sample --name p1_restored01 --labels A s001 P1 --rounds 5 --round-limit 5
```

`recover` 只允许新boot、新epoch；有限复检失败即停止，旧STOP保留。
恢复入口已做语法和拒绝旧boot检查，**尚未在恢复后的环境实跑**。
IO候选初稿的构建/检查入口为 `run.py build --label IO2_LAYOUT`、
`run.py safety --label IO2_LAYOUT`，通过后才允许 `sample`。
这些命令不表示其余三个方向已实现。

