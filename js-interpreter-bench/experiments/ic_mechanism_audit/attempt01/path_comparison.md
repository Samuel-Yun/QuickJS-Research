# 相同 `sum += obj.x` 的执行路径

目标为 `inputs/M1.own_integer.js` 中的 `m1Read`，4096次循环、同一预建 `{x:3}`。引用版本为 QuickJS upstream `04be246001599f5995fa2f2d8c91a0f198d3f34c`；M 为 read_ic_mic/attempt01 固定源码，本轮逐文件散列在 sources.json。以下不按C行数或opcode数估算时间。

固定upstream原文：[QuickJS quickjs.c](https://github.com/bellard/quickjs/blob/04be246001599f5995fa2f2d8c91a0f198d3f34c/quickjs.c)。M/B是本地已记录补丁版本，不能把这条upstream链接当作其完整实现；本轮source_evidence/保留实际位置与散列。

## A：普通读取本来就有内联快路径

原 `GET_FIELD_INLINE` 在解释器中检查 JS_TAG_OBJECT，直接调用 `static force_inline find_own_property`：从shape按atom取hash桶，比较链中的atom，定位 `p->prop[h-1]`，检查普通data descriptor后 `JS_DupValue`。get_field消费receiver并用结果替换栈顶；get_field2则保留receiver并压入值。不是每次都进入大通用helper。

真实逻辑进入/桶读/链比较计数，在本轮N2稳定读分别都是8192，generic_get为0，结果均INT。这里“逻辑进入”指插在内联函数体内的计数，不是CPU执行了8192条call；该C函数声明force_inline。定位：旧冻结 `legacy_ng_ic/attempt01/artifacts/A/quickjs.c` 的 `find_own_property` 和 `GET_FIELD_INLINE`；本轮actual A源码及ELF身份见manifest.json，最终摘录见source_evidence/。

## M：命中省去hash定位，没有省去整个读取与循环

`read_ic_mic/attempt01/implementation/read_ic_opcodes.inc:2–23` 的实际顺序是：

1. 读bytecode内site index，定位本函数的16B site，取栈顶obj。
2. 检查object tag、JS_CLASS_OBJECT及non-exotic。
3. `read_ic_runtime.inc:5–10` 直接比较site.shape与对象shape，命中返回offset；单槽无探测循环。
4. 按 `p->prop[offset].u.value` 读取**该对象的当前值**，JS_DupValue；保持与原get_field/get_field2相同的receiver消费/保留规则。

本轮N2目标8192查询、8191命中、1冷miss，普通find_own_property仅1次、桶/链各1次，插入1次、替换0次。这证明跳过了这些定位工作，不证明整个读取“零成本”。INT值不增减对象引用，receiver的复制/释放、JSValue栈读写、循环累加/比较/回跳仍在。

miss按同一文件:27–66走原内联own/原型循环；仅普通hashed own data的合格对象更新slot（runtime.inc:29–41，先dup新shape、再free旧shape）；descriptor、special对象、primitive等进入相应原路径。shape被强引用保活，缓存本身及函数头也占内存。本轮未量出这些部分的独立时间。

## B：实际执行了IC，但不是M的旧名字

旧安全移植 `legacy_ng_ic/attempt01/artifacts/B/quickjs.c`：get_ic_prop_offset:726起扫描四个槽；find_own_property_ic:6233起在正常查找时返回offset；JS_GetPropertyInternalWithIC:8482起包装查询/直接读值；rewrite_ic:10108起；GET_FIELD_INLINE:19279起；改写后get_field_ic:19401起。具体以 source_evidence/ 的逐行摘录为准。

首次普通opcode成功登记后才改写。N2稳定读取总操作8192，改写后查询8191且全命中；第一次find_with_offset=1。Richards同函数两处state的操作数都改为共享index0：位置不同但按函数+atom共享。第一次位置插入1次，第二位置首次普通读取会更新同shape，而不是新建第二cache。M则分别index0/1。这一差别是真实before/after字节快照，不是只看静态patch。

B历史空槽填充和读wrapper已有C/D干预。P为后来重新设计的逐site四槽；M已没有B的共享hash查询和四槽循环，不能再用B的wrapper问题直接解释M。

## V8 ON/OFF：配置范围不同，OFF不是A的替身

实际 d8 15.6.21 的当前目标为PC13 `GetNamedProperty a0, [0:"x"], FBV[0]`；ON同进程日志记录该PC `0→1`，receiver map为 `0x0dfd0101e8fd`。同一map的实际map-details写出 `JS_OBJECT_TYPE`、1个inobject property，x为 `const data field 3:s, in-obj`。因此**这个案例**的字段是in-object；不能外推所有对象/字段。具体安装的handler编码及该site逐次路径/命中率仍UNKNOWN。DebugPrint仅输出brief，未反复尝试反馈快照。

对应材料包固定官方参考commit为 `37fb84941c9be9f9914ee50b1ad366f06a1bd764`，不是d8精确构建commit证明。文件SHA复核见v8_evidence.json。以下是**源码解释**，不是实际逐次trace：

- [interpreter-generator.cc:598](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/interpreter/interpreter-generator.cc#L598)：GetNamedProperty取得receiver、name、slot/vector，进入AccessorAssembler，返回accumulator后dispatch。
- [accessor-assembler.cc:3392](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/accessor-assembler.cc#L3392)：vector存在时尝试map/mono/poly handler，miss进入runtime；这里不是逐次use_ic判断。已有同制品GetNamedProperty反汇编显示map比较和字段load的候选路径，不能据存在分支宣称目标每次走到。
- [ic.cc:419](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/ic.cc#L419)：`state()!=NO_FEEDBACK && v8_flags.use_ic && update_feedback`；456–465仍建立LookupIterator、LookupForRead，仅条件满足时UpdateCaches；479–483仍取属性。ON/OFF差异可以涉及缓存反馈更新/安装，OFF不等于删除全部快路径。
- [accessor-assembler.cc:3737](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/accessor-assembler.cc#L3737)：NoFeedback仍包含map/type检查、GenericPropertyLoad及fallback。OFF逐次实际分支、槽快照及剩余全部缓存清单UNKNOWN。
- use_ic对named/global/keyed **load和store** 的具体更新条件见既有 `v8_ic_on_off/attempt02/source_notes.md`：ic.cc:515–534、1955–2025、2172–2189、2292/2355–2382、3078–3123。当前M只覆盖两类named own read；写、keyed、global和prototype结果均不被M缓存。不能把所有类型反馈都归为本次use_ic开关关闭的内容。

本轮两种V8都是 `--jitless --no-lazy`，实际flags同时关闭JS JIT tiers并强制RegExp解释、关闭regexp tier-up。对比只涉及use_ic配置净效果；不使用早期native RegExp结论解释本轮。

## 能回答与仍不能回答

**实际观测**：B/M真正执行IC；M稳定own读减少了hash桶/链工作；Richards的多个own数据读取命中、prototype方法准备回退；V8目标有独立反馈位置及ON转换，当前x确为in-object。

**源码解释**：A原本已有内联own快路径；M新增准入/site/shape与引用维护；V8支持不同的反馈/handler及更广读写路径，表示与fallback也不同。

**待验证**：上述哪项占主要CPU时间、V8在Richards各site的逐次handler命中率、M剩余命中和回退成本各占多少。不能用OFF/ON时间解释QJS/V8差距比例，不能相减中位数得到单次属性成本。此前同二进制消融与布局实验仅作约束，不移植其百分比作本轮分解。
