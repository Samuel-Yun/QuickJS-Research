# 固定源码机制映射

下列V8路径均相对source_reference/v8/。原归档SHA核验见source_manifest.json，
后补三文件的实际SHA见source_headers_network_allowed.json。参考提交固定
37fb84941c9be9f9914ee50b1ad366f06a1bd764；不是实际d8构建提交证明。
未将源码存在某分支当作本次d8逐位置命中证据。

|机制与V8入口|所依赖的不变量|A/M/H现状与缺口|E实际实现/回退|新增读端/维护工作|
|---|---|---|---|---|
|interpreter/interpreter-generator.cc:602 GetNamedProperty → accessor-assembler.cc:3392 LoadIC_BytecodeHandler|name、反馈slot和receiver；允许无vector|A普通查找；M/H已经有按最终读点索引的外部数组|独立metadata＋延后vector；get_field/get_field2保留原栈所有权|多一个vector存在判断；冷期计数；首次分配|
|accessor-assembler.cc:71 TryMonomorphicCase；:104 HandlePolymorphicCase|弱Map与handler成对，handler与Map兼容|M单态shape/offset；H多holder守卫但仍单槽|内嵌单态entry；按需分配额外三条；own/proto分类|单态不扫描PIC；多态至多4次shape匹配|
|ic.cc:731 UpdatePolymorphicIC；:1005 SetCache状态分支；ic.h:IC::State|旧Map/handler过滤、重算、容量及name一致|M替换唯一项；H无多态状态；旧NG按atom合并不同点|未初始化→单态→多态→普通GENERIC；同shape重算；容量4不是V8默认10|更多状态与有界miss维护；泛型释放保活后仍走原查找|
|handler-configuration.cc:LoadField；accessor-assembler.cc:600 HandleLoadField|field表示、in-object/外部storage、Map保护|QJS独立prop数组/JSValue，不能复制offset单位|读当前prop槽；own无需原型检查，不缓存值|仍有tag/class/shape及JS_DupValue；没有迁移in-object字段|
|handler-configuration.cc:119 LoadFromPrototype；accessor-assembler.cc:1275 HandleProtoHandler|validity cell、弱holder及额外access/dictionary检查|H仅直接一层hashed双shape；没有原型用户登记|限定三层完整shape链守卫＋强引用，非cell/弱引用等价成本|每次沿当前链比较；chain分配、mark/free/COW代价|
|objects/map.cc:2603 GetOrCreatePrototypeChainValidityCell；js-objects.cc:5298/5346失效；lookup.cc:TransitionToAccessorPair|原型用户登记完整，修改通知正确，value/descriptor语义分类|A hashed COW；未hashed不能用引用保证不变|只准入hashed，全链包含中间对象；修改guard失败后普通语义/重算|未新增全局修改通知；拒绝未支持类型；读端成本更高|
|ic.cc:1404 ConstantFromPrototype；data-handler.h及-inl.h|内部constness与依赖/失效；弱heap value|A/QJS值更新不必变shape；M/H读当前值|不实现constant handler，方法替换仍读新值|少一个不安全常量缓存；可能少于V8覆盖|
|objects/js-function.cc:659/717 EnsureFeedbackVector/InitializeFeedbackCell；feedback-vector.cc:256 New|反馈metadata、closure cell、GC；创建还受coverage/log/tiering状态影响|M/H编译时eager分配所有site及记录|eager8B metadata，首次8次目标操作后创建40B/site vector；PIC/chain按需|冷metadata仍有成本；首次热分配在实际执行内，不说V8第8次调用|
|feedback-vector.cc:ConfigureMonomorphic/ConfigurePolymorphic/清理|弱Map、弱handler及GC屏障|QJS显式引用计数和shape GC边，与V8不同|强shape边逐条mark/free，原子发布新entry，失败不发布|保活/COW及额外GC边；间接保活峰值UNKNOWN|
|interpreter-generator.cc:725 SetNamedProperty → StoreIC；ic.cc:2269/2387 Store/UpdateCaches|writable/strict、transition、setter receiver等|A named store own快路；M/H不缓存写|已有own writable data store缓存；其余原JS_SetPropertyInternal|store site/vector/shape边与miss查找；不支持transition handler|
|interpreter-generator.cc:658/748 Keyed；ic.cc:1997/3037|key转换、elements kind、边界/空洞/特殊对象|A已有数组/typed-array逻辑，旧IC未替代|审阅后保留全部原路径，不伪装named缓存已覆盖keyed|仅独立诊断分类计数；正式不加计数|
|interpreter-generator.cc:214/236 Global；ic.cc:493/2141|script context、TDZ、const、property cell和typeof错误|A有独立global/lexical语义；M/H未做|保留原路径，不把globalThis字段当所有绑定|未迁移global反馈；测试TDZ/typeof/strict错误|
|ic/stub-cache.cc:PrimaryOffset/SecondaryOffset/Set/Get|unique name、Map/handler存活及GC/布局|M/H无共享mega cache|不移植，GENERIC普通回退释放旧IC边|少全局结构/弱引用工程，少V8高多态加速能力|

固定参考最大有效多态Map默认10（flags/flag-definitions.h）；本轮E容量4不表示
“V8四槽”，反馈slot索引也不是容量。jitless执行构建时生成的native builtin
不等于给本次JS函数开启JIT。E只有普通C编译快路，不生成运行期机器码。
