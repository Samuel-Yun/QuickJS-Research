# EVAL_COLD五轮探索

新候选在本次跨批次五轮比较中超过READ_STORE的整体点估计。85条新性能、17条N1负载正确性、18项专项/ASan/UBSan/private probe均通过，原始采样审计与独立统计复算通过。一个固定ELF测完整17项，不重测旧对照、不追加轮数。

|比较|核心16项/13suite耗时变化|含zlib扩展17项/14suite耗时变化|
|---|---:|---:|
|相对A|-5.51%|-5.70%|
|相对PREP2|-0.75%|-0.95%|
|相对READ_STORE|-0.52%|-0.78%|
|相对全局COLD_ENTRY|-0.79%|-0.72%|

相对READ_STORE核心变化的95%探索区间[-0.741%, -0.370%]，扩展[-0.991%, -0.616%]，均不跨零。是探索阶段新最佳候选；旧对照来自同机同boot的前批，不含未观测系统漂移，五轮区间不是最终同批确认。完整原始五次统计、区间和17项对照见[results.md](results.md)、[statistics.csv](statistics.csv)、[aggregate.csv](aggregate.csv)。

|项目|READ_STORE ms/Run|EVAL_COLD ms/Run|相对READ_STORE|相对A|
|---|---:|---:|---:|---:|
|Splay|1.50561|1.46839|-2.47%|+1.51%|
|CodeLoad.Closure|0.51846|0.49081|-5.33%|+2.44%|
|CodeLoad.JQuery|9.25680|8.94423|-3.38%|+1.51%|
|NavierStokes|41.50613|42.62834|+2.70%|-2.88%|
|RayTrace|28.06210|28.50240|+1.57%|-6.81%|
|DeltaBlue|4.78171|4.83454|+1.10%|-16.79%|
|Typescript|1415.00004|1428.55398|+0.96%|-6.84%|

三目标更接近A，仍未恢复到A；其他14项有7项中位数回退，其中3项探索区间在回退方向。整体改善不等于逐项不退化。完整表保留全部回退，不挑选单项拼接版本。

实现：编译器沿仍存活的JSFunctionDef祖先寻找direct/indirect eval来源，只有这类普通函数延迟IC准备（包括Function构造器），第一次调用经过COLD_ENTRY的内部class-call入口，准备或可选OOM回退后变回普通bytecode class。普通脚本、module、载入字节码与generator/async保持eager。检查不依赖benchmark/文件/函数名，不改变计时边界，也不增长记录24B/函数头144B。热JS_CallInternal源码与READ_STORE相同。

保留一个额外内部class及每context一个prototype槽；JS_GetClassID可观察首次调用前后的类别变化，不能当作全C API/ABI兼容发布。专项覆盖静态eager、direct eval/Function冷类别、共享b闭包、never-called cycle、参数赋空的native finalizer顺序、跨context new.target realm、首次可选OOM、热保存加载和P1/B2/shared-store命中。JS用例分别在静态和间接eval下执行。LSan关闭，没有完整test262或全OOM覆盖。

性能结束后的独立N1计数只包围原Run，排除Setup和事后验证，不计入85条性能：

|案例|READ_STORE准备调用/读点/请求字节|全局COLD_ENTRY|EVAL_COLD|
|---|---|---|---|
|CodeLoad.Closure|59 / 219 / 9328|10 / 37 / 2288|4 / 31 / 2056|
|CodeLoad.JQuery|535 / 3066 / 133192|73 / 510 / 26272|57 / 504 / 26040|
|RayTrace|0 / 0 / 0|40 / 498 / 16904|0 / 0 / 0|
|Richards|0 / 0 / 0|32 / 124 / 4712|0 / 0 / 0|
|Boyer|0 / 0 / 0|32 / 136 / 5704|0 / 0 / 0|
|Splay|0 / 0 / 0|4 / 34 / 1200|0 / 0 / 0|
|Mandreel|0 / 0 / 0|60 / 21 / 4408|0 / 0 / 0|

准备策略的工作量和时机变化符合假设。非eval负载也有时间变化，例如Splay/Mandreel在两个版本的本次诊断中均无Run内准备，不能把它们的时间改善直接归因于省去准备。native布局、堆分配时序和跨批次漂移仍未分离；计数不是周期归因，N1不代表正式N总量。post_counts独立ELF/脚本/源码SHA及压缩原始归档均保留。

五次CV中位数0.30%，15/17项低于1%，最大RayTrace为1.21%。仅作敏感性诊断，去掉Mandreel及zlib后剩余核心相对READ_STORE为-0.39%，正式分数仍保留全部原集合。最终确认应预先固定多轮、同批交错A/READ_STORE/EVAL_COLD，不根据是否显著反复加轮。
