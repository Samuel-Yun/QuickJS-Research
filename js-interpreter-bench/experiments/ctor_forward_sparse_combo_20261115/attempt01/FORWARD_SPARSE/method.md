# 第一轮 + 第三轮：FORWARD_SPARSE

本次用户明确要求把第二批四轮实验的第1轮FORWARD_CTOR_IC与第3轮SPARSE_CTOR_IC合并，分别沿用其现有实现，不合入第2轮票据，不合入任何旧“3+4”组合或本轮第4轮。固定底座仍为独立R3 CONSTRUCTOR_PLAN_IC（在C上）。本次每项正式计时1个新进程，完整Octane17/SunSpider26各一轮，两个单版及R3引用原成绩，不重新跑它们的正式全集。

构建器先从冻结R3源包按原第一轮builder得到FORWARD，再应用原第三轮sparse.apply，所有原builder/include文件hash写入manifest provenance；另核对它们生成的单版source与当时单版manifest完全相同。组合没有另加优化救成绩。独立计数中的follow[0..11]留给sparse，forward计数移至[12..19]，避免原来相同编号混计；Release宏仍为空。

执行路径：不支持R3纯字段构造模板的wrapper由sparse负缓存跳过反复模板解析，但实际构造和包装体仍运行；包装体进入FORWARD快路时免去arguments对象及apply参数列表，用真实argc/argv转发到初始化函数。普通合格构造继续通过32B小记录指向按需分配的96B完整计划，守卫和分配/字段写入与原SPARSE一致。两类位点保留独立记录；GC mark/free均处理forward函数强引用、sparse负缓存及完整计划。FwdSite仍48B，full plan96B，cold slot32B；每函数forward指针8B与每runtime动态forward上下文8B按原第一轮保留。保存时恢复原special_object/call_constructor等字节码，未引入新编码。

定向验证：R3、原FORWARD、原SPARSE、组合Release/counts/ASan+UBSan六构建对同一组额外/少参、apply/target改写、getter/Proxy/抛错/this/递归、冷→热及同点目标替换、原型setter/删除的输出一致。混合样例同一进程FORWARD命中499,998次、构造计划命中499,996次，确认二者实际共存。准备后的两种内部opcode普通/ROM保存加载、显式GC、循环引用及两个realm通过。ASan/UBSan使用detect_leaks=0（当前sandbox的LSan不可用）。详见qualification/gate.json及runs.jsonl。各微基准是单次局部观察，不计入全集表，不作为叠加结论。

正式计时沿用native_confirmation_20261108/attempt02的原脚本、输入、N、CPU2、Asia/Shanghai、LC_ALL/LANG=C、Setup/Run边界，首个Run计入且无额外预热。独立counts进程确认覆盖，不进入时间表。Release期间不编译或并发跑其它基准。所有表项和最大回退保留。

相对R3及两个单版均为跨批次单轮筛选；A/EVAL_COLD/V8_ON是历史30轮中位数。Octane按14 suite分层等权GM；SunSpider26项等权GM并附逐项和。百分比不相加，不将计数构建命中数当作Release实际命中率，也不报告单轮显著性。

产物：release.patch相对R3；incremental_vs_FORWARD.patch、incremental_vs_SPARSE.patch；source.tar.gz/source.sha256，三种构建manifest，qualification，独立counts及release原始process记录与完整逐项CSV。目录外旧实验和用户已有改动保持原样，未自动push。

复现见../REPRODUCE.md。阶段性运行的命令：build.py release/counts/san → qualify.py → sequence.py FORWARD_SPARSE counts → sequence.py FORWARD_SPARSE release → analyze.py → audit.py。构建目录必须为空，防止覆盖历史样本。已有源包可解压到新目录直接make编译。

组合实际计数：RayTrace参数直传3,246,080次、原模板解析104次、负缓存8,524,234次，66个cold槽0个full plan；Boyer构造计划8,211,289次命中，1985槽1863个完整计划；Tree独立计数构建10,558,564次构造计划命中。只说明两条路径都保留，诊断构建改变布局，不当作计时Release进程的实际命中数。所有记录的单版source、组合source和元数据改动均保留，不回改旧成绩。

## 本次判定

未观察到净叠加收益。组合相对R3：Octane -0.8756%，SunSpider +0.9671%；组合相对单独第一轮分别+0.0237%/+1.3714%，相对单独第三轮+0.0106%/+1.8179%。Octane三个版本差距极小，跨批次单轮不能按0.01%量级差异排名；SunSpider本轮方向为回退。SunSpider之和：R3 393.0469ms、第一轮391.4414ms、第三轮389.5728ms、组合393.8915ms。

关键表项：RayTrace组合26.3929ms（R3 26.9678、第一轮26.4232、第三轮27.7063），显示参数直传局部效果保留；Boyer组合56.0432ms（第一轮56.2061、第三轮54.7713）；Tree组合6.2218ms（R3 4.7762、第一轮4.8208、第三轮6.0916），相对R3+30.2649%、相对第三轮+2.1372%。所有逐项回退在下表保留。

两条路径均生效，但重复模板解析本身成本有限，不能把省掉的工作量直接相加成端到端收益。组合也保留了已激活记录多一层指针、元数据和原R3的shape/GC条件。仅凭这次单轮不能把回退精确归因到某一个成本，不能宣称统计显著性，也不通过添加其它优化或追加轮数救成绩。当前证据不支持用组合替换两个单版。
