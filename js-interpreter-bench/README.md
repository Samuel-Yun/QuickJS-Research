# JavaScript Interpreter Benchmark

## 研究目标

比较不同 JavaScript interpreter 的执行性能，并分析差异来源，最终寻找 QuickJS 的可优化方向。

## 实验对象与优先级

主实验分为两个优先级：

- P0：upstream QuickJS、V8 Ignition。
- P1：JavaScriptCore LLInt，作为后续扩展；不得阻塞 P0。
- PrimJS：只作为文献和工程实现参考，不参加 benchmark，不出现在性能排名或主实验统计中。

第一套候选 benchmark 为 SunSpider。在 P0 的解释器执行模式、版本、构建和运行配置得到验证之前，不进行正式 P0 benchmark。

## 固定实验平台

- 所有正式 benchmark 统一在同一台 Windows 11 x64 原生主机上运行。
- WSL 不作为主实验环境，也不混入正式结果。
- 所有引擎使用各自项目支持的 Release/optimized build。
- 不强制不同项目使用相同 compiler；V8、WebKit 和 QuickJS 可以采用各自官方或源码支持的工具链。
- 每个构建必须完整记录 compiler、compiler version、build flags 和 runtime flags。
- 比较对象是 interpreter，不是完整 JIT engine，也不比较 JIT 性能。

当前 Windows 环境快照见 [`notes/platform_windows.md`](notes/platform_windows.md)。

## 当前阶段边界

- 不修改任何引擎源码做性能优化。
- 不运行正式 benchmark。
- 不下载大型源码树。
- V8 必须验证为 Ignition-only；JSC 扩展实验必须验证为 LLInt-only。
- 所有判断必须依据固定 checkout 的源码、对应版本的官方文档或实际运行证据。
- 无法验证的信息统一标记为 `UNKNOWN`，不得猜测。
- QuickJS 与 V8 的 P0 门禁满足后即可开始 P0 benchmark，无需等待 JSC。

## 目录结构

```text
js-interpreter-bench/
├── engines/            # 固定版本的引擎源码或其来源记录
├── benchmarks/         # benchmark 源文件及版本信息
├── scripts/            # 构建、运行和结果处理脚本
├── results/
│   ├── raw/            # 不可改写的原始实验输出
│   └── processed/      # 汇总和统计结果
├── notes/              # 实验协议、平台记录、研究日志和分析笔记
└── patches/            # 后续实验性补丁；基线阶段保持为空
```

## 文档

- [`notes/platform_windows.md`](notes/platform_windows.md)：Windows 原生实验主机与工具链快照。
- [`notes/experiment_protocol.md`](notes/experiment_protocol.md)：实验约束、P0/P1 门禁和可复现性要求。
- [`notes/engine_feasibility.md`](notes/engine_feasibility.md)：各 interpreter 的当前可行性与验证方法。
- [`notes/research_log.md`](notes/research_log.md)：按时间记录命令、结果、问题和下一步。
