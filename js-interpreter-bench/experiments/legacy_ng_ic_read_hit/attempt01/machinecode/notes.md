# 实际干预与尚未分离的派生变化

来源为本轮正式制品，hash、完整相关符号尺寸及16字节对齐余数见identities.json/sizes.csv。
源码精确upstream 04be246…加已公开旧IC安全移植及空槽修复；本轮C→D只有
`static JSValue` → `static force_inline JSValue`，宏为cutils.h:34的
`inline __attribute__((always_inline))`。源码位置索引在../sources/mapping.json。
这是实际机器码的静态观测，不声称已经采到每条native分支执行次数。

## 两个读位置

C：get_field2_ic的wrapper call在0x26b60，get_field_ic在0x26c1f，
均到0x2d060，wrapper长156字节。它保存6个callee-saved寄存器并分配栈空间，
对象tag检查后在0x2d095调用0x17f40的probe；命中后按offset×16加载JSValue，
检查refcounted tag并在需要时递增引用。然后恢复寄存器、ret。慢路径仍调用通用IC helper。
对应C/JS_GetPropertyInternalWithIC.constprop.0.asm及C/read_write_opcode_excerpts.asm。

D：wrapper体嵌入JS_CallInternal；两个probe call分别为0x26b4f（get_field2_ic）
与0x26c3f（get_field_ic），仍到同一个0x17f40的96字节probe符号。
没有把共享probe强制内联。两个位置仍有object tag检查、MISS比较、offset×16、
prop读取和refcounted结果的JS_DupValue递增；不是删除类型或引用语义。
0x26b33、0x26c23仍保存sf->cur_pc；assert offset==index与异常检查也保留。
get_field2在0x26b94起将结果压栈，原receiver保留给方法调用；
get_field在0x26c87起读取并释放旧receiver，然后将结果替换栈顶。
慢路径仍由0x2a1c5/0x2a210调用JS_GetPropertyInternalIC，并返回同一异常/后续处理路径。
诊断与回归覆盖了引用返回、getter/Proxy/异常及own方法this，不能用静态图替代动态计数。

## 写路径与布局

写wrapper源码完全相同，GCC在C/D中原本都将它内联到JS_CallInternal，故没有独立写wrapper符号。
写opcode热直线区域（包括dispatch和支撑，不含离线慢分支）C为
0x2686c–0x269ca，D为0x2684c–0x269aa，均350字节；probe仍有一次call，
descriptor/writable检查、set_value引用处理和receiver释放仍存在。
然而保存中间值的rbp栈槽及跳转距离发生改变，不能说写机器码逐字相同。
这350字节不是整个写helper的完整静态大小，更不是动态成本。

JS_CallInternal从42733增至42970字节（+237），独立156字节wrapper消失；
GNU size的text汇总字段1038363→1038323字节（−40，含只读等分配段），
但ELF实际.text段为763586→763666字节（+80）；不能混称纯指令代码减少。
probe机器指令的96字节逐字节相同，SHA见post_static_audit.json。
其它布局/对齐和编译器决策也会变化。
文件尺寸含debug段，不能当作纯运行代码或IC内存占用。两版同为-O2/-g/fwrapv，
无LTO/PGO、无-DNDEBUG。函数边界变化是有效干预，但整程序时间差不是纯call/ret成本。
