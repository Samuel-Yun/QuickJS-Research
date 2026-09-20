# Windows x64 Interpreter 可行性调查

## 当前实验计划

- 主环境：同一台 Windows 11 x64 原生主机；不使用 WSL 产生正式结果。
- P0：upstream QuickJS、V8 Ignition。
- P1：JavaScriptCore LLInt；不得阻塞 P0。
- PrimJS：仅作文献和工程参考，不参加 benchmark。
- 所有参测引擎使用 Release/optimized build。允许按项目采用不同官方工具链，但必须完整记录 compiler/version、build flags 和 runtime flags。

以下 commit 沿用阶段 1 的候选固定点。实际 checkout 后仍须用 `git rev-parse HEAD` 复核。

## 主实验与扩展实验总表

| Priority | Engine | Version/Commit | Interpreter | Interpreter-only 方法 | Windows x64 当前状态 | 验证方法 | 风险/问题 |
|---|---|---|---|---|---|---|---|
| P0 | upstream QuickJS | `2026-06-04`；`master` @ `04be246001599f5995fa2f2d8c91a0f198d3f34c` | QuickJS bytecode interpreter；预期 computed-goto direct dispatch | 无 JIT；确认 Release binary 使用预期 dispatch | GCC 13.1/MinGW 可用；MSYS2/普通 make 不可用；尚未构建 | 固定 commit 与 binary checksum；保存 build flags；预处理/符号/反汇编确认 `JS_CallInternal` 分派 | 纯 PowerShell/MinGW 构建可行性和最终 dispatch 尚为 `UNKNOWN` |
| P0 | V8 Ignition | `main` @ `68a0ee4aa9a2cba8a43cbd1ed1700828adad618f`；产品版本 `UNKNOWN` | Ignition | `--jitless --no-sparkplug --no-maglev --no-turbofan`，以当前 binary flag dump 为准 | 架构支持；VS C++、SDK、depot_tools、Ninja 均未就绪 | 保存 `--print-flag-values`；确认 JIT tiers 全关；字节码和 Ignition trace 作为补充 | V8 原生 Windows 工具链缺失；`d8.exe` 尚未生成 |
| P1 | JavaScriptCore LLInt | WebKit `main` @ `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`；产品版本 `UNKNOWN` | OfflineASM X86_64 LLInt | 保持 `useLLInt=true`，运行时 `useJIT=false` 并显式关闭 Baseline/DFG/FTL | 源码有 x86-64 backend；本机官方构建链不完整 | option dump；确认非 C-loop；调试器/profile 看到 `llint_*` | Windows JSC build 未验证；属于扩展项，不阻塞 P0 |

## P0-1. upstream QuickJS

### 版本、shell 与 interpreter

- 官方 repository：<https://github.com/bellard/quickjs>。
- 候选 commit：`04be246001599f5995fa2f2d8c91a0f198d3f34c`；[`VERSION`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/VERSION) 为 `2026-06-04`。
- standalone shell：`qjs.exe`。
- [`quickjs.c`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c) 的 `JS_CallInternal` 是字节码执行核心。非 Emscripten 路径定义 `DIRECT_DISPATCH=1`，以 `goto *dispatch_table[...]` 实现 GNU computed goto。

upstream QuickJS 没有 JIT，不会自动 tier-up。P0 需要验证的是 Windows Release/optimized binary 确实来自固定 commit、使用预期 build flags，并编译进 direct-dispatch 路径；不能只凭源码宏推断最终二进制。

### Windows 原生构建状态

- 当前有 MinGW GCC/G++ 13.1 和 `mingw32-make`。
- 当前没有 MSYS2 和普通 `make`。
- [`Makefile`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/Makefile) 含 MinGW/Windows 相关配置，但在现有纯 PowerShell 环境中的实际构建成功状态为 `UNKNOWN`。
- 本轮没有下载、构建或运行 QuickJS。

### P0 验证要求

1. 固定 checkout，并保存 `git rev-parse HEAD`。
2. 使用 Release/optimized 配置，保存 GCC 路径、版本和完整 flags。
3. 保存 `qjs.exe` checksum。
4. 用预处理输出、符号/反汇编或调试器确认 `JS_CallInternal` 的 computed-goto dispatch。
5. 完成最小功能 smoke test；smoke test 不是 benchmark。

## P0-2. V8 Ignition

### 版本、shell 与 interpreter

- 官方 repository：<https://chromium.googlesource.com/v8/v8.git>。
- 候选 commit：`68a0ee4aa9a2cba8a43cbd1ed1700828adad618f`。
- standalone shell：`d8.exe`，见官方 [`d8` 文档](https://v8.dev/docs/d8)。
- interpreter：Ignition。

当前 commit 的 [`src/flags/flag-definitions.h`](https://chromium.googlesource.com/v8/v8/+/68a0ee4aa9a2cba8a43cbd1ed1700828adad618f/src/flags/flag-definitions.h) 中，`jitless` 对 TurboFan、Sparkplug 和 Maglev 有负向 implication，并令 RegExp 走解释路径。`disable_optimizing_compilers` 仍允许 baseline compiler，因此不能替代 `--jitless`。

计划中的可审计运行方式为：

```text
d8.exe --jitless --no-sparkplug --no-maglev --no-turbofan \
       --print-flag-values --print-bytecode script.js
```

`--print-bytecode` 只能证明产生 Ignition bytecode，不能单独证明没有 tier-up；正式准入必须保存 flag dump，确认 `jitless=true` 且 Sparkplug、Maglev、TurboFan 为 false。所有 flag 必须由实际构建的 `d8.exe` 接受，否则状态保持 `UNKNOWN`。

### Windows 原生构建状态

- x64 架构支持 Ignition。
- 当前未检测到 Visual Studio C++ Build Tools、`cl.exe`、可用 Windows SDK、Ninja 或 depot_tools。
- 官方 Windows 流程所需的 `fetch`、`gclient`、GN/autoninja 当前均不可用。
- 本轮没有安装依赖、下载 V8 或生成 `d8.exe`。

### P0 验证要求

1. 固定 checkout，保存 commit。
2. 按当前官方 Windows 工具链生成 Release/optimized `d8.exe`，保存 GN args、compiler version 和 binary checksum。
3. 保存实际 `d8.exe --print-flag-values` 输出。
4. 确认 Ignition 执行且 Sparkplug、Maglev、TurboFan 未参与。
5. 完成最小功能 smoke test；在全部 P0 门禁满足前不跑正式 benchmark。

## P1. JavaScriptCore LLInt

- 官方 repository：<https://github.com/WebKit/WebKit>。
- 候选 commit：`fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`。
- standalone shell：`jsc.exe`。
- 当前 [`OptionsList.h`](https://github.com/WebKit/WebKit/blob/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/Source/JavaScriptCore/runtime/OptionsList.h) 与 [`Options.cpp`](https://github.com/WebKit/WebKit/blob/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/Source/JavaScriptCore/runtime/Options.cpp) 表明 `useJIT=false` 会关闭 Baseline、DFG、FTL 及其他 JIT 选项。
- 当前 [`CMakeLists.txt`](https://github.com/WebKit/WebKit/blob/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/Source/JavaScriptCore/CMakeLists.txt) 有 X86_64 OfflineASM backend。不能简单用 `ENABLE_JIT=OFF` 代替运行时关闭，因为某些配置会改为 C-loop。

候选验证命令仍为：

```text
jsc.exe --useLLInt=true \
        --useJIT=false \
        --useBaselineJIT=false \
        --useDFGJIT=false \
        --useFTLJIT=false \
        --validateOptions=true \
        --dumpOptions=2 \
        script.js
```

当前 Windows 工具链不足，构建与运行均未验证，状态为 `DEFERRED`。JSC 的缺失不影响 P0 QuickJS + V8 在自身门禁满足后开始实验。

## PrimJS：工程参考，不参加 benchmark

阶段 1 已确认当前 Windows x64 不能启用 PrimJS 的 arm64 Template Interpreter，只会落到 QuickJS-derived C++ switch fallback。该结论保留用于解释实验范围，但 PrimJS 从参测对象、P0/P1 门禁、结果表和性能结论中移除。后续只在分析 interpreter generation、handler layout、register allocation 等工程思路时引用，不构建、不计时。

参考 repository：<https://github.com/lynx-family/primjs>；阶段 1 候选 commit：`7e50bda3e4e45762ab27a4ce415eab776953435c`。

## 当前结论

- Windows 11 x64 原生主机是唯一正式实验环境。
- P0 当前为 `BLOCKED`：QuickJS 和 V8 都尚未取得 Windows Release binary 与 interpreter-only 运行证据。
- 一旦 QuickJS 与 V8 完成 P0 门禁，即可开始 P0 benchmark；无需等待 JSC。
- JSC 为 `DEFERRED`，PrimJS 为 `REFERENCE_ONLY`。
- 本轮没有开始大型源码下载、构建或 benchmark。
