# CTOR_PROTO_TICKET

独立从固定 R3 派生；构造模板、目标/new.target/实际.prototype守卫、对象和属性存储分配及字段初始化均保持 R3。仅将热命中中的 four_ctor_chain 换为 ticket_check。

每个 FourSite 从96B增至104B；JSRuntime从2216B增至2232B（epoch64位、disabled和对齐）；JSObject借用原有标志空位，sizeof仍64B。对象上watch位只标记成功计划的字段资格检查实际遍历过的原型，不是保存裸指针的外部表。计划的原引用保活规则不变，已标记对象只随原对象生命周期存在；标记不清除，会导致计划释放后仍有保守失效。所有点共享epoch，任何已登记原型结构变动都保守失效所有票据；溢出至UINT64_MAX后永久禁用票据，保留原检查。

完整检查成功后纯描述符重走一次登记（不执行JS、不分配）；热路径仅比较有效位/epoch。失效后完整检查成功才重发。新增属性add_property、改变描述符/可写性、删除、链路变化与seal/freeze经js_shape_prepare_update在变动前递增epoch；后者对unhashed shape也先失效，不以shape指针相等作有效性判断。数据值普通替换不影响写资格。原型链由已有final shape及链引用保活，换链先失效，重检重新登记。全局对象class不是ordinary OBJECT，不进入原R3模板资格。

原R3算法的独立probe：Earley完整chain调用4,455,716/描述符17,822,864；Boyer8,211,355/32,845,420；Splay982,620/3,930,480；access-binary-trees2,103,439/12,620,634。probe保留R3检查，不发票据（其布局仍带诊断和新字段，不能用其时间替代Release）。

候选独立counts：Earley票据4,455,709，避免17,822,836查询；Boyer8,211,289，避免32,845,156；Splay982,620，避免3,930,480；Tree2,103,239，避免12,619,434。其它数据见analysis/coverage.csv的follow列：0完整chain调用、1描述符查询、2有效票据、3避免查询、4失效或无效重检、5发票据、6登记对象发生变动。计数构建改变布局和GC预算，尤其Tree，不把它的命中数当Release命中数。

针对性R3/Release/counts/ASan+UBSan语义对照、准备后的普通/ROM保存加载通过；热身后直接/父级原型加setter、改只读、删字段、换链、换目标、freeze。独立count_safety真实触发11次变动失效、206次无效票据重检、7次发票据，370次有效票据，避免2,142次查询。首版fixture使用不存在的shell gc helper失败，原版同样报错；修正后通过，保留失败记录。微基准计时及checksum在qualification/gate.json。

正式仅43个新进程、每项一次；同原N/CPU2/TZAsia/Shanghai/C locale/首次Run计入。原始计时在runs/release，计数独立runs/counts。下表相对旧R3均跨批次单轮筛选，绝不报告统计显著性。不另启R3/C全集。

复现：仓库根执行 `python3 js-interpreter-bench/experiments/ctor_ic_followups_20261115/attempt01/build.py 02_proto_ticket release`，另build counts/san/probe；`python3 .../qualify.py 02_proto_ticket`；`python3 .../sequence.py 02_proto_ticket counts`及`release`；`python3 .../analyze.py 02_proto_ticket`。源包source.tar.gz及SHA，release.patch相对R3。

本轮判定：Octane相对R3 +0.1296%，SunSpider +3.7985%，Tree 4.7762→9.1459ms（+91.4885%），不选为后续底座。单次微基准-3.8755%不能推导全集受益；布局、缓存和GC守卫敏感，当前43项时间原样保留，无补跑救成绩。

补充生命周期验证：check_ownership.py链接原Release及ASan/UBSan对象，两个realm共用runtime，构造计划/闭包/原型循环引用，跨realm实际构造、显式JS_RunGC及释放context/runtime均通过（qualification/ownership_realms.json）。当前sandbox不支持LeakSanitizer，首次detect_leaks=1出现LSan运行环境fatal，记录保留；采用detect_leaks=0跑ASan/UBSan和QuickJS自身FreeRuntime断言，不将此表述为LSan通过。

Tree专项诊断：保持Release结构尺寸、取消per-site诊断分配的lean_counts/lean_reasons两种独立构建（不是正式计时），同原N输入测得967,517次构造/票据命中、5,805,102次跳过查询；9,802,867次慢路因find_hashed_shape_proto查不到所需空shape而不能学习计划，base拒绝2次，GC预算拒绝记录仅3次。证据在qualification/lean_tree_reasons.json。说明这次主要覆盖瓶颈在原R3的empty-shape学习前提，不能把大幅退化归为票据版本比较本身；其与布局/shape缓存的具体因果尚未完全隔离，也不能把诊断数冒充原Release计时进程数。
