**SunSpider历史收益核对（仅查旧数据）**

当前EVAL_COLD的26项等权GM相对A降低1.487%，属于小幅收益；本次30轮95%区间[-1.528%, -1.436%]。它的选择过程此前主要依据Octane，尚不能称SunSpider最优版本。

旧记录确实有更大的数字：

|版本与批次|相对同批A耗时变化|覆盖及轮数|证据边界|
|---|---:|---|---|
|s001 / v6 expand01|-6.71%|全26项，1轮|单轮点估计，无区间|
|W1 / v6 expand01|-5.22%|全26项，1轮|单轮；相对s001反而+1.60%|
|K1 / v6 expand01|-5.08%|全26项，1轮|单轮；相对s001反而+1.75%|
|P1 / v6 expand01|-4.14%|全26项，1轮|单轮；相对s001反而+2.76%|
|s001 / v6 accept02|-0.68%|全26项，3轮|95%区间[-3.35%, +0.62%]跨零|
|s001 / v2 final|-0.65%|全26项，30轮|95%区间[-0.88%, -0.47%]|
|EVAL_COLD / 本机确认|-1.49%|全26项，30轮|95%区间[-1.53%, -1.44%]|

P013还曾出现短测SunSpider子集-8.57%，但行本身标UNSTABLE；独立完整26项四轮相对A为+0.397%，并未保持这个幅度。不能将短子集直接当作完整SunSpider收益。

旧数据来自Windows主机上的WSL2/Ryzen 5800H/GCC13.3，本次来自原生Ubuntu/i9-14900/GCC15.2。上表各百分比使用各自同批A，不跨环境拼绝对时间或给精确算法排名。三轮/30轮批次也不是同一批，所以不能仅凭表格断言单轮6.71%完全由噪声造成；可以确定的是较大幅度尚未得到这些多轮数据的支持。

当前也有局部较强收益：access-fannkuch -7.23%、access-binary-trees -6.95%、3d-morph -5.67%；同时access-nbody +5.20%、bitops-3bit-bits-in-byte +2.40%、bitops-bits-in-byte +1.92%等回退抵消一部分收益（17项改善，9项回退）。不能只按Octane整体最优预设SunSpider也最优。

另保留原输入模式的已知限制：string-base64和string-validate-input使用Math.random且未固定种子；冻结JS源文件及校验值不等于每个进程的随机输入字节完全相同。本次没有修改这两项或偷偷删除它们。

来源：[旧单轮](../../experiments/ic_search_lab/v6_targeted_ic/full_expand01_sunspider.one_round.aggregate.csv)、[旧三轮](../../experiments/ic_search_lab/v6_targeted_ic/full_accept02_sunspider.aggregate.csv)、[s001旧30轮](../../experiments/ic_search_lab/v2_20261105/final.sunspider.aggregates.csv)、[当前30轮](../../experiments/native_confirmation_20261108/attempt02/aggregate.csv)。逐字CSV行和源SHA保存在evidence.json，未执行任何新性能样本。
