# 弱表失效入口核对

缓存键是完整 shape 指针与 atom；它不持有 shape/atom 引用。下表描述本轮新增的失效或初始化动作。

| 路径 | 原路径动作 | 弱表处理 |
|---|---|---|
| js_new_shape_nohash | 新分配 shape | head=0，覆盖所有普通/预分配对象工厂 |
| js_clone_shape | 复制旧 shape 的主体和描述符 | 新 head=0，旧记录仍归旧 shape |
| js_shape_hash_unlink | 取消当前 hash 登记 | 先沿 shape 的链摘除全部弱项 |
| add_shape_property | 唯一已哈希布局可能原地追加 | 原来先调用 hash_unlink，因此在改 hash/prop_count/描述符前已清理 |
| js_shape_prepare_update | 唯一 shape 取消哈希；共享 shape 复制 | 唯一分支经 hash_unlink 清理；共享分支克隆新 head=0，旧不可变布局仍可使用 |
| JS_DefineProperty / js_update_property_flags / JS_AutoInitProperty | 改 flags、getter、只读、AUTOINIT | 原来均经 prepare_update，受上述处理覆盖 |
| JS_SetPrototypeInternal | 改 sh->proto | 原来先经 prepare_update，旧缓存不跨过原型链接变化 |
| delete_property / compact_properties | 清 atom/flags，可能压缩搬移 | 删除先 prepare_update；compact 搬移前额外清理，新 head=0 |
| resize_properties | 扩容并搬移 shape | 成功分配新块后、复制/释放旧块前清理；新 head=0 |
| js_closure_define_global_var | 一处直接写全局属性 flags | 在该分支直接清理 p->shape，先于 free_property/flags 写入 |
| js_free_shape0 | 释放 proto、atoms 和 shape 内存 | 已哈希分支经 unlink 清理；未哈希分支显式清理；都先于释放 proto/atoms |
| JS_FreeRuntime | 释放已有转换缓存根并收集剩余图 | 最先禁用和清空共享表，避免 finalizer 重入重新登记 |

resize_shape_hash 只搬 hash 桶数组、改 shape_hash_next，不移动 shape 地址或属性描述符，不是此缓存的失效依赖。
内置模板直接调用 add_shape_property 的路径创建专用上下文初始布局；其新 shape 也由已初始化 head 的工厂创建。属性 append 本身在已哈希时经过 hash_unlink，仍然先清理。
GC 不扫描这个表作强根。循环回收的 shape 最终仍通过原 js_free_shape/js_free_shape0 释放。克隆和两个搬移路径均显式重置 head，不把旧 shape 的索引链接复制给新 shape。

登记在 rdi_update 之前，且不分配、不执行 JS、不释放值；rdi_update 发布新一级记录后释放旧引用时，即使原生回调重入并使当前 prop[] 搬移，后续也不再读取旧 descriptor。C 重入测试会递归替换该一级记录、释放原布局并扩容当前对象，A 的普通 JS 语义和 SPARSE/候选的当前值、后续值均另行验证。

具体源码见 SPARSE-to-GLOBAL_OWN_OFFSET_CACHE.patch；对应 source/sizeof/offset 及 C 生命周期测试输出见 weak_gate.json 与 validation/。
