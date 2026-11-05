# 最小移植映射 / v2

历史文件均为 `sources/ng_parent/quickjs.c`，目标为 `/home/mzyx/legacy_ng_ic_attempt01/B_port2/quickjs.c`。
生成器 `port.py` 的断言限制所有替换；最终补丁 `patches/legacy_ng_ic_port.v2.patch`。
失败的第一构建和原补丁保留，仅v2进入A/B。

| 历史位置 | upstream目标 | 适配 | 是否改变策略 |
|---|---|---|---|
| JSInlineCache*结构、get_ic_prop_offset | JSFunctionBytecode之前、ic指针放debug之前 | 保留4槽、index规则、同函数atom共享 | 否 |
| find_own_property_ic | find_own_property之后 | NG反向prop_hash_end改成upstream sh->hash_table[h]，相同offset意义 | 布局API适配 |
| JS_GetPropertyInternal2 / WithIC | 新JS_GetPropertyInternalIC；公开API wrapper保持原签名 | 保留upstream rope/typedarray等语义，仅增加offset/own登记；JS_DupValue/BOOL适配 | 否 |
| get_field/get_field2/put_field及*_ic | 当前GET_FIELD_INLINE/put_field+三个追加opcode | 保留upstream普通内联路径，在其own数据命中处登记，首次成功后原地重写；get_length不IC | 必要适配，不引入NG其余属性实现 |
| JS_SetPropertyInternal2 / WithIC | upstream JS_SetPropertyInternalIC+原API wrapper | **额外检查命中属性仍可写且非length**。同函数read可能把readonly shape放进共享atom单元，历史write hit不检查；这是语义修复，不改容量/替换 | 最小安全差异 |
| emit_ic+多处显式登记 | emit_atom/emit_u32统一operand登记 | 在三类字段和新版本optional-chain字段的atom写入时登记；保留解析期hash、重复登记行为、优化后无用atom，非延迟初始化 | 生成入口适配；可选链为当前API覆盖 |
| init_ic / rebuild_ic | js_new_function_def / js_create_function | eager创建不变；init用mallocz，NULL时释放已建fd，rebuild失败在转交b前处理，emit分配失败标byte_code.error | OOM安全差异，不默默关闭IC |
| free_ic / free_function_bytecode | fd析构、b析构 | 原atom/shape强引用与释放；endof宏展开为固定4槽边界 | 否 |
| mark_children | FUNCTION_BYTECODE分支 | 所有非空shape GC边均保留；ring尚未建好时保护NULL | 清理安全适配 |
| JS_WriteFunctionBytecode | 当前writer改为接受b | IC opcode还原对应普通opcode/atom，保持BC_VERSION=5与旧正常字节码编号 | 否 |
| JS_ReadFunctionTag | upstream原实现，b已calloc | ic=NULL，不新建缓存；保存历史caa1bf5行为 | 否 |

## 有意不做

- 不修正四槽实际填充/替换算法；不增加原型IC。
- 不缓存属性值，不改变GC阈值，不增加正式计数器/trace。
- 不把整个NG引擎替换过来。其它源码和Makefile均来自精确upstream底座。
- 正式A与B都是新GCC13.3/-O2构建，旧binary仅作身份核对，不参与比值。
- 尚未实施编译期开关：正式A是独立未打补丁源码，而非关闭后仍有开销的B。
