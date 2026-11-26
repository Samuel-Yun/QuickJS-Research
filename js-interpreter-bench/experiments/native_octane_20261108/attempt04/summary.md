# 两项新方法完成五轮：有更好点估计，尚无明确增量证据

已分别基于冻结PREP2实现CHAIN2和READ_STORE，通过资格检查并采集17项×2版×5进程=170条新性能记录。34条Octane正确性全部通过，原始数据审计及独立统计复算通过。旧A/P1+B2/PREP2/V8_ON仅作冻结引用，没有新性能采样；未跑SunSpider/V8_OFF。

逐case先取五次中位数，再在原suite内和suite之间分别等权几何聚合；负数表示耗时降低，不是官方Octane分数。

|版本|核心16项/13suite相对PREP2|核心相对A|扩展17项/14suite相对PREP2|扩展相对A|
|---|---:|---:|---:|---:|
|旧PREP2|—|-4.79%|—|-4.79%|
|CHAIN2|-0.08%|-4.87%|-0.09%|-4.88%|
|READ_STORE|-0.24%|-5.02%|-0.17%|-4.96%|

CHAIN2核心相对PREP2耗时变化95%探索区间为[-0.67%, +0.38%]，READ_STORE为[-0.70%, +0.05%]，都跨零。READ_STORE核心相对A区间对应降低约4.70%～5.34%，不能据点估计5.02%称已确认超过5%。父版为跨批次引用，bootstrap不包含未观测到的批次漂移。两个新版本同批配对比较的核心差也不明确：CHAIN2比READ_STORE慢0.16%，区间[-0.17%, +0.40%]。

## 实现与局部表现

CHAIN2准备时识别arg0/loc0、get_field、get_field的相邻组合，根对象由原槽保活，两次普通own-data读精确命中时借用中间值，省掉中间引用处理及第二次属性分发。保留两个字段指令的独立入口和长度；不满足条件就保持原B2或普通读取。Richards比PREP2低1.19%、DeltaBlue低0.43%、Gameboy低1.42%、Typescript低0.79%；RayTrace增加3.01%、Boyer增加0.87%、Splay增加0.95%。

READ_STORE让put_field复用同atom最近在前的静态读点，无额外写记录和写入缓存更新。写入时重新检查实际receiver、精确shape、非prototype状态和可写普通数据descriptor；失配保留原setter/Proxy/异常语义。Gameboy降低1.68%、NavierStokes降低1.06%、RayTrace降低0.78%、Boyer降低0.35%；Richards增加1.37%、Crypto两子项增加1.03%/1.20%、Splay增加1.48%。这些均是本批点估计，不是逐项都已确认的变化。

完整17项绝对时间和全部对照见[results.md](results.md)。逐项CV中位数：CHAIN2约0.19%，READ_STORE约0.55%；最大为CHAIN2/PdfJS的3.23%、READ_STORE/RayTrace的1.37%。所有原始慢点都保留，没有删点、换参数或追加轮数。

## Mandreel是本次结论的重要限制

两版的Mandreel分别比旧PREP2低2.32%和3.69%，是整体点估计改善的主要来源。性能结束后，另用预检诊断镜像及原N=1输入补查Run区间覆盖，两版新机制的queries/hits均为0/0。这不能把N=1诊断冒充正式进程逐次轨迹，但正式Mandreel的N也为1，且诊断保留相同输入和Run边界；它直接限制了把Mandreel改善归给预期命中快路径的说法。

仅作敏感性分析，排除Mandreel、保持其余15项/12suite等权定义后，CHAIN2相对PREP2为+0.107%、READ_STORE为+0.054%。正式主表仍保留Mandreel及原完整集合，不因这个分析改分数。该对照表明本轮没有证据支持“多个目标案例的净收益合成为稳定整体提升”。

新opcode、编译器生成代码、数据/代码布局和批次环境可能造成间接变化；没有隔离各项贡献，不能凭零命中就把改善归给某个具体缓存或分支机制，也不能否定所有间接收益。READ_STORE保留为点估计稍好的候选材料，不晋级为已确认赢家。

## 独立指令诊断

性能完成后，用候选原Release VM对象链接边界hook进行四个独立N=1 Callgrind运行，旧父版Ir来自之前的诊断，不重跑正式对照。

|版本/案例|总Ir变化|正式五轮原生时间变化/旧PREP2|
|---|---:|---:|
|CHAIN2 / Richards|-1.03%|-1.19%|
|CHAIN2 / RayTrace|-0.06%|+3.01%|
|READ_STORE / Richards|+0.57%|+1.37%|
|READ_STORE / RayTrace|+0.15%|-0.78%|

CHAIN2确实在Richards减少了指令工作量。READ_STORE虽命中了共享写位置，但整个程序的Ir并未必减少；现有原版own-property查找本来已有内联路径，增加缓存资格和descriptor检查仍需付费。以上总差还包含代码生成及其它路径变化，不是单次写入/查找成本。Ir不是CPU周期；不同N与工具环境的两列不能相除推CPI或纯机制成本。

## 安全、冻结与材料

两版通过既有与新增JS、C API roundtrip/GC/native finalizer/qjsc、ASan/UBSan检查。新的finalizer回调确认值71先发布，回调能观察它并改shape/写成23。内部探针实测两个链入口共62次完整命中，共享写探针97次命中；ReadICSite仍24B、JSFunctionBytecode仍144B，写不增加记录，热字节码可写出/加载。性能之后另在Release与ASan/UBSan各验证一次跳过前置读分支的冷写提示、不同shape、primitive/null、只读和原型setter，四个补查进程均通过。LSan关闭，不声称完整test262或全面语言语义证明。

预检中的三项setup/fixture失败原样保留，修正前probe.c也保留；均未成为性能样本。候选引擎逻辑没有因这些修正改变。正式冻结后源码、输入、脚本、ELF、调度和串行区间均通过审计，170条性能内部计时均不少于1秒。峰值内存没有独立测量。

实现及相对PREP2补丁：[variants.py](variants.py)、[CHAIN2](patches/CHAIN2.from_PREP2.patch)、[READ_STORE](patches/READ_STORE.from_PREP2.patch)。[原始性能归档](raw/archive.json)、[独立复算](independent_statistics_check.json)、[指令诊断](post_diagnostics/instruction_comparison.csv)、[Mandreel覆盖](mandreel_diagnostic/summary.json)。

本轮不组合、不追加正式性能轮数。保留PREP2参考和READ_STORE的新点估计材料；若以后做最终确认，应按预先固定的轮数同批交错A/PREP2/候选，不能把当前约0.24%的跨批次变化当成已经确定的算法增益。
