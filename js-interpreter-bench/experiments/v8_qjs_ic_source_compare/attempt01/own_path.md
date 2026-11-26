# 稳定 own 数据字段：命中之前和之后做什么

证据分四层：**源码事实**、**旧动态观测**、**本轮语义验证**、**性能假设**。这里不把前两层直接换成每一步耗时。

## 1. 对应的是哪些真实程序

- `ic_mechanism_audit/attempt01/inputs/M1.own_integer.js`：`m1Read(obj)` 每 Run 4096 次 `sum += obj.x`，预建 `{x:3}`，结果 12288。QJS PC13，V8 PC13 / FBV[0]。
- `function_value_call_path/attempt01/cases/shared.js`：`valueReadLoop` 每轮 `last=obj.slot`，再累加 `i+1`。两个案例仅 slot 的值为整数 3 / 普通 JS 函数 step；QJS PC12。读取次数、返回 tag 和没有调用 step 均有旧窄诊断。不要将其时间与 M1 相减。
- 同一旧 campaign 的 `methodCallLoop` PC13 每轮读 own 方法；`localCallLoop` PC1 每 Run 只读一次。后者仍有调用及循环中的函数值复制。

本轮从压缩原始报告按 **函数源码 SHA + compiled instance + opcode 起点 PC** 重新对应，而不是按函数名或 atom 数字合并。结果在 `evidence_recheck.json`。

## 2. A：普通读取已经有内联路径

源：固定 A `quickjs.c:6135–6156`、`:19107–19168`；摘录 `source_reference/qjs/A/shape_lookup.txt`、`get_field_inline.txt`。下面是说明步骤的伪代码，不冒充原始实现：

```text
atom = bytecode.u32; receiver = stack.top
if receiver is an object:
    for p = receiver, p.prototype, ...:
        lookup atom in p.shape hash buckets/chains
        if found ordinary data property: duplicate current p.prop[index].value
        if accessor/varref/autoinit/exotic: use the appropriate original slow path
else: original primitive/error path
get_field: release temporary receiver, replace it with result
get_field2: keep receiver, push result
```

`find_own_property` 声明为 `static force_inline`；实测“进入其逻辑”不等于 CPU 发出了同次数的 native call。A 的 inline 宏没有先把所有 object 限为 `JS_CLASS_OBJECT`；M 的命中准入则有这一限制，不能把两者画成相同的前置条件。

## 3. M/P：从最终读点索引到当前值

实际源在 `source_reference/qjs/M/read_ic_{types.h,prepare.inc,runtime.inc,opcodes.inc}`；M/P 接入 diff 在 `source_reference/MP/patches/`。

`rdi_prepare:1–40` 在最终编译/atom fixup 后两遍扫描，第一遍计数、为有目标读点的 bytecode 分配零初始化 site 数组，第二遍将五字节 `get_field atom32` / `get_field2 atom32` 改为等宽的 `*_rdi site_index32`。属性名移入 site.atom；不是运行中每次拿 PC 查旁表。缓存属于 `JSFunctionBytecode` 编译实例；复用该 bytecode 的调用/闭包不因此各有新数组。

命中顺序（`read_ic_opcodes.inc:2–24`，以下为伪代码）：

```text
site = b.read_ic_sites[bytecode.u32]
obj = stack.top
if obj.tag == OBJECT && obj.class == JS_CLASS_OBJECT && !obj.is_exotic:
    offset = inline rdi_probe(site, obj.shape)
    if offset != UINT32_MAX:
        value = JS_DupValue(obj.prop[offset].value)  // current value, not cached value
        finish with original get_field / get_field2 stack ownership
otherwise run original lookup, and fill only an eligible hashed own data result
```

- M probe 只比较一个 shape；P 先试 recent，再依次试其余三个，后续命中会更新 recent（`runtime.inc:5–25`）。**`rdi_probe` 是 force_inline，不能预设每次多一个 C call。**
- offset 是 `JSProperty` 数组元素索引，更新用 `pr - p->prop`，不是字节地址。当前 `p->prop` 每次重新取得；没有缓存旧 backing-store 指针。
- miss 宏仍沿 receiver/prototype 做普通查找。只有 origin 上普通、non-exotic、hashed 的 data 属性才更新缓存；继承结果不填。getter/特殊类型/错误仍由旧 helper/异常路径处理（`opcodes.inc:27–66`）。
- M 同 shape 更新 offset；不同 shape 替换唯一槽。P 完整检查已有 shape，优先首个空槽，否则按 victim 轮换；命中查找用 recent。它不是旧 NG add_ic_slot 的覆盖起点行为，也没有 R 的持续失配退出。

### 真实计数，不是时间

|M1 PC13 / N=2|操作 / 查询|命中 / 回退|普通 find / 桶 / 链|
|---|---:|---:|---:|
|A|8192 / 0|不适用|8192 / 8192 / 8192|
|M|8192 / 8192|8191 / 1|1 / 1 / 1|

`evidence_recheck.json:own_integer` 从原 gzip 重算核对。两个最新 value-read 的 M N2 也各为 8192 查询、8191 命中、1 回退；函数值的结果 tag 是 OBJECT，整数读是 INT。不能把第一次冷 miss 与每 Run 都冷一次混同。

## 4. V8 参考源码：slot → Map/handler → value

以下全部为固定参考 commit `37fb849…`，**不是 d8 精确构建提交证明，也不是该 site 的逐次 handler trace**。

1. `interpreter-generator.cc:598–630`：从虚拟寄存器取 receiver、从 constant pool 取 name、从 bytecode 取 feedback slot，读 FeedbackVector，进入 `LoadIC_BytecodeHandler`；结果放 accumulator 后 dispatch。虚拟寄存器不是 CPU 寄存器。
2. `accessor-assembler.h:275–294` 的参数构造调用 `SanitizeReceiverAndLoadReceiverMap`（其继承 helper 的全部特殊值分支不在本轮摘录范围；本例 receiver 已有普通对象证据，不按名称推断非对象分支）。`accessor-assembler.cc:3392–3463` 中 vector 不存在走 no-feedback；存在时以 Map 尝试单态，接着可能尝试多态或非内联部分。`TryMonomorphicCase:71–102` 比较向量中的弱 Map，取相邻 handler。
3. `HandleLoadICHandlerCase:488–519`：Smi 编码 handler / heap handler 分流。普通 own field 使用初始 holder=lookup_start_object；字段 handler 解码 kind/offset/in-object/double 等信息。Map+handler 守卫与 M 的 class/exotic/shape 准入不是逐项相同的检查。
4. `HandleLoadField:600–630`：`StorageOffsetInWords * kTaggedSize` 得到字节偏移，选择 holder 本体或 `LoadFastProperties(holder)` 外部存储，再读取当前字段。double 路径还有表示检查及重装箱可能性。**V8 的 offset 单位与 QJS prop 数组索引不同。**
5. miss 进入 runtime `LoadIC_Miss`；`ic.cc:416–486` 建 LookupIterator、LookupForRead，在 `state!=NO_FEEDBACK && use_ic && update_feedback` 时 UpdateCaches，最后执行属性取值。`ComputeHandler → SetCache → FeedbackNexus::Configure*` 安装/重算记录；失败和异常不是由原来的 Smi handler 凭空解决。

已有同制品 M1 的实际 dump、LoadIC 0→1 与 receiver map-details 支持 x 为 in-object 字段；同制品 GetNamedProperty handler 反汇编也有 Map 检查和字段 load。它们仍未给出本位点安装 handler 或每次分支。证据原文件见 `ic_mechanism_audit/attempt01/v8_evidence.json`、`source_evidence/V8_GetNamedProperty_actual.asm`。

## 5. 值、shape、分配和释放

**QJS 所有权源码事实。** `quickjs.h:689–714` 的 Free/Dup 对有引用计数的值更新引用头；整数仍有 tag 路径，但不更新对象引用头。对象/函数属性值被读出后取得 owned result。`get_field` 释放栈上的临时 receiver，`get_field2` 保留它供 method call，之后调用/栈清理消费各份引用。对象值比整数值多的引用工作存在于源码，但未量出其独立时间；旧 function/number 对照不支持它已经解释主要距离。

**M/P 保活与空间。** shape 由 `rdi_update` 先 dup 新、再 free 旧，atom 由最终字节码转交 site；`rdi_free` 释放 atom、shape 和数组，bytecode 的 GC mark 同时遍历所持 shape（摘录 `qjs/M/mark_read_ic.txt`）。shape 自身还持有 prototype。按 x86_64 字段大小/对齐推导，M site 为 16B，P 为 56B；本轮未执行 sizeof 探针，不冒充新测量，且不包括间接保活。数组在最终 prepare eager 建立，有 OOM 路径；本轮不把改懒分配当收益。

**V8 所有权与创建。** handler 的 tagged load 不采用 QJS 的逐值 Dup/Free 引用计数模型；反馈更新源码使用弱 Map、MaybeObject/WeakFixedArray 和写屏障。`feedback-vector.cc:256–337` 根据 metadata 分配、初始化向量；`js-function.cc:659–750` 经 function/raw_feedback_cell 挂接，在 `InitializeFeedbackCell` 中按 lazy 开关、日志、coverage、cached tiering 状态决定立即创建还是只准备 closure cells。已有实际 flag dump 为 lazy=true、invocation-count=8，但**不能据此说该运行总在第八次调用才分配**。本轮没有逐次创建/GC 记录；确切分配时刻、保留量、回收时刻 UNKNOWN。

向量/handler 均为 GC 管理记录，弱引用可被清除；`feedback-vector.cc:432–446,583–685,1163–1211` 给出清理及单态/多态写入。它与 M 的强 shape 引用、函数销毁时显式释放不同，不能用一个“多一次引用”口号估算成本。

## 6. 能与不能解释什么

已确认 M 省了目标稳定 own 读取的 hash 定位；命中仍有 site 定位、准入、shape 比较、取值、所有权及支撑循环。V8 可用 in-object 存储、编码 handler、生成的 native builtin，值管理也不同。**哪些工作可以在不改语义下删去、各占多少时间，未由源码证明。** 本轮没有发现足以直接删除的 own 命中检查。

CSA 生成且预编译进 binary 的 handler 在 jitless 仍可执行，不是为当前 JS 函数开启 JIT。`accessor-assembler.cc:3396–3402` 的“常见路径省 frame”说的是 IC 原生执行的额外 frame，并且原文自己提示脆弱性；不是省掉被调用 JS 函数的 frame，也不是实际 d8 本 site 已测得的好处。
