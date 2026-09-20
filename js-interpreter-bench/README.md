# JavaScript Interpreter Benchmark

## 研究目标

比较不同 JavaScript interpreter 的执行性能，并分析差异来源，最终寻找 QuickJS 的可优化方向。

## 研究对象

- upstream QuickJS
- PrimJS
- V8 Ignition
- JavaScriptCore LLInt

第一套候选 benchmark 为 SunSpider。在解释器执行模式得到源码、官方文档或实际运行证据验证之前，不进行正式 benchmark。

## 当前阶段边界

- 不修改任何引擎源码做性能优化。
- 不运行正式 benchmark。
- 不比较 JIT 性能。
- V8 与 JavaScriptCore 后续必须使用经过验证的 interpreter-only 模式。
- 所有判断必须依据当前 checkout 的源码、官方文档或实际运行证据。
- 无法验证的信息统一标记为 `UNKNOWN`，不得猜测。
- 当前仓库仅完成实验项目骨架和协议初始化，尚未下载或编译任何引擎。

## 目录结构

```text
js-interpreter-bench/
├── engines/            # 固定版本的引擎源码或其来源记录
├── benchmarks/         # benchmark 源文件及版本信息
├── scripts/            # 构建、运行和结果处理脚本
├── results/
│   ├── raw/            # 不可改写的原始实验输出
│   └── processed/      # 汇总和统计结果
├── notes/              # 实验协议、研究日志和分析笔记
└── patches/            # 后续实验性补丁；基线阶段保持为空
```

## 文档

- `notes/experiment_protocol.md`：实验约束、记录要求与正式实验门禁。
- `notes/research_log.md`：按时间记录命令、结果、问题和下一步。
