# Octane strict harness audit（正式实现前）

审计日期：2026-09-28。仅使用本地 Chromium Octane 2.0，commit
`570ad1ccfe86e3eecba0636c8f932ac08edec517`。源码根目录：
`benchmarks/octane/upstream/`。以下结论是源码审计；可重复性、frontend ordering、tier 与 correctness 尚须新运行证据，不用旧 PASS 代替。

## 官方调用语义

`base.js:49` 的 Benchmark 对象保存 run、Setup、TearDown、doWarmup、doDeterministic、deterministicIterations、minIterations；缺省 Setup/TearDown 是空函数。
`base.js:343–408` 的 RunStep 顺序为：每 suite 一次 ResetRNG → 每 Benchmark 的 Setup → RunSingleBenchmark（可能多次 continuation）→ TearDown → 下一个 Benchmark。
`base.js:291–337` 中 Measure 每次调用实际 benchmark.run；非 deterministic 模式连续运行到至少 1000 ms，deterministic 模式运行指定次数；doWarmup 先执行不计入结果的 Measure(null)，后续计时累积到 minIterations。
正式严格模式不调用 RunSuites/RunSingleBenchmark，保持实际 Run 原样，替换的仅是预算、warmup 和计时控制。

一次 workload = 一个官方 Benchmark 对象的实际 `run()`，不是整个 suite，不是原生的 1 s 时间预算。每个正式样本使用新进程。Setup 一次在 timer 前，Run × N 在 timer 内，验证/TearDown 在 timer 后；Run 自带断言、runtime 统计、动态 frontend 不挪出。

## 逐项审计

表中 warmup 指官方 harness 的 doWarmup；strict 全部移除。源码行号均相对于固定 upstream。

| Suite / Benchmark | 必需 Setup（计时外） | 官方 warmup | 实际 Run / 证据 | TearDown / correctness | 重复与状态风险 | strict 可行性判断 |
|---|---|---|---|---|---|---|
| Richards / Richards | 空 | true | richards.js:38–47，runRichards，每次新 scheduler | Run 断言 queueCount=2322、holdCount=928 | 每次重建，Run 原样重复 | 候选，须 N=1/2/selected 验证 |
| DeltaBlue / DeltaBlue | 空 | true | deltablue.js:26–27，deltaBlue，chain/projection | Run 内约束失败 alert | 每次新 planner/graph | 候选 |
| Crypto / Encrypt | 空 | true | crypto.js:1683，encrypt，RSA ciphertext | 原 Encrypt 无断言；独立 correctness 每次调用原 decrypt 验证，正式 timer 后 decrypt 验证末次 | global encrypted 每次覆盖；rng_pool 在 script loading 时用原 Math.random 初始化，ResetRNG 不倒推修改它 | 候选；不声称跨进程密文逐字相同 |
| Crypto / Decrypt | 原 upstream encrypt() 一次生成所需 ciphertext；这是另一 subbenchmark 的输入依赖，不是 Decrypt warmup | true | crypto.js:1690，decrypt | 每次 Run 明文与 TEXT 断言 | 原 harness 依赖前一 Encrypt；单独测量必须显式准备密文，可能预热共享 RSA helper | 候选，有输入/状态限制 |
| RayTrace / RayTrace | 空 | true | raytrace.js:811，renderScene | raytrace.js:666，Run checksum 2321 | 每次新 scene | 候选 |
| EarleyBoyer / Earley | 空 | true | earley-boyer.js:4–6，Benchmark.run 匿名函数调用 BgL_earleyzd2benchmarkzd2 | RunBenchmark:4675–4684 的期望结果断言 | 静态生成函数很多；需分别证明实际匿名 Run 的 bytecode | 候选 |
| EarleyBoyer / Boyer | 空 | true | 同上，调用 BgL_nboyerzd2benchmarkzd2 | 原 Run 自带结果断言 | 每次重建主要数据 | 候选 |
| RegExp / RegExp | 只保留原 RegExpBenchmark 构造；详见下节 | true + Setup 内一次 RegExpRun | regexp.js:52、1785–1804，RegExpRun | 每次 Run 内 5 次 checksum=1666109；TearDown 清对象 | Exec:73–85 每次重置 lastIndex；Run 只调用既有 block，不初始化所需输入 | 候选；须验证不调用 priming 也能正确重复 |
| Splay / Splay | splay.js:97 建 8000 节点和 payload；原 bookkeeping | true | splay.js:140，SplayRun | TearDown:115 验证长度8000及严格排序 | 树持续变化，Run 原来就是连续重复；TearDown 一次而非每次 | 候选，保留整段验证 |
| NavierStokes / NavierStokes | navier-stokes.js:64 初始化128×128 solver | true | runNavierStokes:43 | 原 Run 仅 frame15 checksum=77；TearDown 释放 solver | 流体状态跨 Run 演进；N1/2 后另在计时外继续至 frame15 检查，记录额外调用 | 候选，不伪造逐帧 checksum |
| PdfJS / PdfJS | pdfjs.js:34 typed array 检查/装载 PDF buffer | false | runPdfJS:45，包含 flushTimeouts 等待所有页面渲染 | TearDown:70 对每次保留的 log 验证 length36788、hash939524096，之后释放 | canvas_logs 随 N 积累，内存风险；不能每次 TearDown 删除库 | 候选，官方逐次 log 验证在计时后 |
| Mandreel / Mandreel | mandreel.js:44 构造器/heap/browser mock 初始化 startApp 等 | false | runMandreel:59，恢复 heap、初始化、20 次 render/flush | Run 内 Mandreel_checkState:230 checksum8001026，TearDown:96 释放 | 原样包含大 typed-array copy、runtime 时间统计；flushTimeouts:122 的 eval 动态 frontend 保留 | 候选，不声称无动态编译 |
| Gameboy / Gameboy | gbemu-part1.js:28 ROM decode/typed array 检查 | false | runGameboy:42，新模拟器、250000指令及音频 | checkFinalState:155–186 CPU寄存器及内存等，原 Run 中完成；TearDown 清 ROM | Run 自行 resetGlobalVariables | 候选 |
| CodeLoad / CodeLoadClosure | code-load.js:95 salt=0、indirectEval=eval | false | runCodeLoadClosure:102 / runClosure:1517 | eval 后结果对 salt 断言；TearDown:100 清 eval | 每次故意生成变体源码并 eval；动态 frontend 是 workload，不排除 | 候选，不是纯解释器循环 |
| CodeLoad / CodeLoadJQuery | 同上 | false | runCodeLoadJQuery:107 / runJQuery:1540 | 原结果断言 | 同上，global 定义/输入 salt 演进 | 候选 |
| Typescript / Typescript | typescript.js:44 空 | false，deterministic=true、5次、min=1 | runTypescript:53，JS 编写的 TS compiler | Run 内 parseErrors192/193及输出checksum(-412589664)；TearDown:48清输入 | 每次新 compiler；原预算5次不改变Run语义，strict 改为校准N | 候选；TS parsing 是 workload 算法，不是 VM 静态 frontend |

## RegExp Setup 中的额外 Run

`regexp.js:48–50` 是 `new RegExpBenchmark(); RegExpRun(); // run once to get system initialized`。
构造函数在首次 Run 前已定义 regexps、inputs、variants、所有 block 及 `this.run`。
`Exec` 每次将 `lastIndex=0`；`runBlock*` 返回局部 sum；`run` 汇总并断言，并不建立供下一次运行所需的输入。
因此额外完整 RegExpRun 是运行时 priming，strict 移除这一次调用，保留构造函数和计时内首次 Run，包括首次 regexp runtime 成本。上游文件不修改；新 driver 对 RegExp Setup 明示等价于仅构造对象。
这是一项非静默的 harness warmup policy adaptation，独立 N1/N2/selected correctness 是必要 gate。若失败则 NOT_COMPARABLE，不回填 priming 来伪装无 warmup。

## Frontend / 状态边界

QuickJS `quickjs.c:36072–36085` js_create_function 递归处理 child_list，JS_Eval 的编译在顶层执行前完成（`qjs.c:66`，`quickjs.c:37280` 附近）。需保存当前文件 hash 和源码片段，并将其与新拼接脚本关联。
V8 要在实际每个 Benchmark.run 对象上保存 `--no-lazy` 的 BytecodeArray 诊断与 timer 前 marker；匿名函数同样要验证，不能只引用 flag 名字。诊断命令与正式命令分开。
CodeLoad 的 eval 明确在 Run 内；Mandreel 的 timeout eval 路径在 Run 内。其他文件可能包含 Function/eval 辅助定义：仅发现定义不证明该路径在本次 timed Run 执行，未逐路径追踪的动态 frontend 为 UNKNOWN，不删除。
所有必要 Setup 已执行会影响 helper、IC、heap 状态；“无性能 warmup”不等于整个 VM cold。运行时 GC、builtin、regexp、动态编译不隔离。

## 预先定义的敏感性分析（不依据结果）

主结果始终保留所有通过 strict gates 的 suite。附加 sensitivity 排除：

- RegExp：机制专门测 regexp builtin。
- CodeLoad：每次 Run 明确 VM 动态 eval/compilation。
- Mandreel：生成 runtime、bulk typed-array heap 恢复和 timeout eval。
- Typescript：JS 实现的语言 compiler / specialized runtime workload；不是声称它包含 VM 静态 frontend。

后两项属于较宽的 mechanism sensitivity，不等价于测得“builtin 占比高”。另报告只排除 RegExp+CodeLoad 的窄敏感性分析。所有排除名单在 calibration/formal 数据产生前固定。

## 聚合

新 strict 每 subbenchmark：r_b = median(V8 elapsed/N) / median(QJS elapsed/N)。
suite ratio = exp(mean(log(r_b)))；overall GM 对 suite ratio 等权 geometric mean，不让含多个 subbenchmark 的 suite 加权更高。
旧 native 实现是每个 sample 先对 subbenchmark time 取 GM，再对这些 suite sample 取 median，最后 V8/QJS；不是先取 subbenchmark medians。
两者保持 suite 等权 geometric 结构，但 median 与 GM 不可交换。三模式表保留旧统计原值，注明此差异；不能把模式差值解释成单一 frontend/warmup 成本。

## 原有排除保持不变

zlib：QuickJS 无 read()；Box2D：双方能运行但缺少可靠 upstream correctness。不得加入正式统计。
