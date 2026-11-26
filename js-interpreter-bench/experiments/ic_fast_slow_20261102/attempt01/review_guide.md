# 人工跟读一个普通 own 读取

先看 source_reference/M/read_ic_opcodes.inc 的 GET_READ_IC：字节码操作数是 site index，找到 `b->read_ic_sites[index]`。M1 的目标 m1Read 源 SHA/PC13 在 mechanism/target_sites_all.json，M2 为 PC12；名字相同不替代源码/实例核对。

1. **site**：看 read_ic_prepare.inc 的最终扫描/改写。原 atom 转入 site；每个静态点单独记录，编译实例独立。源码已经 eager 创建数组，不能把本轮控制器当延迟反馈。
2. **probe**：看 read_ic_runtime.inc 的 `rdi_probe` 容量1分支，以及 opcodes 中 OBJECT/class/non-exotic 前置检查。当前对象 shape 与所保活 shape 相同才返回 prop 数组索引。该函数原本 force_inline。
3. **普通查找**：看 source_reference/A/find_own_property.txt；atom 与 mask 选桶，沿 hash_next 比较 atom，得到当前属性位置。不要把普通 fallback 直接称为 generic helper 慢路。
4. **update**：回到 rdi_update，同 shape 只更新 offset；换 shape 先 dup 新、再 free 旧。只有 hashed own 普通 data 准入，相关 mark/free 与修改端 COW 仍须保留。

**实际命中例子**：mechanism/diagnostic_counts.csv 的 M1/C100，准备后两次 Run 共8192次目标读取，guard匹配8192，offset取值8192、普通查找0、update/shape引用活动0。值来自当前 `p->prop`，整数结果不增加对象结果引用；get_field 仍消费 receiver。

**实际普通回退例子**：同表 M1/C0，guard同样匹配8192，但offset取值0、真实普通查找/桶/链各8192，update/引用活动仍0。它是人为采用控制，不是真实 shape 失配。另看 mechanism/true_miss.json，两个真实不同 shape 交替触发8192次替换/保活/释放，不能混同。

机器码入口用实际 ELF 的 JS_CallInternal/源码行反汇编，不按函数名猜 native call。调试时可参考 e_ic_bytecode_example/attempt02 的方法：在 JS_CallInternal 第一条机器指令按 x86_64 ABI读根对象/bytecode，在 native print 入口查看结果后的记录；源行 b 常被优化掉。不要在正式计时进程打断点或开启计数。用户可据这些材料自行跟读，本记录不表示用户已经亲自审阅。
