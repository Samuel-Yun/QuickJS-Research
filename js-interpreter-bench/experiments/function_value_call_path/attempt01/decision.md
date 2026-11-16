# 本轮收敛：暂不推荐一个尚未测定成本的优化

唯一要补的证据是：**localCallLoop的每次call1进入普通bytecode JS_CallInternal，再正常返回caller，这段入口/退出相对于其余已执行循环与step占多少native成本。**

具体范围：冻结A quickjs.c的17787–17875（poll、tag/class、参数区、stack/frame建立）及20699–20710（正常清理/恢复），caller的18175–18202（plain call及返回处理）；M对照用source_evidence/M/entry_and_frame.txt与actual_return_cleanup.txt的实际行号。只关注这一个公共调用边界，不将新的IC、融合指令或receiver改写列作并列候选。

为什么到这里：实测local每Run只有1次目标字段读取，两个call案例全部进入ordinary bytecode分支而非class-call回退；M/V8在local仍约1.331。另一方面，两个不调用控制也已约1.28–1.31，M函数值/数字值比约0.991且区间跨1。它们不支持直接宣布frame、引用计数或读取是主因；不能用跨案例总时间相减分解。

取得这一个分区成本证据后，才能决定是否值得对该既有入口/退出提出最小改动假设。若成本并不集中于此，应撤销其优先级，而非以调用次数多代替耗时证据。本轮没有相应低扰动native成本测量；不为此安装perf、扩大工具链或用高扰动计时包住每次调用。实际class分支计数已经取得，不把缺少成本归因写成整轮未完成。

任何未来改动仍必须保持receiver、实参数量/借用、返回值所有权、异常传播、interrupt/stack检查和引用语义。本轮不实施它，也不声称本小程序解释了Richards总体差距。
