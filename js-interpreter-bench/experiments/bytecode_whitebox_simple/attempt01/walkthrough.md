# 怎样顺着执行读懂这次结果

先记住三个层次：JS 的变量名、bytecode 的虚拟槽、CPU 物理寄存器不是同一件事。下面的栈都画成左边为底、右边为顶；A 表示 Ignition 的虚拟累加器。每条指令完整原文见 bytecode/，这里只按执行先后解释，不把注释当原始输出。

## 例一：wbArithmetic(7,3,4)

源码见 [cases/arithmetic.js](cases/arithmetic.js)。独立计算：`x=7+3*4=19`，`y=7-3=4`，条件19>4为真，返回15。另一个独立诊断输入(7,-3,4)使条件为假，返回5；第一次辅助检查误写-15的失败记录保留，但正式输入与预期15从未改变。

### QuickJS

打开 [wbArithmetic.txt](bytecode/quickjs/wbArithmetic.txt)。它是最终执行字节码，不是 parser 的临时指令。

1. `get_arg0/get_arg1/get_arg2` 依次压入 a、b、c，栈从 `[]` 到 `[7,3,4]`。
2. `mul` 消耗顶部3、4，留下 `[7,12]`；`add` 留下 `[19]`。
3. `put_loc0` 把19移入局部槽 x，栈变空。后面 `get_arg0/get_arg1/sub/put_loc1` 算出并保存 y=4。
4. `get_loc0/get_loc1/gt` 把 `[19,4]` 化为 `[true]`。`if_false8 19` 弹掉条件；这里为真，不跳到偏移19。
5. 再取 x、y，`sub` 得15，`return` 返回顶部值。偏移19的 `get_loc0/get_loc1/add/return` 是另一条路径，仍计入静态长度，但本次没有执行。

局部槽不等于操作数栈；get/put 是它们之间的搬运。当前源码 quickjs.c:18589 的 get_loc 会 JS_DupValue，put_loc 会 set_value。数字没有对象引用计数，但 obj/function 等值可能有；不能把“所有 get 都增加对象引用计数”当事实。

### V8 Ignition

打开 [wbArithmetic.txt](bytecode/v8/wbArithmetic.txt)，其中 a0/a1/a2 是源码参数 a/b/c（Parameter count 还包括 this）。

1. `Ldar a2` 令 A=4；`Mul a1` 计算3*A=12；`Add a0` 得7+A=19；`Star0` 把 A 写入虚拟 r0（x）。
2. `Ldar a1` 令 A=3；`Sub a0` 不是 A-7，而是操作数 a0 减 A，得到4；`Star1` 保存为 r1（y）。
3. `Ldar r1`，`TestGreaterThan r0` 比较19>4，A=true。JumpIfFalse 不跳。
4. `Ldar r1/Sub r0/Return` 返回15。另一条分支在偏移28。

这份序列是16条/34字节，而 QJS 是22条/23字节：指令更少不保证字节更少。这里没做正式性能采样，不能从 dump 直接声称此函数谁更快。

## 例二：wbPrototypeMethod(obj,4096)

源码见 [cases/prototype_method.js](cases/prototype_method.js)。计时外创建两个共享 prototype 的对象；被测 obj 只有自身 bias=3，step 位于 prototype。每轮直接 `obj.step(i)`，没有缓存方法，也没有 `.call`。预期结果是 `sum(i+3)=4096*4095/2+4096*3=8398848`。

### 先跟一轮 QuickJS 的值

假设运行到 i=2，此前 sum=(0+3)+(1+3)=7。

| 指令组 | 操作数栈（sum局部槽此时仍为7） |
|---|---|
| `get_loc1/get_arg1/lt/if_false8` | `[2,4096] → [true] → []`，继续 |
| `get_loc0` | `[7]` |
| `get_arg0` | `[7,obj]` |
| `get_field2 step` | `[7,obj,wbStep]`，保留原 receiver |
| `get_loc1` | `[7,obj,wbStep,2]` |
| `call_method 1` | 调用 wbStep(2)，this=obj；回来是 `[7,5]` |
| `add/put_loc0` | `[12] → []`，局部 sum=12 |
| `inc_loc 1/goto8 4` | 局部 i=3，回到比较 |

关键点是“查找”和“调用”不是一条工作：`get_field2` 找到方法值，但尚未执行；`call_method` 才建立调用关系。callee 自己通过 `push_this/put_loc0` 保存 this，再取 x、this.bias、相加返回。

### 再沿 QJS 的实现看它实际干了什么

源码 revision 是04be246…，对应摘录都在 source_evidence/。

- `qjs_get_field.txt`（原 quickjs.c:19107）：确认 object tag；对 shape 调 find_own_property。第一次在 obj 找 step 失败，沿 shape->proto 再查；数据属性命中后复制函数值。get_field2 把函数追加到栈，保留 obj。
- `qjs_shape_lookup.txt`（6135）：atom & mask 定位哈希槽，比较 atom，必要时沿 hash_next；这仍是工作，不是零成本。
- `qjs_calls.txt`（18220）：从栈取 fn/receiver/argc，调用 JS_CallInternal；返回后释放旧 receiver、函数、参数的栈引用，将结果压回。
- `qjs_dispatch_frame.txt`（17746）：检查 callable/class、栈空间，建立 frame、局部槽与操作数栈，然后执行 callee。`qjs_refcounts.txt` 说明对象/函数引用增减，数字不会走相同分支。

以上原本只是源码解释；本轮独立诊断又实际记录：step 一层原型命中4096次、fallback=0、wbStep 进入4096次、bias 自身命中4096次。见 raw/diagnostics/prototype_method_paths_persistent.json。**这证明诊断进程走到这些路径，不证明这些步骤各占多少时间，也不是正式 release 的硬件采样。**

### 同一轮 Ignition 怎样组织

打开 [wbPrototypeMethod.txt](bytecode/v8/wbPrototypeMethod.txt)。r0=sum、r1=i，a0=obj、a1=n；r2、r3 是其他虚拟槽。

1. `Ldar a1/TestLessThan r1/JumpIfFalse` 做 i<n。
2. `GetNamedProperty a0, [0:"step"], FBV[0]` 得到方法值并放入 A；`Star3` 把它存入 r3。这里 **没有**把读取移出循环。
3. `CallProperty1 r3,a0,r1,FBV[2]` 表达 fn=r3、receiver=a0、一个参数r1。callee 只有 `GetNamedProperty <this>,bias/Add a0/Return`：读 bias，和参数 x 相加，返回5。
4. caller 的 `Add r0` 得12；`Mov r0,r2` 保存旧 sum 到临时槽；`Star0` 写回新 sum。这个 dump 中没有后续读取 r2，为什么生成器保留它需要对应源码才能确定，不把它说成语义必需或优化收益。
5. `Ldar r1/Inc/Star1/JumpLoop` 更新 i 并回跳。

### “虚拟寄存器”到底在哪里

在实际 frozen d8 的 [Ldar.disassembly.txt](bytecode/v8_native/Ldar.disassembly.txt) 中，0x1d5c040 读取 bytecode 的有符号槽索引，0x1d5c049 从 `[rbp+index*8]` 取值进 CPU rax；末尾通过 handler table 间接跳转。Mov handler 同样从一处帧槽读到另一处帧槽；ShortStar handler 写回帧槽。可见 r0/r1 不是CPU寄存器名。

地址由当前制品 code-creation 日志、同进程 /proc/maps 和 ELF PT_LOAD 联合定位，映射在 source_evidence/v8_native_map.json。CallProperty1 实际机器码含 feedback 检查和通向 Builtins_Call_ReceiverIsNotNullOrUndefined 的路径；GetNamedProperty 有检查、读取与通用 helper 分支。没有动态 native branch/IC 命中记录，所以不能说正式进程每次一定走了哪条 V8 分支。

### 最后才读时间

每次完整目标调用：QJS median274.027µs，V8 155.279µs，比值0.567；N=8192，各30新进程。两边 caller 都19条，callee分别7/3条。按控制流可以推导逻辑 bytecode 访问数，但一条 handler 可能处理后继短 Star，不能直接等同 native dispatch，更不能用总时间除逻辑次数称“单指令成本”。

我能口头复述的是：“同一源码两边都在循环内读 prototype 方法并调用。QJS 的实际诊断显示每次沿一层原型找到函数，再进入其字节码；V8 的 dump 把函数值、receiver、参数组织在虚拟槽，callee 的 this 读取更紧凑。这个小程序 V8 更快，但还没有把差值拆到查找、调用、引用管理各部分，不能据此宣布属性查找是原 Richards 的瓶颈。”
