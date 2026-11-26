# 第 2 轮 CALL_RECIPE_IC

独立从相同冻结 C 派生，不含 3B 或 GROUP_LOAD。正式 43 项各一个新进程；C 为跨批次旧单轮，A/EVAL_COLD/V8_ON 为旧 30 次中位数。无 LTO/PGO、warmup、追加复测或删去回退项。单位 ms/完整 Run，负数更快；Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM。

## 实际覆盖

原 C 语义的独立 probe 在已求值的调用位置检查实际同步 JS callee，按实际字节码实例身份和 PC 聚合，复制 callee 字节码作诊断，不用名称启用。probe 同时观察普通、方法、tail 和构造调用，构造项的 eligible 字段仅标识 kind，不是本轮模板可特化数。原始数据在 runs/probe；第三轮会引用其中的原 C 构造字节码观察，不把它当性能控制。

最终字节码 `push_this; put_loc0; get_loc0/v6_get_loc0; get_field/get_field_rdi; return` 符合纯 this 字段模板。最初要求的两个候选中，此模板在 DeltaBlue 241,664 次、RayTrace 50,944 次、PdfJS 16 次、Typescript 98,255 次出现；arg0 加整数常量未找到动态覆盖。本轮只实施前一种，不升级为带调用、索引或长度的更大函数模板。

实际独立 counts：DeltaBlue 新命中 232,439 / 尝试 45,950,464；RayTrace 50,943 / 19,516,928；PdfJS 15 / 14,024,448；Typescript 91,227 / 11,038,612。Octane 合计命中 374,624 / 142,957,084 次普通方法调用尝试；SunSpider 194,661,884 次尝试全部回退。两套共 337,618,968 次尝试、374,624 次命中、16,255 次学习填充、337,244,344 次回退，不能把微基准命中率当作全集命中率。

## 真正省掉的工作与保护

只把普通 `call_method` 的静态点改写为同长度 3 字节的内部 `four_call`，操作数索引尾随该函数字节码的记录，记录保留原 argc。方法读取和全部参数求值原样执行；handler 验证当前栈上的 callee，不重新读取 receiver.m。tail、普通非方法调用、构造、bound/Proxy/async/generator 等继续旧入口。

每点缓存强引用的实际 callee JSObject 身份、receiver shape、atom 和 offset。只认完整 9 字节短函数形状、简单参数、无闭包引用和额外操作；只接受普通非 exotic receiver、hashed shape 上的自有普通数据字段。shape 通过原 COW 和显式 GC mark/free 保护；每次命中读取当前槽。callee 或 receiver 布局失配时重新检查同一窄模板、学习缓存并执行原调用，不提前执行 getter、函数体或写栈。

命中直接 Dup 当前值，返回原调用清理/返回值路径，**没有进入 JS_CallInternal，没有设置 callee JSStackFrame、alloca 局部/求值栈、初始化 locals 或解释 callee 的 9 字节代码**。实际少进入和少建帧均为 374,624 次，不只是少一次 dispatch。callee 内 C 的 B2 已可把局部 load 与 get_field 合并，仍有 this 保存、借用读取和 return 等工作；这里移除了整段入口/返回。

有 interrupt handler 时始终回原调用；无 handler 命中时仍执行一次原 poll，保持共享中断计数进度。沿用 callee 的参数 padding、locals/stack/var-ref 大小计算并做保守栈空间判断，接近限制时回原精确检查，避免跳过原 StackOverflow。该模板无其它可观察 callee 帧的钩子、调用或分配。所有权沿用原 call_method 的 callee、receiver、参数释放，只有返回值按原规则 Dup。

Release 每点记录为 x86_64 下 40 字节（JSValue 16、shape 8、atom/offset/PC 各 4、argc 2 和对齐），所有普通方法静态点支付记录；函数头增加 pointer+uint32 字段。强引用使目标函数和 receiver shape 活到该 caller 字节码释放。这是本版明显开销：大量不符合模板的方法点仍会进入新守卫和回退，并支付记录/扫描成本；没有用临时第二优化抹掉这项结果。

## 验证与局部对照

C、Release、counts、ASAN/UBSAN 的 safety.js 输出完全相同，覆盖同点替换 callee、缓存预热后参数求值中替换方法（仍调用已解析的旧 callee）、值和 receiver 布局变化、getter/原型/Proxy、bound、非函数 TypeError、原异常对象、null/原始值 this。不是在参数求值后再猜属性对应的函数。

预热后的编译结果保存、普通加载、ROM 加载均通过；内部 opcode 保存为原 call_method 和 argc，外部流不能直接载入内部指令。interrupt.c 在 C 和三个候选构建均输出 `interrupt=3 exception=1`，证实 hook 路径回退并保持中断行为。ASAN leak detection 关闭，未跑完整 test262。

1,200 万次同目标微基准：C 682.43 ms、候选 416.40 ms（−38.98%），独立计数命中 11,999,999 次。这个局部结果证明消除 JS 帧能省时间，但真实负载中此类短函数覆盖太低。

## 最终耗时与结论

相对旧 C，Octane GM **+2.1756%**，SunSpider GM **+2.0622%**；相对原 A 分别 −4.4014%、+0.4622%。SunSpider 无一模板命中，仍有额外处理大量普通方法调用；DeltaBlue、RayTrace 的实际覆盖也远不足以补偿整体开销。结论为**无明显收益，保留实验、不作为新底座**。所有逐项、无命中项目、回退及 SunSpider 耗时之和均在下表。

## 复现

release.patch 为相对 C 的独立补丁；source.tar.gz 为本轮实测 Release 源码。解压后 `make -j2 -o repl.c qjs qjsc`。实验输入、固定 N、CPU 2、Asia/Shanghai 和 Run 计时边界沿用 native_confirmation_20261108/attempt02。独立构建、差分和单轮调用分别见公共 build.py / qualify.py / sequence.py；已有目录防覆盖，已有样本只跳过，不自动多跑。`python3 analyze.py 02_call_recipe` 可离线重建表格。qualification 和 runs 保留原始记录。


编译后 DWARF 核对：本轮 JSFunctionBytecode 从 C 的 144 字节增为 160 字节，即每个函数字节码头实际增加 16 字节；每点记录分别为 40 / 40 / 96 / 16 字节，ReadICSite 均仍为 24 字节。原始测量见公共 layout_sizes.json。本轮 active_safety.json 的真实命中/回退为 8/95；它们保持 strict 指令位置且输出与原 C 一致。
