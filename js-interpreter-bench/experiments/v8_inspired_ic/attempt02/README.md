# V8-inspired IC E / original A / frozen V8_ON

Work in progress: attempt02 repairs a confirmed lifecycle error in attempt01.
The old 558 records are retained but disqualified from performance conclusions.
See [repair_notes.md](repair_notes.md). This directory is a new campaign; no historical measurements are
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

Planned: core16 Run units, mandatory zlib extension (17 total), 30 new processes
per condition/case, 1530 records if all eligible. Box2D remains a coverage row
unless an independently justified complete-output gate can be established.
Seed20261031; six permutations each5; no trace in formal releases; failure and
outlier records retained; global identity/timer/boot contradiction stops collection.

## 入口与材料

- [design.md](design.md)：E确实新增什么、hashed/COW/链守卫和所有权规则。
- [mechanism_mapping.md](mechanism_mapping.md)：固定V8入口与A/M/H/E的机制映射。
- `engine/A_to_E_integration.patch`＋`engine/eic_*`：E完整接入材料；正式qjs.c/Makefile未改。
- `raw/build/`、`runtime.json`：实际编译行/源码和制品SHA；`campaign_runtime.json`
  另记正式cohort的boot。准备/构建时可能的其它boot不充当正式样本。
- `correctness/`、`raw/validation/`：这版E的真实语义、状态、GC/OOM、ASan/UBSan、
  qjsc及热bytecode双向copy/ROM验证。保留测试开发失败及原因，不拿旧H的PASS代替。
- `raw/{correctness,crypto,pilot,selected_correctness,formal,started}/`：逐进程原始记录。
  Crypto摘要是固定源码/seed/N上的实际流核验，不是安全随机数方案。
- `summary/`、`plots/`：采完后从公开raw生成的描述统计、区间与审计；目录/脚本
  存在不代表实验已完成，以实际记录数量及最终results.md为准。

## 仅重算统计（Windows/Linux，不需要旧/home二进制）

在本目录，Python3标准库：

```text
python analyze.py --output replay_01
```

输出目录必须是新目录。输入只读本attempt公开JSON/raw/schedule/manifest和脚本；
不会启动VM、构建、联网或改写原summary。`audit.py`独立检查正式raw与summary。
`plot.py`从summary生成可编辑SVG；不安装绘图库。

## 已实际使用的采集流程（不要在原attempt上重复执行）

```sh
python3 stage_engine.py release
python3 stage_engine.py diagnostic
python3 stage_engine.py sanitizer
python3 prepare.py
python3 validate.py semantic
python3 validate.py lifecycle
python3 validate.py serialization
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
