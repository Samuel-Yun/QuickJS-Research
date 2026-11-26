# IC search v2 — 2026-11-05

已完成：4项实际设计、两项三轮复筛、4380条全新正式记录、230条独立关键集；最终审计PASS。s001在本cohort的Octane核心耗时比A少约1.41%、比M少约1.56%，不是20%提升，也不是所有case更快。结论与完整表看 `results.md`。

本轮从提交 `0bbfe03062d2dc67e91cdf54033529f03b309886` 开始，开始时工作区干净，无上一轮 worker/compiler/benchmark。旧 ic_search_lab 文件只读；本目录独立 raw 与新 cohort，不用旧时间作分母。`decision.json`是不可变的初选记录（其pending文字不代表后续安全门禁失败）；最终状态看 `completion.json`、`audit.json`，不要把初筛当成已验证收益。

一份活动源码active/，独立ELF快照artifacts/；A/M冻结不重建，parent默认M，私有JWST不读取/复制。
新raw为UTF-8/LF，.gitattributes禁用JSONL及原始bin/patch转换。`runners/*.py` 是按内容SHA命名的原字节快照，含继承脚本的CRLF，因此也禁用Git转换；机械复用的host.py同样保留原字节。这不改变新raw的LF约定。旧host_runs的CRLF哈希差异只在新审计中说明，不改旧清单。

计划与命中/失配路径见ideas.md；每个实际候选另有sNNN.md，先正确性再采样。最多6个实际候选，目标4个实质机制，不重复容量/inline枚举。V8只在一个可信候选满足正式门槛后才运行，固定--jitless --no-lazy --use-ic。

入口run.py复用上一轮lab.capture及measure的冻结workload/adapter/内部单调时钟，所有模块路径明确重新绑定到本目录，旧raw不追加。host.py只做本机Windows→WSL命令记录。性能串行，首次Run计入，无额外workload预跑。

## 材料怎么读

- `candidates.csv` / `screen_summary.csv`：四个实际设计的身份与初筛，不是四套参数枚举；全部 parent=M。
- `patches/sNNN.patch` + `sNNN.matched.json`：从同一公开 M 源码重建代码，32份源码的构建前后 SHA、11条编译/链接命令及 ELF SHA。
- `runs.jsonl`：每个子进程的开始、结束、原始 stdout/stderr、命令、身份、boot 和单调时长；保留失败与偏短样本。原件留本地并忽略Git，公开的 `runs.jsonl.gz` 无损包含同样字节，双SHA在 `raw_archive.json`；不要提交近100MB原JSONL。`host_runs.jsonl` 及 `host_*.bin` 保存使用host入口的Windows→WSL外层记录。
- `sNNN.*.table.md`：完成后由分析脚本生成的完整26项/17项三轮复筛绝对 ms/完整Run、相对 A/M 比及区间；`.statistics.csv` 同时给样本量、均值、样本标准差和 Tukey Q1/Q3/IQR。
- `explanation.md`：两个入围设计的关键代码、真实 Release 机器码、两对象/换值检查及成本；诊断结果不混进性能表。
- `manifest.json`：正式采样前冻结的runtime/source/input/contract；`postflight.json`：采样后身份复核。`audit.json`为离线独立检查；最终交付文件哈希另在 `evidence_manifest.json`，不覆盖前冻结清单。
- `final.octane.table.md` / `final.sunspider.table.md`：全新正式17项/26项，绝对ms/完整Run及相对A/M/V8_ON比值、探索性区间。Octane2040条、SunSpider2340条，不与774条三轮复筛合并。
- `independent.*`：按冻结策略触发的关键集独立10轮，最多230条，不对这个人为子集计算总体GM，也不并入正式30。

主平台是同一 WSL2 Ubuntu24.04.2/x86_64，GCC13.3.0；不是旧 Windows 主实验。新观察的 OS/kernel/boot/内存/负载见 `environment_confirmation.json`；`environment.json` 中保留的上一轮字段不冒充新测。功耗、频率控制、温度及不可见后台活动 UNKNOWN。

## 只重算已有结果，不需要旧 /home 路径下的 runtime

在仓库根目录运行（Windows Python 或 Linux Python 均可）：

```text
python js-interpreter-bench/experiments/ic_search_lab/v2_20261105/analyze.py
python js-interpreter-bench/experiments/ic_search_lab/v2_20261105/final_analyze.py
python js-interpreter-bench/experiments/ic_search_lab/v2_20261105/independent_analyze.py
python js-interpreter-bench/experiments/ic_search_lab/v2_20261105/audit.py
```

分析只读公开 raw、冻结输入及 case catalog；无原JSONL时直接读gzip，无需解压，不启动 benchmark，不依赖旧二进制。也可 `gzip -dk runs.jsonl.gz` 恢复不存在的原件；`raw_archive.json`给压缩及解压SHA。审计可额外传 `--artifacts` 检查本地未提交 ELF，但这不是重算统计的前提。它要求相应路径可访问（WSL中的 /home 制品最好在该Linux内核验）；搬迁后可用 `--path-map OLD_PREFIX=NEW_PREFIX` 显式映射，不改历史路径或哈希。前一轮 `host_runs.jsonl` 的 CRLF/LF 关系仅在本轮审计中另记，绝不修改旧 manifest 或 raw。

## 恢复代码与重新构建

```text
python js-interpreter-bench/experiments/ic_search_lab/v2_20261105/recover_source.py s001 NEW_EMPTY_SOURCE_DIRECTORY
```

目的目录必须不存在。它从本轮 `seed_M.tar.gz` 和所选 patch 恢复已核对源码，并补齐固定 `compat/test-closefrom.c`；不恢复旧 bare Git 库，不接触私有 JWST。`LICENSE` 随 seed 保留。也可以选择 M/s002/s003/s004。

在相同 Linux 工具链、恢复目录内 `make -B -j1 qjs qjsc`。原记录是 GCC13.3.0、`-O2 -g -fwrapv -DHAVE_CLOSEFROM`，无新增 NDEBUG/LTO/PGO/padding；实际11条 GCC 命令以 `sNNN.matched.json` 为准。不同机器的新 ELF 不保证字节相同，须记录新身份，不能冒充本轮冻结 A/M/candidate。

## 本轮实际采集入口与防覆盖

以下记录已用的入口供追溯，**不是要求再次运行已完成任务**：

```text
python host.py screen 1000 s001 sunspider
python host.py screen 1200 s001 octane
python host.py recheck_pair 3000 s001
python host.py recheck_pair 3000 s004
```

`host.py` 在本目录运行，只适合本次 Windows/Ubuntu 路径。Linux 原生命令对应 `python3 run.py screen s001 sunspider` 或 `python3 run.py recheck_pair s001`。已有 protocol/results 均拒绝覆盖；中断位置也不自动替换为新样本。新 campaign 必须使用新的命名空间/工作目录并冻结新环境、源码、制品和计划，不能删除本轮 protocol 来强行重跑。

## 口径、限制与一个恢复事件

SunSpider 沿用原26项及旧 N，不改算法/校验/首次Run边界。`string-base64` 和 `string-validate-input` 的随机数未固定种子；同源码不代表各进程输入字节相同，未删除两项。Octane 使用固定17项、确定性 Crypto 和已有密文门禁；主聚合为核心16项/13suite，扩展17项/14suite另报，不是官方分数。Box2D、官方 latency 的旧覆盖限制不变。

初筛 `candidate/sqrt(A_before*A_after)` 无 CI；复筛恰好三轮 A/candidate/M，每项三种位置各一次，seed=20261105。10000次整轮配对 bootstrap 同时重算每项中位数比与 GM。仅三轮、搜索选择偏差、未作多重校正，区间跨1不等于证明无效。

s003 原 SunSpider 初筛遇到两次 >10% 的 A 漂移而保存为 partial 并停止。四次独立 A 健康检查通过后，只授权一次全新完整26项恢复 campaign；原12项及漂移检查未拼接或删除。细节见 `s003.matched.sunspider.partial.json`、`drift_check_policy.json`、`health_after_drift.json`、`recovery_authorization.json`。缺失 `/proc/pressure/cpu` 曾使检查辅助脚本在采样前退出，另有失败记录；不是引擎崩溃/OOM。

构建物、活动源码及诊断 ELF 被本目录 `.gitignore` 排除；可重建 patch、公开 seed、raw 和统计保留。没有自动提交或 push。

正式与关键集的实际入口分别是 `final_collect.py collect octane`、`final_collect.py collect sunspider`、`independent.py`，均在该WSL里运行。已有protocol禁止换身份/boot后拼接；同boot恢复仅跳过已完成有效位置，不删旧数据重跑。新campaign必须独立命名并重新冻结，不能把这些命令当成覆盖重跑按钮。

注意：`active/qjs`是安全验证时的ASan/UBSan输出，**不是计时制品**。正式s001始终为 `artifacts/s001.matched.qjs`，SHA见manifest。原A/M及官方V8均未替换。
