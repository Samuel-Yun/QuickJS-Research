# 固定参考源码的完整路径，与E的对应边界

以下行号相对 `source_reference/v8/`，SHA见source_manifest.json，固定参考commit
37fb84941c9be9f9914ee50b1ad366f06a1bd764。它不是已证明的当前d8构建commit。
这是源码解释；本轮d8的运行证据是同一制品、实际有效flags及原benchmark门禁，
没有凭此文档宣称某一个V8 site逐次走了某个handler。

## 1. named read：解释器入口并非每次直接进入C++查找

`interpreter/interpreter-generator.cc:602–624` 的GetNamedProperty取得receiver、
name与反馈slot，进入AccessorAssembler::LoadIC_BytecodeHandler。
`ic/accessor-assembler.cc:3392–3463`先区分没有vector，再走内联单态Map匹配、
WeakFixedArray多态匹配；handler可直接返回，否则进入非内联builtin或runtime miss。
该函数注释明确指出常见单态field/constant load及前两项多态命中尝试省去frame构建，
同时警告这依赖具体代码布局。这是固定参考的实现描述，不是本d8每site的观测。

TryMonomorphicCase(:71)把反馈中弱Map与当前Map比较，并取配对handler；
HandlePolymorphicCase(:104)处理Map/handler对。HandleLoadICHandlerCase再区分
handler表示与种类；HandleLoadField(:600)依照表示、in-object/外部storage位置读值，
HandleProtoHandler(:1275)处理prototype holder和有效性等检查。
它不等于“任何GetNamedProperty都是一次Map比较后一次读字段”。

miss路径进入 `ic/ic.cc:416 LoadIC::Load`：检查非法receiver、必要的Map迁移、
原型准备，建立LookupIterator并LookupForRead，然后有条件UpdateCaches(:1061)，
ComputeHandler(:1146)决定slow/data/accessor/prototype等适用实现，最后执行实际取值。
这段的反馈更新条件是原文：

```cpp
bool use_ic = (state() != NO_FEEDBACK) && v8_flags.use_ic && update_feedback;
```

SetCache(:1005)与UpdatePolymorphicIC(:731)负责状态/Map/handler更新，不只是
向固定四槽写offset。参考flags默认有效多态Map上限10，但受真实Map状态、同名与
handler更新规则影响；本E容量4是单独固定的空间/扫描选择，没有参数最优证据。

E对应的是普通C的metadata/vector、单态优先、按需PIC和handler分类；没有迁移
CSA生成流程、in-object字段或编码handler，也没有frame-omission同等保证。

## 2. prototype：读端保护依赖修改端维护

`ic/handler-configuration.cc:119 LoadFromPrototype`构造holder/validity等信息。
`objects/map.cc:2603 GetOrCreatePrototypeChainValidityCell`先确定cell holder，
LazyRegisterPrototypeUser，再复用仍有效cell或建立新cell。不能只复制读cell的一行
而遗漏原型用户登记及所有修改入口。

`objects/js-objects.cc:5298 InvalidateOnePrototypeValidityCellInternal`把cell标为
PrototypeChainInvalid，并清理相关prototype handler缓存；:5346遍历prototype_users
的弱Map关系向依赖方向传播。`objects/lookup.cc`的数据/accessor转换、原型字段变化，
以及js-objects的结构修改和Map::SetPrototype共同承担维护工作。Global lexical
环境的变化还有单独全局有效性处理，不等同普通对象原型通知。

E没有这套弱用户登记/通知。它保活hashed shape，利用原有COW，并在每次prototype
hit沿当前对象链核对全部限定shape，读当前holder的当前prop数组；这保留正确性，
却仍支付逐层读端成本和强引用/GC/COW代价。不能称已迁移V8 validity cell。
constant-from-prototype也没移植，因为仅保留shape不足以保护值不变。

## 3. store、keyed、global为何不能共用一个shape-offset表

SetNamedProperty(:725)进入StoreIC；`ic/ic.cc:2269 StoreIC::Store`的语义处理、
LookupIterator及:2387 UpdateCaches选择已有字段/transition/accessor等handler。
E只支持已有own普通writable data，属性创建、readonly、setter及特殊对象保留
原JS_SetPropertyInternal和strict/sloppy错误规则。修复后的miss先提交值，再重查
当前槽并更新反馈，避免缓存释放前后跨用属性指针。

GetKeyedProperty(:658)/SetKeyedProperty(:748)进入对应keyed IC；KeyedLoadIC::Load
(:1997)/KeyedStoreIC::Store(:3037)会区分可转named的key与elements路径，并处理
元素kind、越界、空洞和特殊对象等。E不拿named缓存冒充这些元素handler，保留A路径。

LdaGlobal(:214)、typeof变体与StaGlobal(:236)走Global IC。LoadGlobalIC::Load
(:493)先查ScriptContextTable，遇TheHole抛未初始化ReferenceError，再可能将
lexical context/slot编码到反馈；否则进入global property查找。StoreGlobal有const/
context/property-cell等差异。E没有用globalThis字段替换lexical语义，相关opcode不缓存。

## 4. 分配、清理与高多态

`objects/js-function.cc:659 EnsureFeedbackVector`保证已编译且有metadata时创建vector；
:668 CreateAndAttachFeedbackVector联结closure feedback cell与FeedbackVector::New；
:711 InitializeFeedbackCell的创建条件包含lazy_feedback_allocation、日志、coverage及
cached tiering decision。因此不能从一个“延后分配”名称推断V8第8次函数调用创建。
E是bytecode实例第8次目标属性操作创建vector，metadata仍eager，PIC和chain再按需分配。

feedback-vector的ConfigureMonomorphic/ConfigurePolymorphic和清理规则使用V8的弱Map/
handler表示与GC屏障。E使用QuickJS强shape引用并逐条mark/free，不借用裸弱指针；
可能保活的对象和shape不计入直接metadata/vector请求字节，间接峰值仍UNKNOWN。

`ic/stub-cache.cc`的PrimaryOffset/SecondaryOffset/Set/Get给高多态路径提供共享
Map/name/handler查找。E没有这个共享cache：第五种shape或累计未支持阈值后转普通
GENERIC并释放entry，不再反复替换。成功重建handler清零unsupported，hit本身不清零。

这些组织选择构成一个能运行、能验证的部分迁移，不是完整V8执行成本复制。
实际新路径/状态使用由独立N1计数核验；净收益只由同批完整Release时间判断。
