# JavaScript Interpreter Benchmark

## 研究目标

比较不同 JavaScript interpreter 的执行性能，并分析差异来源，最终寻找 QuickJS 的可优化方向。

## 实验对象与优先级

主实验分为两个优先级：

- P0：upstream QuickJS、V8 Ignition。
- P1：JavaScriptCore LLInt，作为后续扩展；不得阻塞 P0。
- PrimJS：只作为文献和工程实现参考，不参加 benchmark，不出现在性能排名或主实验统计中。

第一套 benchmark 为固定的 SunSpider 1.0.2。早期 Windows P0 已完成；后续另经授权建立独立 WSL2 cohort，完成三引擎比较和白盒实验。不同 cohort 的结果不得合并或互相计算性能比。

## 固定实验平台

- 每项比较必须在同一 cohort、同一主机、同一 OS 环境和 architecture 内运行，记录其独立 manifest、runtime/data hashes 和计时协议。
- **历史 Windows cohort**：早期 QuickJS/V8 正式结果运行于 Windows 11 x64 原生环境。当时“WSL 不参加主实验”的约束和已有数据定义保留，不将后续 Linux/WSL 数据混入这些结果。
- **后续授权 WSL2 cohort**：`wsl2-ubuntu2404-x64-20261004`，同一 Ubuntu 24.04.2/x86_64 内运行冻结的 Linux runtime。其正式样本只代表该 WSL2 环境，不冒充 Windows-native 或原生 Linux，不能与历史 Windows 时间相除。
- 所有参测 runtime 必须是 Release/optimized 配置。QuickJS 使用固定源码构建；V8 允许使用 V8/Chromium 官方发布渠道的可追溯预编译 artifact。
- 不强制不同项目使用相同 compiler；V8、WebKit 和 QuickJS 可以采用各自官方或源码支持的工具链。
- 自行构建必须完整记录 compiler、compiler version 和 build flags；官方预编译 artifact 必须记录精确版本、官方 URL、binary/data hashes、可用 build metadata 和全部 runtime flags，无法从发布物确认的字段写 `UNKNOWN`。
- 比较对象是 interpreter，不是完整 JIT engine，也不比较 JIT 性能。

历史 Windows 环境见 [`notes/platform_windows.md`](notes/platform_windows.md)；后续 WSL2 环境和规则见各实验 manifest、environment 和 execution_contract。`notes/experiment_protocol.md` 保留早期 Windows 协议；其平台/门禁条目不覆盖后续独立授权 cohort 的专用协议。

## 当前实验状态

- 不修改任何引擎源码做性能优化。
- 不下载大型源码树。
- V8 必须验证为 Ignition-only；JSC 扩展实验必须验证为 LLInt-only。
- 所有判断必须依据固定 checkout 的源码、固定官方 artifact、对应版本的官方文档或实际运行证据。
- 无法验证的信息统一标记为 `UNKNOWN`，不得猜测。
- QuickJS 与 V8 的 P0 门禁已经通过；统一 correctness suite 为 24/24 PASS，SunSpider correctness gate 为 52/52 PASS。
- 历史 Windows SunSpider 1.0.2 已完成：每个 engine/case 30 次，共 1,560 个有效样本，保留原计时边界和结果。
- WSL2 后续研究包含三引擎 SunSpider/Octane 和独立白盒实验；不是向旧 Windows 表追加数据。JSC 的 WSL 扩展不改变旧 P0 数据定义，本轮调用路径跟进只用 QuickJS/V8。
- 当前研究不实现 VM 性能优化；暂停的 Richards 方法外提 A/B 不作为原程序瓶颈或优化收益证据。

## 后续实验入口（独立 cohort / attempt）

- [`experiments/three_engine_baseline/`](experiments/three_engine_baseline/)：WSL2 runtime 身份与执行模式。
- [`experiments/timer_recovery/`](experiments/timer_recovery/)：可靠内部单调时钟，替代失败的 Date.now 协议。
- [`experiments/sunspider_three_engine/MAIN_MONOTONIC_V1/attempt01/`](experiments/sunspider_three_engine/MAIN_MONOTONIC_V1/attempt01/)：同平台三引擎 SunSpider。
- [`experiments/octane_three_engine/MAIN_MONOTONIC_V1/attempt01/`](experiments/octane_three_engine/MAIN_MONOTONIC_V1/attempt01/)：同平台三引擎 Octane。
- [`experiments/bytecode_whitebox_simple/attempt01/results.md`](experiments/bytecode_whitebox_simple/attempt01/results.md)：六类小程序字节码；其中三类完成正式计时，不代表总体引擎排名。
- [`experiments/call_path_followup/attempt01/results.md`](experiments/call_path_followup/attempt01/results.md)：2026-10-17 四组相同计算的调用路径对照完成，240/240 正式样本、独立审计 PASS；另有未修改 Richards 的实际采样/路径/dump，位置级耗时归因仍有限。复现见同目录 README，未实现 VM 优化。

## 目录结构

```text
js-interpreter-bench/
├── engines/            # 固定版本的引擎源码或官方 binary/data artifact
├── benchmarks/         # benchmark 源文件及版本信息
├── scripts/            # 构建、运行和结果处理脚本
├── results/
│   ├── raw/            # 不可改写的原始实验输出
│   └── processed/      # 汇总和统计结果
├── notes/              # 实验协议、平台记录、研究日志和分析笔记
└── patches/            # benchmark standalone 移植补丁；不包含引擎性能修改
```

## 文档

- [`notes/platform_windows.md`](notes/platform_windows.md)：Windows 原生实验主机与工具链快照。
- [`notes/experiment_protocol.md`](notes/experiment_protocol.md)：实验约束、P0/P1 门禁和可复现性要求。
- [`notes/engine_feasibility.md`](notes/engine_feasibility.md)：各 interpreter 的当前可行性与验证方法。
- [`notes/v8_prebuilt.md`](notes/v8_prebuilt.md)：固定的 V8 官方预编译 artifact、来源与校验值。
- [`notes/sunspider_results.md`](notes/sunspider_results.md)：SunSpider 来源、移植、方法、correctness 与正式结果。
- [`notes/research_log.md`](notes/research_log.md)：按时间记录命令、结果、问题和下一步。
