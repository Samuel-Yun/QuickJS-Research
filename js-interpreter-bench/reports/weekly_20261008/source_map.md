# 2026-10-08 汇报：来源与统计映射

以下路径相对 `js-interpreter-bench/`。本次只读已有实验、重算用于投影的数值；没有运行引擎、采样、改 flags 或实现优化。
本地源分支 `myx`，HEAD `0f57ab1865d6681704b6021981eb4f16f0a16874`；初始工作区干净。README/旧协议的 Windows 描述是历史定义，本次采用 manifest 中明确授权的独立 WSL2 cohort，不改写历史。

## 短来源编号

| 编号 | 现有本地证据入口 |
|---|---|
| S0 | `experiments/timer_recovery/{manifest.json,results.md,audit.json,adapter_impact.md}`；`adapters/{quickjs,v8,jsc}.js`；`source/{quickjs,jsc_shell,jsc_clock}.txt`；`experiments/three_engine_baseline/{environment.txt,summary/audit.json,probes/tier/summary.json}` |
| S1 | `experiments/sunspider_three_engine/MAIN_MONOTONIC_V1/attempt01/{manifest.json,results.md,raw/formal.csv,summary/per_case.csv,summary/pairwise.csv,summary/pairwise_summary.csv,summary/audit.json}` |
| S2 | `experiments/octane_three_engine/MAIN_MONOTONIC_V1/attempt01/{manifest.json,results.md,raw/formal.csv,summary/per_case.csv,summary/suite_summary.csv,summary/pairwise.csv,summary/pairwise_summary.csv,summary/audit.json}` |
| S3 | `experiments/whitebox_analysis/attempt01/{results.md,raw/formal.csv,summary/per_variant.csv,summary/contrasts.csv,summary/baseline_recomputed.csv,summary/formal_audit.json,summary/completion_audit.json}`；`cases/{richards,navier_stokes,regexp_boundary}/evidence.md`；`profiles/regexp.mapped/execution_evidence.json`；`source_evidence/{qjs.regexp_exec,jsc.regexp.options,jsc.regexp.execution}.txt` |
| S4 | `experiments/code_cache_validation/attempt01/{results.md,protocol.md,capabilities.json,audit.json,raw/formal.csv,raw/producer.csv,summary/per_condition.csv,summary/ratios.csv,summary/cache_evidence.csv,summary/exports_audit.json}`；`probes/cache_proof/*.json`；`probes/logs/{bytecode_lazy,bytecode_no_lazy,target_cache_combined}.stdout.txt` |
| S5 | `experiments/richards_method_lookup/attempt01/{results.md,protocol.md,manifest.json,raw/formal.csv,raw/correctness.csv,summary/per_variant.csv,summary/contrasts.csv,summary/engine_ratios.csv,summary/formal_audit.json,summary/completion_audit.json}`；`microbench/{design.json,driver.js,A.schedule.js,B.schedule.js,A.source.js,B.source.js,generated/A.N512.js,generated/B.N512.js}`；`source_evidence/{sites.csv,qjs.property.inline.txt,qjs.property.fallback.txt,A.*.schedule_bytecode.txt,B.*.schedule_bytecode.txt,prior_art.md}`；`diagnostics/{counter_summary.csv,audit.json,records/sequence.*.json}` |
| S6 | S5 目录的 `source_evidence/{byte_audit.json,archive_audit.windows.json,archive_audit.linux.json,historical_bytes.zip}`、`microbench/{design_bytes.zip,formal_bytes.zip}` |

## 逐页来源、字段及边界

| 投影页 | 核心数据 / 命题 | 本地字段、证据与计算 |
|---|---|---|
| 1 | 同环境基线、cache 验证、两轮对照；未完成 VM 优化 | S0–S5 的 results/status；最新 180 样本在 S5，不沿用旧 Windows 结果 |
| 2 | runtime、flags、内部首次调用计时 | S0 `engines.*.{version,source_commit,binary,compiler,build_mode,runtime_flags}`；`clock`；adapter 捕获 performance.now；S1/S2 driver/contract 与 S0 adapter_impact。动态编译、GC/helper/builtin、原 Run 断言仍可能在内；JSC 首次 frontend UNKNOWN |
| 3 | SunSpider/Octane 三个 GM；原 Richards/Navier/RegExp | S1/S2 raw `elapsed_ms,N,case,suite,engine,valid` 重算全量 median 和三种时间比。GM 复核 `pairwise_summary.csv` 的 all_complete。点图取 S2 原 benchmark 三案例，**不是 S5 派生值** |
| 4 | 四例 cache consumer/source，0.999027 GM | S4 raw 按 `(case,condition)` 分组，30 条/组，median(elapsed_ms/N)。B consumer/A source；4 比值 GM。240 target 与 120 producer 单列。cache proof 的目标路径、事件顺序、size；capabilities 的 `IN_PROCESS_CROSS_ISOLATE`、实际反汇编，不把 cache 称裸字节码文件 |
| 5 | own 状态缓存 / Array→F64 比值 | S3 raw 按 `(variant,engine)` 分组。`richards_cached/richards_fields`、`navier_f64/navier_array` 的组 median 比，复核 contrasts；360 条。图中所有点用同一 engine 顺序/符号 |
| 6 | 两处 inherited run 与 own 字段分离；6573 calls | S5 sites.csv：Scheduler.schedule→TCB.prototype.run；TCB.run→四类 task prototype.run。counter audit 的 `selected_calls_per_Run=6573`；原始方法和断言审查 |
| 7 | A/B 准备位置，selected 3365376→512，其他调用不变 | S5 A/B.schedule、driver。counter_summary.categories 的 kind0=选定 TCB.run lookup、kind1=task.run；`selected_entries`。每种 3 诊断重复，scope=explicit_Run_loop。B 的准备仍在每 Run/timer 内；还移动了额外 own currentTcb 读取和局部赋值 |
| 8 | 六组 median/Q1/Q3、B/A、耗时降低、QJS/V8 | S5 raw 全180条重算：N=512，30条/组；Tukey下15/上15分别median得到Q1/Q3。`(1−Bmedian/Amedian)×100`；同派生实验的 QJSmedian/V8median。图为**分布区间，不是置信区间**；每组各位置10，六排列各5 |
| 9 | QuickJS handler 内普通命中、归因不足 | S5 qjs.property.inline：quickjs.c **19107–19170**；先find_own_property，沿shape->proto，普通数据hit在handler内；8210ff helper属于fallback。计数 selected fallback/helper_entries=0。A/B own/local/layout/refcount/IC/GC/.call混杂，不从源码存在遍历推断瓶颈 |
| 10 | 三边正则策略及 native 执行证据 | S3 execution_evidence：`regex_ticks=124`、`ticks_in_observed_executable_mapping=124`，每条tick、code-creation、执行映射关联；不是占比或全pattern覆盖。qjs.regexp_exec：quickjs.c48159 lre_exec；jsc.regexp.options：Options.cpp745禁用，RegExp.cpp319/336编译路径和Yarr执行。子集GM用S1/S2已有标签 |
| 11 | 候选缓存与后续净成本/语义验证 | S5 protocol/prior_art：受shape、proto identity/version、own shadowing约束。**计划，不是已实现优化**；导师“0.7/0.8”UNKNOWN，创新尚未形成 |
| 12 / A1 | 版本/完成度/环境/时钟历史 | S0–S5 各自 formal raw 计数：2340+1440+360+240+180=4560；S4 producer120另列。S1 results：两个boot恢复，不能声称连续隔离；S0墙钟根因 UNKNOWN |
| 13 / A2 | 聚合和标签子集 | S1 pairwise_summary `without:RegExp` 的20case交集；S2 `without_RegExp_CodeLoad` 的11suite交集。从各交集重算全部三个GM；并非 builtin-free 或 causal exclusion |
| 14 / A3 | `.call` 固定、实际 bytecode、sequence 局限 | S5 driver 的 Object.defineProperty(method,'call')；A/B get_field run + get_field2 call + call_method1；V8 CallProperty1；JSC jneq_ptr identity guard/direct call/fallback；27条sequence诊断。哈希摘要一致不是形式化证明；counter开销不进入formal |
| 15 / A4 | 已有技术、NG历史覆盖、复现来源 | 优先用 S5 最新 prior_art.md。P1–P4 见下；S6只证明45唯一code-cache输入当前字节匹配，21 Git blob 与运行hash因CRLF不同，未声称全部项目历史恢复 |

## 精确原始 benchmark medians（第 3 页图的来源）

单位 ms/Run；三组各30条，来自 S2 原 MAIN raw 重算。图只投影时间比。

| Case | QuickJS | V8 | JSC | V8/QJS | JSC/QJS |
|---|---:|---:|---:|---:|---:|
| Richards.Richards | 3.644671722655403 | 2.24541015625 | 2.1373828125000003 | 0.6160802198706826 | 0.586440419095623 |
| NavierStokes.NavierStokes | 61.663119953125715 | 74.770359375 | 58.6246875 | 1.2125620538149542 | 0.9507252883824978 |
| RegExp.RegExp | 193.10613872655813 | 20.67565625 | 159.7696875 | 0.1070688709657082 | 0.8273672113874994 |

以 `data_audit.json` 重算全精度为准；印刷表四/六位小数是展示舍入，不改变指标。

## 主要统计规则

- 本次离线脚本 `audit_data.py` 只读原始 CSV/JSON，不 import/调用旧 campaign，不执行 runtime。
- 单条值为内部 `elapsed_ms / N`；检查与 recorded `elapsed_per_call_ms` 一致。正式 valid 字段、正有限值保留；无 outlier 删除或 epsilon。
- 中位数取全部30条；样本标准差n−1。Tukey halves：排序后下15的median为Q1、上15的median为Q3；IQR=Q3−Q1。图分别使用两端，不用 IQR/2。
- 时间比为**组中位数之比**，不是30个配对单样本比的median。
- SunSpider：26case等权GM。Octane：每suite的子Run比值先GM，再13suite等权GM。三个pair使用同一完整交集；子集的intersection完整保存在data_audit。
- 180最新样本的位置、N、重复数及六排列核对；读现有正式/诊断独立审计，不冒充本轮重新运行诊断。

## 先前工作的精确指向（只整理已查过的资料）

- P1：Hölzle, Chambers, Ungar, ECOOP1991，*Optimizing Dynamically-Typed Object-Oriented Languages With Polymorphic Inline Caches*，[作者出版记录](https://research.google/pubs/optimizing-dynamically-typed-object-oriented-languages-with-polymorphic-inline-caches/)。
- P2：[V8 Fast properties](https://v8.dev/blog/fast-properties)，2017-08-30。设计背景，不是当前制品的IC命中率证据。
- P3：[WebKit bytecode format](https://webkit.org/blog/9329/a-new-bytecode-format-for-javascriptcore/)，2019-06-21。既有解释器metadata/IC技术，不是当前精确成本证据。
- P4：QuickJS-NG [v0.8.0官方发布](https://github.com/quickjs-ng/quickjs/releases/tag/v0.8.0)、[版本固定源码](https://raw.githubusercontent.com/quickjs-ng/quickjs/v0.8.0/quickjs.c)。本地记录short revision4822912；lines549–609四shape/offset ring、6928–7064 `proto_depth==0`填充、7083–7098own hit、15384–15460cached opcodes。full revision/完整本地源码SHA UNKNOWN。[官方PR884](https://github.com/quickjs-ng/quickjs/pull/884)记录2025-02-06删除历史IC；不推断所有后续版本全无缓存。

## 非数据来源与未执行项

`weekly_report.tex`、`weekly_interpreter_benchmark.tex` **只参考白底、细线和双栏样式**。其Windows数据、GM、样本量和两引擎结论均未导入本报告。
本次没有找到TeX工具链，故PDF编译、Overfull/缺字日志检查、15页PDF渲染及逐页视觉检查为NOT_RUN；源码静态检查不替代这些步骤。见README_Overleaf和data_audit.validation。
