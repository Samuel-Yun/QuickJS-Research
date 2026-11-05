# QuickJS IC快速搜索实验室

状态：**BOUNDED_SEARCH_COMPLETE_NO_ACCEPTED_CANDIDATE**（2026-11-05）。

12个候选已实际实现、构建并完成匹配配置的完整26项SunSpider初筛；c004/c006/c008完成完整17项Octane粗筛；c004完成两套3轮复筛及相关退化复核。相对A的复筛聚合区间均跨1，没有候选晋级，**本轮停止，不启动正式30进程确认或V8新采样**。这是搜索结束，不是仍在等待某个后台benchmark。

先看[results.md](results.md)、[候选总表](candidate_summary.csv)及[最终决定](decision.json)。旧BLOCKED报告原样保存在[results_before_reboot.md](results_before_reboot.md)，旧audit.json/STOP_SEARCH/STOP_CURRENT只作历史；当前检查是search_audit.json，不要将旧报告的0样本当成最新状态。

## 已完成的数量

|阶段|实际有效新进程测量|
|---|---:|
|匹配SunSpider初筛12×26×3|936|
|匹配Octane粗筛3×17×3|153|
|匹配漂移复核|6|
|c004 SunSpider复筛26×3条件×3轮|234|
|c004 Octane复筛17×3条件×3轮|153|
|匹配退化复核10项×3|30|
|匹配配置合计|1512|
|旧配置排除记录/独立环境检查|471 / 4|
|原始记录中全部有效测量|1987|
|正式确认/V8本轮样本|0 / 0|

所有原始点、失败调用、未完成的历史构建、异常和离群值都保留。1987不是正式确认样本数。没有第13个候选，也没有与其他engine/编译/诊断并行采样。

## 环境、身份与计时

- 分支myx，开始commit f191a09a21be9a672f2c4ac06ddbe9d11b483a77；没有提交或push、切分支。
- WSL2 Ubuntu24.04.2 / x86_64 / Ryzen7 5800H，affinity=[2]。当前采样boot见environment.postreboot.json，功耗/频率/温度/外部后台负载控制UNKNOWN。Windows旧数据不作分母。
- upstream QuickJS2026-06-04 / 04be246001599f5995fa2f2d8c91a0f198d3f34c，GCC13.3.0，make -B -j1 qjs qjsc，原Makefile -O2 -g -fwrapv -DHAVE_CLOSEFROM，保留断言，无新NDEBUG/LTO/PGO/padding。
- A永久冻结，SHA256：584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1。M种子SHA256：7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef。artifacts/中A/M为逐字副本，不是重编译A。M不代表整体超过A，U未作parent。
- 只有一个active/源码/构建位置，候选ELF独立快照到artifacts/，不运行正在被覆盖的active/qjs。
- 主指标FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1：内部原生单调时钟，首次Run计入，无额外workload预跑；加载/静态编译/Setup在外，原Run内动态编译/GC/helper/builtin/RegExp仍在内。
- 冻结SunSpider1.0.2与Octane输入、adapter、driver及既有N复用；不复用旧时间。每进程的命令、N、input/script/ELF SHA、内部时长、外部墙钟、boot、校验结果与stdout/stderr在runs.jsonl。
- V8没有运行/重建/更新。条件性最终模式仍应使用冻结官方制品的--jitless --no-lazy --use-ic；本轮未达该阶段，不能声称已取得新的V8结果。
- 私有jwst-compiler本轮未读取、复制、修改或打包。

## 两个重要限制

**构建配置错误已纠正，不掩盖历史。** 初次prepare漏compat/test-closefrom.c，前六个初版因此少-DHAVE_CLOSEFROM。build_configuration_issue.json披露这是本轮准备错误。旧非.matched时间与制品保留，但排除于单因素IC推断。修复后同一算法源hash/patch不变，12个候选均以.matched制品重新采集；9条编译及2条链接命令逐项匹配冻结M参考。官方探测文件公开LF与原CRLF hash分别保留于build_support/及repair记录。

**同源码不等于随机字节相同。** 冻结SunSpider的string-base64、string-validate-input未固定Math.random种子。全部样本保留，没有修改输入或删除这两项来改善GM；逐进程随机输入字节哈希UNKNOWN。见input_control_limitations.json。Octane Crypto则复用确定性输入及N对应密文门禁。当前26项表是探索性结果，不冒充严格固定输入最终验收。

## 读哪些材料

|文件|内容|
|---|---|
|results.md|实际结果、逐候选分数、限制和停止理由|
|candidate_summary.csv / candidates.csv|12个候选的parent/改动/身份/成绩/去留|
|screen_per_case.csv / screen_summary.csv|初筛逐项与聚合；legacy明确标不可用于IC收益判断|
|c004.sunspider.recheck_table.md|26项完整复筛中位数、比值和区间|
|c004.octane.recheck_table.md|17项完整复筛中位数、比值和区间|
|c004.*.recheck_statistics.csv|每项每条件n/median/mean/样本stddev/Q1/Q3/IQR/min/max|
|c004.*.recheck_rounds.csv|每一轮方向，不挑最好一轮|
|regression_followup_comparison.csv|10项初筛退化及唯一补测，绝不替换原值|
|explanation.md / patches/c004.patch|暂定候选的简短讲解和相对c002的精简补丁|
|manifest.json / cNNN.matched.json|cohort、构建和源码/制品/patch身份|
|runs.jsonl|append-only的process_start/result与measurement，命令/输出/时长/身份|
|host_runs.jsonl / host_*.bin|Windows宿主退出和原始字节，不能冒充Linux退出|
|search_protocol.json / shortlist.json|搜索与复筛晋级条件，先于相应采样保存|
|decision.json / search_audit.json|最终决定及独立核对|
|completion_check.json|结束时原A/M与副本hash、active身份及无engine/compiler运行的检查|
|seed_M.tar.gz / workspace.json|一次性公开种子源码及32文件hash，含LICENSE|

初筛ratio=候选/sqrt(A前×A后)，每项候选仅1样本，无CI；A漂移超过10%只允许一次独立三元组检查，原点不替换。复筛为各项中位数之比，再作SunSpider案例等权/Octane分层GM；10000次、seed20261104整轮配对bootstrap。3轮区间探索性且未作多重校正。Octane核心16项/13suite、扩展17项/14suite均不是官方Octane总分，Box2D/官方latency既有覆盖限制不变。

## 重算统计：不需要WSL或旧二进制

从仓库根目录运行（Windows/Linux，Python标准库）：

~~~text
python js-interpreter-bench/experiments/ic_search_lab/audit_search.py
python js-interpreter-bench/experiments/ic_search_lab/summarize.py --best c004
python js-interpreter-bench/experiments/ic_search_lab/finalize.py
~~~

实际已执行。只读raw并重建派生表、检查公开源码/补丁/输入/脚本，不访问旧/home二进制。finalize.py不启动任何runtime；重复执行要求最终决定和manifest完全相同。应保留相关旧实验的公开输入与case_catalog/M构建参考JSON，因为它们参与hash和suite核对。

本机另外已执行制品检查；如果artifacts/未分发，不运行这个可选模式：

~~~text
python js-interpreter-bench/experiments/ic_search_lab/audit_search.py --check-artifacts
~~~

历史audit.py限定重启前0样本状态，保留作证据，不用于最新审计。

## 恢复源码、构建新制品：与重算旧统计分开

提供一个**新的空目录**，恢复M或任一历史候选：

~~~text
python js-interpreter-bench/experiments/ic_search_lab/recover_source.py c004 NEW_EMPTY_DIRECTORY --profile matched
~~~

它会校验seed与parent patch，恢复32个算法文件及匹配的compat探测文件，写恢复身份，不覆盖非空目录。c004需要M→c002→c004，工具会自动按parent链恢复；不依赖旧/home路径、bare历史库或在线下载。--profile legacy仅用于追查已披露的错误配置，不能用于收益结论。

在Linux/WSL x86_64、相同GCC工具链中进入恢复目录后：

~~~text
make -B -j1 qjs qjsc
./qjs PATH_TO_THIS_LAB/checks.js
~~~

构建命令及轻量检查是本轮实际使用的形式。新机器恢复入口做过语法/帮助检查、各候选内存重建hash已核对；没有声称在第二台机器重建验证。新路径/DWARF/编译器可能改变ELF SHA，必须记录新身份；不能要求新ELF天然逐字等于旧快照，更不能把新时间写回旧campaign。

## 实际采集命令与防覆盖

host.py是本机Windows→Ubuntu的记录入口，内含本机绝对路径；在别的机器采集必须显式配置新路径和新campaign。以下是**已完成的历史命令形式，不要再次运行覆盖**：

~~~text
python js-interpreter-bench/experiments/ic_search_lab/host.py build 340 c012 M
python js-interpreter-bench/experiments/ic_search_lab/host.py screen 900 c012 sunspider
python js-interpreter-bench/experiments/ic_search_lab/host.py screen 1500 c004 octane
python js-interpreter-bench/experiments/ic_search_lab/host.py refine 2400 c004 sunspider 3
python js-interpreter-bench/experiments/ic_search_lab/host.py refine 1800 c004 octane 3
python js-interpreter-bench/experiments/ic_search_lab/host.py regressions 1000
~~~

已有campaign的protocol/raw/result为write-once，脚本不会自动删除STOP或覆盖完成记录。恢复执行的build repair/health/recovery都有独立记录；旧STOP文件不抹去。此次搜索已封闭，若开展下一轮应先明确新研究问题、输入政策和命名空间，不能将上述命令当“补跑到显著”的入口。

active/、artifacts/、对象与ELF均忽略；seed归档约0.58MB，仅含公开源码，不含私有JWST或大型历史库。runs.jsonl约35MB，原始信息保留，本轮没有自动提交/推送。
