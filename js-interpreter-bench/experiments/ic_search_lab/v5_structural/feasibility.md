# 本轮实现边界

## 原型版本方案 C

c01 在 `add_property`、`js_shape_prepare_update` 处推进 Runtime 结构 epoch。后者覆盖普通对象删除、descriptor 标志更新及 `JS_SetPrototypeInternal`。只准入单层 prototype 上的普通 own data 属性，接收者和 holder 必须为普通非 exotic 对象、hashed shape。接收者 shape 被强引用，保证其自有属性/原型关系改变时不能原地破坏已缓存的布局。缓存按当前 holder 的 property 数组加载当前值，不保存值或 property 指针。

c02 只在已被原型缓存观察到的 holder 上推进这个共享 epoch。新增 watch 位在 `JS_NewObjectFromShape` 的初始化路径清零。所有被观察 holder 共用一份 epoch，因而仍可能过度失效。已饱和 `UINT64_MAX` 时永久禁止该类型缓存，避免回绕匹配旧记录。

这只探索受限的一层机制。多层依赖 cell、弱引用、完整 JS/native API 失效覆盖的最终安全验收仍需入围后专项验证。通过常规 JS 检查仅能作为探索计时的最低门禁。

## 借用加载方案 D

d01/d02 的首次构建把宏放在它的使用点之后，链接失败，未产生性能数据。d03/d04 修正声明顺序，保留独立编号。

d03 在八个 `get_arg0..3/get_loc0..3` 里读下一条 opcode。相邻 `get_field_rdi` 且普通 own-data exact shape 命中时，直接 Dup 字段值并跳过字段 opcode，无需创建/释放 receiver 临时引用。参数/局部变量槽始终拥有 receiver，借用期间只读、无分配与用户回调。失配执行原加载，字段仍由原处理器执行。

d04 在最终字节码准备时只给实际相邻的八类加载换同尺寸 opcode。原第二条字段 opcode 和所有偏移保持，跳入第二条仍执行原字段逻辑。写出字节码时两条分别恢复为标准 opcode，读入时拒绝运行时 opcode。虚拟栈峰值沿用原编译器计算，不增加栈需求。

## 共享动作方案 B

b01/b02 通过 JS 检查后，代码审阅发现清空多个强引用时可能由 native finalizer 重入。逐个清空再更新 primary 的顺序不够稳妥，在任何计时前撤回。b03/b04 先清空整组并发布完整新 action，再释放已退役引用。补丁仅在该冷端操作加入必要的重入语义适配。

## 调用方案 F

f01 只预解码不可变的 frame 基础字节数，保留现有 callee class 分流、实际闭包 var_refs、argc、interrupt 和 stack overflow 检查。没有声称缓存了调用结果或闭包对象。

第二个更激进的函数身份/入口缓存暂未实现。当前普通 bytecode 入口本来已经直接从实际 callee 取得 bytecode 指针和闭包环境，额外 identity-cache 不能仅凭名字证明能省掉有效工作。全入口复制将扩大本轮验证范围。先依据 f01 的实际结果决定是否值得继续，没有为凑两个候选重复这一设计。
