# 马云霄｜本周解释器研究进展讲稿

数据截至2026-10-08；未假定组会日期。正文11页计划约13分30秒，附录4页仅问答，不计入时长。括号中编号对应source_map；口述重点是证据和边界，不逐项读表。

## 1. 本周进展——从总体差距走向具体机制（65秒）

这页想回答的问题：本周怎样回应导师上次的三项要求？

本周主要沿着三个问题推进。第一，补上JSC，并且把三个引擎放进同一个WSL2环境，避免把Linux的JSC直接跟之前Windows的QuickJS、V8相除。第二，收窄计时边界，同时补查d8的code cache是否真的消费，不只看开关名字。第三，从总体差距转到具体代码，做了两轮白盒对照。第一轮看own状态字段和数值表示，没有出现QuickJS特别受益的own字段结果；最新一轮转向Richards的继承方法准备，QuickJS耗时降低的点估计约4.61%。我会先讲基线和方法，再重点讲这个位置到底改了什么、证据能支持到哪一步。这里还没有实现VM优化，目前只是找到一个值得继续检验的方向。（S0–S5）

## 2. 这次比较的时间包含什么（80秒）

这页想回答的问题：今天的时间指标到底测了什么？

这次三边都是冻结的Linux runtime，V8引擎用的是d8 shell，不是Node。V8用max-opt=0和no-lazy，JSC关闭JS JIT并保持LLInt；QuickJS是固定upstream的-O2构建。我们把source加载、adapter、必需Setup放在timer之前，用进程内部的单调时钟包住第一次Run和后续Run，共N次，再除以N。这已经不含进程启动和VM初始化，但我不把它叫纯解释器循环时间。调用、GC、helper、builtin、原Run里的对象构造与断言仍在；JSC首次函数准备也可能在内，覆盖与成本尚未知。没有显式workload warmup，不过必要Setup可能自然改变共享状态。V8精确制品源码和工具链未知也保留在限制中，不能用参考tag补成构建证明。（S0）

## 3. 总体上V8较快，但差距随workload变化（75秒）

这页想回答的问题：为什么不满足于一个总排名，而要选代表性案例？

上面的GM都是时间比，小于1表示分子耗时更低。SunSpider里V8相对QuickJS约0.62，Octane约0.54。Octane先在suite内部合并子Run，再按13个suite等权，不是官方Octane分数，也不是16个Run直接等权。图是原始Octane的三个案例：Richards里V8和JSC都比QuickJS低，适合看对象和调用；NavierStokes反而是QuickJS比V8更低，是不能忽略的反例；RegExp里V8差距非常大，提示另一个实现策略。三种机制不可能只用dispatch一种解释。这一页的绝对时间来源是原基线，不是后面的A/B派生实验。zlib和Box2D没有进入兼容交集，所以也不说15套Octane全部跑完。（S1、S2）

## 4. Code cache已验证消费，内部执行时间接近（70秒）

这页想回答的问题：cache是不是真的发生，以及这次能测出什么收益？

SOURCE用no-lazy在这次启动时生成代表性静态表示；CACHE则由producer生成并序列化，再让consumer恢复。诊断中目标路径、序列化尺寸和反序列化事件对应，consumer也没有新的代表性生成事件，证据不只是Produce、Consume两个标题。这个d8协议实际是同一进程的两个isolate，不是磁盘缓存，也不是跨进程复用。正式计时只取consumer内部执行，所以240条target和120条producer分开。四个consumer/source比都接近1，GM约0.999。这说明本协议下执行时间点估计接近，但没有量化parser、cache恢复或启动收益，也不能宣称统计学等效。producer仍可能改变硬件缓存、频率；正式每条消费没有开启trace，诊断证明不能冒充逐条观测。（S4）

## 5. 第一轮：own字段没有显示QuickJS特有收益（65秒）

这页想回答的问题：最初“属性读取解释差距”的预测得到了什么结果？

第一轮做了两个明确的派生对照。左边缓存Richards的own状态字段，QuickJS和V8时间比几乎同为0.966，JSC降低更多。因此字段准备变化确实会影响时间，但没有观察到QuickJS特有的更大收益，不能把own字段认定为相对差距主因。右边是Navier派生数值核的Array换Float64Array，三个引擎在这个核里都更慢。它说明表示和访问路径有敏感性，不是TypedArray普遍更慢，也不是完整Navier算法优化。这两组各自保留的工作不同，绝对时间不能直接拿来当原benchmark优化前后。第一轮结果使问题更具体：是不是应该看继承方法准备，而不是继续把own state读取泛化成瓶颈？（S3）

## 6. Richards中究竟是哪一次run查找（65秒）

这页想回答的问题：最新实验的选定位置是什么，是否删掉了原算法工作？

这里有两个不同的run。我们选的是Scheduler.schedule调度循环调用currentTcb.run，目标方法定义在TaskControlBlock原型上，是继承属性。进入TCB.run以后还有task.run，那是四类task各自原型上的方法，本轮没有把它移除。currentTcb是scheduler的own字段，state、task、queue是TCB的own字段，不能把字段读取和继承方法查找混起来。计数显示，每个完整Run有6573次选定TCB.run调用。实验仍然运行完整scheduler、出队和state更新、task方法、Packet以及原输入，每Run原queueCount等于2322、holdCount等于928的断言仍执行。这个图主要澄清对象关系，不代表已测出每一步的时间。（S5）

## 7. A/B改变的是方法准备频率（80秒）

这页想回答的问题：A/B具体改了什么，有哪些共享变化与残余混杂？

图中代码省略未变化的分支。A在循环里从this.currentTcb取run到局部变量；B在每次schedule开头取一次，循环复用。两边都用相同的fn.call(this.currentTcb)保持this和返回处理。这里的call并不是任由原型查找：driver在timer外捕获native Function.prototype.call，并把它作为目标TCB.run函数上不可写、不可配置的own call属性。这个新增函数布局属于两边共享的派生设计，不是未改原始direct call。计数里，选定lookup从336万降到512，TCB.run调用和另一处task.run lookup仍是336万。缓存每Run发生一次，也仍在timer内，不是计时前执行workload。尤其要注意，B同时移出了额外的own currentTcb读取和局部赋值。因此我把它称为方法查找准备对照，不能把改善全部归给prototype traversal。（S5）

## 8. 方法缓存对照：QuickJS耗时降低点估计约4.61%（95秒）

这页想回答的问题：最新180个正式样本观察到了什么，可信边界在哪里？

每组都使用N等于512，30个新进程，共180条。图上的点是中位数，线是实际raw算出的Q1到Q3，不是置信区间，也没有把IQR除以二画成对称误差棒。QuickJS从3.701降到3.531毫秒每Run，降低点估计约4.61%；V8和JSC分别约1.81%和1.29%。同一派生实验的QuickJS/V8时间比由1.707变成1.658，差距小幅收窄，但QuickJS仍然更慢。对于V8和JSC尤其要谨慎，点的改变量相对分布较小，部分区间重叠，图既不能证明显著性，也不能证明没有效果。我们没有独立多机器复现或统计显著性结论。更不能把这4.61%说成原Richards的lookup占比：A/B有共同call布局变化，也有不止lookup的改动，原基线3.645毫秒不是这次A。结果支持的是下一步值得验证的方向。（S5）

## 9. 当前证据支持继续检验，仍不足以独立归因（85秒）

这页想回答的问题：为什么不能根据lookup计数和收益直接下因果结论？

QuickJS冻结源码中，选定GET_FIELD_INLINE普通数据命中先测试receiver，再沿原型测试；当前选定命中只有一跳，意味着总共两次own-property测试。它在handler里返回方法，不走JS_GetPropertyInternal，所以只看那个通用helper热不热会漏掉这条路径；诊断的该site fallback也是零。这条源码和计数支持确实改变了方法准备频率，但不提供lookup self-time。点估计表明QuickJS对这组变化更敏感，可继续研究。仍不能排除的是额外own读取、赋值、字节码与函数布局、引用计数和对象/IC/GC状态。甚至相同call写法在三个VM里也不完全一样，JSC字节码有native-call身份guard、直接调用分支和fallback，不能声称它每次必经native call helper。精确成本、原工作量占比和独立因果份额都仍是UNKNOWN。（S5）

## 10. V8的总体优势还包含RegExp实现差异（65秒）

这页想回答的问题：关闭JS JIT以后，还有什么策略差异不能忽略？

QuickJS走C的regex VM，当前JSC选项关闭RegExp JIT并走Yarr解释器；V8不仅允许native正则，之前白盒诊断还实际观察到了执行。124个采样PC同时匹配已注册的RegExp代码区间和该进程可执行映射，比只看flag强。但这不代表所有pattern都证明native，也不能把采样数换成内部execution的精确占比。去掉正则或CodeLoad标签后，总GM也改变，不过那是换benchmark集合的描述性敏感性，不是扣除了正则的因果时间。滤掉这些case后仍有builtin/helper，不会变成纯dispatch。关键是把总体execution差距按机制拆开，不因为JS JIT关闭就把所有收益都算给一般字节码分发。（S3、S1、S2）

## 11. 下一步——验证小型继承方法缓存的净收益（65秒）

这页想回答的问题：下一步要如何把这个方向变成可检验的VM工程问题？

我建议下一步在独立upstream原型上做一个小型继承方法缓存，明确这只是计划，尚未实现。它需要receiver shape、原型identity或version、own shadowing这些guard，不能只缓存一个函数指针。第一是语义：覆盖own override、删除重定义、原型变更、getter和Proxy fallback，并保留this、返回、副作用与GC引用。第二是净成本：hit、miss、guard、失效、初始化和每site内存，不能只看命中时的时间。第三是回到未改的Richards以及相关、不相关workload，观察收益和回归，后面再做原生Linux独立复现。PIC、原型缓存和调用特化已有很多工程实现，创新还未形成。最后希望请导师确认“0.7/0.8”对应哪个引擎或分支及版本口径，而不是先替导师认定。（S5、P1–P4）

## A1 / 第12页：版本、计时与完成度（问答）

这页想回答的问题：样本量、版本和时钟修复是否被正确限定？

4560是不同campaign target数量的合计，不是可以混成一个共同排名的大样本。Code cache另有120producer。三个runtime都冻结路径和hash，V8的tag是源码参照，不是制品构建证明。Date.now失败数据仍保存，当前独立单调mode通过控制与逐样本内部/外部一致性门禁；并没有证明NTP或WSL墙钟根因已查明。SunSpider因中断跨两次boot恢复，host/kernel/输入/依赖hash通过，但频率、温度和后台负载不保证相同，不能说连续隔离运行。JSC首次frontend也仍可能计入。

## A2 / 第13页：子集与聚合规则（问答）

这页想回答的问题：GM如何聚合，去除标签后能说什么？

比值方向是分子时间除分母时间；先算组median，再算比值。SunSpider每case等权；Octane先对suite里的Run比值取GM，再对13suite等权。去正则标签或CodeLoad只改变所汇总的集合，不是把native/helper成本从原始时间里扣除。三个pair都用同一完整三引擎交集；全量和子集各自交集已保存，不能拿不同子集算三种pair再拼排名。

## A3 / 第14页：A/B语义与字节码（问答）

这页想回答的问题：`.call`共享设计与实际VM路径有什么区别？

两边在timer外固定目标函数的own call，使native intrinsic一致，但改变了函数布局，也使派生输入不同于原直接调用。QuickJS从get_field run取方法，接着get_field2 call和call_method1，经native js_function_call到JS调用；V8两边是CallProperty1，方法取值位置不同；JSC有identity guard/direct/fallback。27个sequence探针覆盖original/A/B、三引擎各三进程，receiver、输入、返回和state摘要一致，配合原断言支持当前输入语义；摘要有碰撞可能，不是形式化证明。计数按receiver原型与函数identity分离TCB/task run，且诊断构建开销不进入排名。

## A4 / 第15页：已有工作与来源（问答）

这页想回答的问题：候选技术与NG历史机制是什么关系，复现证据够到哪里？

PIC和方法特化不是新技术，资料使用已有一手检查记录。最新固定的NG v0.8.0源码检查显示own-slot PIC填充受proto_depth等于零限制；它不能证明当前Richards继承TCB.run已被缓存，更不能形成NG性能结论。full revision和完整本地源码SHA仍未知。官方PR884记录后来删除历史IC，也不能推出所有后续版本完全没有缓存。字节归档审计覆盖45个唯一code-cache输入，当前实际字节全部匹配运行hash；其中21个Git blob因CRLF归一化不同。现存字节已归档，不是全面历史恢复，也没有为这一轮重写旧SHA或raw。每页短来源对应source_map，最新180条正式结果及六组分布重算都在data_audit。
