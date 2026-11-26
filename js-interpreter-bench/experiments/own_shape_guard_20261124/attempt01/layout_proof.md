# SHAPE_ONLY 的边界和依据

这是当前冻结源码的证明，不能推广到其它 QuickJS 版本。RELAX_CLASS 与 SHAPE_ONLY 独立修改，均只对 keep=0 的真实自有普通数据槽有效。

1. **先真实自有槽，再特殊分派。** original/quickjs.c 的 GET_FIELD_INLINE 和 modified/quickjs.c:8299 的 JS_GetPropertyInternal 均先 find_own_property，TMASK=0 时直接 JS_DupValue(pr->u.value)。is_exotic、fast_array、typed-array 数字下标、Proxy/exotic get_property 分派都位于“未找到真实自有描述符”之后。因此在它们之前读一个已证明仍存在的普通自有槽，遵循的是原解释器的顺序。
2. **shape 相等不是 class 相等。** shape 包含 proto、属性描述符、属性槽容量/数量，不含 class。JS_NewObjectFromShape:5674 为所有类别分配独立 p->prop，大小为 shape->prop_size；当前对象自己的 prop 才存当前值。快路从当前 p 的数组取值，不读原接收者，也不推断 class。内部 fixture 用普通对象和一个有 get_property 的自定义 exotic 对象，真实共用同一 shape，验证有真实自有槽时双方 A 本来也先读槽；删除后才分派 exotic。
3. **单槽记录是已验证的 own data。** GET_READ_IC 的常规查找先拿到实际描述符，TMASK=0、p==origin、shape 已哈希才 rdi_update。keep=0 不填直接原型缓存；每个静态读点有独立记录，put_field_shared 只借用、不更新它。v6 前缀只融合 get_field_rdi，不融合 get_field2_rdi。故相等的非空 shape 表示这个访问点曾证明 atom 对应此槽及普通数据类型。有效对象的 shape 非 NULL，所以空缓存不会误命中。
4. **持有已哈希布局保证 atom/type/槽位不被原地换掉。** rdi_update 增加 shape 引用。删除、描述符转换、flags、AUTOINIT、改原型均经 js_shape_prepare_update:10407；仍被缓存持有时采用 COW，原 shape 的 atom/type/offset 不变。add_property 遇到共享 shape 也克隆/复用，不原地添删。resize/compact 只处理可修改、非共享的布局。原型值改变会走对应 shape 更新，普通字段值改变不需要改 shape，本实验每次读取当前值。
5. **核对原地写。** js_closure_define_global_var:17231 的直接描述符转换是 GETSET→VARREF，另一个直接 flags 改动保留 VARREF；它们原来就不是可填槽的 TMASK=0。global 的数据定义经 JS_CreateProperty / JS_DefineProperty 转成 VARREF，不会先留下本 IC 能信任的普通 data 再原地换类型。JS_AutoInitProperty:8256 在改 TMASK 前先 prepare_update。普通、全局、模块、arguments 的其余 data/getter/VARREF 转换均在 prepare_update 后。初始化新 shape 的描述符写入发生在发布/填缓存之前。
6. **状态变化。** 普通 JS 的存活对象 class 切换是 COLD_BYTECODE_FUNCTION↔BYTECODE_FUNCTION，属性数组仍独立且未改语义。数组 fast/slow、长度和 typed-array buffer 分离会改 u.array 或字段值；真实自有 x 槽仍按 shape 解释。改变/删除真实自有描述符仍须 COW。Proxy revoke 改 opaque，不制造真实自有槽；普通 Proxy 的 shape 为空，没有可填的 x 槽。
7. **数字名也允许出现，不能靠“点语法一定非数字”论证。** 当 find_own_property 没找到数字名时，原 fast-array / typed-array / boxed-string 分派原样执行，不填缓存。只有数组慢布局或普通对象的真实数字数据描述符才可能填。与它相等的 shape 本身也含同一真实描述符；不存在“拿虚拟元素位置当 prop 下标”的步骤。测试交替普通数字字段、密集数组、typed array 和 String 对象，并核对实际 opcode；另用 C fixture 强制普通 get_field 路径测试数字 atom。

因此这版不加类别白名单：填槽资格取决于真实自有 TMASK=0 和已哈希 shape，热命中只需对象 tag 与 shape。不存在先通过 exotic 属性 API 获取值、再把虚拟结果误认为真实 prop 槽的填槽途径。

get_field2_rdi、直接原型缓存、put_field_shared、构造 IC、ReadICSite 和字节码均不变。若测试发现上述任一步不成立，就不把 SHAPE_ONLY 作为通过的候选。
