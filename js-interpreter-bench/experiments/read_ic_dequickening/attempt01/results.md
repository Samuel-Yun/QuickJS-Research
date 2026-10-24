# K=32永久退出MIC：减少了重复入口，但没有净超过原版

## 做了什么，实际完成多少

从myx/`7dca3cdc8461c5576a4d63badbcf295bf0ad4f7c`的干净工作区起步，保留历史数据。
底座仍是upstream QuickJS2026-06-04 / `04be246001599f5995fa2f2d8c91a0f198d3f34c`。
同一WSL2 Ubuntu24.04.2/x86_64、Ryzen5800H、GCC13.3.0，官方`-O2 -g -fwrapv`，保留断言，无LTO/PGO。
A/M逐文件恢复原源字节并新构建；R只从M增加固定K32退出策略，不含SW开关，不试其它阈值/布局。
实际源/制品/命令及完整SHA见[manifest](manifest.json)、[源码身份](sources/identities.json)、[M→R补丁](patches/M_to_R.patch)。

**2160/2160条正式样本有效**：16个Octane Run×3版×30=1440，8个micro×3版×30=720。
每项同N，九进程pilot均>=1秒；六排列各5次，位置各10次。无失败、重试、异常值删除或偏短正式样本。
另完成48个workload诊断、18个机制诊断、144个独立GNU time RSS进程。
全部测量串行，不与构建/诊断/RSS并行，原始记录见[raw](raw/)，数量/身份/时钟/顺序见[主审计](analysis/audit.json)。

内部区间是N次原Run，除以N为ms/Run；micro每完整Run4096轮。Setup/静态编译在外，首次Run在内，无额外workload预跑。
必需Setup可能已经访问函数/字段；全区间不叫全冷态。GC/helper/builtin/regexp/动态编译仍计入。
静态eager分配在内部区间外、体现在外部时间/内存；动态compile的分配按原Run计入，没有取消分配。
内部是CLOCK_MONOTONIC绝对ms，父是同域绝对ns，UTC只作日期。不是单个guard/hash的self-time。

## 1. R是否真的退出了，而不只是少计了查询？

是。每site初值0，guard成功将非零streak清0；失败递增，第32次在正常读取前恢复普通opcode/atom，之后永久普通读取。
同长5字节，跳转、栈效果和get_field2的receiver保持。site数组不回收；atom额外所有权、幂等退出及释放顺序见[ownership.md](ownership.md)。

实测site由M16变为R24字节，增加8字节（50%）；函数头组件仍16字节，JSRuntime不加mode。
正式`.text`：M762514、R763186字节。命中新增streak读检查及条件清0，实际机器码保留跳过store的分支，见[机器码说明](machinecode/notes.md)。
这些都是R的真实成本，不把新增counter说成零开销。

边界诊断31次miss仍为IC opcode244；32次后为普通get_field的61及真实atom，方法为get_field2的62。
poly2/4/8目标N2各8192次读：M为8192查询/0命中/8191替换；R为32查询/0命中/31更新，随后8160次普通读。
当前第32次只计最后一个IC miss。原普通handler确实继续真实hash查找，而不是跳过读取。
见[真实退出表](correctness/exit_state_checks.csv)、[目标site记录](correctness/target_sites.json)。
少的是MIC入口/维护，不是JS属性操作次数，也不能说总字节码dispatch因此消失。

## 2. 对M是否有净收益？对A呢？

完整24项绝对时间、N、有效数及三个比较的区间见[逐项表](analysis/tables.md)，机器可读见[summary.csv](analysis/summary.csv)。
以下为R相对M的内部中位时间变化；比值M/R>1才是R快：

| 负载 | R/M耗时变化 | M/R [探索性95%区间] |
|---|---:|---|
| RegExp | −12.25% | 1.1396 [1.1284,1.1533] |
| RayTrace | −1.45% | 1.0147 [1.0061,1.0278] |
| poly2 / poly4 / poly8 | −6.72% / −6.84% / −6.20% | 三者区间均高于1 |
| CodeLoadClosure / JQuery | −3.33% / −4.69% | 两者区间均高于1 |
| own_integer / own_reference | +8.70% / +4.31% | 两者区间均低于1 |
| own_method | −10.61% | 1.1187 [1.1081,1.1296] |
| Richards | +3.51% | 0.9661 [0.9501,0.9763] |
| NavierStokes / Gameboy | +6.49% / +3.07% | 两者区间均低于1 |
| Splay / Typescript | +1.06% / +1.02% | 两者区间跨1，方向不明确 |

逐项10000次三元组配对bootstrap，固定seed，区间是探索性的，没有多重检验校正。
mean、样本std、Tukey Q1/Q3/IQR、min/max在[statistics.csv](analysis/statistics.csv)。
区间图例如[M/R](analysis/execution_MR.svg)、[A/R](analysis/execution_AR.svg)。

Octane按suite内子项GM再suite等权，共享完整rep轮次分块bootstrap10000次：

| 范围 | A/R [95%区间] | M/R [95%区间] | A/M [95%区间] |
|---|---|---|---|
| 主：14单元/12suite，排除Crypto | 0.9852 [0.9815,0.9908] | 1.0051 [1.0010,1.0107] | 0.9802 [0.9764,0.9845] |
| 敏感性：16单元/13suite，含Crypto | 0.9868 [0.9835,0.9918] | 1.0029 [0.9994,1.0078] | 0.9840 [0.9804,0.9879] |

主汇总支持R相对M的小幅方向性改善，**不支持超过A**。含Crypto的M/R方向不明确；没有据此改主指标。
这不是官方Octane分数或总耗时之比，micro不进GM，历史时间没有代入。定义和每suite数值见[aggregate.json](analysis/aggregate.json)。
Crypto仍用历史driver，随机padding未逐组对齐，预先只进敏感性汇总；上轮三个seed/N2的新方案没有混进本轮。
Box2D/zlib/官方latency仍保留既有覆盖边界。

具体对A：RegExp与三种poly的A/R区间跨1，接近A的点估计不是“证明等效”；RayTrace仍比A慢11.37%。
Richards的R/A方向不明确，而M在本批次仍比A低4.78%。DeltaBlue、Boyer、Mandreel、Typescript保留相对A的部分收益，但没有整体净加速。

## 3. 稳定读、own_method与Richards付出了什么？

独立选定工作量中，稳定整数/引用/method三项都**没有任何退出**，命中数保持相同。
整数/引用变慢，说明保留了命中并不等于保留原M的时间；新增streak、24字节stride、元数据及生成代码共同进入净比较。
own_method无退出却快10.61%，**这一改善不能由退出触发来解释**，不是单独调用成本减少的证明。

Richards M有103358529查询、82640297命中；R有82641569查询、20716960次post读，命中仍82640297。
35个site退出，却没有释放既有shape边，更新均105次；同源唯一静态点对齐也没有hit差。
R的hits/IC_queries看似接近100%，但hits/total_site_reads仍约79.95%，实际时间反而高3.51%。
这是分母不能混用的直接例子，不说明额外检查的每一步独立耗时。

## 4. RegExp、Splay和Typescript把原因缩小到哪里？

RegExp总读数仍1120922、命中仍14。IC查询从1120922降到24306，post读1096616，758次退出；更新仍19次。
该site上下文的真实find_own_property调用两边同为1440433，退出释放shape边为0。
所以减少了重复IC入口/准入等工作，**没有减少这些已计数的普通查找**；与时间改善一致，但控制例中的代码派生变化使精确时间贡献仍未知。
该hash计数不覆盖不经find_own_property的其它helper，不能称所有查找的self-time。

Splay两边替换均9650057次、命中均12268391；R退出22点，主要替换点却没有退出。
例如可唯一对齐的匿名函数PC43/key，替换两边均1118759、R退出0。
这说明高总miss不等于达到连续32miss；本策略没有减少这里的主要替换，没有为了Splay换阈值。

Typescript更新4080692→499494、替换4069435→488239，但命中53822815→52412389，真实hash调用增加1410426。
唯一可对齐退出点的hit差为−1403171，未退出点为0；其余差异只能按canonical family聚合，不强配实例。
例如isParenthesized、nodeType等位置既减少维护，也失去后续命中机会，净时间方向仍不明确。
RayTrace三个唯一isHit点也少15550次命中，未退出点的命中差为0。
这是具体位置相关证据，不把它们换算成精确耗时。
完整源SHA/规范码/atom/PC及family限制见[位置对齐结果](analysis/lifetime_site_alignment.json)、[简短位置表](analysis/site_findings.md)。匿名名为空时以规范身份定位，不猜函数名。

## 5. 没有目标读取的控制说明什么？

numeric_control目标没有属性读，R全进程也没有退出，但比M高8.23%；write_control方向不明确。
普通写源码未改，也不加写IC。这些变化必须保留为非目标路径/代码生成/局部性或运行环境影响，不能记作退出策略的直接收益。
同时，R没有退出的own_method却变快，说明不能把所有正变化也都归给退出。

## 6. 创建与内存成本是否解决？

没有取消eager数组，也没有回收退出slot的存储。CodeLoad独立诊断双方N8，**不是正式Closure N2048/JQuery N128**。
Closure在这个N8诊断里创建1913个site，仅105个使用，155次查询、7命中、0退出；M/R直接请求38992/54296字节，峰值30816/42648。
这没有给正式N2048的改善提供退出归因，也不能反推正式进程同样0退出。
JQuery N8创建24689点，请求464336/661848字节，R退出24点但没有释放旧shape边。

独立GNU time每条件3进程，KiB中位数：

| 负载 | A | M | R |
|---|---:|---:|---:|
| Richards | 3416 | 3388 | 3444 |
| RegExp | 6716 | 6644 | 6700 |
| Splay | 147212 | 147400 | 147344 |
| Closure | 61720 | 69132 | 71612 |
| JQuery | 7308 | 7684 | 7804 |
| Typescript | 100868 | 103520 | 103744 |

Closure的R相对M又增加2480KiB，不能说解决了创建负担。其它小差异不能用三样本证明相等或全归给某项元数据。
请求字节、缓存shape边、RSS和间接对象图不是一个指标；间接保活字节UNKNOWN。诊断各版释放后直接live/shape边均0。
完整分布见[memory.csv](analysis/memory.csv)，计数见[diagnostic_comparison.csv](analysis/diagnostic_comparison.csv)。

端到端另报整个N次Run的ms/process：Richards A1912.906/M1819.315/R1884.316；RegExp A1620.111/M1852.154/R1620.595；
Closure A1426.154/M1557.463/R1527.503。见[end_to_end.csv](analysis/end_to_end.csv)，不相减中位数求初始化或单次miss成本。

## 7. 永久退出失去了什么机会？

小诊断先40次继承读取再128次稳定own：M后段有127次命中，R在32次miss退出，后面136次全部普通读取。
先8次own再40次继承再128次own：M共135命中，R只保留退出前7命中。结果仍正确，永久性确实放弃后续命中。
这只是频率/状态证据，没有把phase例子加入GM或再做一轮性能矩阵，也没有临时增加恢复策略。
见[phase_changes.json](correctness/phase_changes.json)。

## 8. M→ON桥接确认了什么，仍不知道什么？

最终环境匹配48条小样本中，ON比M的numeric_control中位时间高10.67%、Richards高2.18%。
独立N2诊断的规范最终码/atom和逐函数dispatch完全一致；数值目标无属性读，不进入mode命中分支。
实际JS_CallInternal布局/大小变了，局部栈预留同为0x248；perf不可用，寄存器、I-cache、调度等贡献仍UNKNOWN。
不能叫一次mode判断成本，也不把桥接M时间和主M/R时间相除。

初版48条M少传旧mode占位，发现后明确标为配置偏差，原数据保留；主所有VM阶段结束后才另收匹配48条及4个诊断。
最终桥接48条不与初版合并，原A/M/R配置和2160条样本不变，也不把两批差异归因于环境变量。
详见[bridge_check/results.md](bridge_check/results.md)、[偏差记录](bridge_check/protocol_issue.md)。没有追padding/flag或调开关跑分。

## 正确性、复现与剩余限制

旧回归/上游/smoke、23个新JS场景1814断言、3个私有C场景72断言、R针对性ASan/UBSan通过。
GC1800函数、OOM192预算、getter/Proxy/异常重入、共享compiled bytecode、混合态保存加载、qjsc及ROM加载重置通过。
私有C实际检查atom dup增1、重复退出不再增、site/ordinary operand销毁合计减2；全suite全atom池逐次refcount没有插桩，不冒称全局实测。
未跑完整test262。证据见[correctness](correctness/)、[机器码](machinecode/)。

74个诊断归档保留压缩/解压双SHA；A/M/R源及ELF收尾核验无变化。
Windows标准库在两个新目录重算22个输出，两次均通过预声明rel/abs=1e-12，且前后hash确认原raw/统计输出未改；无旧ELF或缓存CSV依赖。
命令见[README](README.md)，重放审计见[replays](replays/)。历史tracked文件、原raw、原hash均未重写，未提交/推送。

全进程诊断可能受插桩、Setup和计数范围影响，不是正式分支逐次记录；CodeLoad仅N8。
WSL宿主功耗/频率/后台不受控，探索性区间不消除系统偏差。代码布局、缓存维护、bookkeeping和GC等净成本尚未分开。
不能把总时间差除以miss次数当精确单步成本，也不能凭几个micro给引擎总体排名。

**下一轮只建议问一件事：在没有退出的目标上，R/M的native执行差异主要落在哪里？**
own_method无退出却快、numeric_control无目标读却慢，是先定位生成代码/非目标影响的直接理由；在这之前不继续调K或追加第二策略。
