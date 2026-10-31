# V8-inspired IC E / original A / frozen V8_ON

Completed: 1530/1530 valid formal records, 30 processes per condition/case.
Independent WSL/Windows audits: PASS_COMPLETE; raw-only numeric replay agrees.
Main core16 E/A=1.011485 [1.007660,1.014811]: no overall net optimization.
See [results.md](results.md), [summary/comparison.csv](summary/comparison.csv),
[summary/aggregate.csv](summary/aggregate.csv), [delivery_audit.json](delivery_audit.json).
attempt03 reuses the exact safety-repaired E from attempt02.
attempt01's 558 records are disqualified; attempt02's 169 records were externally
interrupted and remain a separate partial cohort, not completed n30 results.
See [cohort_notes.md](cohort_notes.md) and [repair_notes.md](repair_notes.md).
This directory is a new campaign; no historical measurements are
merged into it. Reference repository HEAD: e4b724e283a8917e851f9bbe2d45ea8c2a4060dd
(myx), initially clean. No commit/push or system configuration changes authorized.

Fixed A: upstream 04be246001599f5995fa2f2d8c91a0f198d3f34c,
SHA256 584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1.
Fixed d8: 15.6.21, SHA256
83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133.
V8_ON: --jitless --no-lazy --use-ic, original snapshot/ICU.

E starts from A, not from H. Its C source/patches are in engine/, build products
stay in /home/mzyx/v8_inspired_ic_attempt02 (not ordinary Git). Mechanism notes,
actual test records and frozen performance protocol are separate. No performance
claim is permitted before the new E correctness/safety gates pass.

MAIN: native monotonic internal ms/original complete Run; first Run included;
no workload warmup. Static loading, adapter, required Setup and final validation
outside. Dynamic compilation, GC, helper, builtin, regexp and original Run checks
remain inside. Cohort: one WSL2 Ubuntu/x86_64 boot, never mixed with Windows.

Completed: core16 Run units plus mandatory zlib (17 total), 30 new processes
per condition/case, 1530 valid records. Box2D remains a coverage row without
an independently justified complete-output gate; it was not silently dropped.
Seed20261031; six permutations each5; no trace in formal releases; failure and
outlier records retained; global identity/timer/boot contradiction stops collection.

## 入口与材料

- [design.md](design.md)：E确实新增什么、hashed/COW/链守卫和所有权规则。
- [mechanism_mapping.md](mechanism_mapping.md)：固定V8入口与A/M/H/E的机制映射。
- [v8_call_chain.md](v8_call_chain.md)：解释器读写入口、miss更新、原型维护、反馈分配和清理的实际调用链。
- [reading_notes.md](reading_notes.md)：按E实际代码解释状态、值与所有权工作，含修复后仍保留的重查。
- `engine/A_to_E_integration.patch`＋`engine/eic_*`：E完整接入材料；正式qjs.c/Makefile未改。
- `raw/build/`、`runtime.json`：实际编译行/源码和制品SHA；`campaign_runtime.json`
  另记正式cohort的boot。准备/构建时可能的其它boot不充当正式样本。
- `correctness/`及`../attempt02/raw/validation/`：这版精确E的真实语义、状态、GC/OOM、
  ASan/UBSan、qjsc及热bytecode双向copy/ROM验证。通过SHA确认复用，不冒充本boot重跑。
- `raw/{correctness,crypto,pilot,selected_correctness,formal,started}/`：逐进程原始记录。
  Crypto摘要是固定源码/seed/N上的实际流核验，不是安全随机数方案。
- `summary/`、`plots/`：从完整新raw实际生成的统计、区间与三张SVG；
  `replay_windows/`保留第二次只读重算，`delivery_audit.json`记录容差1e-12的数值一致性。
- [clock_limitations.md](clock_limitations.md)：UTC标签存在回跳，原因UNKNOWN；未使用UTC计时。
  [timeline_audit.json](timeline_audit.json)核对实际单调序列跨度、1530个进程区间及无重叠。

## 仅重算统计（Windows/Linux，不需要旧/home二进制）

在本目录，Python3标准库：

```text
python analyze.py --output replay_01
```

输出目录必须是新目录。输入只读本attempt公开JSON/raw/schedule/manifest和脚本；
不会启动VM、构建、联网或改写原summary。`audit.py`独立检查正式raw与summary。
`plot.py`从summary生成可编辑SVG；不安装绘图库。

## 本attempt的实际入口（已完成，不要重复）

`launch_campaign.ps1`记录独立隐藏WSL进程的PID和stdout/stderr日志，
实际运行`execute_reuse.py`。本attempt复用精确E，不再次构建Release；
构建/安全门禁的来源及SHA关系见`artifact_reuse.json`。
原始安全检查运行记录在`../attempt02/raw/validation/`，没有冒充本boot新跑。
N1/N2、输入摘要、clock、校准和正式均重新执行。

## 原E的实际构建与验证流程（不能在原build区重复执行）

```sh
python3 stage_engine.py release
python3 stage_engine.py diagnostic
python3 stage_engine.py sanitizer
python3 prepare.py
python3 validate.py semantic
python3 validate.py lifecycle
python3 validate.py serialization
python3 extra_gates.py
python3 campaign.py
# 采集结束后才允许：
python3 diagnostics.py build
python3 diagnostics.py collect
```

所有采样串行，首次Run包含在N中，没有额外workload预热。2个pilot/条件都≥1s
才冻结共同N；选定N再验证。正式偏短值/异常值保留。外部进程wall和CPU时间
独立保存，不与内部中位数相减推算精确frontend时间。

## 从源码重建E（不等于重算历史统计）

恢复官方QuickJS commit `04be246001599f5995fa2f2d8c91a0f198d3f34c` 的独立干净树，
保留其LICENSE，复制本目录`engine/eic_*`到该树，应用integration patch，使用
匹配GCC13.3.0和官方Makefile执行`make -j2 qjs qjsc libquickjs.a`。
编译实际行以raw/build/E.log为准：-O2/-g/-fwrapv，无新增NDEBUG/LTO/PGO/padding。
`stage_engine.py`是本机严格身份检查和机械接入的实际实现；固定源文件及差异见其
JSON日志。其它主机/路径/编译器产生的新ELF不能冒充旧SHA，必须新建cohort和attempt。

构建ELF/对象不在本仓库提交范围。A/d8制品来源与依赖复用旧runtime清单并核SHA；
不要jsvu更新或用Node替换d8。新采集使用下一空attempt并明确提供其runtime路径，
不把现有started/raw覆盖为“重跑”。统计重算与VM身份复核是不同模式。

## 限制

这是部分V8机制迁移，不是完整V8移植；keyed/global、validity cell、弱引用、
constant handler和共享mega cache仍未实现。JIT始终关闭。实际d8构建commit、
compiler/full GN args仍UNKNOWN；固定参考源码不能补成这些字段。
Box2D可运行但没有独立最终输出门禁；zlib保持原长度/strcmp断言及其NUL边界限制。
频率/命中率与诊断直接请求字节不是耗时归因、不是RSS或间接保活峰值。
N1诊断中最大直接缓存峰值1,245,432B（TypeScript）；完整JSFunctionBytecode的
GDB sizeof从128B增至152B，头字段增长24B不在上述请求计数中。
本目录及兄弟attempt未包含ELF，单文件最大约5MB；构建树/对象仍在Linux构建区。
`.gitattributes`只对本实验目录关闭换行转换，保留冻结字节SHA，不改全仓Git配置。
