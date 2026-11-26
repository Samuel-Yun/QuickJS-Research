# 一次性冷函数入口

已完成85条性能和17条负载正确性，审计/离线统计复算通过。核心相对READ_STORE慢0.28%，含zlib扩展快0.06%，区间均跨零；未确认超过最佳。完成结论见[summary.md](summary.md)，完整表见[results.md](results.md)。

首次调用准备ENTRY1已把CodeLoadClosure/JQuery相对READ_STORE降低5.73%/4.14%，但RayTrace增加8.78%、核心整体增加0.63%。本批只验证一个有针对性的修订COLD_ENTRY，继续基于原READ_STORE，不组合OWN2或S002。

保留ENTRY1的按首次调用准备及可选OOM回退，把准备检查移出JS_CallInternal：未准备的普通函数对象暂用新增的内部cold-bytecode类别，第一次调用经过已有class-call分支；准备或决定回退后切回原bytecode-function类别。共享同一b的其他冷闭包在各自第一次调用时只切换类别，不重复准备。后续新闭包若b已ready则直接保留原类别。热JS_CallInternal主体源码与READ_STORE逐字相同，生成器对此做断言；机器码布局和最终耗时仍须检查。

首次调用保留原flags、this、new.target和argv所有权，构造调用经原构造逻辑返回。generator/async继续eager准备。cold类别使用原bytecode的mark/finalizer，函数识别、realm、toString、内存核算和class prototype覆盖新类别。记录仍24B、函数头仍144B、对象结构不变，但增加一个内部class注册及每context一个class-prototype槽。JS_GetClassID可观察首次调用前后的内部类别变化，不能据常规JS通过宣称全C API/ABI等效。

检查包括原语义/C API保存加载/GC/native finalizer、ASan/UBSan，以及专门的冷/热类别、共享b闭包、首次OOM、never-called冷闭包cycle、跨context构造realm、参数赋空时native finalizer先于后续语句的顺序。JS用例覆盖constructor/new.target、继承super、bind、Proxy、Function.toString、箭头不可构造、arguments、递归与generator/async。LSan依既有环境限制关闭，没有完整test262或完整OOM覆盖。

完整17项Octane每项5个新进程，共85条新性能样本。旧A/PREP2/READ_STORE/ENTRY1均复用已有Ubuntu归档，不跑SunSpider/V8_OFF，不追加旧对照。GCC15.2、CPU2、原输入/N/首次Run边界及-O2/-g/-fwrapv/HAVE_CLOSEFROM沿用；不增加NDEBUG/LTO/PGO/march=native。一个固定ELF跑全部表项。

运行`python3 -u -B run.py all`；冻结后不改runner、生成器、候选源码、probe、测试或输入，不覆盖失败token。实际完成状态以audit.json为准。`python3 -B review.py`只做离线统计审计。旧对照跨批次，探索区间不包含未观测的环境漂移；五轮不能证明稳定不退化。

本批是attempt09的独立修订。attempt09因新probe误用双参数JS_NewClassID在采样前停止，性能0条，旧runner/probe/源码/失败记录和归档保留。修正后的单参数probe在attempt09/diagnostics独立通过；本批probe与该修正版逐字相同。候选引擎32文件不变，复用原Release及ASan/UBSan ELF和对象文件的精确SHA，重做语义/C API/ASan检查及机制probe后再采17条负载正确性和85条性能，不混入旧失败批次样本。build_reuse与probe_reuse记录原构建、源文件与制品来源。
