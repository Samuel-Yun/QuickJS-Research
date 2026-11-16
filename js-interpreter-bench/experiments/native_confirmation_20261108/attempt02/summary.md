**30轮同批确认结果**

仅A、EVAL_COLD、V8_ON三版，Octane 1530条、SunSpider 2340条有效新性能样本，共3870条；另有258条N1/N2正确性。每case每版30个独立进程，旧性能数据没有参与分母或统计。原始数据、命令/源码/运行时/输入SHA、串行顺序及统计独立审计均通过；138行置信区间也经另一种加权次序统计量算法独立复算通过。

|负载及口径|EVAL_COLD相对A耗时变化|95%成对整轮bootstrap区间|V8_ON相对A耗时变化|
|---|---:|---:|---:|
|Octane，suite分层等权GM|-5.7106%|[-5.7691%, -5.6526%]|-39.8012%|
|SunSpider，26项等权GM|-1.4870%|[-1.5280%, -1.4361%]|-30.9961%|
|SunSpider，逐项中位数总和|-1.2878%|[-1.3300%, -1.2270%]|-37.7237%|

Octane此前跨批次五轮点估计为-5.6980%；本次同批30轮为-5.7106%，相差约0.013个百分点，约5.7%的收益在这台机器、这套冻结运行口径下复现。此确认仅涉及相对A；READ_STORE未按用户要求加入本批，不能据此单独确认相对READ_STORE的增量。

EVAL_COLD/ V8_ON的整体耗时比：Octane 1.5663、SunSpider GM 1.4276；仍有明显差距。SunSpider三版逐项中位数总和分别为A 401.84999ms、EVAL_COLD 396.67499ms、V8_ON 250.25713ms。

逐项并非全部改善：Octane 14项中位数降低、3项增加。最大改善DeltaBlue -16.76%、Richards -15.51%；剩余三项回退Splay +0.90%、CodeLoad.Closure +2.44%、CodeLoad.JQuery +1.24%。SunSpider 17项降低、9项增加；access-fannkuch -7.23%、access-binary-trees -6.95%、3d-morph -5.67%，access-nbody +5.20%为最大回退。这里的计数为描述性中位数比较，不代表逐项多重检验后的显著性结论。

CV中位数：Octane A/EVAL_COLD/V8_ON为0.41%/0.54%/0.61%；SunSpider为0.56%/0.51%/0.51%。有真实保留的慢点：V8_ON/NavierStokes最大97.41013ms，中位54.81286ms，CV 13.78%；EVAL_COLD/access-fannkuch最大32.14283ms，中位25.77484ms，CV 4.49%。没有据此删除样本或追加轮数，原因未做周期归因；全部中位数与bootstrap使用原30样本。

90条V8_ON/Octane内部区间不足1000ms的样本按事前规则保留并标记；沿用既定N未事后校准。其余两版Octane及全部SunSpider均无此类短样本。首次Run计时包含在内，无workload预热；报告单位为ms/完整Run，进程内N次不是额外独立样本。

三版按case相邻串行、六种顺序各五次，CPU2，Asia/Shanghai时区，C locale。V8_ON为--jitless --no-lazy --use-ic。QJS沿用冻结Release ELF，源码没有改动或重建，已有专项/ASan/UBSan证据复用；新数据不包含sanitizer或诊断ELF，不宣称完整test262/API兼容性。置信区间条件于本批观测轮次，不覆盖所有未来运行环境的系统变化。

attempt01在N1预检因UTC与既有日期oracle东八区基准不一致停止，性能0条；其冻结代码和失败日志保留。本批仅修正时区，未改变checksum允许值、引擎、负载、N、seed、顺序或30轮停止规则，重新通过全部预检。失败批次没有进入任何性能统计。

完整逐项表见[results.md](results.md)，30样本统计见[statistics.csv](statistics.csv)，逐项及整体区间见[per_case_comparisons.csv](per_case_comparisons.csv)和[aggregate.csv](aggregate.csv)，原始记录见[raw/runs.jsonl.gz](raw/runs.jsonl.gz)。
