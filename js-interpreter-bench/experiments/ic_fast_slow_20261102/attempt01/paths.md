# 三条公开 QuickJS 路径

分析底座 upstream 04be246001599f5995fa2f2d8c91a0f198d3f34c；原 M 以 `v8_qjs_ic_source_compare/attempt01/runtime_before.json` 所列源 SHA 和 binary SHA 为准，不把另一次 read_ic_mic 的 ELF 冒充同一制品。

## 1. A 普通 own 读取

`quickjs.c` 的 GET_FIELD_INLINE 取得 atom 和栈顶 receiver；object 情况在当前对象的 shape 哈希桶/链寻找属性。普通数据属性命中后从当前 `prop` 数组取值并 Dup；继承继续沿链，descriptor/exotic/primitive 等才进入原通用语义。`find_own_property` 原为 force_inline，次数不等于 native call 次数。

## 2. M 命中

`read_ic_opcodes.inc` 的 GET_READ_IC 从最终字节码 u32 取 index、定位 site；保留 OBJECT/class/non-exotic 准入，再用已 force_inline 的 rdi_probe 比较 shape，返回属性数组索引。命中从 **当前** `p->prop[offset]` 读值，执行原 Dup/receiver 所有权后 dispatch。不加载 atom，不更新反馈。

## 3. M 普通回退及通用慢路

probe 未匹配后加载 site.atom，实际 find_own_property 沿对象/原型搜索。只有 origin 自身、普通类、non-exotic、hashed shape、普通 data 的结果准入 rdi_update；不同 shape 保活新边再释放旧边。descriptor、exotic、primitive 路径仍保留 sf->cur_pc、this 和异常处理，不把它们当作本轮两种稳定对象的普通查找。

## 保持的语义和限制

get_field 消费临时 receiver，get_field2 保留 receiver 供方法调用，不能互换。整数值的 Dup/Free 有 tag 判断但不改对象引用头；对象/函数结果须保留引用。缓存引用、编译实例/site 隔离、hashed shape 的修改端 COW、GC mark/free、序列化恢复均属于正确性条件。

`paths.csv` 是逐阶段对照。以上为源码事实；8192/8191/1 是旧的独立动态计数，不冒称本轮采集。实际 native 窗口及本轮采用比例计数将在 machinecode/、mechanism/ 单列。机器码存在某分支不证明每个正式样本走该分支；所有成本拆分假设仍需受控数据验证。
