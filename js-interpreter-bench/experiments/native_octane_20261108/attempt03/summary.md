# 三个后续方向验证完成：没有获得更好的整体耗时

三个新版本分别从冻结PREP2生成，各跑完整17项Octane五个新进程。共255条新性能样本、51条Octane正确性记录，全部有效。复用旧A、P1+B2、PREP2和V8_ON，不采SunSpider/V8_OFF。本批原始数据审计及独立统计复算通过。

负数表示耗时降低；逐case取五次中位数，再按原suite等权几何聚合。核心为16项/13suite，扩展包含zlib，为17项/14suite。结果不是官方Octane分数。

|版本|改动|核心相对PREP2|核心相对A|扩展相对PREP2|扩展相对A|
|---|---|---:|---:|---:|---:|
|旧PREP2|已有父版|—|-4.79%|—|-4.79%|
|COALLOC|源码编译时合并函数、字节码和IC最终分配|+1.26%|-3.59%|+1.18%|-3.67%|
|FUSE_A1L1|选择性增加arg1/loc1借用加载融合|+0.26%|-4.54%|+0.14%|-4.66%|
|CALL02|展开正常返回后0～2参数清理循环|+0.71%|-4.11%|+0.62%|-4.21%|

核心相对PREP2耗时变化的95%探索区间：COALLOC为[+0.67%, +1.56%]；FUSE_A1L1为[-0.35%, +0.45%]；CALL02为[+0.11%, +0.98%]。FUSE的方向不明确，不是等效证明。父版和旧对照均为跨批次比较，区间不覆盖未观测到的环境漂移；没有把同一boot当成同一时刻的环境证明。

三个新版本在本批按case交错、各轮轮换位置。同批配对比较中，COALLOC比FUSE核心慢0.99%（探索区间[+0.40%, +1.41%]），FUSE比CALL02快0.45%（区间[-0.76%, -0.09%]）。这支持区分本批新版本，但不能替代与父版的新同批确认。

## 每项方法实际得到什么

COALLOC的源码编译路径确实减少了一笔独立IC分配和一次额外字节码复制，函数头仍为144B、记录仍为24B，运行时命中逻辑不变。加载保存字节码仍走原外部分配回退，两种所有权均已检查。CodeLoadClosure/JQuery相对PREP2分别降低0.53%/0.17%，但RayTrace增加6.77%、Splay增加3.28%、DeltaBlue增加3.06%，整体回退。

FUSE_A1L1按父版独立N=1计数选择arg1/loc1，并非重做旧d04全部八种加载。新增形式实测命中，原B2/P1继续命中；静态第二入口、字节码长度和miss语义保留。完整时间中Boyer仅降低0.13%、Splay降低0.95%；Mandreel降低4.22%、zlib降低1.49%。Richards增加1.69%、DeltaBlue增加1.81%、RayTrace增加1.82%、NavierStokes增加1.87%，未形成明确整体增量。没有把Mandreel等非选定目标的变化全归给融合。

CALL02保持receiver、callee、参数的原释放顺序，超过两参数仍用原循环，异常与tail call路径不变。Boyer降低0.98%、Gameboy降低1.80%、Mandreel降低3.45%，但Richards增加12.53%，RayTrace和Splay各增加约1.93%。局部改善不足以抵消回退。

完整17项绝对时间、逐项相对父版及所有聚合见[results.md](results.md)。样本标准差/CV中位数：COALLOC 0.49%、FUSE 0.28%、CALL02 0.34%；最大分别为Splay 1.44%、RayTrace 0.95%、Richards 1.11%。所有慢点保留，没有删点或追加到出现有利结果。

## 减少工作量为什么没有直接变成整体加速

性能完成后，另用五个有界N=1 Callgrind运行检查指令工作量。它们不进入性能统计，也没有重测旧正式对照；分母来自采样前的独立父版诊断。新诊断直接链接各候选Release的原VM对象，只替换带边界hook的libc对象，性能源码及ELF前后哈希不变。

|版本/案例|独立N=1总Ir变化|正式五轮原生耗时变化/旧PREP2|
|---|---:|---:|
|COALLOC / CodeLoadClosure|-0.05%|-0.53%|
|FUSE_A1L1 / Boyer|-1.32%|-0.13%|
|FUSE_A1L1 / RayTrace|-0.75%|+1.82%|
|CALL02 / Boyer|-0.74%|-0.98%|
|CALL02 / Richards|-0.80%|+12.53%|

指令工作量减少是实测事实，仍不能等同原生时间减少。Ir不是周期、缓存或分支失误计数，整个N=1区间的差值也不是目标操作的纯成本。新旧N、工具执行环境和统计目的不同，不能把两列相除推CPI或每次命中的成本。当前没有隔离代码布局、寄存器分配、分支、缓存及批次环境的具体贡献，不把回退武断归给其中一项。

## 验证与复现边界

三版通过针对性JS、C API保存加载、GC、native finalizer、qjsc及ASan/UBSan。新增原生finalizer测试检查普通/方法调用0～5参数的释放顺序，36次finalizer符合预期。COALLOC探针检查七个fixture的最终存储、与父版的opcode/atom/site映射、加载回退，以及八次目标分配失败注入后的恢复。LSan因既有环境限制关闭，没有声称完整test262或全面OOM验收。

源/输入/脚本/制品哈希、串行时间区间、调度位置及各case五次的审计均为PASS_COMPLETE；全部性能样本内部时长不少于1秒。独立复算从冻结压缩raw验证中位数、调度和suite加权log聚合，容差1e-12。当前没有单独测VM峰值内存；过程记录中的wait4 peak_rss不用于内存收益判断。

前一attempt02在新增C API测试编译时因JS_NewClassID参数误用停止，无性能样本；失败原样保留。本批修正测试，在新目录重新完成资格检查，没有修改引擎变换或复用失败点。[失败记录](../attempt02/qualification_failure.json)。

实现见[variants.py](variants.py)，相对PREP2的补丁见[COALLOC](patches/COALLOC.from_PREP2.patch)、[FUSE_A1L1](patches/FUSE_A1L1.from_PREP2.patch)、[CALL02](patches/CALL02.from_PREP2.patch)。诊断选择见[selection.json](selection.json)，原始性能记录见[raw](raw/archive.json)，独立复算入口为[review.py](review.py)，后补指令结果见[post_diagnostics](post_diagnostics/instruction_comparison.csv)。

本轮不晋级、不组合、不追加性能轮数。保留旧PREP2作为当前点估计最快的小幅候选，P1+B2为此前的组合参考。继续推进前，应优先取得原生周期/分支/缓存与实际机器码的归因；本次没有证据支持继续按“少分配/少指令必然更快”叠加改动。
