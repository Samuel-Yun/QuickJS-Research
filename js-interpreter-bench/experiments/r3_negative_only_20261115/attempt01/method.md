# R3_NEGATIVE_ONLY

问题仅是：R3原有正缓存记录和热命中执行路径不变时，给慢路径添加“同一已准备JS构造目标的不可变字节码不匹配模板”的记忆，能否省解析、保住原有构造场景。本轮不叠加SPARSE分配拆分、参数直传、原型票据或JIT，不修空shape学习问题。

工作树起点myx/06aada464。读取该提交的冻结R3 manifest/source、SPARSE负缓存/记录拆分和02_proto_ticket/qualification/lean_tree_reasons.json；最后一份只作诊断参考，不挪入优化。父版源包SHA与每个源文件均校验。R3新Release源码与源包逐文件一致。SPARSE按该提交原实现构建，只有不影响Release的空诊断宏差异，未改模板/守卫/分配。所有新产物独立保存在本attempt，不改旧结果、不自动push。

实现采用原96B FourSite尾部padding中的uint32 negative_index（+92）；原callee/initial/final/recipe/pc/argc偏移全部不变。索引指向runtime按需扩展旁表，每项16B（目标JSObject*8B、free-list索引4B及对齐），每个曾激活负缓存的静态位点一项；旁表容量按32项起翻倍，索引稳定，realloc地址不逃逸。runtime增加24B元数据。没有每构造点104B增长，也没有SPARSE的FullPlan分配或热路径二次指针。LAYOUT_OFF和NEGATIVE_ONLY结构完全相同，关闭负缓存，作为重点项目的额外布局对照（不扩展全集版本）。

原four_ctor_try完整函数逐字节文本不变，原正计划学习和对象分配逻辑不变。先执行原正缓存尝试，只有失败才查负缓存。若相同目标已确认模板不匹配，仍调用原JS_CallConstructorInternal；目标身份不同则原完整资格检查。首次只在four_ctor_base通过、真实four_ctor_recipe返回不匹配时得到可记忆结论；正常构造成功后才发布负条目，不额外重放用户代码。Cold类/实参数量/new.target/栈/中断/GC预算/prototype/empty hashed shape/原型写资格失败均不成为负结论。抛错构造不新增负条目；已缓存目标后来抛错仍走普通构造，异常保持。

负缓存只针对普通已准备BYTECODE构造函数的不可变模板不匹配，不缓存C/Proxy/bound等其它类，也不按基准、构造器/函数/属性/文件名启用。R3的普通函数class转为BYTECODE之前，eval-origin冷函数先完成rdi_prepare；静态普通函数原本已eager prepare。模板本身不含会在后续准备中变化的属性读取，且后续运行不重写这段模板字节码。强引用防止身份地址复用。

负目标独立于原正callee保存，遇到不支持目标绝不驱逐正计划；切回旧支持目标，原热命中直接返回，无负旁表读取。新负目标先dup并发布，再释放旧目标；分配失败用js_realloc_rt，优化可放弃且不改pending exception。条目概念上属于函数字节码的静态点：原GC mark遍历增加该引用、原free回收索引再释放目标，旁表自身不是GC根，RT销毁时断言live=0再释放旁表。没有回调后继续使用旧entry地址。

验证：R3/SPARSE/LAYOUT_OFF/新Release/counts/ASan+UBSan针对性JS差分；native内部测试直接检查正计划指针在Bad→Good→Bad2→Good中未被负缓存驱逐，检查argc/new.target/GC预算/cold/空shape失败不记负结论，setter移除、冷准备、空shape前提恢复后仍可学正计划。native创建seed空对象只用于定向恢复测试，未改benchmark或学习条件。正负缓存目标循环引用、替换和释放、prepared字节码普通/ROM保存加载均验证。原C强shape缓存本来就是根，GC fixture在断言最终释放前显式清掉该原有根；正式负载不执行这个测试动作。ASan/UBSan detect_leaks=0，当前sandbox的LSan不可用。初版fixture将静态eager函数当冷函数、未清C强缓存即断言零live的失败日志保留，修正为真实eval-origin冷函数及正确根条件；未因此更改优化实现或重跑正式样本。

计数是单独编译/进程：不定义FOUR_DIAG，不分配逐点日志，不加每点diag指针，结构大小与Release一致；global数组计数包括实际模板解析、负命中、正命中、慢路失败原因。SPARSE的原FOLLOW[0]/[2]分别作为解析/负命中，原正命中统一FOUR_COUNT(h)。诊断helper/计数代码仍会扰动布局，5个诊断进程的次数不可冒充5个Release计时进程逐次精确命中率，也绝不用计数版耗时得性能结论。

重点项目：RayTrace、access-binary-trees、Boyer，R3/NEGATIVE_ONLY/原SPARSE各5个Release新进程，附LAYOUT_OFF各5个。按预先固定的旋转顺序同一批交替，记录每次原始时间。独立counts各5进程同样交替，单列empty shape失败及次数范围。随后仅R3与NEGATIVE_ONLY同批次完整Octane17/SunSpider26各1个新进程，每项两版轮换先后顺序。不重测C/A/V8，不自动追加长批次。

协议沿用native_confirmation_20261108/attempt02原脚本/输入/N/校验/首Run计入，无额外热身、CPU2、TZ Asia/Shanghai、LC_ALL/LANG=C、原Setup/Run边界。Release无插桩；正式计时期间不编译、不并行跑其它基准。Octane按14 suite分层等权GM，SunSpider26项等权GM并附逐项耗时和。5次重点时间报告中位数与范围；全集单轮只作方向筛选，不报显著性，不通过新优化救数据。

复现与交付：build.py四个label、release/counts及新san；qualify.py；run.py target release；run.py target counts；run.py full release；analyze.py；audit.py。release.patch相对冻结R3，源包/source.sha256，manifest、qualification、原始进程记录及analysis完整表全部保留。详细命令见REPRODUCE.md。

补充控制核对：qualification/reference_equivalence.json通过objcopy提取可执行.text段确认，本次R3和SPARSE Release与06aada4里的对应原二进制可执行代码逐字节一致；R3源码也逐文件一致，SPARSE仅空诊断宏所在four_diag.inc不同，不改变执行代码。growth.js以100个动态构造位点检查旁表扩容及目标切换、异常，R3/新Release/新ASan+UBSan输出一致，见qualification/growth_gate.json。

独立计数数组定义：negative[0]真实four_ctor_recipe入口；[1]负命中；[2]负发布；[3]base临时/类别失败；[4]template不匹配；[5]prototype失败；[6]找不到empty hashed shape；[7]原型写资格失败；[8]慢路学习资格通过；[9]首次取得旁表条目；[10]扩表；[11]可选分配失败。SPARSE原sparse[0]是plan_recipe次数，[2]为负命中。ctor[0]尝试、[1]正命中、[2]可学习、[3]填充、[4]正未命中。所有这些只在原Run计数边界内累加。
