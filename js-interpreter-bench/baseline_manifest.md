# QuickJS vs V8 解释器实验基线清单

审计日期：2026-09-24（Asia/Shanghai）。范围：当前项目中已经生成的 Windows x64、SunSpider 1.0.2 第一轮结果。审计只读取二进制、源码、日志和 CSV；没有重新构建、运行 benchmark 或修改引擎与 benchmark 代码。

## 1. Host

| 证据 | 核对结果 |
|---|---|
| 2026-09-24 只读命令 `Get-CimInstance Win32_OperatingSystem / Win32_Processor / Win32_ComputerSystem`，以及 `.NET RuntimeInformation.OSArchitecture` | Windows 11 Home China，版本 `10.0.26200`，build `26200`，x64；AMD Ryzen 7 5800H，8 物理核 / 16 逻辑处理器；内存 `17,024,741,376` bytes。 |
| [notes/platform_windows.md](notes/platform_windows.md) | 2026-09-20 的实验平台记录与上述 OS、CPU、架构、核心数、内存一致。 |
| [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 158–166 行 | 子进程继承当前环境；QuickJS 的 `PATH` 临时加入 `E:\mingw64\bin`。 |

结论：当前审计主机与已记录的实验主机硬件和 OS 标识一致。正式运行期间的电源计划、CPU 频率、温度、后台负载及逐样本绝对时间戳未记录，见第 9 节。

## 2. QuickJS

| 证据 | 固定值 / 判定 |
|---|---|
| `git -c safe.directory=C:/Users/mzyx/Desktop/0921/js-interpreter-bench/engines/quickjs-upstream -C engines/quickjs-upstream rev-parse HEAD`；同目录 `VERSION` | upstream repository `https://github.com/bellard/quickjs.git`；commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`；version `2026-06-04`。当前 tracked worktree 的 `status --porcelain` 为空。 |
| [results/raw/quickjs_build.txt](results/raw/quickjs_build.txt) 第 8–15、28–39 行 | 编译器 `E:\mingw64\bin\gcc.exe`，MinGW-Builds GCC `13.1.0`，target `x86_64-w64-mingw32`；干净构建 `qjs.exe`。编译命令使用 `-g -Wall -MMD -MF <dependency-file> -Wno-array-bounds -Wno-format-truncation -Wno-infinite-recursion -fwrapv -D_GNU_SOURCE -DCONFIG_VERSION=\"2026-06-04\" -D__USE_MINGW_ANSI_STDIO -O2`；链接 `-g ... -lm -lpthread`。`-g` 保留调试符号，核心优化为 `-O2`，未启用 LTO。 |
| [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 37–41、130–135、169–172 行 | 正式 runner 固定 `C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\quickjs-upstream\qjs.exe`，调用时不附加 runtime flag；启动前检查 SHA-256。 |
| `Get-FileHash -Algorithm SHA256 engines/quickjs-upstream/qjs.exe`；[notes/quickjs_windows_build.md](notes/quickjs_windows_build.md) | 当前大小 `5,263,029` bytes；SHA-256 `6ef16219978ed1cf7d6590b9c9603c65874ad30ac465c67e5fb819da8786b573`，与构建记录及正式 runner 固定值一致。 |
| `Get-FileHash E:\mingw64\bin\libwinpthread-1.dll`；runner 第 39–41、132–135 行 | 当前 DLL SHA-256 `c7c7dced65fff71c7bb61f80c771c562f533d26d72722d9d6091129a3b03d5ce`，与正式 runner 固定值一致。 |
| [results/raw/quickjs_dispatch_validation.txt](results/raw/quickjs_dispatch_validation.txt)；[engines/quickjs-upstream/quickjs.c](engines/quickjs-upstream/quickjs.c) 第 52–55、17777 行 | 编译期 `DIRECT_DISPATCH=1`；optimized object 含 `dispatch_table.8`，`JS_CallInternal` 中有 `jmp QWORD PTR [r15+rax*8]`。 |
| 本次对**当前 `qjs.exe` 本体**只读运行 `nm -a` 与 `objdump -d -Mintel --disassemble=JS_CallInternal` | exe 中有 `dispatch_table.8` 和 `JS_CallInternal`；exe 地址 `1400120d3` 等处直接出现 `jmp QWORD PTR [r15+rax*8]`。 |

结论：正式 benchmark 的 `qjs.exe` 与构建记录中的已冻结二进制是同一路径、同一 SHA-256；本次还在该 exe 本体复核了 dispatch 指令。**可以确认同一二进制使用 computed-goto/direct dispatch**。这只说明分发实现，不说明 dispatch 是性能瓶颈。

## 3. V8 / d8

**Engine = V8；Shell = d8；NOT Node.js。**证据是 [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 45–52、173–179 行：正式命令调用 `d8.exe`，没有调用 `node.exe` 或 jsvu wrapper。

| 证据 | 固定值 / 判定 |
|---|---|
| 本次只读命令 `d8.exe --snapshot_blob=<固定 snapshot_blob.bin> --version`；[results/raw/v8_validation/version.txt](results/raw/v8_validation/version.txt) | 输出 `V8 version 15.6.21`，退出码 0。 |
| `Get-FileHash -Algorithm SHA256 engines/v8-official-15.6.21/runtime/d8.exe`；[scripts/run_sunspider.py](scripts/run_sunspider.py) 第 46–47 行 | 路径 `C:\Users\mzyx\Desktop\0921\js-interpreter-bench\engines\v8-official-15.6.21\runtime\d8.exe`；大小 `34,526,208` bytes；SHA-256 `1808fe93e1838ba0a0489363fddb1a0399da99c533f537c39b621e4a55cf7d87`，与 runner 固定值一致。 |
| runner 第 48–51、175–178 行；本次文件哈希复核 | 同目录 `snapshot_blob.bin`：`900160d7d689b8e7b0c71c5f164a045b608bf5504329ad6dcba8e526ed6df975`，由 `--snapshot_blob=...` 显式传入；`icudtl.dat`：`495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1`，由 runner 检查并与 binary 一起保留。 |
| [notes/v8_prebuilt.md](notes/v8_prebuilt.md)；本次 archive 哈希复核 | 来源 `https://storage.googleapis.com/chromium-v8/official/canary/v8-win64-rel-15.6.21.zip`；原 ZIP SHA-256 `c36f9ddeec335dcf45735c91c930f99971504259f865a39d9c6ddf0b4a9b119f`。这是官方渠道的 `rel` canary artifact，不能称为 Chrome stable。 |
| [runtime/v8_build_config.json](engines/v8-official-15.6.21/runtime/v8_build_config.json) | `target_cpu=x64`、`clang=true`、`debug_code=false`、`DEBUG_defined=false`、`full_debug=false`、`official_build=false`。`official_build=false` 是构建元数据，不应改写成 true；确切 Clang revision 和完整 GN args 为 UNKNOWN。 |
| [notes/v8_prebuilt.md](notes/v8_prebuilt.md) 的 PE import 记录 | archive 无 `natives_blob.bin`；binary 依赖 Windows 系统 DLL，如 `KERNEL32.dll`、`ntdll.dll`、`SHELL32.dll`、`ADVAPI32.dll`、`dbghelp.dll`、`WINMM.dll` 等。正式 runner 未固定这些 OS DLL 的文件哈希。 |

## 4. Execution mode

| 证据 | 判定 |
|---|---|
| 本次对同一 SHA-256 的 `d8.exe --help` 只读复核；[results/raw/v8_validation/help.txt](results/raw/v8_validation/help.txt) 第 297、311、417、437、507、1534、1690 行 | 当前 binary 支持 `--max-opt`、`--jitless`、`--print-bytecode`、`--sparkplug`、`--maglev`、`--turbofan`、`--trace-opt-status`、`--regexp-interpret-all`。help 明写 `--max-opt` 的 `0 == ignition/interpreter`。 |
| [notes/v8_interpreter_validation.md](notes/v8_interpreter_validation.md) 中归档的 V8 `15.6.21` 官方源码 tag / `src/flags/flag-definitions.h` 位置 | 该版本的 `max_opt < 1`、`< 2`、`< 3` weak implications 分别关闭 Sparkplug、Maglev、TurboFan。本项目没有 V8 完整源码 checkout；本次没有重新下载源码。version tag 对应的源码 commit 记录为 `37fb84941c9be9f9914ee50b1ad366f06a1bd764`，但 archive 本身未携带可独立核对的精确 source revision。 |
| [results/raw/v8_validation/candidate_a_flag_values.txt](results/raw/v8_validation/candidate_a_flag_values.txt) | 实际 final values：`--max-opt=0`、`--no-sparkplug`、`--no-maglev`、`--no-turbofan`、`--no-jitless`、`--no-regexp-interpret-all`。runner 只传 `--max-opt=0`，未追加可覆盖 weak implication 的冲突 flags。 |
| [results/raw/v8_validation/summary.txt](results/raw/v8_validation/summary.txt)；[candidate_a_tier_trace.txt](results/raw/v8_validation/candidate_a_tier_trace.txt)；[candidate_a_bytecode.txt](results/raw/v8_validation/candidate_a_bytecode.txt) | 500,000 次调用的 probe：默认模式 Sparkplug/Maglev/TurboFan 编译分别 `9/6/3`，OSR entry `3`；`--max-opt=0` 下四项均 `0`、`INTERPRETED_FUNCTION` status `333`，并有 Ignition bytecode 输出。两模式 probe checksum 一致。 |
| [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 52、175–178 行 | 正式 SunSpider 命令为 `<fixed d8.exe> --snapshot_blob=<fixed snapshot_blob.bin> --max-opt=0 <case>.js`，诊断 trace flags 未进入正式计时。 |

结论：现有证据支持固定 binary、固定 flags 的 **JavaScript 函数最大执行 tier 为 Ignition**；probe 未见 Sparkplug、Maglev、TurboFan 或 OSR。没有逐个 SunSpider case 的 tier trace，且 `--no-regexp-interpret-all` 表明该配置**不保证正则表达式代码也由解释器执行**；`regexp-dna` 等 case 不应被笼统称为“全部执行均为 Ignition”。QuickJS 的 computed goto 证据见第 2 节。

## 5. Benchmark

| 证据 | 固定内容 |
|---|---|
| [notes/sunspider_results.md](notes/sunspider_results.md)；[benchmarks/sunspider/upstream/sunspider-1.0.2/LIST](benchmarks/sunspider/upstream/sunspider-1.0.2/LIST) | WebKit 官方 SunSpider `1.0.2`，固定仓库 commit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`，共 26 个 case。 |
| [SHA256SUMS.upstream.txt](benchmarks/sunspider/SHA256SUMS.upstream.txt) 与 [SHA256SUMS.standalone.txt](benchmarks/sunspider/SHA256SUMS.standalone.txt)；本次哈希复核 | 两份 manifest 自身 SHA-256 分别为 `bbe7f444daea654cac808800081ecaab7b30a749d72ef6071fe248229c193790` 与 `e383efe54a39e8c18010135390ce2fc98c2618f55bc5078f43fc45c3a8ef98fd`。 |
| [patches/sunspider-1.0.2-standalone.patch](patches/sunspider-1.0.2-standalone.patch)；本次哈希复核 | patch SHA-256 `82ef95ca6a1c7728d2f6b651eaefba6df6765d2f522ef5d7f49127821a40ccb7`；删除 `date-format-xparb.js` 的浏览器 `document.write`，并让 `3d-raytrace.js` 的原长度哨兵接受 20969 或 20970。两引擎使用同一份 standalone JS。 |
| [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 83、337–389 行；[results/raw/sunspider.csv](results/raw/sunspider.csv) | 固定 seed `20260920`，每轮打乱 case 顺序；每个 case 的引擎先后顺序交替。CSV 实际为 `26 × 2 × 30 = 1,560` 行，全部 `exit_code=0` 且 `valid=true`；每 engine/case 30 行，双方各 15 次先运行。 |
| 本次原始数据哈希复核 | `results/raw/sunspider.csv`：`1e27d75a7d38ab48d5fd3a8b30b8d29b4c47b9ba648a9f080fd10ee3b968df82`；`results/processed/sunspider_summary.csv`：`dc558feca2607d416189f17d5509d95d2ae9f73de30bd02967f75f21350184dc`。 |
| 本次 runner 文件哈希复核 | 当前 [scripts/run_sunspider.py](scripts/run_sunspider.py) SHA-256 `ba193c30126ca83d8185b57cb7ad0cac6e748321eb3e18a913c1eb0186daf9ea`；当前 [scripts/run_smoke_all.py](scripts/run_smoke_all.py) SHA-256 `82463f65684cbb78e570de9e5e29895a28f70b19193725dab604e4b562cf2798`。这些是**本次审计时**的文件哈希，不应倒填成正式运行当天保存过的哈希。 |

### 统计复算

[scripts/run_sunspider.py](scripts/run_sunspider.py) 第 281–327 行对同一 engine/case 的全部 30 个 `wall_time_ns` 计算：`statistics.median`、`statistics.mean`、`statistics.stdev`（样本标准差，分母 `n-1`）、Tukey median-of-halves IQR（排序后前 15 个和后 15 个样本各自的 median 之差）、`min`、`max`；`V8 / QuickJS ratio = V8 median_ns / QuickJS median_ns`。未删 outlier。结果以纳秒为单位，主要统计量保留三位小数，ratio 保留九位小数。

本次从 [results/raw/sunspider.csv](results/raw/sunspider.csv) 独立复算全部 26 行 summary，每一项及其格式化值均与 [results/processed/sunspider_summary.csv](results/processed/sunspider_summary.csv) 一致；24 个 case 的 ratio 大于 1，2 个小于 1。

**几何平均：**正式 runner 和 summary CSV **没有**实现/保存跨 case 几何平均。对 26 个未四舍五入的 case median ratio 按 `exp(sum(log(V8_median_i / QuickJS_median_i)) / 26)` 复算，得到 `1.693695374538`；用 summary CSV 中已保留九位小数的 ratio 计算，得到 `1.693695374527`。因此汇报中的“约 1.69”数学上正确，但应明确它是**端到端 median ratio 的后续衍生统计**，不是解释器执行循环的速度倍数，也不是当前处理脚本自动生成的字段。

## 6. Timing boundary

| 阶段 | 证据与确认程度 |
|---|---|
| 计时器及 Python 调用成本 | [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 194–221 行直接确认：`start = perf_counter_ns()` 位于构造命令和 `subprocess.run()` 之前，`end` 位于 `returncode` 读取以及 stdout/stderr 解码、换行归一化**之后**。因此计入 Python 命令构造、子进程创建/等待、管道捕获和输出处理的成本。 |
| process creation 与 process exit | 同一 `subprocess.run()` 调用直接确认每个正式样本创建并等待一个新进程；进程退出发生在 `run()` 返回前。 |
| VM initialization | QuickJS [qjs.c](engines/quickjs-upstream/qjs.c) 第 544–546 行创建 runtime/context；V8 进程也必须初始化才能执行，但当前项目没有逐阶段 instrumentation。此项在计时区间内，耗时占比 UNKNOWN。 |
| source loading | runner 第 169–179 行把 `.js` 绝对路径交给 shell；QuickJS [qjs.c](engines/quickjs-upstream/qjs.c) 第 78–102、519 行明确调用 `js_load_file` 与 `eval_buf`。V8 `d8` 的具体文件读取路径未在本地源码检查；correctness 输出证明所传 workload 被执行，但单独加载耗时 UNKNOWN。 |
| parsing / bytecode generation | QuickJS 的 `JS_Eval` 路径见 [qjs.c](engines/quickjs-upstream/qjs.c) 第 58–66 行；V8 [candidate_a_bytecode.txt](results/raw/v8_validation/candidate_a_bytecode.txt) 证明**热点 probe**生成过 bytecode。正式 SunSpider 每个 case 的 parse/compile 时间和产物未单独计量；这些阶段进入总时间属于根据 shell 从源码执行的合理判断，不能从 runner 单独量化。 |
| interpreter execution | QuickJS 当前 exe 的 dispatch 已从二进制确认；V8 probe 与 flags 支持 Ignition tier。正式 SunSpider 没有逐 case 的解释器指令计数或内部计时；其执行时间占比 UNKNOWN。 |
| 排除在每条 `wall_time_ns` 外的工作 | runner 第 130–155、337–389 行显示输入哈希检查、测试顺序随机化、CSV 写入与统计汇总发生在每条样本的 `invoke(..., measure=True)` 计时边界外。 |

结论：`wall_time_ns` 是**Python runner 测得的单次 shell 启动到返回并完成输出处理的墙钟时间**；它覆盖可能发生的 VM 初始化、文件读取、解析、字节码生成和 JavaScript 执行，但没有这些内部阶段的独立计时。应称为 source-to-finish / end-to-end latency，不能称为纯 interpreter loop 时间。

## 7. Correctness gates

| 证据 | 实际结果 |
|---|---|
| [scripts/run_smoke_all.py](scripts/run_smoke_all.py) 第 37–53 行；[results/raw/correctness.csv](results/raw/correctness.csv) | 12 个独立测试 × 2 引擎 = 24 行；全部退出码 0、`valid=true`，两引擎对同一测试的确定 checksum 完全一致。CSV SHA-256 `e7898f998fe7095e148a87a740a2d35443dd703407b4b3028fd248f74a38e9a0`。 |
| [scripts/run_sunspider.py](scripts/run_sunspider.py) 第 187–265 行；[results/raw/sunspider_correctness.csv](results/raw/sunspider_correctness.csv) | 26 个 case × 2 引擎 = 52 行，正式计时前每个 pair 仅运行一次；全部退出码 0、stdout/stderr 为空、`valid=true`。CSV SHA-256 `0a4e34dbc499456ac7fd079328141104f68f9e2b77bb96424ad0e63c1b9e330b`。 |
| [results/raw/sunspider_correctness_attempt1_upstream_sentinel.csv](results/raw/sunspider_correctness_attempt1_upstream_sentinel.csv)；standalone patch | 原始哨兵下首次 51/52；`3d-raytrace` 的 QuickJS 长度为 20969、V8 为 20970。最终共同 workload 只放宽该长度哨兵，而不是对两引擎使用不同文件。 |

边界：独立 suite 校验预设 checksum；SunSpider gate 则主要依赖退出码、空输出以及各 case 自带的断言，不能等同于逐 case 两引擎输出 checksum 完全一致。

## 8. Known limitations

1. 计时含 Python 子进程启动与输出处理，以及引擎 frontend/VM 启动；现有结果无法单独评价 interpreter loop。[runner 第 194–221 行](scripts/run_sunspider.py)
2. `--max-opt=0` 限制 JavaScript tier，当前有效值仍为 `--no-regexp-interpret-all`；正则表达式 workload 的内部执行方式和原生 builtins 成本未被隔离。[candidate_a_flag_values.txt](results/raw/v8_validation/candidate_a_flag_values.txt)
3. tier trace 证据来自同一 binary 的热点 probe，而不是正式 SunSpider 逐 case tracing。正式模式固定 flags，但不能把 probe 的事件计数当作 SunSpider 的逐 case 事件计数。[summary.txt](results/raw/v8_validation/summary.txt)、[runner 第 175–178 行](scripts/run_sunspider.py)
4. 两处 SunSpider standalone 修改可能影响与未修改的浏览器版比较；本研究的两个 shell 使用相同文件。[patch](patches/sunspider-1.0.2-standalone.patch)
5. V8 artifact 来自官方发布存储，但 archive 的 `official_build=false`；确切编译器 revision、完整 GN args 和 archive 所用精确 source commit 未随本地 metadata 记录。[v8_build_config.json](engines/v8-official-15.6.21/runtime/v8_build_config.json)
6. 当前 CSV 没有每条样本的绝对时间戳，也没有同步记录电源计划、温度、CPU 频率或后台负载。[raw CSV header](results/raw/sunspider.csv)、[runner 第 351–385 行](scripts/run_sunspider.py)
7. 正式 runner 不生成跨 case 几何平均字段；汇报中的约 1.69 是从已保存 CSV 复算的衍生值。[summary writer](scripts/run_sunspider.py)、[summary CSV](results/processed/sunspider_summary.csv)
8. 原始 CSV 没有逐行 binary SHA-256、runtime flags 或 runner SHA-256。当前 runner、研究日志及冻结 artifact 的一致性支持项目记录中的对应关系，但**仅凭 CSV 本身**不能独立鉴定正式运行当日每条样本使用的二进制和脚本文件内容。[raw CSV header](results/raw/sunspider.csv)、[research log](notes/research_log.md)

## 9. UNKNOWN items

| 项目 | 为什么仍为 UNKNOWN | 对下一阶段的影响 |
|---|---|---|
| 各 case 的 VM initialization、source loading、parsing、bytecode generation 与解释执行分别耗时多少 | 目前只有单个外部墙钟计时区间，没有内部阶段计时。 | 下一阶段需要建立隔离测量方案。 |
| 正式 SunSpider 每个 case 的逐次 tier/RegExp 编译事件 | 只保存了同一 binary 的热点 probe trace；正式计时未带诊断 flags。 | 不影响当前 **JS tier 配置**的核对，但限制“全部工作都由 Ignition 执行”的表述。 |
| V8 archive 实际编译使用的精确源 commit、Clang revision 和完整 GN args | `v8_build_config.json` 没有这些字段；`15.6.21` tag 的 commit 不能自动等同于 archive 的可证明构建输入。 | 作为预编译 artifact 的来源限制保留，不填猜测值。 |
| 正式测量期间的逐样本热状态、频率、电源计划、后台负载与绝对时间戳 | 原始 CSV 和 runner 均未记录。 | 后续实验应记录，不改写第一轮原始数据。 |
| 正式运行当天 runner 文件的独立哈希及每条样本的 binary 身份证明 | 当天记录了冻结路径、配置和运行命令，但 raw CSV 没有嵌入这些哈希；本次只能核对当前文件和项目记录。 | 后续实验应生成独立 run manifest；不能给旧 CSV 补造历史字段。 |
| 原生 builtins、RegExp 与其他非 JavaScript bytecode 工作占用比例 | 现有实验没有细分；`--max-opt=0` 并非 `--jitless`。 | 后续解释性能差异时必须避免直接归因到 bytecode dispatch。 |

## 审计判定

**是否可以进入下一阶段：YES**，限定为设计和验证“frontend 与 interpreter execution 分离”的新测量协议。理由是：两份正式 binary 和依赖的哈希与冻结值一致；QuickJS exe 的 dispatch 在当前二进制本体复核通过；V8 当前 binary 的 help、有效 flag dump 与既有热点 probe 证据相互一致；correctness 和 1,560 个原始样本、26 行统计均复算通过。当前 UNKNOWN 是下一阶段需要测量或如实保留的限制，**不是继续把第一轮端到端比率当成纯解释器性能的依据**。本审计没有启动下一阶段实验。
