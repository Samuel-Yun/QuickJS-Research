# Interpreter-only 可行性调查

## 范围与证据规则

- 调查日期：2026-09-20。
- 本阶段只检查当前分支头、当前源码、官方仓库和官方构建文档；没有 clone/build V8 或 WebKit，没有运行 benchmark，也没有修改引擎源码。
- 下表中的 commit 是本阶段准备固定的候选 checkout。以后实际 checkout 后，必须再次用 `git rev-parse HEAD` 核对；不允许悄悄跟随移动分支。
- “源码已确认”不等于“运行时已验证”。没有当前二进制执行证据的事项明确标为 `UNKNOWN` 或“待验证”。

## 总表

| Engine | Version/Commit | Interpreter | Interpreter-only 方法 | 当前平台支持情况 | 验证方法 | 风险/问题 |
|---|---|---|---|---|---|---|
| upstream QuickJS | `2026-06-04`；`master` @ `04be246001599f5995fa2f2d8c91a0f198d3f34c` | QuickJS 字节码解释器；默认 direct threaded dispatch / GNU computed goto | 无需 JIT 开关；upstream QuickJS 没有 JIT | x86-64 + GCC 13.1 支持 computed goto；构建尚未执行 | 核对 `DIRECT_DISPATCH=1`；在 `JS_CallInternal` 断点/反汇编确认间接跳转；记录 `qjs` 版本 | 实际 Windows/MinGW 构建和运行仍为 `UNKNOWN` |
| PrimJS | `2.11.1-rc.1`；`develop` @ `7e50bda3e4e45762ab27a4ce415eab776953435c` | Template Interpreter（受限目标）或 QuickJS-derived C++ fallback | 没有 JIT；必须同时证明 `enable_primjs_snapshot=true` 且使用对应 `embedded.S`，否则不是 Template Interpreter | **当前 Windows x86-64 不支持 Template Interpreter**；只能落到普通 C++ switch interpreter | 检查最终 GN args、`LEPUS_IsPrimjsEnabled`、链接输入和解释器符号/反汇编 | 当前平台无法完成所需“优化 interpreter”对比；官方主流程依赖缺失 |
| V8 Ignition | `main` @ `68a0ee4aa9a2cba8a43cbd1ed1700828adad618f`；产品版本号 `UNKNOWN` | Ignition | `--jitless`；审计命令再显式加 `--no-sparkplug --no-maglev --no-turbofan` | Ignition 支持 x86-64；当前机器缺少 V8 Windows 构建链 | `--print-flag-values` 确认四项；`--print-bytecode`；诊断构建可开 Ignition trace | 默认会 tier-up；当前仅源码确认，实际 `d8` 运行验证未完成 |
| JavaScriptCore LLInt | WebKit `main` @ `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`；产品版本号 `UNKNOWN` | OfflineASM 生成的 LLInt（x86-64 backend） | 运行时 `--useJIT=false`；审计命令显式关闭 Baseline/DFG/FTL 并保持 `--useLLInt=true` | 源码支持 X86_64 LLInt；当前 Windows 构建链不完整，实际构建为 `UNKNOWN` | `--validateOptions=true --dumpOptions=2` 检查最终选项；字节码 dump；调试器/采样确认 `llint_*` | 不应以禁用 JIT 的构建替代运行时关闭，否则可能落到 C-loop；Windows 构建未验证 |

## 1. upstream QuickJS

### A–D：仓库、版本、shell 与解释器

- A. 官方 repository：<https://github.com/bellard/quickjs>。
- B. 候选固定版本：`master`，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`；该 commit 的 [`VERSION`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/VERSION) 为 `2026-06-04`。
- C. standalone shell：`qjs`（Windows 构建通常为 `qjs.exe`）；入口是 [`qjs.c`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/qjs.c)。
- D. 当前 interpreter：`quickjs.c` 中的 QuickJS 字节码解释器，主执行函数为 `JS_CallInternal`。

### E–H：解释器确认、JIT 与当前平台

当前 [`quickjs.c`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c) 顶部定义：Emscripten 路径令 `DIRECT_DISPATCH=0`，其他路径令 `DIRECT_DISPATCH=1`。`JS_CallInternal` 中：

```c
#define SWITCH(pc) goto *dispatch_table[opcode = *pc++];
```

并由 opcode 到 `&&case_OP_*` 标签的表进行分派。这是 GNU labels-as-values 实现的 computed goto，也就是 direct-threaded dispatch；不是 C `switch` 分派。关键位置是：

- `quickjs.c` 约 48–54 行：`DIRECT_DISPATCH` 的平台选择；
- 约 16851 行：`JS_CallInternal`；
- 约 16865–16889 行：switch 与 computed-goto 两条分支以及 dispatch table；
- 约 16972 行以后：解释器循环调用 `SWITCH(pc)`。

QuickJS upstream 没有 JIT，不会自动进入 JIT，因此没有需要关闭的 tier。当前 x86-64 MinGW GCC 支持这一 GNU 扩展；按当前宏定义应编译 direct-dispatch 路径。实际确认仍需在构建后保存预处理/编译参数，并在 `JS_CallInternal` 断点或反汇编中看到 dispatch table 的间接跳转。仅仅看到程序能运行不算充分证据。

### I：构建难度与依赖

难度评估：低到中。当前 [`Makefile`](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/Makefile) 提供 GCC/Clang 路径和 `qjs` 目标，并含 MinGW/Windows 配置。当前机器有 GCC 13.1 和 `mingw32-make`，但没有普通 `make`，且 Makefile 使用若干类 Unix shell 工具。是否能在现有终端直接成功构建为 `UNKNOWN`，本阶段没有尝试。

## 2. PrimJS

### A–D：仓库、版本、shell 与解释器

- A. 当前官方 repository：<https://github.com/lynx-family/primjs>。旧的组织位置不作为本次版本依据。
- B. 候选固定版本：默认开发分支 `develop`，commit `7e50bda3e4e45762ab27a4ce415eab776953435c`；[`PRIMJS_VERSION`](https://github.com/lynx-family/primjs/blob/7e50bda3e4e45762ab27a4ce415eab776953435c/PRIMJS_VERSION) 为 `2.11.1-rc.1`。
- C. standalone shell：GN target `qjs_exe`，官方 README 的输出为 `out/Default/qjs`；如果 Windows 构建成功，预期文件名为 `qjs.exe`，但本阶段没有验证。
- D. 源码中存在两种解释执行路径：自研 Template Interpreter，以及 QuickJS-derived C++ interpreter fallback。

### E–H：Template/Generated Interpreter 是否真正启用

当前源码给出的结论是：**本机 Windows x86-64 不能启用 PrimJS 的优化 Template Interpreter。** 证据链如下：

1. [`config.gni`](https://github.com/lynx-family/primjs/blob/7e50bda3e4e45762ab27a4ce415eab776953435c/config.gni) 在 `target_cpu != "arm64"` 时强制令 `enable_primjs_snapshot=false` 和 `enable_compatible_mm=false`。
2. 根 [`BUILD.gn`](https://github.com/lynx-family/primjs/blob/7e50bda3e4e45762ab27a4ce415eab776953435c/BUILD.gn) 只有在 `enable_primjs_snapshot` 为真时才定义 `ENABLE_PRIMJS_SNAPSHOT`；`src/interpreter/BUILD.gn` 也只在该条件下加入 PrimJS interpreter 目标。
3. [`src/interpreter/primjs`](https://github.com/lynx-family/primjs/tree/7e50bda3e4e45762ab27a4ce415eab776953435c/src/interpreter/primjs) 的预生成 `embedded.S` 只有 Android、iOS、macOS 目录，没有 Windows/x86-64 版本。
4. 官方 [`template_interpreter.md`](https://github.com/lynx-family/primjs/blob/7e50bda3e4e45762ab27a4ce415eab776953435c/docs/template_interpreter.md) 描述由 macro assembler 生成 handler 并嵌入 `embedded.S` 的 AArch64 实现，包括 AArch64 寄存器分配。
5. fallback 的 [`quickjs.cc`](https://github.com/lynx-family/primjs/blob/7e50bda3e4e45762ab27a4ce415eab776953435c/src/interpreter/quickjs/source/quickjs.cc) 在未定义 `EMSCRIPTEN` 时主动定义它，继而令 `DIRECT_DISPATCH=0`；其 `JS_CallInternal` 因此走普通 C/C++ `switch` 分派，而不是 upstream QuickJS 当前默认的 computed goto。
6. 同一文件的 `LEPUS_IsPrimjsEnabled` 只有在 `ENABLE_PRIMJS_SNAPSHOT` 存在时才可能返回 runtime 的 PrimJS 状态，否则直接返回 false。

PrimJS 没有 JIT，因此不存在自动进入 JIT 的问题。但“PrimJS 能运行”只说明 fallback shell 可运行，**不能**证明 Template Interpreter 已启用。本文把项目文档中的 “Template Interpreter” 视为由模板生成并打包到 `embedded.S` 的实现；若“Generated Interpreter”是指另一个独立实现或开关，当前源码中未找到独立目标，含义为 `UNKNOWN`，不得自行等同。

后续正确验证应同时满足：

- 保存最终 GN args，证明 `target_cpu="arm64"` 且 `enable_primjs_snapshot=true`；
- 证明目标平台对应的 `embedded.S` 被纳入链接；
- 通过 `LEPUS_IsPrimjsEnabled`、调试器或反汇编证明实际进入 Template Interpreter handler；
- 如果任一条件不成立，将结果标记为 C++ fallback，不纳入“PrimJS 优化 interpreter”组。

### I：构建难度与依赖

难度评估：高；在当前目标上还存在架构阻断。官方 [`README`](https://github.com/lynx-family/primjs/blob/7e50bda3e4e45762ab27a4ce415eab776953435c/README.md) 使用 Habitat 初始化依赖，并通过 GN/Ninja 构建 `qjs_exe`。当前机器缺少 `hab`、GN、Ninja、Clang，且 README 主要给出 Linux/macOS 流程。即使补齐工具，在 Windows x86-64 上也只会研究 fallback interpreter，不是本项目希望评价的 Template Interpreter。

## 3. V8 Ignition

### A–D：仓库、版本、shell 与解释器

- A. 官方 repository：<https://chromium.googlesource.com/v8/v8.git>；GitHub 仓库只是官方镜像。
- B. 候选固定版本：`main`，commit `68a0ee4aa9a2cba8a43cbd1ed1700828adad618f`。没有 checkout/build，因此可发布产品版本号为 `UNKNOWN`。
- C. standalone shell：`d8`（Windows 为 `d8.exe`），见官方 [`d8` 文档](https://v8.dev/docs/d8)。
- D. interpreter：Ignition。

### E–H：从当前 flag 定义确认 Ignition-only

当前 commit 的 [`src/flags/flag-definitions.h`](https://chromium.googlesource.com/v8/v8/+/68a0ee4aa9a2cba8a43cbd1ed1700828adad618f/src/flags/flag-definitions.h) 定义 `jitless`，说明为禁止运行时分配可执行内存，并有如下 implication：

- `jitless => !turbofan`；
- `jitless => !turboshaft`；
- 在 Sparkplug 编译进来时，`jitless => !sparkplug` 和 `!always_sparkplug`；
- 在 Maglev 编译进来时，`jitless => !maglev`；
- `jitless => regexp_interpret_all`。

同一文件中的当前独立开关是 `sparkplug`、`maglev`、`turbofan`。因此计划中的审计命令为：

```text
d8 --jitless --no-sparkplug --no-maglev --no-turbofan \
   --print-flag-values --print-bytecode script.js
```

语义上 `--jitless` 已负责关闭 Sparkplug、Maglev 和 TurboFan；三个显式 `--no-*` 用于使实验记录自解释，并防止检查时遗漏某一层。当前源码还定义了 `disable_optimizing_compilers`，但其注释明确表示仍保留 baseline compiler，因此它**不能**替代 `--jitless` 做 Ignition-only。

默认构建会根据阈值从 Ignition 向 Sparkplug/Maglev/TurboFan tier-up，所以不加限制不能用于本研究。当前平台 x86-64 支持 Ignition；尚未生成 `d8`，运行时状态仍待验证。

验证准则：

1. 保存 `--print-flag-values` 输出，确认 `jitless=true`，且 `sparkplug=false`、`maglev=false`、`turbofan=false`；
2. `--print-bytecode` 只能证明生成了 Ignition bytecode，不能单独证明从未 tier-up；
3. 如需更强证据，可用构建参数开启 Ignition tracing，再运行 `--trace-ignition`；这是诊断构建配置，不是修改源码；
4. 若当前构建不认识任何计划 flag，立即停止并标记 `UNKNOWN`，不可用旧教程中的替代 flag 猜测。

### I：构建难度与依赖

难度评估：很高。官方 [`source checkout`](https://v8.dev/docs/source-code) 和 [`build`](https://v8.dev/docs/build) 流程使用 depot_tools、`fetch v8`、`gclient sync`、GN 和 Ninja；Windows 还需要 Visual Studio C++/Windows SDK。当前机器缺少这些工具。本阶段没有 clone 或 build。

## 4. JavaScriptCore LLInt

### A–D：仓库、版本、shell 与解释器

- A. 官方 repository：<https://github.com/WebKit/WebKit>，JavaScriptCore 位于 `Source/JavaScriptCore`。
- B. 候选固定版本：WebKit `main`，commit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`。没有 checkout/build，因此产品版本号为 `UNKNOWN`。
- C. standalone shell：`jsc`（Windows 为 `jsc.exe`）。
- D. interpreter：LLInt（Low Level Interpreter），由 OfflineASM 生成平台相关解释器实现。

### E–H：从当前 option 定义确认 LLInt-only

当前 commit 的 [`OptionsList.h`](https://github.com/WebKit/WebKit/blob/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/Source/JavaScriptCore/runtime/OptionsList.h) 定义：

- `useLLInt=true`；
- `useJIT=jitEnabledByDefault`；
- `useBaselineJIT=true`；
- `useDFGJIT=jitEnabledByDefault`；
- `useFTLJIT=true`。

当前 [`Options.cpp`](https://github.com/WebKit/WebKit/blob/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/Source/JavaScriptCore/runtime/Options.cpp) 的 `disableAllJITOptions()` 会关闭 `useJIT`、Baseline、DFG、FTL、RegExp JIT、DOM JIT 和并发 JIT 等；选项初始化后只要 `useJIT=false` 就调用该函数。因此源码层面的总开关是 `--useJIT=false`。为让原始记录明确列出研究关注的三层，计划运行命令为：

```text
jsc --useLLInt=true \
    --useJIT=false \
    --useBaselineJIT=false \
    --useDFGJIT=false \
    --useFTLJIT=false \
    --validateOptions=true \
    --dumpOptions=2 \
    script.js
```

JSC 也支持 `JSC_<option>` 环境变量；官方 Windows 文档示例包括 `JSC_useJIT=0`、`JSC_useDFGJIT=0` 和 `JSC_dumpOptions`。正式脚本将优先使用并保存命令行参数；若当前 `jsc` 的命令行解析与预期不符，再使用对应环境变量，但必须用 `dumpOptions` 留下最终值证据，不能静默切换。

默认配置允许 Baseline/DFG/FTL，因此会自动离开 LLInt。`useJIT=false` 后应停留在 LLInt。当前 [`Source/JavaScriptCore/CMakeLists.txt`](https://github.com/WebKit/WebKit/blob/fd3406f133a4e56d7aaf399ba5611ae44b8da7e9/Source/JavaScriptCore/CMakeLists.txt) 在 x86-64 上选择 `OFFLINE_ASM_BACKEND=X86_64`，并通过 OfflineASM 生成 `LLIntAssembly.h`；只有特定 `!ENABLE_JIT && ENABLE_C_LOOP` 配置才改成 `C_LOOP`。

这带来一个重要约束：**应构建包含正常 JIT 能力的 x86-64 JSC，再在运行时关闭 JIT tier。** 如果为了“interpreter-only”直接做 `ENABLE_JIT=OFF` 构建，可能比较到 C-loop，而不是优化的 X86_64 LLInt。

验证准则：

1. 保存 `--validateOptions=true --dumpOptions=2` 输出，确认 `useLLInt=true`，`useJIT/useBaselineJIT/useDFGJIT/useFTLJIT=false`；
2. 可增加当前源码定义的 bytecode dump 选项，证明生成解释器字节码，但该证据仍不能单独排除 tier-up；
3. 使用调试器断点或采样 profile 确认执行位于 `llint_*` handler，并确认没有 Baseline/DFG/FTL 编译事件；
4. 运行前检查生成配置没有选择 `C_LOOP`。

当前 x86-64 架构在源码中有优化 LLInt backend；但是本机尚未实际构建，Windows 上这一 checkout 的成功构建状态为 `UNKNOWN`。

### I：构建难度与依赖

难度评估：很高。官方 [`Windows port 文档`](https://docs.webkit.org/Ports/WindowsPort.html) 要求 64-bit Windows、Visual Studio Desktop C++、CMake、Perl、Python、Ruby、gperf、LLVM 和 Ninja 等。当前机器仅有部分依赖，缺少 Visual Studio、LLVM/Clang、Ninja、Perl、Ruby、gperf。本阶段没有 clone 或 build WebKit/JSC；当前 main 上 Windows JSC-only 的完整可复现构建命令仍为 `UNKNOWN`，后续必须先做小范围构建可行性验证。

## 阶段结论与准入状态

- QuickJS：computed goto 已由当前源码确认；实际二进制路径待验证。
- PrimJS：当前 Windows x86-64 明确不能启用 Template Interpreter，不能把 fallback 的可运行性写成“优化 interpreter 已启用”。
- V8：`--jitless` 对 Sparkplug/Maglev/TurboFan 的负向 implication 已由当前 flag 定义确认；实际 `d8` flag dump 待验证。
- JSC：`useJIT=false` 关闭 Baseline/DFG/FTL 的逻辑已由当前 option 源码确认；必须避免构建成 C-loop，实际 `jsc` option dump 待验证。
- 因此四系统的正式 benchmark 准入状态仍为 `BLOCKED`。尤其是 PrimJS 的目标实现与当前主机架构不兼容；如果研究对象必须是 Template Interpreter，后续应评估一个受支持的 arm64 共同平台，而不是在本机把 fallback 当作等价对象。

本阶段到此停止，没有进入下载、构建或性能测试阶段。
