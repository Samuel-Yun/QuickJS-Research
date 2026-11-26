# 唯一候选：M 的受限直接一层原型 data 读取

**状态：设计假设，未实现、未跑其性能、未声称为 Richards 主瓶颈。** 先验证“对实际可覆盖位置减少两次普通 own 探查，是否有净收益”。不把 V8 OFF/ON 倍数或调用总时间预测成 QuickJS 可加速比例。

## 1. 选择依据与尚缺的覆盖证据

旧原始 Richards 的 schedule PC30、PC83 与 TCB.run PC73 已按源码 SHA+instance+PC 重新核对：每 Run 分别 10671/6573/6573 次 inherited 回退，零命中；receiver → 直接 prototype 上的方法关系可从原源码/已有对象关系证据解释。它们是值得验证的访问，不是已经量出的耗时热点。

own 路径已有强 shape 守卫和直接按偏移读取；本轮没有发现可无条件删除的检查。选择补小范围继承覆盖，而不并列提出另一个命中路径优化。

**仍 UNKNOWN：这些实际 QJS holder 在读点是否满足 hashed shape 准入、满足比例多大。** 旧 reason 计数先归为 inherited，不等于已经记录 holder.is_hashed。V8 的 prototype Map 日志也不能证明 QJS 的 hashed 标志。下一轮若候选实际不可准入，应如实停在低覆盖/无收益，不改成无保护缓存。

## 2. 限定范围

支持普通 non-exotic `JS_CLASS_OBJECT` receiver；目标 atom 不在 receiver 上；直接一层 prototype 就是 holder；holder 也是普通 non-exotic object；该属性为普通 data descriptor；**填充时 receiver shape、holder shape 均 hashed**。

不支持中间层、getter/setter/varref/autoinit、primitive、Proxy/其它 exotic、array/特殊 class、缺失属性、未 hashed shape。保留当前 M 单槽及逐最终 read-site 单位；不引入 P 新策略、R 退出、共享 megamorphic 表或跨位点缓存。

属性值不缓存。data 槽内初始函数变成另一函数/非函数时也读取当前值：随后调用应执行新函数或按原语义抛 TypeError，不能命中旧函数。候选不是只适用于“函数永不变化”的假设。

## 3. 最小数据与代码接点

下一轮预计改 M 的：

- `read_ic_types.h`：site 额外保存 `JSShape *holder_shape`；NULL 表示原 own 槽，非 NULL 表示受限继承槽。不保存 JSValue 函数或旧 `JSProperty*`。
- `read_ic_opcodes.inc::GET_READ_IC`：own 分支保持原含义；继承分支比对 receiver shape 后，从其当前 shape.proto 取直接 holder，再守卫 holder class/exotic/shape，最后读 **当前** `holder->prop[offset].u.value`。get_field/get_field2 的返回值及 receiver 所有权规则保持不变。
- `read_ic_runtime.inc::rdi_update/rdi_free`：成功的普通 miss 查找在确认“正好一层且两边 hashed”后填充；先取得新 shape 引用再释放旧项，复用单槽替换策略。
- M 接入 `quickjs.c` 的 bytecode GC mark 遍历：新增 holder_shape 的 GC 边。序列化仍输出正常 get_field/atom，不序列化运行期 shape/offset；原加载 prepare 流程不变。

下面是设计伪代码，不是实现或已执行路径：

```text
if receiver qualifies && receiver.shape == entry.receiver_shape:
    if entry.holder_shape == NULL: original own hit
    holder = receiver.shape.proto
    if holder qualifies && holder.shape == entry.holder_shape:
        return owned_copy(holder.prop[entry.offset].current_value)
normal lookup with original receiver / exceptions
if result is eligible own: original own fill
else if result is exactly direct-prototype data and both shapes hashed:
    retain receiver_shape and holder_shape; record element offset
else: original fallback, do not install a broader handler
```

## 4. 为什么两边 shape 之外还要准入/生命周期规则

`quickjs.c:10302–10326` 的 COW 条件是 **hashed 且 refcount != 1**。缓存强持有两边 hashed shape，使本轮已核对的结构修改入口不能直接改掉那份共享 hashed 元数据；新 holder/receiver shape 将不匹配。不能照抄 V8 弱 Map/holder 字段，也不能将这条条件改写成“所有 shape 只要多保活就不可变”。

receiver_shape 自身通过 shape.proto 强持有直接 holder（`:5285–5286,5308–5309`）。因此不另保存一份 holder JSValue；命中时重新取得 holder，重新读其 prop 指针。holder_shape 仍须单独强引用并在 mark 中登记，不能因 holder 已被保活就省掉这条边。替换/free/OOM 回收要成对处理新增引用，防止函数→shape→prototype→函数形成的循环被误当外部活引用。

### 成立与不成立的具体变化

|变化|候选要求的正确行为|
|---|---|
|不同 receiver 共享相同合格 shape|从每次实际 receiver 的同一直接 proto 读值，不缓存 receiver 自身|
|receiver 新增同名 own 字段 / 删除|原 shape 被缓存强持有时，已有 add/delete 更新入口改变当前 shape；旧槽 miss，正常查找处理遮蔽/恢复|
|receiver 更换 prototype|SetPrototype 先 shape_prepare_update；旧 receiver shape 守卫拒绝|
|holder 仅 data 值/方法变化|每次读当前槽；不靠缓存函数值，不要求为普通值更新引入全局失效|
|holder 删除字段、data→getter、descriptor/原型变化|已缓存 hashed holder shape 被强持有；已核对的修改入口克隆/换 shape，守卫 miss，普通 helper 负责 getter receiver/异常|
|holder 已经未 hashed|拒绝安装；该 shape 可能被原地修改，单纯 pointer 相等不足以保护|
|目标实际隔着一层中间对象|拒绝安装；不能忽略中间对象 own 遮蔽与换链|

这只是针对所列普通 JS 修改链的安全设计依据；**本轮 48 个 PASS 来自现有 A/M/V8，不是这个尚未实现的候选的通过记录**。下一轮仍必须覆盖删除、重定义、嵌套 getter、函数回收与序列化，不以当前测试替代新增缓存的回归。

## 5. 代价与可推翻条件

按 x86_64 指针/atom/offset 布局推导：M 的 site 从 16B 增为 24B（多一根 shape 指针）；即使是 own site，也会承担数组膨胀。额外成本包括分支/holder shape 读取、填充/替换/释放与 GC mark、原本不共享的 hashed shape 被 pin 后触发 COW，以及额外间接保活。此为布局估计，待实现后 sizeof、分配量、RSS 分开核验，不称已经测得内存代价。

下一轮只需最小补丁：受益控制为直接一层普通 prototype 方法；负控制为稳定 own 与无字段数值循环，另加两层/未 hashed 明确回退；原 Richards 保持原源码及输入。先检查实际 hashed 准入及缓存命中，再同批测冻结 M/候选，跟踪内存与正确性。

反例包括：Richards holder 多数不合格；结构变化使缓存持续失配；新增成本抵消省去查找；own 控制退化；任一语义/GC/序列化回归。出现这些结果就否定或收窄这一个假设，而不是承诺接近 V8，也不顺势加入完整原型失效系统。
