# V8继承读取：直接观察、固定源码和未知项

本轮实际d8为官方15.6.21、SHA `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133`，snapshot/ICU身份见manifest.json。双边`--jitless --no-lazy`，有效flags仅use-ic不同，RegExp interpret-all=true、tier-up=false。没有重建/替换V8，没有再尝试GetFeedback/OFF槽打印。

## 1. 日志直接看到什么

### 两个新方法控制

`methodLoop`两案例都是42B；PC13为 `GetNamedProperty a0,[0:"step"],FBV[0]`，PC17 Star3，PC18 CallProperty1 r3,a0,r1,FBV[2]。后者是调用取得的函数；属性读取与调用不是同一工作。参数在methodLoop里a0=obj，而step里的a0=x。

- own：同进程目标PC `0x131c01000565` 的LoadIC为0→1，receiver map `0x20780101eaa9`，运行后microObject Brief与此map相符；map-details描述step为in-object data field。
- inherited：目标PC `0x308c01000569` 的LoadIC为0→1，receiver map `0x0e410101eb35`，与运行后microObject Brief一致，也有map-create。但**没有此receiver的map-details**。独立JS descriptor检查确认receiver无own step、直接prototype是sharedProto，其descriptor.value为原step。运行后sharedProto map为`0x0e410101ebad`，同进程map-details有prototype_map以及step的in-object data field。

map-details是生成/改变时的快照；例如own创建日志的representation尚未最终稳定，不能据此声称运行中每次字段值的tag。它支持本例字段布局，不是逐次路径记录。继承receiver缺详情已保留null，未借holder详情冒充receiver详情。

两个caller/callee规范化指令/操作数一致，实际dump见bytecode/。两个目标方法的property、loop、参数及调用形式相同；对象建立导致布局、原型、反馈与其运行状态不同，耗时比不是纯一层原型成本。具体安装的handler、每次命中/回退率均UNKNOWN。

### 未修改Richards的三个位置

|QJS位置|V8位置|N1/N2各自观察|receiver / holder|
|---|---|---|---|
|schedule PC30 isHeldOrSuspended|Scheduler.schedule PC20|每进程0→1，1个receiver map|TCB / TCB.prototype|
|schedule PC83 run|Scheduler.schedule PC64|每进程0→1，同一类TCB map|TCB / TCB.prototype|
|TCB.run PC73 run|TaskControlBlock.run PC58|0→1、1→P、P→P、P→P；4个map|四种task / 各自prototype|

不是按属性名run查找所有日志后混合：先解析每个实际函数dump中的字节码地址，再以LoadIC PC精确对应。N1/N2不同进程各自对应，不混用裸地址。所有原断言通过。

运行结束后，读取TCB及四种task prototype的own descriptor（均为函数值，writable/configurable/enumerable=true），并DebugPrint这些对象。receiver map-details中的prototype地址逐个匹配同进程holder地址，完整表richards_map_holder_matching.json与richards_map_summary.csv。未给原方法加wrapper，未移动方法，未用另建receiver冒充原运行实例。TCB自身包含task/state等字段，不拥有run；task属于各自类型，不能把这两种run混成一个site。

直接证据是slot/PC、0/1/P状态码、receiver maps及prototype/descriptor关系；不是逐次命中计数。完整raw在raw/diagnostic，原命令/退出码/stderr在raw/commands。N1仅一次有界全量dump，N2采用`*.*`过滤；实际输出规模保存在各identity.json。没有无限扩大导出。

状态码释义也核对了固定参考[ic.cc:62–73](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/ic.cc#L62)：0=UNINITIALIZED、1=MONOMORPHIC、P=POLYMORPHIC。日志直接事实仍是这些转换码；释义不赋予逐次命中率。

## 2. 固定参考源码怎样解释继承结果

下列全部实现引用commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764`，**仅为固定15.6.21参考版本，不是d8精确构建commit证明**。新取得的四个小型官方文件在source_reference/，记录URL/SHA256/Git blob SHA1；TLS校验开启，每URL一次下载，没有引擎源码树/工具链重建。既有ic.cc/accessor-assembler.cc等从上轮材料读取并再次核验SHA，见source_reference/reused_identity.json。

1. [ic.cc:1391–1433](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/ic.cc#L1391)：普通fast data property先构造LoadField；若holder不是lookup-start，使用LoadFromPrototype封装。若继承data的constness满足条件，另有LoadConstantFromPrototype，并以weak_value保存可弱引用的结果。**因此不能只凭“继承方法”就认定安装的是字段offset handler或常量handler。**
2. [handler-configuration.cc:119–151](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/handler-configuration.cc#L119)：LoadFromPrototype默认将holder作为弱引用data1；若调用方给maybe_data1则使用给定值。建立/取得prototype chain validity cell，分配LoadHandler，写smi_handler、validity_cell和附加数据。常量结果路径的data1可为结果本身，不能一概叫holder。
3. [handler-configuration.h:35–109](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/handler-configuration.h#L35)：kind包括kField、kConstantFromPrototype等；字段编码有in-object、offset、double和descriptor index等信息。没有取得本site的原始handler值时，不能据这些位定义直接“解码”某site。
4. [data-handler.h:29–56](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/objects/data-handler.h#L29)与[data-handler.tq](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/objects/data-handler.tq)：DataHandler有smi_handler、validity_cell、可选data字段。它不是“保存一个offset就结束”的统一模型。
5. [accessor-assembler.cc:1275–1450](https://github.com/v8/v8/blob/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/ic/accessor-assembler.cc#L1275)：HandleProtoHandler先检查validity cell，再按handler位处理必要access/receiver dictionary检查；HandleLoadICProtoHandler解弱holder或常量、再分派具体处理。通用情况仍可能miss。相关常量/field分支在842–870附近，Field进入HandleLoadField。

这些说明参考实现**具备**原型守卫与不同结果处理方式，不能证明本次release在每次读取都走了哪条分支。map日志里的“const data field”是V8内部跟踪信息，不等同JS不可写属性；本轮descriptor实际writable=true。未来若设计缓存，仍需考虑失效与写入语义，但本轮不实现它。

## 3. use_ic和调用的边界

固定参考ic.cc:419、464–465中的use_ic门控LoadIC缓存更新/安装；实际取值语义仍发生。AccessorAssembler有vector的mono/poly入口和runtime fallback，OFF并未据此被证明删除全部缓存。调用反馈槽FBV[2]与读取槽FBV[0]分开；本轮没有证据将所有调用反馈、所有类型反馈都归为此开关。

V8 ON/OFF只能回答同制品此配置开关的净影响，OFF不是“没有IC的QuickJS”。M只缓存合格own data的get_field/get_field2，继承结果仍回退；不能由范围更广直接计算V8差距的归因比例。

概念补充可看用户指定的[官方Hidden Classes and ICs说明](https://chromium.googlesource.com/v8/v8/+/bcefebe8498628369427a91063982fc0160da99f/docs/runtime/hidden-classes-and-ics.md)；其commit不同，仅用于理解术语，不替代以上固定参考实现或当前制品观测。

## 4. 仍未知什么

- 各site安装的具体handler对象/Smi值及可靠解码；逐次命中率。
- 读取、函数值引用处理、receiver/参数准备、调用帧、callee执行各自耗时。
- Richards三处的时间贡献及可加速上限；perf不可用，见profiling_status.md。
- d8精确构建commit/完整工具链、OFF直接槽状态。均保持UNKNOWN，不阻止已授权的配置开关对照。
