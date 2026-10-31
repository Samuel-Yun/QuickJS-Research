# 从真实 call 指令走到 step 再返回

## 一、实际观察

完整dump在 bytecode/<case>/，目标caller分别为 valueReadLoop、methodCallLoop、localCallLoop；所有案例都定义相同五个共同函数。step=普通非strict JS函数，非native/bound/Proxy。布局/源码检查在独立进程，原目标没有插入这些检查。

|路径|QuickJS caller|V8 caller|N1 / N2实际调用|
|---|---|---|---|
|两个read|循环无call；身份失败分支中另有未执行的call1|循环GetNamedProperty；错误分支有未执行CallUndefinedReceiver1|A/M目标caller实际0 / 0次call|
|own method|PC13 get_field2/_rdi，PC18 get_loc1，PC19 call_method 1|PC13 GetNamedProperty FBV[0]，17 Star3，18 CallProperty1 r3,a0,r1,FBV[2]|4096 / 8192，均进入bytecode class分支|
|local function|PC1 get_field/_rdi、6 put_loc0在循环外；19 get_loc0，20 get_loc2，21 call1在循环内|PC0 GetNamedProperty FBV[0]、4 Star0在循环外；18 CallUndefinedReceiver1 r0,r2,FBV[2]|4096 / 8192，均进入bytecode class分支|

QuickJS路径由两个独立诊断构建计数，完整补丁 diagnostic/{A,M}_call_only.patch，身份 call_diagnostic_manifest.json，原始 raw/call_diagnostic/*.json.gz，聚合 call_counts.csv。counter设在真实caller opcode与被调 JS_CallInternal 的 class 判断之后，并按caller compiled instance/源码SHA/真实PC关联；不是因源码存在分支就推定执行。通用 class-call 回退实测0仅限上述目标调用，不是全VM没有helper。新计数版的时间完全不用作性能结果。

## 二、QuickJS A/M 实现

精确上游SHA 04be246001599f5995fa2f2d8c91a0f198d3f34c，M是在相同底座加入原单槽读IC；当前源哈希与实际ELF身份见 manifest 和 source_evidence。下面行号为A，M摘录保留自己的实际行号，不将两份行号混用。

1. **准备函数、receiver、参数。** A quickjs.c:18175–18202 的call1把函数置于 call_argv[-1]，receiver传JS_UNDEFINED；18220–18239的call_method把对象放在[-2]、函数[-1]，参数i位于[0]。两者均设置 sf->cur_pc 并递归调用 JS_CallInternal(flags=0)。method调用前 get_field2保留receiver，local调用前get_loc0复制已保存函数。M只替换字段读取路径，不替换调用opcode。
2. **进入callee。** JS_CallInternal入口先poll interrupts、检查func tag/class。非JS_CLASS_BYTECODE_FUNCTION才进入 class_array[class].call；本输入实测走bytecode branch。随后取得 b；argc=1满足step声明参数1且COPY_ARGV未置位，源码上不用分配/复制参数数组。此条件由源码、参数和调用形态确定，没有另外计数arg_allocated_size。
3. **建立执行状态。** 计算局部/operand stack/varref区大小，stack overflow检查、alloca、填frame字段、undefined初始化local及varrefs，更新current_stack_frame、realm与pc。step无局部但仍有operand stack/frame等工作。该路径不是“每次落到通用native helper”，也不是“没有frame成本”。
4. **解释step。** get_arg0复制整数x（不递增对象引用），push_1，add，return。x=0..4095，结果1..4096；符合add的int-int无溢出快分支，但未加add branch counter，属于源码/输入解释。caller另有sum累加、i自增、比较回跳，不能都记成callee调用成本。
5. **返回。** return把栈顶作为ret_val跳到done；清理var_buf等、恢复prev_frame。caller检查异常，再释放临时函数/receiver/参数并压返回值；plain循环清理[-1..argc)，method多含[-2]的receiver。继续add及loop。本轮不存在tail_call；原Richards TaskControlBlock.run的tail_call_method走goto done，不能照搬这组调用后继续累加的流程。

重要的receiver区别：QuickJS非strict转换在OP_push_this时做。本step没有该opcode，因此没有执行这项转换；不能仅因fn(i)传undefined就凭经验声称它每次复制global。方法仍传obj，local仍是undefined，两者语义未被人为改成strict/.call/.bind。

## 三、V8：真实字节码与固定源码解释分开

实际制品15.6.21/SHA83b744…，严格 --jitless --no-lazy --use-ic；有效flags原始输出及snapshot/ICU身份都保存。静态native解释器handler/builtin在jitless下照常执行，不是打开JS JIT。

仅引用官方固定参考37fb84941c9be9f9914ee50b1ad366f06a1bd764，**不声称已证明它就是本预编译artifact的精确构建commit/编译配置**。文件 URL/SHA/TLS结果在 source_reference/identity.json 和 authorized_network_pass.json。

- interpreter-generator.cc:1561–1687：CallProperty1与CallUndefinedReceiver1进入JSCallN(1)，分别用kNotNullOrUndefined与kNullOrUndefined。读取函数、参数、context，调用反馈与属性读取槽独立。源码包含 `#ifndef V8_JITLESS` 构建条件；不能把运行时 --jitless 等同于这个编译宏，也不能据此宣称本制品未收集调用反馈。
- interpreter-assembler.cc:867–889：小固定参数个数使用模板CallJSAndDispatch，选择Builtins::Call(receiver_mode)，对plain调用补UndefinedConstant receiver，再TailCallBuiltinThenBytecodeDispatch，返回结果更新accumulator。不能把本例误写为必须走可变参数版本的InterpreterPushArgsThenCall。
- builtins-call-gen.cc:28–57：CallFunction及Call的三种receiver包装入口，转到相应架构实现。
- builtins/x64/builtins-x64.cc:2617–2717：Generate_CallFunction检查strict/native，装入callee context；sloppy/null-or-undefined加载global proxy；sloppy/object检查receiver非primitive后通过；其它primitive可能ToObject。最后InvokeFunctionCode。**这是固定参考源码解释，不是本site逐次命中/分支记录。**本step不读取this不意味着这份V8参考入口自动省掉receiver处理。
- 同文件1075–1240：InterpreterEntryTrampoline获取bytecode、准备解释器frame、register file和dispatch等；还含字节码被flush时的CompileLazy候选。--no-lazy是本实验静态编译策略，不被夸大为排除任何未来runtime重编译。本case无eval/Function。

另外对当前SHA一致的实际d8导出了两个小型CallFunction builtin（source_evidence/Builtins_CallFunction_ReceiverIs{NullOrUndefined,NotNullOrUndefined}.asm）。例如null/undefined版本0x1b8318c的test/jne之后，0x1b83196–0x1b831a8存在加载并写回receiver的native序列，后续还含参数适配/dispatch。该静态观察支持“callee只有三条bytecode之外还有native调用入口工作”，但未由这些地址推定本site每次走哪个分支，也未测得其独立耗时。地址只对应本SHA的ELF，不与其他布局混用。

实际dump支持不同receiver约定、读取/调用feedback槽及callee三条指令。当前没有该site具体handler、每次调用feedback路径、native cycle或frame各步骤时间。不能由源码或静态反汇编推断100% IC命中或某一步解释全部差距。

## 四、与Richards的边界

只引用 inherited_method_opportunity/attempt01/richards_notes.md 等旧材料：原Richards继承读取与M回退、V8单/多态反馈已观察，但位点耗时未知。本轮全部own，local函数预取也不是对原Richards合法的等价重写。TCB.run尾调用、对象/null参数、receiver类型变化与本小程序不同；新时间不与旧时间相除，不给出“解释总体差距的比例”。
