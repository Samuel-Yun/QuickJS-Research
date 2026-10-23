# 历史实现（移植前核对）

来源：官方 quickjs-ng/quickjs。git 实际确认删除提交
`7de6d467ebc3598b5e10169f7be3de5b46ff0245` 的唯一/第一父提交为
`e1b5978775f75f9637c624fc45e69b92d2c15f42`（精确日期见 source_evidence/ng_parent_identity_v2.txt）。
下文位置均为 `sources/ng_parent/quickjs.c`；完整源、删除 diff、git 元数据和哈希在本目录保存。

| 项目 | 实际实现与出处 |
|---|---|
| 内容/归属 | 567–640：JSFunctionBytecode 持有 JSInlineCache；每函数内按 atom 分组，不按 opcode site 分组。同函数同名读写共享缓存。保存 JSShape 强引用和属性数组 offset，不缓存属性值。 |
| 容量/探测 | IC_CACHE_ITEM_CAPACITY=4；get_ic_prop_offset 从 ring.index 开始依次比较4个shape，命中更新index，miss返回UINT32_MAX。 |
| 更新/替换 | add_ic_slot（56078起）扫描已有shape，完整扫描无命中时替换起始index槽；**不推进index、不优先选择空槽**。初始index=0，因此实际能填几槽必须诊断；移植不得擅自修成常规轮转。 |
| 准入 | add_ic_slot 仅接收 is_hashed shape；读取仅对自身普通数据属性（proto_depth=0）加入，写入仅普通可写且非length数据属性加入。原型查询、getter/setter、varref、autoinit及特殊路径回退；没有原型链IC。 |
| opcode | get_field/get_field2/put_field 首次成功填缓存后，原地改成对应 *_ic，4字节atom改为cache index，同时释放该opcode持有的atom引用；长度均5字节。get_length、get_array_el等不在三条IC opcode中。 |
| hit/miss | IC读hit按offset读取并复制**当前对象**值；写hit set_value。miss仍执行正常属性语义并尝试更新；没成功填缓存的旧opcode继续普通路径。未编译出槽的atom无法填充。 |
| 创建/存储 | js_new_function_def 每个函数init_ic；emit_ic按atom建立hash链；js_create_function转交并rebuild ring数组，零count释放；非空hash/链仍保留。存在编译期分配及解析短命函数的成本。 |
| 引用/回收 | hash与ring分别持有atom；ring持有js_dup_shape；替换/释放js_free_shape_null。mark_children对每个非空shape调用mark_func，避免GC漏边；free_function_bytecode释放ic。 |
| 编译 | emit_ic在解析器多处get/put_field生成点登记atom；静态优化可删除/改成get_length但已登记atom不会因优化而删除。 |
| 序列化 | JS_WriteFunctionBytecode将*_ic还原普通opcode/atom再序列化，bc_byte_swap保持正常atom格式。加载的b->ic=NULL，旧实现不重建cache，继续普通opcode；已合入caa1bf5确保NULL时不崩溃。不会把shape指针写入文件。 |

## 已合入的相关历史

`source_evidence/ic_history.txt` 为 git -G 在父提交祖先中的真实历史：

- `6b78c7f3e13c9add01312cca80ba4bb7a2f8adf4`：#120 引入（2023-11-29）。
- `c7ca3febd30cc1a12d4995c8b5544d47c8eabee4`：#334 序列化时去除IC opcode（2024-03-27）。
- `763076d1098fac3fc7aa2d4918399c1c1a2a9ec5`：#609 更新信息改为栈上传递（2024-10-20）。
- `caa1bf544d7cd96997abddcf31765a51fc737f16`：加载字节码无IC状态也能运行（2024-10-24）。
- #551 为关闭但未合并的原型IC提案；父提交源码没有它，**不移植**。

## 移植时必须明确的差异

当前 upstream 已有 GET_FIELD_INLINE 和 put_field 的普通快路径，并无上述跨执行缓存。
移植保留这些已有路径，在其正确own命中处登记NG缓存，而不是换入NG其余属性实现。
JSValueConst/BOOL/JS_DupValue、debug布局、序列化函数签名等仅作API适配。
历史的分配失败处理和同atom读写共享的写权限检查需用回归测试检验；必要安全修复必须单列，不能静默改变容量/替换策略。

官方历史入口：
[引入#120](https://github.com/quickjs-ng/quickjs/pull/120)、
[删除#884](https://github.com/quickjs-ng/quickjs/pull/884)、
[删除commit](https://github.com/quickjs-ng/quickjs/commit/7de6d467ebc3598b5e10169f7be3de5b46ff0245)、
[讨论#876](https://github.com/quickjs-ng/quickjs/issues/876)、
[未合并#551](https://github.com/quickjs-ng/quickjs/pull/551)。这些网页不代替本地git/source核验。
