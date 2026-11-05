# E：实际实现与保护规则

## 哪些东西是新加的

E从冻结A复制源码后接入，不从M/H继续打补丁。参考固定V8 commit
37fb84941c9be9f9914ee50b1ad366f06a1bd764的组织方式，但没有复制CSA或
把V8对象类型直接放进QuickJS。最终字节码实例拥有逐位置metadata、可延后
建立的feedback vector和分类handler；有界状态转换和named store是本轮新增，
不把M原有的逐位置数组重新命名为新贡献。

这是**部分机制迁移的实验实现**，不是完整V8 IC移植。未实现共享megamorphic
stub cache、弱引用Map/holder、原型validity cell、constant-from-prototype、
数组elements handler或global lexical/property-cell缓存。原型正确性依靠
完整守卫的限定链，而非声称复制了V8的O(1)有效性检查。

## 准备、反馈及状态

- 最终atom fixup之后扫描get_field/get_field2/put_field。每处metadata为
  atom和真实opcode起点PC（x86_64实测8B）；改成等宽5B的实验opcode＋索引。
  同名不同PC不共享，同一函数再次编译也有独立记录。闭包共享同一bytecode时
  按bytecode实例共享，不声称按每个JSFunction对象隔离。
- metadata仍eager分配。只有该bytecode执行第8次目标属性opcode时才申请
  feedback vector；这按**操作总数**计，不是函数调用8次，更不是V8实测阈值。
  8是本轮预先固定的冷代码成本策略，未比较多个阈值或宣称最优。
- 单态先比较内嵌entry的shape，不扫数组；第二种合格shape才申请三个额外entry。
  允许1→2→3→4，既有shape只重算对应handler；第五种进入永久GENERIC，释放
  所有保活边和额外数组，不无限替换。连续8次未支持操作也转普通回退。
  不采用V8当前默认10作为QuickJS容量；4是有界空间/扫描的固定实验选择。
- optional vector/PIC/chain分配失败不留下半初始化记录，也不抛新JS异常；
  vector失败后该bytecode禁用反馈。metadata编译分配失败走正常编译OOM清理。

## handler与修改保护

OWN_DATA：普通JS_CLASS_OBJECT、non-exotic、准入时hashed shape；guard成功后
从当前obj.prop[offset]取得当前值，保持Dup/Free语义。没有持有JSProperty*、
prop旧地址或属性值。own handler不走原型链循环。

PROTO_DATA：最多三层prototype，每个经过对象均为普通non-exotic且准入时hashed。
保活receiver shape及每层shape。命中从receiver出发沿**当前**shape.proto走链，
逐层比当前shape；最后从当前holder.prop读当前值。这既保护属性布局，也保护
中间层不存在遮蔽、链关系及holder字段类型。尚未支持的深链/特殊对象回原语义。

hashed条件不可省。A的js_shape_prepare_update仅对hashed shape按引用计数COW；
缓存引用使该条件成立时的结构修改获得新shape，旧entry拒绝它。未hashed对象
不准入。普通值更新不一定改变shape，但读取的是当前槽值，所以无需缓存值失效。
本设计没有依赖登记/通知写入的全局epoch；修改端的正确性来源是现有COW加全链守卫。
这不是与V8 validity cell相同的维护/读取成本。

OWN_STORE：仅已有own普通data、writable且非length字段。guard仍保护原准入权限；
以原set_value消费新值并释放旧值，不增加一份错误引用。属性新增/transition、
readonly、accessor、继承setter、特殊对象及strict/sloppy错误沿原put_field路径。
不缓存写入值，也不改变this、receiver、throw flag或getter/setter执行次序。

named load的miss保留原GET_FIELD_INLINE搜索与JS_GetPropertyInternal慢路；
get_field释放临时receiver，get_field2保留它供调用，callee/尾调用实现不改。

## 所有权、GC和格式

每条shape强引用均有独立mark/free；chain/PIC分配后才发布，替换先取得新引用
再释放旧entry。shape持有prototype，可能增加保活/COW及环；gc_mark_children
遍历这些边，function bytecode释放全部metadata/feedback/chain/shape。
直接缓存请求字节不等于间接保活或RSS。实测Site40B、Entry24B、Chain32B；
另有bytecode头字段增长和allocator开销，不在直接请求字节里假装消失。

写出复制bytecode后恢复原opcode/atom，绝不序列化指针或反馈。读入copy/ROM都
使用可写副本，fixup后重新准备冷metadata；运行期opcode出现在序列化输入会被拒绝。
原格式号保持，因为输出仍是原格式；不是同版本号解释另一份磁盘格式。
prepare两遍扫描没有中途可失败的重写步骤。metadata allocation失败时原atom
仍由普通字节码拥有；成功后atom所有权转metadata，free时各释放一次。

## 覆盖为什么没有继续扩大

固定V8的KeyedLoadIC::Load/KeyedStoreIC::Store不仅是把key转成atom：还维护
元素kind、越界/空洞、对象/索引转换及特殊对象路径。QuickJS已有数组/typed array
快路；本轮没有足够实现/验证依据把它们替换成named-shape记录，原逻辑保留。

global也不能偷换成globalThis字段：LoadGlobalIC/StoreGlobalIC区分script context、
未初始化、const、typeof与ReferenceError；A有全局var/lexical和varref语义。
本轮审核这些入口但不新增global handler。独立N1诊断报告覆盖与回退，不把频率
当时间占比，不声称E覆盖了V8所有use_ic影响的操作。

## 复用来源

最终扫描、等宽runtime opcode、恢复原格式与ROM副本接点参考了
read_ic_mic/attempt01/patches/A_to_common_M.patch，已逐处核对A。
E的handler/vector/state/chain/store代码为本轮新写，非旧M/H改名。
测试复用read_ic_mic及prototype_ic_h的原预期，另加E内部状态和分配失败检查。
新旧失败记录分开；独立诊断制品及sanitizer从不用于正式时间。
