# 已哈希且被持有的 shape 为什么能作布局守卫

核查对象是冻结 modified/quickjs.c，未修改任何变动入口。

- 添加属性：add_property 对已哈希 shape 先复用目标 shape；找不到时，引用计数不为 1 就 clone，再追加描述符。守卫持有引用后，接收者原 shape 至少有对象与守卫两份引用，不能走“唯一引用直接追加”。
- 删除属性：delete_property 先调用 js_shape_prepare_update，再清除 atom/flags、更新 hash 链。压缩属性表只处理已经脱离旧守卫的未哈希 shape。
- 改描述符、可写性与 data/accessor 类型：JS_DefineProperty / js_update_property_flags 经 js_shape_prepare_update。已哈希且被共享的布局被复制成未哈希布局，原守卫指向的描述符不变。
- 改原型链：JS_SetPrototypeInternal 在写 sh->proto 前调用 js_shape_prepare_update。守卫持有的旧 shape 的 proto 链接不被原地改写。
- AUTOINIT 实例化：JS_AutoInitProperty 同样先调用 js_shape_prepare_update，之后才清除 JS_PROP_TMASK、写属性值。这也是普通构造函数 .prototype 实例化后变成未哈希布局的原因。
- 普通数据值替换可能不换 shape。因此命中时仍读取构造函数 prototype 槽的当前值并比较实际原型身份，不能只比较函数 shape。
- 未哈希布局：js_shape_prepare_update 不会仅因为引用计数大于 1 就 clone 未哈希布局，所以明确拒绝，不能照搬已哈希布局的证明。

记录只覆盖普通字节码构造函数与普通非 exotic 原型对象，最大链长 4，检查实际链及 NULL 终点。数组、RegExp 等内部模板直接改 shape 的路径不进入这类记录。构建记录无额外 JS 读取/调用；js_mallocz_rt 失败不设置 JS 异常，也不触发 JS 层 GC。

结论：这份窄守卫在上述限制下可成立，但普通 JS 函数的 AUTOINIT 正是覆盖障碍；不能为了覆盖率把未哈希布局当成稳定布局。

旧 CTOR_PROTO_TICKET 使用共享 epoch 和登记对象。这次没有复制它的 runtime/object 标志或失效入口。历史结果只是参考，不作为本批基线。
