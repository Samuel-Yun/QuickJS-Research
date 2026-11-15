# SPARSE_CTOR_IC

独立从R3源包派生，保留C shape转换缓存与原R3构造模板/目标身份/引用/GC/中断/分配/字段初始化语义，不叠加票据或参数直传。

Release FourSite从96B改为32B：稳定旁表中的FullPlan*、负缓存强JSValue、pc/argc。完整FullPlan96B在第一次成功合格构造且结果通过原R3 learn校验后才可选js_mallocz_rt分配，不改变成功构造结果或pending exception。每点地址与完整记录地址均不随表增长变化。已激活点多一次plan指针读取；总记录128B（比原96B多32B，另有allocator开销）。非激活点节约64B，不能把记录请求字节当作RSS或时间。

负缓存仅记同一个确定不合格callee：非cold的固定class、或最终字节码不符合原不可变构造模板的BYTECODE函数。绝不记argc/原型/GC预算/栈等暂时性失败，COLD先走正常调用。目标替换仍重学。发布negative在原构造成功之后，不在原目标执行前释放旧根；发布完整计划后再释放旧negative。负缓存和完整计划按原GC mark/free规则持有/释放，原write/read归一化继续按small slot.argc恢复call_constructor。

关键独立计数（只计Run的工作；记录请求量从进程起累计，含Setup与准备、已释放点，不能称为峰值）：RayTrace原R3模板解析8,524,032次→候选104；负缓存8,524,234次（包括其它不支持构造点），66槽0完整记录，Release记录请求6336→2112B。Closure12槽0完整记录，1152→384B；JQuery4108槽0完整记录，394368→131456B，原R3解析15,356→1540。Boyer1985槽1863完整记录，请求190560→242368B（+27.19%）；Tree6槽2完整记录，576→384B（-33.33%），原R3解析6,900,543→候选423,734。数量见analysis/memory_work.csv；由诊断累计点/计划数乘Release sizeof换算，不含malloc额外开销。

qualification/gate.json：R3/Release/counts/ASan+UBSan差分通过，冷→热、同点不合格→合格→目标来回切换、原型setter与删除、动态Function冷目标、Proxy及异常；普通/ROM保存加载通过。fault_plan.py单独复制ASan构建，仅将可选完整计划malloc强制失败，目标构造仍成功且输出完全一致，见qualification/optional_alloc_failure.json。原版R3/候选微基准checksum一致，单次124.545→126.284ms（+1.40%），因此不假定已激活路径更便宜。原先拼错COLD枚举导致构建失败的日志counts.compile_error_v0.log保留；修正后正常构建。

独立计数构建的旁表有额外diag指针，改变分配/GC节奏，不能把其Tree命中数直接当成Release命中数。计时仅未插桩Release，每项一个新进程，各套各一轮，沿用原N/输入/校验/CPU2/TZAsia/Shanghai/LC_ALL=C/首Run计入。相对旧R3是跨批次单轮筛选；不追加正式R3/C复测或重复候选轮数。

复现：`python3 js-interpreter-bench/experiments/ctor_ic_followups_20261115/attempt01/build.py 03_sparse_ctor release`（新目录；另counts/san/probe）；`python3 .../qualify.py 03_sparse_ctor`；`python3 .../fault_plan.py`；`python3 .../sequence.py 03_sparse_ctor counts`、`release`；`python3 .../analyze.py 03_sparse_ctor`。release.patch相对R3，source.tar.gz/source.sha256含完整可复现源码。

补充生命周期验证：check_ownership.py链接原Release及ASan/UBSan对象，两个realm共用runtime，构造计划/闭包/原型循环引用，跨realm实际构造、显式JS_RunGC及释放context/runtime均通过（qualification/ownership_realms.json）。当前sandbox不支持LeakSanitizer，首次detect_leaks=1出现LSan运行环境fatal，记录保留；采用detect_leaks=0跑ASan/UBSan和QuickJS自身FreeRuntime断言，不将此表述为LSan通过。

本轮正式单次：Octane相对R3 -0.8861%，SunSpider -0.8356%；Tree仍+27.5392%，RayTrace+2.7384%。有内存/避免解析的真实收益和整体筛选收益，不能称为所有单项不退化。
