# 谁持有函数值，何时复制和释放

范围仅为目标函数一次完整 Run（4096 轮），不把 microRun 的全局读取、向 selectedLoop 传参及驱动计数混入。A/M 的上游底座为 04be246001599f5995fa2f2d8c91a0f198d3f34c。以下区分**实际计数**和**按源码/控制流推导**；没有逐条 native 引用计数指令或 CPU 周期计数。

## 1. 共同的持有者

计时外建立的 microObject.slot、全局 step/expectedValue 保持函数对象存活。目标的 obj/expected 位于 caller 提供的参数区；JS_CallInternal 在实参足够且 flags=0 时复用该区，不为每个实参额外复制一份。外部 caller 对实参的最终清理不计入下表的目标体计数，但仍属于正式 timed region。微基准所有加法结果在 int32 范围；驱动 checksum 最大 1099780063232，小于 2^53。

## 2. 不调用的两个 read

真实序列：PC11 get_arg0 → PC12 get_field / get_field_rdi → PC17 put_loc1。局部 last 起初为 undefined。

|值/动作|每 Run 的行为|证据层级|
|---|---|---|
|receiver obj|get_arg0 复制临时接收者；get_field 得到结果后释放该临时接收者，4096 对|字节码＋handler/quickjs.h 推导；非实测 refcount 指令数|
|属性结果|实际读取4096次；number 为 INT4096，function 为 OBJECT4096|path_counts.csv 的具体实例/PC 计数|
|M 查询|N1：4096查询、4095命中、1回退；N2：8192、8191、1；两种值相同|独立窄诊断实测，不是每 Run 都冷一次|
|属性结果的复制|两种都执行 JS_DupValue 的语义；INT 不改引用头，函数 OBJECT 会增加引用|source_evidence/A/quickjs.h:707–714；M/read_ic_opcodes.inc 命中与miss均取得 owned result|
|last 覆盖|put_loc1 经 set_value 保存新 owned value，并释放旧值；首轮旧值undefined，后4095轮为上次结果|实际 opcode＋A/set_value.txt:2664–2669 推导|
|最终身份检查|get_loc1 / get_arg1 取得两个值，strict_neq 比较，消费临时值；异常分支未进入|PC28/29/30真实dump＋call_counts.csv确认无 Error 调用|
|函数退出|最后一份 last 在 var_buf 清理中释放；expected 参数由调用者侧管理|source_evidence/A/actual_return_cleanup.txt；不是被测步骤的单独时间|

只就函数结果链：4096次属性结果复制，4095次旧 last 释放，再加最终身份比较的两次复制/两次消费及最后 last 释放。按源码推导，函数值链上合计4098次引用增加、4098次引用减少；number 对应调用仍有tag判断，但没有这种对象引用头更新。**这些不是实测 CPU 指令/周期，也不能把 function/number 的完整时间比称为纯引用计数成本。**外层传参和全局持有不包含在此局部推导中。

## 3. own_method_call

caller PC12 get_arg0 把 obj 临时引用放栈；PC13 get_field2/_rdi 保留 receiver，再放函数结果；PC18 get_loc1 放 i；PC19 call_method 传 receiver=obj、一个显式参数。正常返回后清理函数、receiver、整数参数，留下 owned 返回结果供 add。

每 Run：4096次函数值复制及调用后释放；4096次 receiver 临时复制及调用后释放。属性值 OBJECT 与读取次数实测；dup/free 的逻辑对数由实际序列与源码推导。这里没有 last 槽；但有小函数执行、frame、返回和清理。不能把它与 read 的差直接称为调用帧时间。

## 4. local_function_call

PC0 get_arg0 → PC1 get_field/_rdi → PC6 put_loc0，只在循环前把函数引用存到 fn。每轮 PC19 get_loc0 再复制函数引用，PC20 get_loc2 取 i，PC21 call1 传 undefined receiver。返回后清理函数和整数参数；fn 的持久局部引用保留至 Run 退出。

每 Run 只有1次目标字段读取（实测），但仍有4096次局部函数值复制及调用后释放（源码推导），加最初结果引用和末尾 fn 清理，共4097对函数值引用增减。不能把“字段只读一次”讲成“函数引用只处理一次”。receiver obj 的字段读取临时引用仅1对；plain call 的 receiver 是 undefined，不复制 obj 作为 receiver。

## 5. step 与 this

两种调用都实际进入 ordinary bytecode-function 分支：call_counts.csv。step 的完整 QuickJS 序列只有 get_arg0、push_1、add、return；没有 push_this。QuickJS 将非strict this转换放在 OP_push_this（A/push_this.txt:17933–17953），因此不能说本 step 每次执行了全局对象装箱/复制。仍然存在函数检查、参数区、stack/frame及返回清理。

V8 的实际两个调用 opcode 不同，固定参考 x64 Generate_CallFunction 在调用入口处理 sloppy receiver；源码解释见 call_path.md。该源码中出现的 receiver/global proxy 处理不是当前binary逐次路径计数。V8 的 heap/GC/value representation 不能套用 QuickJS 的 dup/free 对数。

## 6. 未取得的证据

未测得各项所有权处理的独立耗时、编译器消除/合并后的机器指令总数、cacheline/内存层次成本或 V8 逐次分支。诊断制品的计时不参加性能表；formal 是冻结原A/M/d8。shape 被M保活与函数值被复制是不同持有关系，不能混为一项。
