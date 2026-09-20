# 实验协议

## 1. 研究范围与优先级

本项目比较 JavaScript 字节码解释器的执行性能，而不是完整 JavaScript JIT engine 的峰值性能。

- P0 主实验：upstream QuickJS 与 V8 Ignition。
- P1 扩展实验：JavaScriptCore LLInt。
- PrimJS：只作为文献和工程参考，不参加 benchmark。

P0 与 P1 使用独立门禁。QuickJS 和 V8 完成验证后即可开始 P0 benchmark；JSC 未构建、未验证或不可用都不得阻塞 P0。

第一套候选 benchmark 为 SunSpider。benchmark 的来源、版本、校验值和任何本地改动必须固定并记录。

## 2. 固定平台

- 所有正式 benchmark 必须在同一台 Windows 11 x64 原生主机上运行。
- WSL、虚拟机和其他主机产生的数据不得混入正式对比。
- 每批正式实验必须重新记录 Windows version、CPU、architecture、核心数、RAM、可用磁盘空间和电源/温控相关条件。
- 如果 OS、硬件、固件、电源策略或关键工具链发生变化，必须建立新的环境记录，不能沿用旧结果的环境标识。

## 3. 可复现性记录

每次可用于比较的实验必须完整记录：

- engine 名称、version、branch 和精确 commit；无法确认时标记 `UNKNOWN`，不得纳入正式结果。
- CPU 型号、物理核心数、逻辑处理器数、OS 名称与版本、x64 architecture。
- compiler 名称、完整 version 和实际可执行文件路径。
- build type，以及完整 build flags、GN args、CMake cache 选项或等价配置。
- 完整 runtime flags 和环境变量。
- standalone shell binary 的路径、文件校验值和构建时间。
- benchmark 名称、版本/commit、文件校验值以及任何本地改动。
- 执行命令、工作目录、时间戳、退出状态和原始输出位置。

所有判断必须来自固定 checkout 的源码、与该版本相符的官方文档或实际运行证据。无法确认的内容必须写为 `UNKNOWN`，不得依据记忆、旧博客或推测补全。

## 4. 构建原则

- 所有参测引擎必须使用 Release/optimized build；Debug、sanitizer、coverage 或 assertions-heavy 构建不得作为正式性能结果。
- 不强制不同项目使用相同 compiler。QuickJS、V8 和 WebKit/JSC 可以使用各自官方支持或源码要求的工具链。
- 工具链不同是实验配置的一部分，必须完整记录并在结论中作为限制因素说明。
- 不得为了提高性能修改引擎源码。基线必须来自未修改的固定 commit。
- 构建命令、compiler version 和全部 build flags 必须原样归档；只写“Release”不充分。
- 构建产物不得在未重新记录配置的情况下覆盖或复用。

## 5. Interpreter-only 门禁

### QuickJS

- 确认当前 checkout 的 bytecode interpreter 和 dispatch 实现。
- 保存 Release/optimized 构建参数。
- 用预处理结果、符号/反汇编或调试证据确认实际二进制采用预期 interpreter dispatch。
- upstream QuickJS 没有 JIT，但仍必须证明测试的是目标 `qjs` 二进制而非其他安装版本。

### V8 Ignition

- 必须使用当前 checkout 定义并实际接受的 interpreter-only flags。
- 当前候选方案为 `--jitless --no-sparkplug --no-maglev --no-turbofan`，正式使用前必须由该 checkout 的 flag 定义和 `d8` 实际输出再次确认。
- 必须保存 flag dump，证明 Sparkplug、Maglev 和 TurboFan 均未参与。
- 只看到 Ignition bytecode 不足以排除后续 tier-up。

### JavaScriptCore LLInt（P1）

- 必须保持并验证 LLInt，同时在运行时关闭 Baseline JIT、DFG 和 FTL。
- 必须确认构建没有退化成 C-loop。
- 保存最终 option dump 以及 LLInt 执行证据。
- 该门禁只控制 P1，不影响 P0 准入。

任何引擎的执行模式仍为 `UNKNOWN` 时，其数据只能用于 smoke test 或环境检查，不得纳入正式性能比较。

## 6. P0 正式实验准入条件

只有同时满足以下条件，才能开始 QuickJS 与 V8 的正式 P0 benchmark：

1. QuickJS 与 V8 的精确 commit 均已固定。
2. 两者都已完成 Windows x64 Release/optimized build，且编译器和完整 build flags 已归档。
3. QuickJS interpreter 路径与 V8 Ignition-only 模式均已取得运行或二进制证据。
4. V8 的 Sparkplug、Maglev、TurboFan 已确认关闭。
5. 当前 Windows 主机环境快照已保存。
6. SunSpider 的来源、版本和校验值已固定。
7. 计时边界、进程模型、预热策略、重复次数、超时和异常样本规则已预先确定。
8. 原始结果格式、命名规则和保存目录已确定。

JSC 和 PrimJS 不属于 P0 准入条件。

## 7. P1 扩展准入条件

JSC 只有在固定 commit、完成 Windows x64 Release/optimized build、证明使用非 C-loop LLInt、关闭 Baseline/DFG/FTL，并满足与 P0 相同的数据记录规则后，才能加入扩展比较。P1 失败或延期不改变已经合格的 P0 状态。

## 8. 运行、重复与统计

- 正式实验必须重复多次，重复次数须在运行前确定并记录。
- 默认以有效重复测量的 median（中位数）作为主要汇总值，不使用单次时间代表性能。
- 必须保留每一次测量值；不得只保存汇总结果。
- 若排除任何测量，必须保留原值并记录预先定义的排除规则和具体原因。
- 同一比较组必须使用一致的重复次数、计时边界和统计方法；无法一致时必须限制结论范围。
- 不得把 JIT-enabled 数据与 interpreter-only 数据混合。

## 9. 数据保存

- 原始命令输出、标准错误、环境记录、flag dump 和逐次计时结果保存到 `results/raw/`。
- `results/raw/` 中的原始数据一经生成不得就地修改。
- 清洗、转换和统计结果保存到 `results/processed/`，并能由脚本从原始数据重新生成。
- 每组结果必须关联到 engine commit、binary checksum、构建配置、运行配置和研究日志条目。

## 10. 当前状态

当前只完成 Windows 原生环境复查和计划调整。尚未下载大型源码、构建引擎或运行 benchmark。P0 正式 benchmark 状态为 `BLOCKED`，直到第 6 节门禁全部满足。
