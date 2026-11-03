# M→U：实际命中指令改变

对应原M SHA7b6fa1e… 与U SHA b07d3ca8…；完整身份和小窗口分别见identity.json、U_identity.json和两份*_read_paths.asm。不是比较源码行数。

get_field_rdi：M的0x29ce9读取site+8元素下标，0x29cf6 `shl rax,0x4`，0x29cfa加当前prop；U的0x29cd9读取site+8字节偏移，0x29ce6直接加当前prop，随后0x29cea/0x29cee取JSValue。两者都保留shape相等、UINT32_MAX检查及Dup/receiver处理。

get_field2_rdi：M的0x29f0b读取元素下标，0x29f1a左移4，0x29f1e加prop；U的0x29ef7读取字节偏移，0x29f04直接加prop，再取值。receiver保留语义没有改。U入口0x23f46、0x24015仍有siteindex×16，这不是漏掉的属性缩放，也不应该删除。

U miss侧0x2bd1e/0x2be27的0xfffffff0上界比较，对应字节偏移范围检查，拒绝无法放入32位缓存的元素下标。编译器可以把pr减当前prop与后续单位换算化简；不可只按C表达式数预测成本。offset_boundary.c在独立release和ASan/UBSan translation unit实际覆盖0、1、最大可缓存、越界及哨兵，未为巨大下标分配巨大对象。

实际观察支持“命中端少了property-index左移、miss端有范围判断”。它不证明那条shift占原耗时多少，也不排除其余地址/布局和寄存器分配变化。U sizeof(JSProperty)=16、JSFunctionBytecode=144，见U_layouts.json；缓存结构及反馈初始化策略不变。全套时间尚需另看本轮正式结果。
