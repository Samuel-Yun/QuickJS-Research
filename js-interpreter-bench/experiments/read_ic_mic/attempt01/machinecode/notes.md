# 正式二进制核对（不是分支实测）

`layouts.json` 来自实际 ELF 的 GDB 类型信息：JSFunctionBytecode sizeof 为 A128、P/M144，新增函数头16字节；P/M的debug字段偏移为112。
M ReadICSite sizeof=16，P=56；函数头的sizeof不是读点大小或debug偏移，不能混用。
P/M正式源除了 read_ic_config.h 容量1/4外相同；PUT_FIELD区域保持A原文。符号表未出现out-of-line rdi_probe/rdi_update，二者均force_inline。

真实 `JS_CallInternal` 中的独立片段见 M/P/read_paths.asm（片段之间明确分隔，不能按连续机器码读）：

- M `0x23f46 shl rax,0x4`，再加b的site数组地址：实际16字节记录索引。
- M `0x29f02 cmp QWORD PTR [r14],r13`，不等跳普通搜索，随后`0x29f0b`取offset并从当前对象prop取值，引用型值仍有dup。
- P `0x23f21`起用index×8−index再×8，实际56字节记录；不是保留M的16字节数组。
- P `0x29f8c`加载recent，`0x29f97`先比较这一槽；不等再走余下三槽搜索。稳定命中没有强制扫满四项。
- M/P新opcode miss片段都能见到原find_own_property内联散列搜索；两个版本均使用相同正常属性语义。

GNU size 的 text 含其它只读节；实际ELF `.text` 另列 sizes.csv：A760562、P762866、M762514 bytes。
因此M比A `.text` 增加1952 bytes，P增加2304 bytes；带-g整个ELF约5MB，不等于VM嵌入最小体积。
源相同不保证机器码布局相同。增加新opcode也会改变旧路径的布局、寄存器分配与跳转；numeric/write控制只能观测其净派生效应，不能单独隔离原因。
这里证明代码已生成；是否真正命中由独立计数给出，不能凭一条cmp宣称正式样本每次命中。
