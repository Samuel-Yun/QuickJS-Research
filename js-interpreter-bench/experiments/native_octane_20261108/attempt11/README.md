# EVAL_COLD：只延迟动态eval来源的准备

已完成85条性能、17条负载正确性及专项/ASan/UBSan，采样审计和独立统计复算通过。核心相对A -5.51%、相对READ_STORE -0.52%，扩展分别-5.70%/-0.78%；保留为新的探索最佳候选，尚未同批多轮确认。见[summary.md](summary.md)和[完整17项](results.md)。

基于READ_STORE，复用COLD_ENTRY的一次性冷调用类别，但在编译器中检查仍存活的函数定义祖先：仅direct/indirect eval产生的普通函数及其子函数延迟准备，包含Function构造器。普通全局脚本、module、保存加载的字节码和generator/async继续eager准备。来源由语言语义决定，不识别benchmark、文件名或函数名，不调整原Run边界。一个固定ELF跑完整17项。

假设来自attempt08/10独立计数：全局延迟让CodeLoad少准备大量未调用函数，但把RayTrace等静态函数准备从Run前移进Run。该修订保留静态时机，仅让动态编译来源使用延迟策略，不假定它一定改善时间。新增编译期祖先遍历同样会进入动态编译成本。

热JS_CallInternal主体与READ_STORE逐字相同，记录24B、函数头144B、对象结构不增长。仍增加一个内部class及每context一个prototype槽；JS_GetClassID可观察冷/热类别变化，不宣称全C API/ABI等效。首次准备的可选分配失败保留普通图像与原异常状态，ready置位后不重试；不是全面OOM覆盖。

新probe覆盖静态eager、direct eval/Function产生冷函数、共享字节码闭包、冷闭包cycle、跨context构造realm、原生参数释放顺序、首次OOM及热保存加载、P1/B2/shared-store命中。原JS语义测试在普通脚本和间接eval中各执行一次；沿用native保存加载/GC/reentrant store与ASan/UBSan。LSan关闭，没有完整test262。

每项5个独立进程共85条新性能样本，17条N1负载正确性。复用A/PREP2/READ_STORE/COLD_ENTRY旧归档，不重跑对照，不跑SunSpider/V8_OFF。原N/输入、CPU2、GCC15.2、-O2/-g/-fwrapv/HAVE_CLOSEFROM不变，不用LTO/PGO/NDEBUG/march=native。负值代表耗时降低；核心按16项/13suite分层，扩展含zlib按17项/14suite分层。五轮跨批次探索，bootstrap区间不覆盖未观测的环境漂移。

运行`python3 -u -B run.py all`，再用`python3 -B review.py`离线复核。prepare后不更改runner、生成器、候选源码、probe或测试，不覆盖失败token。以audit.json和summary.md记录实际完成状态。
