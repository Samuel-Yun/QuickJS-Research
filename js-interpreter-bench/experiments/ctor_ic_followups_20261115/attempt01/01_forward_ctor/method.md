# FORWARD_CTOR_IC

独立父版：冻结 R3 archive，构建时逐文件对照 R3 Release manifest/源包 SHA；不叠加其它新候选。
原真实包装字节码：`push_this;put_loc0;special_object MAPPED_ARGUMENTS;put_loc1;get_loc0;get_field <init>;get_field2 <apply>;get_loc0;get_loc1;call_method 2;return_undef`。RayTrace 原动态包装 8,524,032 次（不是所有 8,524,288 次 new）。参数对象仅这一个用途。

在原参数物化位置改用长度相同的 internal forward_ctor。完整匹配函数体，不按函数名/属性名/文件名启用。每个受支持包装仅一个 48B Release FwdSite，另每函数8B空指针、每 runtime8B上下文指针。按当前原始描述符逐层检查 ordinary non-exotic receiver/holder 与普通数据槽，读当前 target/apply，验证真正原生 Function.prototype.apply 身份；没有二次 JS 读取。缓存两个实际 function 身份，冷切换先发布持有再释放旧引用。未命中在栈和值均未改变时进入原 special_object。

命中：保留 wrapper frame，仍通过 JS_CallInternal 进入实际原生 apply 帧；一个动态作用域 FwdCall 借用实际 argc/argv，native apply 确认当前函数/target/this 后一次性消耗，直接 JS_Call 初始化函数。保留初始化执行、字段写入及对象最终 shape；并未内联初始化函数。JS_Call 原参数所有权规则保持。递归前 consumed 防止借用外层实参。无中断 hook 且本次 arguments 对象分配不会触发 GC 才进入。原型 raw descriptor 遍历是新增成本，未信任可原地变化的 unhashed shape 指针。

独立计数：RayTrace wrapper进入/可解析 8,524,032；命中3,246,080；回退5,277,952。省 arguments对象3,246,080、apply参数列表3,246,080；直接转发9,738,240实参，避免mapped arguments及apply列表两次共19,476,480元素复制；此零形参模板还免去每实际实参的mapped JSVarRef分配。其它项目没有新增命中。不得把所有构造IC hits当作这个新增路径。

qualification/gate.json：R3/Release/counts/ASan+UBSan 语义一致，覆盖多/少参、this、改 target/apply、getter、Proxy、抛错栈及递归；准备后的内部字节码普通/ROM保存加载通过。微基准500000次checksum一致，R3 136.978ms，候选106.355ms（-22.36%，单次局部结果）。初版fixture漏了receiver.setup，原版本身报错，失败记录保留在qualification.fixture_missing_setup，已修正fixture后通过。

正式每项一个独立进程，Octane17/SunSpider26，各一轮。CPU2/TZAsia/Shanghai/LC_ALL=C；原N、校验、Setup/Run边界不变，首次Run计入无预热。原始记录在runs/release；计数在runs/counts，不用于时间。下表相对R3为跨批次单轮筛选；A/EVAL_COLD/V8_ON为历史30轮中位数。不重测R3/C，不把旧R3收益算成新方案收益。

复现（仓库根）：`python3 js-interpreter-bench/experiments/ctor_ic_followups_20261115/attempt01/build.py 01_forward_ctor release`（新目录；另建counts/san）；`python3 .../qualify.py 01_forward_ctor`；`python3 .../sequence.py 01_forward_ctor counts`；`python3 .../sequence.py 01_forward_ctor release`；`python3 .../analyze.py 01_forward_ctor`。完整相对R3补丁release.patch，源包source.tar.gz及source.sha256。

补充生命周期验证：check_ownership.py链接原Release及ASan/UBSan对象，两个realm共用runtime，构造计划/闭包/原型循环引用，跨realm实际构造、显式JS_RunGC及释放context/runtime均通过（qualification/ownership_realms.json）。当前sandbox不支持LeakSanitizer，首次detect_leaks=1出现LSan运行环境fatal，记录保留；采用detect_leaks=0跑ASan/UBSan和QuickJS自身FreeRuntime断言，不将此表述为LSan通过。

本轮正式单次：Octane相对R3 -0.8991%，SunSpider -0.3988%，RayTrace26.9678→26.4232ms(-2.0194%)；最大回退Closure+4.3762%、crypto-aes+3.9628%。不是所有单项不退化。
