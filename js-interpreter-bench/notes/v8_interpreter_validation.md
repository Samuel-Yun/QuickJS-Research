# V8 Ignition-only 验证

## 状态

`BLOCKED`。

由于没有完整 V8 checkout 和 `d8.exe`，无法取得当前 binary 的 flag dump、bytecode evidence、Ignition trace 或 tier/compilation trace。下面的 flag 分析来自调查日期当天的 V8 官方在线源码，只能作为候选方案设计，不能替代用户要求的 current-checkout 与运行时证据。

## 当前官方源码中的 flag 含义

官方 [`flag-definitions.h`](https://chromium.googlesource.com/v8/v8/+/refs/heads/main/src/flags/flag-definitions.h) 当前定义：

### `--max-opt`

`max_opt` 是最大优化 tier：

- `0`：Ignition/interpreter；
- `1`：Sparkplug/baseline；
- `2`：Maglev；
- `3`：TurboFan；
- 大于 3：不限制。

源码用 weak value implications 在 `max_opt < 1/2/3` 时分别关闭 Sparkplug、Maglev、TurboFan。`--max-opt=0` 的目标正是把 JavaScript 执行上限设为 Ignition，同时不要求全面禁用可执行内存或 regexp JIT。

### `--jitless`

`jitless` 的定义是禁止运行时分配 executable memory。它会关闭 TurboFan、Turboshaft、Sparkplug、Maglev 等，还会强制 `regexp_interpret_all`，并改变若干依赖生成代码的 VM 行为。它能阻止 JS tier-up，但作用范围明显大于“只把 JS 最大 tier 固定为 Ignition”。

### `--sparkplug`

控制 Sparkplug baseline compiler。默认 Release build 通常启用；若不限制，热点函数可从 Ignition tier-up 到 Sparkplug。最终默认值必须由实际 `d8 --print-flag-values` 确认。

### `--maglev`

控制 Maglev optimizing compiler。是否编译进 binary 以及默认值受当前 build 配置影响，必须由实际 flag dump 确认。

### `--turbofan`

控制 TurboFan optimizing compiler。`disable_optimizing_compilers` 不是 interpreter-only，因为当前源码明确说明它保留 baseline compiler，JavaScript 仍可在 Ignition 或 Sparkplug 中执行。

### 三个 compiler 的直接关闭形式

当前源码把 `sparkplug`、`maglev`、`turbofan` 都定义为布尔 flag，因此各自的直接关闭形式是：

```text
--no-sparkplug --no-maglev --no-turbofan
```

候选 A 不额外附加这三项，因为 `max_opt=0` 的当前定义已经通过 weak value implications 将它们设为 false，命令也更直接表达“最大 tier 为 Ignition”。但 weak implication 不是不可覆盖的硬约束，所以实际 binary 的 flag dump 必须显示三者最终均为 false；否则候选 A 判定失败，不能用于实验。

## 两个候选方案

| 候选 | 命令 | JS tier 限制 | 额外 VM 行为变化 | 源码层面评价 |
|---|---|---|---|---|
| A | `d8.exe --max-opt=0 script.js` | 最大 tier 为 Ignition | 相对较少 | 更准确匹配“始终在 Ignition，尽量少改变其他 VM 行为” |
| B | `d8.exe --jitless script.js` | 关闭 JIT tiers | 禁止 executable memory、regexp 解释化及其他 implication | 更强，但改变范围更大 |

源码层面的首选候选是 A：`--max-opt=0`。但 `max_opt` 使用 weak implications，最终值可受显式 flag/配置影响，所以必须查看实际 binary 的最终 flag dump；没有运行证据时不能把 A 宣布为正式命令。

## 计划中的运行时验证

脚本：[`run_v8_ignition.ps1`](../scripts/run_v8_ignition.ps1)。探针：[`v8_ignition_probe.js`](../scripts/v8_ignition_probe.js)。脚本为 A/B 分别保存：

1. `--print-flag-values`：核对 `max_opt`/`jitless`、Sparkplug、Maglev、TurboFan 最终值；
2. `--print-bytecode --print-bytecode-filter=hot`：证明 Ignition bytecode 已生成；
3. `--trace-ignition`：证明探针函数实际由 Ignition 执行；
4. `--trace-baseline --trace-baseline-exec`：检查 Sparkplug 编译和执行；
5. `--trace-opt --trace-opt-status --trace-deopt --trace-osr`：检查 Maglev/TurboFan/OSR tiering。

bytecode 输出本身不充分，因为函数仍可能在后续 tier-up。只有 flag dump、Ignition execution trace，以及 Sparkplug/Maglev/TurboFan compilation/entry 均未出现的证据组合才能通过门禁。

当前预期证据目录 `results/raw/v8_validation/` 未创建，因为 `d8.exe` 不存在。不得创建伪 flag dump 或空 trace 冒充验证结果。

## 最终判定

- Ignition 正在运行：`UNKNOWN`。
- Sparkplug 未参与：`UNKNOWN`。
- Maglev 未参与：`UNKNOWN`。
- TurboFan 未参与：`UNKNOWN`。
- Candidate A 相比 B 更少改变 VM 行为：源码层面支持，运行时未验证。

```text
OFFICIAL_V8_INTERPRETER_COMMAND=BLOCKED
CANDIDATE_V8_INTERPRETER_COMMAND=d8.exe --max-opt=0
```

在完整 checkout、Release `d8.exe`、flag dump、bytecode、Ignition trace 和 tier trace 全部存在以前，不得将候选命令提升为正式实验命令，也不得开始 P0 benchmark。
