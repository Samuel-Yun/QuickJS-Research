# 只回看 Splay 与两个 CodeLoad 表项

本次只读历史统计、方法定义和既有质量标签，不构建、不启动 JS 引擎、不采集性能样本。
`python3 -B review.py`生成1233条比较记录，包含重复测量和单次筛选，不能将行数理解为新增样本数。
来源SHA见audit.json，明细见target_comparisons.csv。重点复测结果另外核对了统计表中位数的比值。
没有重新逐进程审计所有历史raw；没有把不同批次或主机的数据合并。

下表均为耗时变化 `(候选/同批A-1)*100%`，负数更快，正数更慢。
旧结果是Windows宿主上的WSL2/Ryzen5800H/GCC13.3；后列原生Ubuntu结果另报。
每个候选使用其自己批次的A，不共用一个跨批次的A时间。

## 重复测量中值得保留的线索

|版本|每条件轮数|Splay/A|Closure/A|JQuery/A|Splay/s001|
|---|---:|---:|---:|---:|---:|
|AQ1|3|+0.48%|+12.38%|+5.50%|-3.94%|
|L030|4|+1.46%|+7.41%|+4.10%|-3.27%|
|P013|4|+2.40%|+8.15%|+4.43%|-3.38%|
|IO2_LAYOUT|3|+2.72%|+10.63%|+4.56%|-2.21%|
|AP1|3|+3.35%|+14.01%|+6.55%|-2.00%|
|H015|4|+6.49%|+3.69%|+2.07%|+1.29%|
|mx019|5|+5.31%|+2.95%|+2.30%|-1.01%|
|E（attempt03）|30|+6.55%|+2.80%|+3.48%|无同批s001|

- AQ1：观察8次后单态特化，连续4次失配退回普通opcode，冷却后有界再准入。Splay最接近A的复测点，但v7为EXPLORATORY_CLOCK_LIMITED，不能确认0.48%的差距或可靠净收益。其Splay/A探索区间为[0.988487,1.018933]，bootstrap不覆盖系统时钟误差。
- L030：6槽分离shape数组与受检uint16字段下标；P013：4槽多态缓存。Splay相对s001的探索区间分别[0.965375,0.969784]、[0.942281,0.974335]，支持回收部分父版退化。相对A分别仍慢1.46%、2.40%，L030/A区间跨1。这两版CodeLoad也未回到A。
- IO2_LAYOUT：普通小对象尾部内嵌2个属性槽；AP1：第二种shape才分配2槽表，之后扩至4槽。两者v7计时受限，减少分配或提高命中不等于耗时已超过A。
- H015：shape内一个字段下标提示，fill-only更新。JQuery/s001=-0.70%，探索区间[0.975622,0.997329]；Closure/s001=+0.26%，区间跨1。不是两个CodeLoad同时显著提速。
- mx019：复用原缓存下标做受检预测，以及已知对象标签的receiver释放。JQuery/s001=-0.83%，Closure/s001=-0.63%（后者区间跨1）。仍慢于各自同批A。
- E的attempt02部分三轮曾出现Splay/A=-1.16%；之后相同E制品在attempt03完整30轮变成+6.55%。不把部分批次点估计当作已确认的Splay赢家。

来源：[v3四轮](../../experiments/ic_search_lab/v3_mass_search/exploration.level3.ratios.csv)、[v4五轮](../../experiments/ic_search_lab/v4_refine_s001/recheck.per_case.csv)、[v7三轮及五轮](../../experiments/ic_search_lab/v7_adaptive_layout/comparison_octane.csv)、[E三十轮](../../experiments/v8_inspired_ic/attempt03/summary/comparison.csv)。

## 单次筛选中的局部信号，尚无独立复测

|版本|样本层级|Splay/A|Closure/A|JQuery/A|
|---|---|---:|---:|---:|
|S002|一次有效短测，trial1|-7.66%|-4.32%|未测|
|S006|完整套件单次|+2.87%|-0.62%|-0.10%|
|S010|完整套件单次|-0.42%|-0.81%|+4.32%|
|S012|完整套件单次|+8.49%|-1.63%|+0.64%|
|mx039|完整套件单次|+8.54%|+5.13%|-0.61%|

S002/S006/S010/S012分别对不超过2/3/4/4个属性的合格普通对象做短线性扫描，S012逆序，其余正序。
它们来自当时IC搜索，但直接基于A，修改find_own_property，并未启用s001/PREP2的读IC。
因此这些数字是普通查找优化的线索，不能当作已消除IC准备/元数据成本的证据，也不能保证叠加到PREP2后仍接近A。
S002仅有两个目标表项的短测，另一trial0为UNSTABLE；两次全部保留，未合并或挑最快值。
S006在两个CodeLoad上最均衡地接近A，S010对Splay/Closure有小信号，S012对Closure最突出但Splay回退明显。
mx039组合提前读取shape、复用下标预测后提升缓存、已知标签释放；只有JQuery出现-0.61%的单点，不满足三项同时恢复。
这些单次数据没有CI，微小负值不能视作已确认加速。

来源：[v3短测](../../experiments/ic_search_lab/v3_mass_search/exploration.per_case.csv)、[v3完整单次](../../experiments/ic_search_lab/v3_mass_search/exploration.level2.per_case.csv)、[v4完整单次](../../experiments/ic_search_lab/v4_refine_s001/screen.per_case.csv)。方法定义见v3的generate.py、exploration.candidates.csv及v4的candidates.csv和补丁。

## L1延迟准备：大幅相对A下降必须核对s001

L1第3次安全普通函数入口才尝试准备IC，函数头144B增至152B。

|三轮批次/版本|Closure/A|JQuery/A|Closure/s001|JQuery/s001|
|---|---:|---:|---:|---:|
|accept01 / L1|+4.71%|+6.72%|+2.31%|+1.83%|
|expand01 / s001|-19.33%|-3.57%|0.00%|0.00%|
|expand01 / L1|-17.70%|-4.53%|+2.02%|-1.00%|
|expand01 / P1|-18.63%|-2.14%|+0.87%|+1.48%|

expand01的Closure大幅下降并不是L1/P1对s001的新增改善。
L1在JQuery上有约1%的父版改善点，但另一独立批次相反，尚无稳定解决两个CodeLoad的结论。
来源：[accept01](../../experiments/ic_search_lab/v6_targeted_ic/full_accept01_octane.times_and_parent_ratios.csv)、[expand01](../../experiments/ic_search_lab/v6_targeted_ic/full_expand01_octane.times_and_parent_ratios.csv)。

## 已有原生Ubuntu数据另列

每项5个进程，以下均使用本机同批A。

|版本|Splay/A|Closure/A|JQuery/A|
|---|---:|---:|---:|
|s001|+1.89%|+7.35%|+4.00%|
|mx019|+1.98%|+7.48%|+3.35%|
|d03|+0.79%|+7.67%|+3.89%|
|P1|+1.39%|+7.21%|+3.49%|
|B2|+2.55%|+10.51%|+6.24%|

d03是已在本机复现、Splay较接近A的线索，但两个CodeLoad仍退化。
新PREP2/COALLOC/FUSE_A1L1/CALL02/CHAIN2/READ_STORE的这三项也已在明细中保留，均没有三个表项同时恢复A的点估计。
来源：[原生Ubuntu第一批](../../experiments/native_octane_20261107/attempt01/statistics.csv)及后续各批冻结statistics.csv；后续跨批复用A均显式标记。

本次没有发现已验证能把三项一起恢复至A的现成IC版本。Splay优先保留AQ1和L030/P013的机制线索；CodeLoad保留S006/S012的普通查找线索及L1冷函数准备的研究问题。未检查这些方向与PREP2组合后的其他表项，不能承诺它们不回退。本次不实现或测试新组合。

后续用户要求已实际复现S002：原生Ubuntu每项5进程、17项共85条有效性能记录，Splay/Closure/JQuery相对旧本机A为-0.40%/+0.63%/+0.04%；核心整体为+0.58%，相对PREP2为+5.65%。旧短测中的大幅局部改善未复现，三个目标项接近A；这是A派生的单独版本，组合仍未验证。完整新结果单列在[attempt06](../../experiments/native_octane_20261108/attempt06/summary.md)，不改写上面的历史数据。
