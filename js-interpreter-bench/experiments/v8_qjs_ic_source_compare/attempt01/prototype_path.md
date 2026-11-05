# 原始 Richards：receiver、holder、保护和失效

所有函数/PC 指真实原程序；未用历史方法外提 A/B、新建替代 receiver 或源码插计数版本代替原函数。原始输入为 `inherited_method_opportunity/attempt01/inputs/richards.js`，冻结文件 SHA `1246a64a24b931158bf01c24640343259fa74b0226e73bad630bd1f686aa0fa7`。复核函数身份与原始字节码码流 SHA，见 `evidence_recheck.json:Richards`。

## 1. 三处不能按属性名合并

|原源码 / 对象关系|QJS PC|V8 PC / 读槽|M 每 Run 读取 / 命中 / 回退|
|---|---:|---|---:|
|schedule:191 `this.currentTcb.isHeldOrSuspended()`；TCB → TCB.prototype|30|20 / FBV[8]|10671 / 0 / 10671|
|schedule:195 `this.currentTcb.run()`；TCB → TCB.prototype|83|64 / FBV[26]|6573 / 0 / 6573|
|TCB.run:337 `this.task.run(packet)`；四类 task → 各自 prototype|73|58 / FBV[22]|6573 / 0 / 6573|

`evidence_recheck.json` 重新核对原 gzip 的源码 SHA、instance、PC、opcode、查询与 inherited 理由。N2 读取/回退分别为 21342、13146、13146；own 探查分别为 42684、26292、26292，符合本次这些访问的两级探查。**这些是频率，不是 self-time。**

原源码关键连续片段（`richards.js:188–198`）：

```javascript
Scheduler.prototype.schedule = function () {
  this.currentTcb = this.list;
  while (this.currentTcb != null) {
    if (this.currentTcb.isHeldOrSuspended()) {
      this.currentTcb = this.currentTcb.link;
    } else {
      this.currentId = this.currentTcb.id;
      this.currentTcb = this.currentTcb.run();
    }
  }
};
```

`schedule` 的 this 是 Scheduler；读取 currentTcb 后，方法读取的 receiver 已是该 TCB。holder 是 TCB.prototype，其中的数据属性值才是函数。`get_field2` / `CallProperty*` 保留并传递的是 **receiver**，不是 holder。`TCB.run` 的 `this.task` 又取得 task；其返回尾部是 QJS `tail_call_method`，不能用 opcode 名就断言一定复用 frame，也不能套用“调用后继续累加”的小程序时间。

## 2. 已有 V8 动态证据究竟到哪一步

本轮离线重查了 `inherited_method_opportunity/attempt01/raw/diagnostic/v8.Richards.N{1,2}.log.gz` 与同进程函数 dump / holder 输出：

- schedule 的前两处各观察状态码 0→1，并关联同类 TCB map。
- TCB.run 的 run 读取观察 0→1→P、后续 P→P，四个 Map 分别对应 Idle/Worker/Handler/DeviceTask。
- 两进程各六条，共 12 条 receiver map 的 prototype 地址与运行后 holder 对象地址相符；holder 的 own descriptor 为函数值。裸地址只在同进程关联。

完整旧 dump：`inherited_method_opportunity/attempt01/bytecode/Richards/`；细项 `richards_sites.csv`、`richards_map_holder_matching.json`。`evidence_recheck.json:V8_Richards` 保留重新核对的实际 instruction 与转换码。实际安装 handler、逐次命中率、位点耗时均为 **UNKNOWN**。FBV[26] 是反馈槽位置，不是“26 个缓存槽”。

本固定参考的 `flag-definitions.h:3286–3288` 定义 `max_valid_polymorphic_map_count` 默认 **10**；旧同制品实际 `function_value_call_path/attempt01/effective_flags.json` 及 `ic_mechanism_audit/attempt01/effective_flags.csv` 也记录 10。不能照搬“V8 永远四槽”；task.run 观察四类 map 也不表示达到此上限。反馈结构与更新仍需按 `feedback-vector.cc:1163–1211`、`ic.cc:731–838` 的具体条件理解。

## 3. V8 固定参考的两种结果路径

以下引用 `source_reference/v8/`，commit `37fb849…`，并不等于已证明 actual d8 使用其某一条 handler。

### A. 普通原型字段：保护后读 holder 的当前值

`ic.cc:1391–1403,1432–1433` 用字段位置构造 `LoadField`；非 lookup-start holder 再 `LoadFromPrototype`。

`handler-configuration.cc:119–150` 的实际关键顺序：

```text
默认 data1 = weak(holder)                 // 原文是 MaybeObjectDirectHandle::Weak(holder)
按对象条件设置 handler 检查位/附加数据
Map::GetOrCreatePrototypeChainValidityCell(receiver_map)
分配 LoadHandler，保存 smi_handler、validity_cell、data1 等
```

上面是伪代码，完整原文在固定文件。实际使用端先匹配 receiver Map，再 `HandleProtoHandler:1275–1373` 检查 validity cell；按位可能还需 access check 或 receiver dictionary own lookup。`HandleLoadICProtoHandler:1408–1447` 取出弱 holder，清除则 miss；`HandleLoadField:600–630` 才按当前 holder 的存储/偏移读取值。

保护对象不同：Map 匹配保护 receiver 布局/原型入口；原型用户登记与 cell 保护相关链的更改；弱引用防止使用已清除记录；dictionary receiver 的同 Map own 遮蔽不能仅靠 Map 相等排除，因此另有查找位。不能把一个 cell 当成无条件覆盖所有对象情形的万能版本号。

### B. ConstantFromPrototype：可能复用结果，但有条件

`ic.cc:1404–1429`：继承 data、内部 `PropertyConstness::kConst`，且字符串/弱引用等条件合格时，可选择 `LoadConstantFromPrototype`；传入的 data1 此时是结果（Smi 或弱 heap value），不再一概是 holder。`accessor-assembler.cc:1417–1427,842–870` 处理对应常量/字段分支。

这里的内部 const 不等于 JS `writable:false`。Richards 的原型方法 descriptor 实际可写；不能据此说常量 handler 不可能，也不能仅凭方法没改就宣称实际安装了它。

## 4. 一条读端、修改端都能追到的失效链

取本轮 case7 的“已有原型 data 属性改为 getter”。下面是**固定参考源码的具体条件链**，不是本轮采到的内部事件：

1. 普通对象 DefineOwnProperty / ValidateAndApplyPropertyDescriptor 进入 `JSObject::DefineOwnAccessorIgnoreAttributes`（`js-objects.cc:1794–1810,4894–4923`）。
2. `LookupIterator::TransitionToAccessorProperty`（`lookup.cc:859–925`）：fast property 分支调用 `Map::TransitionToAccessorProperty`，再 `JSObject::MigrateToMap`；若继续到 accessor-pair/字典分支，见该文件 `928–976`。
3. fast map 真变化时，`MigrateToMap:3544–3549` 调 `NotifyMapChange:3184–3195`；旧 map 是 prototype map 才 `InvalidatePrototypeChains`。accessor-pair 分支在 prototype map 上也显式失效（`lookup.cc:961–974`）。这覆盖了不同分支，不假定本次实际选了哪一个。
4. `js-objects.cc:5298–5315,5346–5387` 把现存 cell 标 invalid，并沿登记的 prototype users 传播。登记/创建端是 `map.cc:2603–2658` 的 `GetOrCreatePrototypeChainValidityCell → LazyRegisterPrototypeUser`。
5. 旧 LoadHandler 的 `CheckPrototypeValidityCell`（`accessor-assembler.cc:2110–2123`）见 invalid 则 miss；`LoadIC_BytecodeHandler:3456–3462` 进入 `LoadIC_Miss`。
6. `ic.cc:266–318` 允许相同 map 的 handler 重算；`:416–483,1061–1113` 重新 lookup、ComputeHandler / SetCache、取得语义结果。getter 的结果/异常仍依赖普通语义处理，并非只更新一个指针就完毕。

本轮 A/M/V8 的 case7、N1/N2 共六条正确性记录均得到 `[6,6,21,22,"expected_exception",3,true]`。它说明新 getter、receiver 和异常身份正确，不证明本次具体走了上述哪一条优化内部支路。

### 其它变化：哪些已有源码依据，哪些不能概括

|变化|已核对的参考保护/取值规则|本轮内部事件边界|
|---|---|---|
|原型同 data 字段更新值/替换方法|Field handler 读当前值；constant 路径需保持内部 constness 依赖。`lookup.cc:488–535` 可更改 constness/Map，字典 const 跟踪分支也显式失效|返回新值/新函数已验证；具体 handler、失效次数 UNKNOWN|
|receiver 添 own 遮蔽/删除|fast receiver Map 变化可拒绝旧记录；dictionary receiver 还可能需 own lookup；删除 prototype 属性另见 `js-objects.cc:991–994`|正确遮蔽与恢复已验证，不声称每类删除走同一路|
|receiver 换 prototype|`js-objects.cc:5488–5494` 经 MapUpdater 应用转换并 MigrateToMap；receiver Map 与可能的 prototype-user 失效各按条件工作|返回新值已验证；没有逐次 Map/handler 记录|
|中间 prototype 换链|同样涉及该对象的 Map 变化；已登记 prototype map 用户可被失效传播|新 holder 值已验证；不能宣称一个未登记/特殊对象也无条件受同一 cell 保护|

## 5. QuickJS 已有保护，以及为什么只看 receiver shape 不够

固定 A 的 `JSShape` 含 prototype 指针和属性元数据；对象有单独 `prop` 数组（`quickjs.c:947–1014`）。`js_dup_shape` 增引用，shape 的克隆/销毁也处理 proto/atoms（`:5266–5317`）。

- 普通 data **仅值**更新可只 `set_value`，不改变 shape（`:9705–9713`）。因此若缓存函数值而不加值变化保护，就会错误；若每次从当前 prop 槽读取，值更新无需因这一点失效。
- add_property（`:9205–9237`）、删除（`:9332–9358`）、descriptor 更新（`:10302–10335,10410–10427`）以及 SetPrototype（`:7978–7983`）有具体 shape 更新入口。
- **关键条件**：`js_shape_prepare_update` 只在 `sh->is_hashed` 时根据 refcount 克隆/解除 hash。未 hashed shape 不承诺因为多一个引用就 COW。当前 M 只向 hashed own shape 填槽，不能把这条准入条件忘掉后推广为原型缓存。
- receiver 的 shape 保存的是 proto 对象指针，不是该 proto 的 shape/值版本。`proto.step = otherFn`、`defineProperty(proto,"step",getter)` 不必主动改 receiver；只比较 receiver shape 不足以判断 holder 仍是旧 data 布局/值。

因此当前 M/P 的 inherited 回退是**正确但未缓存**，不是语义 bug。只借用现有机制的受限设计，需要守卫 receiver 和直接 holder 两边；必须明确 hashed 准入、保活、当前值读取及排除范围。具体唯一候选见 [candidate.md](candidate.md)。
