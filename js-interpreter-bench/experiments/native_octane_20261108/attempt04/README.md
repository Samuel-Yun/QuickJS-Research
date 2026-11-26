# PREP2 属性链融合与读反馈共享写入

用户请求继续想出并尝试方法。本批只验证两个独立候选，各基于冻结PREP2，完整17项Octane各五个新进程，共170条新性能记录。旧A、P1+B2、PREP2、V8_ON复用既有数据；不跑SunSpider/V8_OFF，不做参数网格搜索，不把旧负结果叠加。

CHAIN2：仅准备阶段识别arg0/loc0、get_field、get_field的相邻组合，替换单字节加载前缀。两次普通own-data读均精确命中时，根对象由原参数/局部槽继续保活，根的属性继续保活中间对象；没有回调、分配或中断检查点介于取出中间值与复制最终值之间，故省去中间值的Dup/Free并跳过第二次属性分发。第一次命中、第二次失配时保留原B2的一次读取；第一次失配时恢复原拥有引用的加载。两个属性指令及全部长度和独立入口保留。不能直接把这一借用推广到根对象可能最后释放的普通栈顶读取。

READ_STORE：准备时只让同atom且最后一个物理上在前的读位置，为put_field提供一个受检提示。无需假定该读本次已经执行，也无需假定两位置操作相同对象：写入时重新检查实际receiver为普通非exotic对象、精确shape、缓存为own而非prototype状态，以及当前descriptor可写、非特殊类型、非array length。命中直接set_value，失配用JS_SetPropertyInternal及原strict/receiver处理。不会从写入更新读缓存，不增加写记录、atom额外保留或shape边；改写时释放写opcode原有atom引用，读记录继续持有该atom，写出时恢复普通put_field/atom。与旧W1独立写记录、旧NG函数+atom多槽共享均有具体区别，不声称读写反馈共享是新颖概念。

预检诊断只在独立instrumented ELF中，在原N=1 Run循环外加标记，不包含Setup或后置验证，不作性能分数。覆盖如下：

|case|CHAIN2查询/完整双命中|READ_STORE查询/命中|
|---|---:|---:|
|Richards|11599 / 11596|17607 / 17607|
|DeltaBlue|9693 / 9655|14445 / 14445|
|RayTrace|7730 / 5044|39314 / 38275|
|Boyer|296 / 284|0 / 0|
|Splay|320 / 144|3362 / 2216|
|CodeLoadClosure|0 / 0|1 / 0|

来源diagnostics/counts，选择与边界在selection.json中先于正式性能冻结。次数不是耗时占比。

针对性JS检查覆盖链中getter/Proxy/null、换值/换布局，own/inherited写、只读/严格模式/冻结/array length以及generator/eval。独立原生finalizer检查确认set_value先发布新值71，回调随后能观察它、改shape并把值改成23；外层读取返回23。内部probe验证两个链前缀、共享写实际命中、热序列化后重新准备及空缓存，并验证ReadICSite仍24B、JSFunctionBytecode仍144B、写不增加记录。另复用既有语义、C API roundtrip/GC/qjsc、ASan/UBSan。LSan依既有环境限制关闭，不声称完整test262。

预检过程中保留三项setup/fixture失败：复用旧插桩源码时的定位断言、原生测试wrapper的相对路径、局部变量fixture被优化而未保证get_loc0。源码定位和路径修复不涉及候选引擎逻辑；fixture修正后要求两种前缀都静态标记并实测62次命中。原始stdout/stderr/退出码及修正前probe.c在diagnostics，摘要为qualification.json；这些点没有进入性能统计。

正式构建、专项安全与性能采样串行，固定CPU2，GCC15.2，-O2 -g -fwrapv -DHAVE_CLOSEFROM，无新增NDEBUG/LTO/PGO。输入、N、首次Run边界和原生单调时钟沿用冻结协议。两个新版本按case交错，各轮轮换位置。相对旧对照为跨批次探索，bootstrap不覆盖未观测到的环境漂移。

执行入口`python3 -u -B run.py all`；冻结后不改生成器、候选源码或runner，不自动重试失败token。`python3 -B review.py`只读冻结raw进行独立复算，不启动runtime。结果见results.md、statistics.csv、aggregate.csv和paired_ratios.csv，源码/输入/制品及压缩raw哈希保留。

已完成：170条新性能样本、34条Octane正确性、全部专项检查、原始审计及统计独立复算通过。CHAIN2/READ_STORE核心相对PREP2分别-0.08%/-0.24%，区间都跨零；相对A为-4.87%/-5.02%，扩展集合为-4.88%/-4.96%。READ_STORE的新点估计优势主要来自Mandreel，而后补N=1覆盖显示两版在该Run中均0查询/0命中，尚不能归给目标机制。未组合、未追加轮数。完整结论见[summary.md](summary.md)。性能结束后的指令诊断和冷写补查见post_diagnostics，Mandreel覆盖在mandreel_diagnostic，均不进入正式时间统计。
