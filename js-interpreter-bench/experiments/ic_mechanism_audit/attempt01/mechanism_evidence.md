# IC确实执行了吗：位置—字节码—计数

以下均为独立诊断进程N=2，非正式计时。m1Read每Run4096次读x；Richards每Run保留原queue/hold断言。函数源码SHA、编译实例、原/后码SHA、真实PC、操作宽度见mechanism_sites.csv，完整原文压缩于raw/diagnostic；离线对应由diagnostic_run.py完成，N1与N2也分别保存。

计数覆盖诊断进程期间**已登记的源码编译函数**，不是全VM总数：预编译标准库的反序列化函数未加登记hook。理由计数中另有37个无源码site、37次读取，保留UNKNOWN；选定Richards/M1点均已独立匹配。详见diagnostic_scope_amendment.json。cache_probes只统计query中的shape比较，不含更新时额外的同shape判断。

|目标/版本/PC|执行前→结束|操作|IC查询|命中/未命中|插入/同shape更新/替换|普通find / offset-find|桶/链|
|---|---|---:|---:|---|---|---|---|
|m1Read:13 / A|get_field 626 → get_field 626|8192|0|0/0|0/0/0|8192/0|8192/8192|
|TaskControlBlock.prototype.isHeldOrSuspended:3 / A|get_field 757 → get_field 757|21342|0|0/0|0/0/0|21342/0|21342/21342|
|TaskControlBlock.prototype.isHeldOrSuspended:19 / A|get_field 757 → get_field 757|20230|0|0/0|0/0/0|20230/0|20230/20230|
|m1Read:13 / B|get_field 626 → get_field_ic 0|8192|8191|8191/0|1/0/0|0/1|1/1|
|TaskControlBlock.prototype.isHeldOrSuspended:3 / B|get_field 757 → get_field_ic 0|21342|21341|21341/0|1/0/0|0/1|1/1|
|TaskControlBlock.prototype.isHeldOrSuspended:19 / B|get_field 757 → get_field_ic 0|20230|20229|20229/0|0/1/0|0/1|1/1|
|m1Read:13 / M|get_field_rdi 0 → get_field_rdi 0|8192|8192|8191/1|1/0/0|1/0|1/1|
|TaskControlBlock.prototype.isHeldOrSuspended:3 / M|get_field_rdi 0 → get_field_rdi 0|21342|21342|21341/1|1/0/0|1/0|1/1|
|TaskControlBlock.prototype.isHeldOrSuspended:19 / M|get_field_rdi 1 → get_field_rdi 1|20230|20230|20229/1|1/0/0|1/0|1/1|

## 三个最直接的事实

M另用独立诊断副本在rdi_prepare入口/改写后各保存一次最终代码，见prepare_snapshot_gate.json及raw/diagnostic/M_prepare.*.gz。这才是M自身的prepare前→后证据，不用A的字节码冒充M的前态；先前表中M的before指prepare完成、开始执行之前。

|M函数 / PC|prepare前真实指令及atom32|prepare后真实指令及site index32|
|---|---|---|
|m1Read / 13|get_field 626（x）|get_field_rdi 0|
|isHeldOrSuspended / 3|get_field 757（state）|get_field_rdi 0|
|isHeldOrSuspended / 19|get_field 757（state）|get_field_rdi 1|

表内atom编号是这次独立进程的实际值，不作跨进程身份。三处的指令宽度仍为5B，除这些读点外字节码保持原样；完整前/后字节见压缩JSONL。

1. 稳定own读的真实PC13：A普通get_field保持不变；B从atom626的get_field改成index0的get_field_ic，8192次操作中第一次不计IC查询，后8191次全命中；M在执行前就为index0的get_field_rdi，8192查询含一次冷miss。数字244在B/M中代表不同新增opcode，不能只按opcode编号判断是相同实现。
2. A在该位置实际执行8192次逻辑find_own_property、8192次桶读取和链atom比较；M仅1/1/1，B另一个带offset的查找仅1/1/1。命中后确实少做查找，而不只是“源码中有命中分支”。这些是内联函数体逻辑计数，不是native call或周期数。M额外shape比较8192次，不能把节省的链比较直接换成时间。
3. Richards真实isHeldOrSuspended PC3/19分别读state。B两处结束时index均0，M分别index0/1；B第二处首次普通opcode虽有已存在同shape缓存，仍先作一次普通offset查找/更新。M每site首个查询属于冷miss，两处均仅1次普通查找，后续全命中，返回INT。函数匿名名称用原始源码赋值关联，完整身份仍以source SHA+instance+PC为准。

## 缓存不是缓存值，诊断不是完整语义证明

复用原read_semantics、site_regression、legacy_regression、multislot，共12个A/B/M release回归进程实际通过。stdout中的assertions/scenarios各自保留于regression.csv：覆盖同shape不同对象与当前值更新、INT→引用/字符串、删除/重定义、getter/抛异常、Proxy、只读属性、receiver绑定及已有多shape情况。没有跑完整test262，没有新IC算法。
另外A/B/M各一次scope探针通过：getter重入inner、第二次抛异常、随后独立after读取均正确映射。GCC cleanup按栈恢复上下文；每次JS_CallInternal先暂停父属性上下文，避免把getter内的查找算到外层。信号采样未在本轮启用，不记录海量访问事件，不对每次访问调用时钟。

正式源树没有计数器。诊断差异均在diagnostic/补丁与两个hook中；字节码快照为最终编译定型/准备后以及释放前，不是编译中间表示。未插桩的访问类型不以0冒充。额外理由计数使用既有原M诊断制品，身份、源码与每个source SHA+PC的query/hit/fallback交叉一致，见reason_gate.json。

## Richards覆盖（次数不是时间）

N1：isHeldOrSuspended PC3/19分别10671/10115查询，命中10670/10114。schedule PC30的isHeldOrSuspended方法准备10671次全回退，两级run方法准备PC83/TCB.run PC73各6573次全回退；每次分别发生两次own探查，理由计数确认为inherited。TCB.run PC68读task则6573查询、6572命中。普通put_field仍走原写入，不属于M读IC；keyed/global动态次数UNKNOWN。
完整逐site表coverage.csv，不能按atom合并后冒充一个位置。N2独立核对次数增长，缓存冷miss不随Run成倍增加；分母为各site的查询数，不是整个程序时间。

## V8的直接证据和未知项

本轮实际m1Read dump PC13/FBV0；同一进程LoadIC 0→1和receiver map相符，map-details中x是in-object数据字段。完整地址和描述见bytecode/V8_m1_*与raw/diagnostic/v8_m1.log.gz。ON有状态转换不代表每次命中；精确handler编码、逐次命中率、OFF直接槽快照均UNKNOWN。
本制品拒绝print-builtin-code，只读flag失败保留；正式采样结束后实际objdump静态导出同一d8的Builtins_GetNamedPropertyHandler，source_evidence/V8_GetNamedProperty_actual.asm中可见反馈map检查/字段load和分支。它是具备路径的证据，不是目标每次走该支的trace。两种V8只有use-ic生效值不同，jitless及RegExp解释策略相同。
