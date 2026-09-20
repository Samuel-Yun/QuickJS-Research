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

- 对源码构建记录 engine 名称、version、branch 和精确 commit。对官方预编译 V8，允许 source commit 为 `UNKNOWN`，但必须固定精确 V8 version、官方 archive URL、archive SHA-256、实际 binary/data artifact SHA-256，缺一不得纳入正式结果。
- CPU 型号、物理核心数、逻辑处理器数、OS 名称与版本、x64 architecture。
- 自行构建记录 compiler 名称、完整 version、实际可执行文件路径、build type 与完整 build flags/GN args/CMake 配置。
- 官方预编译 artifact 记录发布物携带的全部 build metadata；无法从官方发布物确认的 compiler revision 或 build flag 必须标为 `UNKNOWN` 并作为结论限制，不得猜测。
- 完整 runtime flags 和环境变量。
- standalone shell binary 的路径、文件校验值和构建时间。
- benchmark 名称、版本/commit、文件校验值以及任何本地改动。
- 执行命令、工作目录、时间戳、退出状态和原始输出位置。

所有判断必须来自固定 checkout 的源码、固定官方 artifact、与该版本相符的官方文档或实际运行证据。无法确认的内容必须写为 `UNKNOWN`，不得依据记忆、旧博客或推测补全。

## 4. 构建原则

- 所有参测引擎必须使用 Release/optimized build；Debug、sanitizer、coverage 或 assertions-heavy 构建不得作为正式性能结果。
- V8 可以使用 V8/Chromium 官方发布渠道提供的 Release binary；不得使用 Node.js、jsvu wrapper 或第三方未知构建代替真实 V8 shell binary。
- 官方预编译 V8 必须连同所需 data files 和原始 archive 一起版本化固定，不得在实验过程中由 jsvu 自动更新 latest。
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

- 必须使用与固定 binary 版本对应的官方源码定义，并确认实际 binary 接受 interpreter-only flags。
- V8 `15.6.21` 已选择 `--max-opt=0`：对应官方源码把最大 tier 设为 Ignition，并 weak-disable Sparkplug、Maglev、TurboFan；固定 `d8` 的最终 flag dump 和运行时对照已经确认该模式。
- `--jitless` 是更强但改变更多 VM 行为的备选，不得在未验证 binary 支持及副作用前用作默认方案。
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

1. QuickJS 的精确 commit 已固定；V8 已固定精确官方 artifact version、URL、archive/binary/data SHA-256。
2. QuickJS 已完成 Windows x64 Release/optimized build并归档工具链/flags；V8 已确认为官方渠道的 Windows x64 Release artifact并归档可用 build metadata。
3. QuickJS interpreter 路径与 V8 Ignition-only 模式均已取得运行或二进制证据。
4. V8 的 Sparkplug、Maglev、TurboFan 已确认关闭。
5. 当前 Windows 主机环境快照已保存。
6. QuickJS 与 V8 Ignition-only 必须通过同一套 correctness suite，所有测试行均为 `valid=true`。
7. SunSpider 的来源、版本和校验值已固定。
8. 计时边界、进程模型、预热策略、重复次数、超时和异常样本规则已预先确定。
9. 原始结果格式、命名规则和保存目录已确定。

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

当前已完成 QuickJS Windows baseline，固定 V8 `15.6.21` 官方 win64 prebuilt artifact，通过 V8 Ignition-only 运行验证，并由统一 correctness suite 得到 24/24 行 `valid=true`。SunSpider 1.0.2 的官方来源、固定 commit、文件哈希、standalone patch、计时边界、进程模型、重复次数和数据格式均已归档，第 6 节第 1–9 项全部满足。

SunSpider correctness gate 为 52/52 PASS。正式实验已按每个 engine/case 30 次执行，共保存 1,560 个样本，全部为 `exit_code=0`、`valid=true`；没有删除任何 outlier。原始数据为 `results/raw/sunspider.csv`，统计结果为 `results/processed/sunspider_summary.csv`，完整记录见 `notes/sunspider_results.md`。
