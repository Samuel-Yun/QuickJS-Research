# 实验协议

## 1. 研究范围

本项目比较 JavaScript 字节码解释器的执行性能，研究对象为 upstream QuickJS、PrimJS、V8 Ignition 和 JavaScriptCore LLInt。当前阶段不修改引擎源码做性能优化，不比较 JIT 性能，也不运行正式 benchmark。

第一套候选 benchmark 为 SunSpider。benchmark 本身的来源、版本和本地改动也必须固定并记录。

## 2. 可复现性记录

每次可用于比较的实验必须完整记录以下信息：

- engine 名称、version 和精确 commit；若无法确认，标记为 `UNKNOWN`，该实验不得作为正式结果。
- CPU 型号及与性能相关的可确认配置。
- OS 名称与版本。
- architecture，例如 `x86_64`、`arm64`。
- compiler 名称与完整 version。
- 完整 build flags。
- 完整 runtime flags。
- benchmark 名称、版本或 commit，以及任何本地改动。
- 执行命令、工作目录、时间戳和退出状态。

所有判断必须来自当前 checkout 的源码、与该版本相符的官方文档或实际运行证据。无法由这些证据确认的信息必须明确写为 `UNKNOWN`，不得依据记忆、博客或推测补全。

## 3. 解释器模式门禁

- 在解释器执行模式得到验证前，不得进入正式 benchmark。
- V8 必须验证为 Ignition interpreter-only，且确认 JIT 未参与被测执行。
- JavaScriptCore 必须验证为 LLInt interpreter-only，且确认更高执行层级未参与被测执行。
- QuickJS 与 PrimJS 也必须根据当前 checkout 确认实际执行路径和相关配置。
- 每个引擎都必须保存验证依据：源码位置、官方文档位置、运行输出或可复现的验证命令。
- 任何引擎的模式仍为 `UNKNOWN` 时，其数据只能用于环境检查，不得纳入正式比较。

## 4. 构建与运行控制

- 对比前固定所有引擎的源码版本和工具链。
- 不对引擎源码应用性能优化补丁；基线实验必须使用未修改源码。
- 构建命令与 build flags 必须原样记录。
- 运行命令与 runtime flags 必须原样记录。
- 不比较 JIT 性能，也不得把 JIT 数据与解释器数据混合。
- 正式实验前先定义统一的计时边界、进程模型、预热策略、超时规则和异常样本处理规则；未确定的项目标记为 `UNKNOWN`。

## 5. 重复与统计

- 正式实验必须重复多次，重复次数须在运行前确定并记录。
- 默认以有效重复测量的 median（中位数）作为主要汇总值，不使用单次运行时间代表性能。
- 必须同时保留每一次测量值；不得只保存汇总结果。
- 若排除任何一次测量，必须保留原值并记录预先定义的排除规则和具体原因。
- 不同引擎必须使用一致的重复次数和统计方法；若无法一致，必须记录原因并限制结论范围。

## 6. 数据保存

- 原始命令输出、标准错误、环境记录和逐次计时结果保存到 `results/raw/`。
- `results/raw/` 中的原始数据一经生成不得就地修改。
- 清洗、转换和统计后的结果保存到 `results/processed/`，并能由脚本从原始数据重新生成。
- 每组结果必须能够关联到对应的 engine commit、构建配置、运行配置和研究日志条目。

## 7. 正式实验准入条件

只有同时满足以下条件，才能开始正式 benchmark：

1. 四个引擎的精确版本或 commit 均已固定。
2. 四个引擎的解释器执行模式均已验证，并保存证据。
3. CPU、OS、architecture、compiler/version 均已记录。
4. build flags 与 runtime flags 均已固定并记录。
5. SunSpider 的来源和版本已固定。
6. 计时、重复、统计和异常处理规则均已预先确定。
7. 原始结果的保存格式与目录规则已确定。

任一条件不满足时，正式 benchmark 状态为 `BLOCKED`。
