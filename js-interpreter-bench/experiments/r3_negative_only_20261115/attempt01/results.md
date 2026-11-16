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


## 本轮结论（只回答三个问题）

### 1. 少解析是否实际省时？

RayTrace的模板判型/解析入口由8,524,032次降到52次，少8,523,980次（99.999390%），负缓存命中8,523,980次，5个计数进程相同。但5次Release中位数R3 26.9455ms、NEGATIVE_ONLY 27.4912ms，即增加0.5458ms/Run（+2.0254%）；同布局关闭负缓存27.3092ms，开启后也慢0.6664%。因此没有看到减少解析带来的清楚时间收益。

这些次数是four_ctor_recipe入口次数，不代表每次完整扫描：RayTrace的实际包装字节码有this和arguments两个局部（前一轮真实字节码证据），原模板在var_count!=1等头部条件即拒绝；减少几百万次这样的早退，不等于减少几百万次昂贵模板遍历。新旁表检查也有成本。此为源码与计数支持的解释，不把所有慢化精确归因给某一条指令。

### 2. 保持R3布局后Tree和Boyer怎样？

Tree Release中位数R3 4.7947ms，NEG 4.6443ms，SPARSE 6.1010ms；新版本相对R3 -3.1367%，相对SPARSE -23.8765%，没有重现SPARSE的约27%回退。但同布局OFF为4.5243ms，比新版本还快，不能把这项改善归功于负缓存。

Tree独立计数：R3正命中1,346,111、NEG正命中4,374,863、SPARSE正命中6,141,635。NEG与OFF完全一致，且负命中均为0；这里覆盖差异与本轮负缓存命中无关，仍受内存/代码布局及原C强shape缓存环境影响。计数版不能直接还原Release进程命中率。原empty-shape失败仍在：R3 9,424,255、NEG/OFF 6,395,359、SPARSE 4,628,503次，所有5次计数各自相同，未修改学习规则。

Boyer正命中三版都为8,211,289次，R3/NEG模板解析均66次，SPARSE72次。Release中位数R3 56.1561ms、NEG 55.9342ms（-0.3953%），SPARSE 54.8066ms；新版本相对SPARSE +2.0573%。正计划未被负缓存驱逐，已有热路径相对R3未出现清楚退化，但没有超过SPARSE的Boyer成绩。

### 3. 两套全集方向与是否保留？

本次R3/NEG同批次、每项一个新进程：Octane14 suite分层GM相对R3 -1.2973%，SunSpider26项GM -0.1844%。方向均略快；Octane逐项和8260.6010→8151.4961ms，SunSpider393.5978→392.9500ms。最大单项回退：Octane Typescript +0.9652%，SunSpider bitops-bits-in-byte +5.4625%。

全集单轮RayTrace为27.8438→27.3076ms，方向与重点5次的中位数对照相反；不能挑全集中的这一次就宣称负缓存已加速RayTrace。全集未另跑OFF（按用户限定仅R3/NEG），所以也不能把所有单轮整体差异都归因于少解析。保留本轮代码、数据作为对照候选，暂不替换R3或宣布负缓存已产生稳定净收益；不追加长批次，不叠加其它优化救数据。


## 重点项目5次交替：Release时间与独立计数

计数版同样各5个独立进程，结构大小与Release一致，无逐点日志分配；这些计数不属于对应的Release计时进程。时间保留全部5次，判定使用中位数，不用计数版时间。

| 项目 | 版本 | 5次Release时间ms/Run | 中位数 | 相对R3中位数 | 模板解析中位数 | 负命中中位数 | 正命中中位数 | 找不到空shape中位数 |
|---|---|---|---:|---:|---:|---:|---:|---:|
| RayTrace.RayTrace | R3 | 27.1919 / 26.8410 / 26.9455 / 26.8183 / 27.0713 | 26.9455 | +0.00% | 8,524,032 | 0 | 0 | 0 |
| RayTrace.RayTrace | NEGATIVE_ONLY | 27.3278 / 27.8086 / 27.7378 / 27.4912 / 27.2367 | 27.4912 | +2.03% | 52 | 8,523,980 | 0 | 0 |
| RayTrace.RayTrace | SPARSE | 27.8374 / 27.7068 / 27.4458 / 28.3049 / 27.9168 | 27.8374 | +3.31% | 104 | 8,524,234 | 0 | 0 |
| RayTrace.RayTrace | LAYOUT_OFF | 27.2242 / 27.2785 / 27.3230 / 27.3092 / 27.4694 | 27.3092 | +1.35% | 8,524,032 | 0 | 0 | 0 |
| access-binary-trees | R3 | 4.8344 / 4.7661 / 4.7664 / 4.8067 / 4.7947 | 4.7947 | +0.00% | 9,424,383 | 0 | 1,346,111 | 9,424,255 |
| access-binary-trees | NEGATIVE_ONLY | 4.6304 / 4.6860 / 4.6601 / 4.6243 / 4.6443 | 4.6443 | -3.14% | 6,395,775 | 0 | 4,374,863 | 6,395,359 |
| access-binary-trees | SPARSE | 6.2222 / 6.1010 / 6.0742 / 6.1286 / 6.0768 | 6.1010 | +27.24% | 9,257,592 | 0 | 6,141,635 | 4,628,503 |
| access-binary-trees | LAYOUT_OFF | 4.4841 / 4.5323 / 4.5181 / 4.5532 / 4.5243 | 4.5243 | -5.64% | 6,395,775 | 0 | 4,374,863 | 6,395,359 |
| EarleyBoyer.Boyer | R3 | 56.3304 / 56.1120 / 56.1561 / 56.0284 / 57.1750 | 56.1561 | +0.00% | 66 | 0 | 8,211,289 | 0 |
| EarleyBoyer.Boyer | NEGATIVE_ONLY | 55.9316 / 56.1437 / 55.8168 / 56.0575 / 55.9342 | 55.9342 | -0.40% | 66 | 0 | 8,211,289 | 0 |
| EarleyBoyer.Boyer | SPARSE | 54.9917 / 54.7547 / 54.8066 / 54.8818 / 54.7769 | 54.8066 | -2.40% | 72 | 0 | 8,211,289 | 0 |
| EarleyBoyer.Boyer | LAYOUT_OFF | 56.1018 / 55.9597 / 56.1149 / 55.9989 / 55.8635 | 55.9989 | -0.28% | 66 | 0 | 8,211,289 | 0 |

各5次计数及所有最小/最大范围见analysis/target_raw.csv和target_summary.csv；Tree的空shape失败独立报告，没有修改任何学习条件。

## octane 全集同批次单轮（ms/Run）

| 表项 | R3 | NEGATIVE_ONLY | 相对R3 |
|---|---:|---:|---:|
| Richards.Richards | 2.3444 | 2.2546 | -3.83% |
| DeltaBlue.DeltaBlue | 4.7184 | 4.7547 | +0.77% |
| Crypto.Encrypt | 3.8798 | 3.7552 | -3.21% |
| Crypto.Decrypt | 71.0345 | 70.4491 | -0.82% |
| RayTrace.RayTrace | 27.8438 | 27.3076 | -1.93% |
| EarleyBoyer.Earley | 4.5876 | 4.5409 | -1.02% |
| EarleyBoyer.Boyer | 56.9278 | 56.5139 | -0.73% |
| RegExp.RegExp | 154.2828 | 153.3664 | -0.59% |
| Splay.Splay | 1.3617 | 1.3320 | -2.18% |
| NavierStokes.NavierStokes | 43.0475 | 41.8660 | -2.74% |
| PdfJS.PdfJS | 122.5453 | 121.2441 | -1.06% |
| Mandreel.Mandreel | 1174.5546 | 1153.4927 | -1.79% |
| Gameboy.Gameboy | 209.7454 | 209.6454 | -0.05% |
| CodeLoad.CodeLoadClosure | 0.4988 | 0.4904 | -1.69% |
| CodeLoad.CodeLoadJQuery | 8.8708 | 8.8907 | +0.22% |
| Typescript.Typescript | 1452.2467 | 1466.2641 | +0.97% |
| zlib.zlib | 4922.1109 | 4825.3283 | -1.97% |

GM相对R3：-1.2973%；逐项和：R3 8260.6010ms，NEG 8151.4961ms。

## sunspider 全集同批次单轮（ms/Run）

| 表项 | R3 | NEGATIVE_ONLY | 相对R3 |
|---|---:|---:|---:|
| 3d-cube | 14.9141 | 14.6647 | -1.67% |
| 3d-morph | 10.8414 | 11.0479 | +1.90% |
| 3d-raytrace | 11.1031 | 10.9025 | -1.81% |
| access-binary-trees | 4.7946 | 4.6495 | -3.03% |
| access-fannkuch | 26.2860 | 25.6887 | -2.27% |
| access-nbody | 10.7062 | 10.6309 | -0.70% |
| access-nsieve | 15.2354 | 14.8626 | -2.45% |
| bitops-3bit-bits-in-byte | 6.7047 | 6.6705 | -0.51% |
| bitops-bits-in-byte | 16.0965 | 16.9758 | +5.46% |
| bitops-bitwise-and | 6.3489 | 6.6510 | +4.76% |
| bitops-nsieve-bits | 11.4838 | 10.9549 | -4.61% |
| controlflow-recursive | 5.0543 | 5.0241 | -0.60% |
| crypto-aes | 9.7559 | 9.6220 | -1.37% |
| crypto-md5 | 5.2248 | 5.1216 | -1.97% |
| crypto-sha1 | 4.6923 | 4.7426 | +1.07% |
| date-format-tofte | 22.0776 | 21.8168 | -1.18% |
| date-format-xparb | 16.9247 | 17.2337 | +1.83% |
| math-cordic | 16.7714 | 16.2826 | -2.91% |
| math-partial-sums | 8.2642 | 8.2869 | +0.27% |
| math-spectral-norm | 5.9908 | 6.1953 | +3.41% |
| regexp-dna | 72.5862 | 73.0009 | +0.57% |
| string-base64 | 10.5562 | 10.6553 | +0.94% |
| string-fasta | 18.3407 | 18.9127 | +3.12% |
| string-tagcloud | 19.3335 | 18.9977 | -1.74% |
| string-unpack-code | 34.2907 | 34.1548 | -0.40% |
| string-validate-input | 9.2197 | 9.2039 | -0.17% |

GM相对R3：-0.1844%；逐项和：R3 393.5978ms，NEG 392.9500ms。
