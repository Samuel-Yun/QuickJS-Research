# Frontend isolation experiment (2026-09-24)

研究问题：原 SunSpider source-to-finish 的差异在减少一次性 frontend/启动开销后如何变化？本实验不能把变动量直接解释为某一阶段的因果贡献，也不能称为“纯 interpreter time”。

## 冻结输入与模式

- QuickJS：upstream `2026-06-04`，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，原 `engines/quickjs-upstream/qjs.exe`（SHA-256 `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`）；`qjsc.exe` SHA-256 `db80b47e8383afd76b95bea2f76354591c9b5667c16b4fec73632eacf6445092`。实验中不重建/替换 `qjs.exe`。
- V8：官方 Windows x64 prebuilt `15.6.21`，`d8.exe` SHA-256 `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`，固定 `snapshot_blob.bin` 和 `icudtl.dat`；正式参数始终 `--max-opt=0`。V8 是 engine，d8 是 shell，不是 Node.js。
- Workload：原项目已冻结的 SunSpider 1.0.2 standalone 26 cases；其上游/移植版 manifest 和 patch 由 `scripts/run_sunspider.py:verify_frozen_inputs` 核验。没有覆盖第一轮 `results/raw/sunspider.csv`。
- Mode 1：**已有** source-to-finish，不重跑；`run_source_mode.py` 只检查/读取第一轮 CSV。26×2×30 = 1,560 样本。
- Mode 2：**未做正式横向比较**。QuickJS 可使用 `qjsc` 的 C/可执行文件嵌入字节码；本 Windows 版 `qjsc` 自身不支持直接输出 exe，需额外 C 编译/链接。d8 `--cache=code` 可在同一启动中先生成再消费 Code Cache，但不提供已验证的跨进程固定缓存产物启动命令；两边产物及计时边界不等价。只有机制 smoke，不生成跨引擎 ratio。
- Mode 3：**same-process repeated execution / frontend-amortized**。把每份原 case 原封不动放进 `function workload(){...}` 函数体，追加可观察 checksum；同一个进程加载/编译一次，然后调用同一函数 N 次。两引擎使用逐字相同的生成 JS 文件。`N` 按两个引擎的 pilot 墙钟时间逐 case 倍增，直到两者都至少 200 ms；同 case 双方使用相同 N。每个 engine/case 30 个新进程样本，case 顺序按 seed `20260924` 打乱，engine 先后逐轮交替。每条 sample 用 Python `time.perf_counter_ns()` 计 `subprocess.run`；结果以 `wall_time_ns / N` 作摊薄后的每调用时间。保留全部样本，不删 outlier。
- 包装作用域对照（不是第四种解释器模式）：对**同一生成 JS** 只调用 1 次（N=1），每 engine/case 30 次。它检查“顶层改函数体”是否已显著改变第一轮趋势。数据在 `raw/wrapped_once_control.csv`，seed `20260925`。

Mode 3 计时仍包括一次 process creation/exit、VM 初始化、生成的 JS 源文件读取/解析/编译、N 次调用、checksum 比较、输出捕获与 Python 处理。V8 的惰性函数编译若发生，也会落在首次调用内；本实验没有对该内部事件单独计时。这些一次性成本除以 N 摊薄，但未被单独测出或完全消除。引擎执行内还含 GC、builtins、regexp、运行时辅助操作。`--max-opt=0` 限制 JavaScript tier，不保证 RegExp 原生实现也解释执行。源码检索还确认 `date-format-tofte`、`date-format-xparb`、`string-tagcloud`、`string-unpack-code` 含 `eval`，`date-format-xparb` 含动态 `new RegExp`；这些 case 在每次调用中**仍可能重新执行 frontend 工作**（`rg -n '\beval\s*\(|new RegExp\s*\(' benchmarks/sunspider/standalone/sunspider-1.0.2`）。**不能称为纯解释器执行时间**。

特别注意：函数包装把原顶层脚本变成函数作用域，虽然两个引擎执行相同的生成 JS，但它与 Mode 1 的语义边界并不完全一致。某些 case 使用 `Math.random()`、时间、全局状态/原型；每次调用的内部数据不一定相同。这个 mode 适合观察“同进程重复执行下的整体趋势”，不适合用两种 mode 的差值识别 startup、VM init、parser、bytecode compiler 各自的占比。`crypto-aes` 的密文长度受 nonce/编码影响；checksum 只用解密后明文长度并保留原文件的明文相等断言。`3d-raytrace` 保留已有 20969/20970 双长度哨兵，允许其跨引擎 checksum 不同。`date-format-*` 和 `string-validate-input` 原 case 没有内部正确性断言，因此附加 checksum 仅作为重复稳定性/跨引擎一致性门槛，不等同于独立 oracle。

## QuickJS 机制证据

`qjs --help`：支持 source 文件、`-e` eval、module、include；无裸字节码文件加载选项。`qjs.c` 的 source 路径使用 `js_load_file` + `JS_Eval`。`qjsc --help`：`-c` 输出含序列化字节码的 C，`-e` 输出含 `main()` 的 C，常规目标是可执行文件。`qjsc.c:346` 使用 `JS_EVAL_FLAG_COMPILE_ONLY`，`qjsc.c:193` 使用 `JS_WriteObject`，生成 C 的 `main` 在 `qjsc.c:856` 调用 `js_std_eval_binary`；后者在 `quickjs-libc.c:4357,4375` 使用 `JS_ReadObject(..., JS_READ_OBJ_BYTECODE)` + `JS_EvalFunction`。官方本地文档 `doc/quickjs.texi` “Script evaluation” 明确指出该路径免于运行时编译，字节码版本绑定、不适合不可信输入，所以 `qjsc` 不直接输出裸二进制字节码文件。

额外 `-c` smoke：`qjsc.exe -c -o experiments/frontend_isolation/generated/qjsc_probe_bytecode.c experiments/frontend_isolation/correctness/qjsc_probe.js` 生成只有 `uint8_t[]`/size、无 `main()` 的 C 文件（SHA-256 `5788f759050779d3548614829d9b2bfbe56d5f0fbcb4eb219397d54543b57246`）。这不是可直接传给 `qjs.exe` 的独立 bytecode 文件。

Windows 特例：`qjsc.c:430` 的直接编译/链接路径受 `!defined(_WIN32)` 限制，Windows 分支报 `Executable output is not supported for this target`；`-e -o file.c` 仍有效。我们仅为**机制 smoke** 用已存在的 `.obj` 链接了独立小程序，没有重建 qjs 或改 VM 源码：

```powershell
& .\engines\quickjs-upstream\qjsc.exe -e -o .\experiments\frontend_isolation\generated\qjsc_probe.c .\experiments\frontend_isolation\correctness\qjsc_probe.js
& E:\mingw64\bin\gcc.exe -O2 -D_GNU_SOURCE -I .\engines\quickjs-upstream -o .\experiments\frontend_isolation\generated\qjsc_probe.exe .\experiments\frontend_isolation\generated\qjsc_probe.c .\engines\quickjs-upstream\.obj\quickjs.o .\engines\quickjs-upstream\.obj\quickjs-libc.o .\engines\quickjs-upstream\.obj\libregexp.o .\engines\quickjs-upstream\.obj\libunicode.o .\engines\quickjs-upstream\.obj\cutils.o .\engines\quickjs-upstream\.obj\dtoa.o -lm -lpthread
& .\experiments\frontend_isolation\generated\qjsc_probe.exe
```

固定 probe 的 source 与预编译程序均打印 `QJSC_CHECKSUM=333833500`。生成 C SHA-256 `1e3c1ab916671156b21bed84198db0eee3b434fa2c74d20c86e314816c4d7d23`；测试 exe SHA-256 `f007e511266a476578e4f88abea9b089b6ac27e6a0c3de228e5877006659ce70`。若将来计时该路径，仍包含进程启动、VM 初始化、字节码反序列化、解释执行、进程退出与外部 runner 开销；只跳过该预编译 workload 的 source 文件读取/解析/编译。这个 smoke 只证明 QuickJS 机制，不属于与 d8 对称的 Mode 2 测量。

## V8/d8 Code Cache 机制证据

当前 d8 `--help` 有 `--compilation-cache`（内部缓存，默认 on）、`--concurrent-cache-deserialization` 等 VM flags，**未列出** shell 的 `--cache=code`；但同一固定 binary 的实际 smoke 接受：

```powershell
& .\engines\v8-official-15.6.21\runtime\d8.exe --snapshot_blob=.\engines\v8-official-15.6.21\runtime\snapshot_blob.bin --max-opt=0 --cache=code .\experiments\frontend_isolation\correctness\qjsc_probe.js
```

输出依次为 `Run: Produce code cache`、checksum、`Run: Consume code cache`、checksum。也就是说，一次 d8 启动执行两遍；该文本证明走到 shell 标注的“消费”运行段，但未独立核验缓存实际接受/命中还是 fallback，**命中状态 UNKNOWN**。当前也未证明能把第一次产物保存为固定文件，在另一启动中仅消费缓存。因此不将它计作预先固定缓存的正式模式。`Code Cache` 是 V8 `ScriptCompiler` 的序列化编译缓存概念，**不是已验证的“裸 Ignition bytecode 文件”**；`--compilation-cache` 是引擎内部缓存开关，不能替代可导出 artifact；`snapshot_blob.bin` 是启动 snapshot，不是针对这 26 份 workload 生成的编译缓存；parser cache 的当前可用独立接口 **UNKNOWN**。本项目没有 V8 完整源码 checkout；当前 tag 为 [15.6.21 / 37fb84941c9be9f9914ee50b1ad366f06a1bd764](https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21)，所以不把其他版本的 d8 源码细节当成当前 binary 的证据。当前官方 [V8 Code Cache 说明](https://v8.dev/blog/code-caching) 可作为 API 概念背景，但 capability 判定基于此处实际 d8 输出。

术语边界：Ignition bytecode 是 V8 函数内部的执行指令；Code Cache/compiled script cache 是 `ScriptCompiler` 面向嵌入方的序列化编译结果，不等同于一个可由 d8 直接运行的裸字节码文件；`--compilation-cache` 是 V8 内部缓存策略开关；parser cache 的独立持久化路径在此 binary 上 **UNKNOWN**；snapshot 是引擎启动状态的序列化数据，与为每份 SunSpider source 预编译的缓存不同。现有证据不能进一步分解 Code Cache 具体装入了多少 parser 结果、Ignition 指令或其他 metadata。

## 重现命令（项目根目录）

```powershell
python experiments/frontend_isolation/run_source_mode.py
python experiments/frontend_isolation/run_repeated_mode.py correctness
python experiments/frontend_isolation/run_repeated_mode.py calibrate
python experiments/frontend_isolation/run_repeated_mode.py measure
python experiments/frontend_isolation/run_repeated_mode.py summarize
python experiments/frontend_isolation/run_wrapped_once_control.py measure
python experiments/frontend_isolation/run_wrapped_once_control.py summarize
python experiments/frontend_isolation/compare_modes.py
```

脚本对 correctness/raw/summary 使用排他创建，不会覆盖既有证据。重复实验需在另一个全新实验目录或明确保留旧证据后安排，不要直接重跑并覆盖。Mode 3 的完整 30 次实验结果在 `raw/repeated.csv`，选择的 N 在 `summary/selected_n.csv`，统计在 `summary/repeated_summary.csv`，两模式描述性比对在 `summary/comparison.csv`。样本标准差为 `statistics.stdev`（n-1），IQR 为 Tukey median-of-halves（30 个值的前/后 15 个各取 median）；ratio 为 V8 median / QuickJS median；跨 case 几何均值为 `exp(mean(log(ratio)))`。无 outlier 删除。

阈值是 pilot 选 N 时的条件，不是对后续每条样本强制重新校准。实际 1,560 条 Mode 3 正式样本中有 51 条低于 200 ms，最低 187.868 ms（仅 `3d-morph` 两引擎和 `access-nsieve` 的 V8）；全部保留，没有筛除。解释时应将“自适应选择合理持续时间”与“每个样本严格 ≥200 ms”区分开。
