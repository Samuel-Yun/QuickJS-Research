# M/R非目标变化：数值变慢复现，方法变快未复现；链接位置确实有影响

## 做了什么

从myx/e9a71a01722a34bb9e61314965020d56d93141f9的干净工作区出发，恢复前轮逐文件相同的M/R，没有新IC策略。
仍是QuickJS2026-06-04 / upstream 04be246001599f5995fa2f2d8c91a0f198d3f34c，M16字节site、R24字节site/K32。
同一WSL2 Ubuntu24.04.2、Ryzen5800H/x86_64，GCC13.3.0，官方-O2 -g -fwrapv，保留断言，无LTO/PGO。
每版仅干净编译一次，四个固定padding条件复用同一原对象。源码、原链接输入和正式制品前后hash均未变。
正式清单是[manifest.final.json](manifest.final.json)，不是保留的首版manifest.json。

实际完成**704/704有效正式样本**：原基线前段96、布局512、后段96。全部串行、无重抽/删样本/补轮次，正式内部区间均>=1秒。
每条件3个独立pilot，共120个，全部通过后冻结N：numeric32768、own_integer32768、own_method8192、Richards512。
每micro完整Run4096轮；Setup/静态编译在外，首次Run在内部N次里，无额外workload预跑，缓存状态随后自然变化。
GC/helper/builtin照原Run计入。内部ms/Run与外部整个N次的ms/process分开，不相减求精确初始化成本。
80个最终N1/N2正确性检查及M/R各5个既有语义回归通过；未做完整test262。

证据：[冻结协议](design.md)、[原始记录](raw/)、[独立审计](analysis/audit.json)、[源码身份收尾](analysis/post_identity.json)。

## 1. 原基线重现了什么

下表只用本批次base，M/R>1才表示R快；中位时间单位是**ms/完整Run**。没有与旧时间相除。

|案例|M median|R median|R相对M时间变化|分层合并M/R [探索性95%区间]|
|---|---:|---:|---:|---|
|numeric_control|0.038046|0.041678|+9.55%|0.91286 [0.89789,0.93482]|
|own_integer|0.059933|0.065979|+10.09%|0.90837 [0.89676,0.92121]|
|own_method|0.224321|0.236850|+5.59%|0.94710 [0.92719,0.97091]|
|Richards|3.470088|3.524808|+1.58%|0.98448 [0.97382,0.99561]|

前/后段每边各12个，合并每边24个；10000次分层pair bootstrap，区间探索性、未校正多重检验。

|案例|前段M/R [95%]|后段M/R [95%]|
|---|---|---|
|numeric|0.92031 [0.88997,0.93905]|0.91296 [0.89828,0.93265]|
|own_integer|0.90705 [0.88633,0.93240]|0.91193 [0.89389,0.92362]|
|own_method|0.98378 [0.93921,0.99743]|0.93306 [0.92050,0.95056]|
|Richards|1.00083 [0.97746,1.01330]|0.97265 [0.94592,0.98393]|

**数值循环变慢复现；own_method前轮变快没有复现，本轮方向相反。** 两段也有不同，不能只保留其中一段。
本轮完整JS_CallInternal的编码字节与地址，各自与前轮M/R公开ASM完全一致（41599/42021字节），见[native/prior_body_comparison.json](native/prior_body_comparison.json)。
这排除了“该函数本轮又编译成另一份机器码”这一简单解释，但不证明整个ELF、堆布局、加载路径、调度或功耗状态相同。
本轮boot_id与前轮不同；跨campaign的运行状态影响未隔离，旧改善不能当成稳定的退出收益。

## 2. JS动态工作量是否不同

独立N1/N2诊断保留原最终PC、规范码、atom、函数身份与实际computed-goto计数。
三个micro的M/R逐PC原始dispatch相同，目标读取/命中/维护相同，R无退出；R自身新增的streak检查/条件写单列，当然不与M相同。
numeric目标m4Loop18字节、14个静态opcode，N2中add_loc/inc_loc各8192次，条件lt/if_false8各8194次；没有字段读取。
全进程adapter/driver仍有少量属性操作，不能说整个程序零属性读，更不能把它们归到数值内循环。

Richards保留真实差别。measurement-driver N2：M403809次IC查询；R323583次IC查询+80226次普通post读取=403809，命中均322727、更新均105、R退出21点。
按同一原始PC将MIC/普通读取两通道相加后相同。它是读取/分派工作量核对，不是CPU指令数，也不声称把融合handler消费的所有逻辑opcode逐条实测。
采样前correctness-driver与采样后精确measurement-driver的scope不同，原始证据分开；不将N2退出数外推成正式N512的精确计数。
见[分派门禁](diagnostic/gate.json)、[精确measurement driver补核](diagnostic/measurement_driver/gate.json)、[目标完整规范码](native/target_bytecode.md)。

## 3. native能解释到哪里

按真实ELF dispatch表定位后，numeric整数候选路径在两版中保留相同关键运算/寄存器/栈临时操作，但handler和慢分支位置不同。
例如add_loc入口M0x26f93/R0x270f0，inc_loc入口M0x2780f/R0x272aa；两边inc_loc都存在xmm2→[rbp-0x110]临时保存，不是R独有spill证据。
没有native动态trace，不能把候选窗口里的每个分支当实际执行，也不能断言全函数没有其它spill差别。

R读命中路径确有额外工作：16→24字节site寻址、streak读和test/je、非零才清零的store。成功命中不等于零额外成本。
own_method还包括函数值引用、receiver保留、递归JS_CallInternal、参数/局部释放；其前轮改善不能由退出事件解释。
完整地址、分支边、候选片段和源码位置见[native_notes.md](native_notes.md)、[opcode→入口表](native/opcode_entries.csv)及native/final/。
静态差异与独立诊断支持继续定位，但不足以把总差距拆成某个C判断、spill或一次引用计数的时间。

## 4. 固定链接位置是否影响结果

初版零条件发现GNU property缺失导致PLT/前缀布局变化，未采样；保留失败后补齐原note，仍是同一种padding-object方法、同四个值。
最终p000与base.text逐字节相同；请求16/32/48使两版JS_CallInternal分别精确平移16/32/48。
原对象不变；函数body的变化字节全落在原对象实际relocation字段中，256个dispatch目标同步平移；不是删掉数字后比较ASM。
padding为局部OBJECT，前方help以noreturn exit结束，无直接跳转/相对数据重定位/dispatch/构造器入口进入padding；这是静态依据，没有native覆盖率trace。
见[请求→地址](layout/addresses.csv)、[重定位核对](layout/relocation_comparison.csv)、[静态引用检查](layout/padding_unreachable.json)。

下表每格为同padding的M/R及95%区间，每边16个完整8条件block，10000次共享block bootstrap。没有各自挑最佳位置。

|案例|p000|p016|p032|p048|
|---|---|---|---|---|
|numeric|0.9181 [0.8972,0.9332]|0.9702 [0.9590,0.9854]|1.0067 [0.4534,1.0323]|1.0106 [0.9812,1.0430]|
|own_integer|0.9265 [0.9083,0.9465]|0.9152 [0.8999,0.9502]|1.0097 [0.9944,1.0248]|0.9912 [0.9652,1.0184]|
|own_method|0.9870 [0.9818,1.0048]|1.0099 [0.9883,1.0249]|0.9299 [0.9126,0.9482]|1.0030 [0.9859,1.0158]|
|Richards|0.9812 [0.9642,0.9946]|0.9866 [0.9669,1.0055]|0.9864 [0.9682,1.0030]|0.9920 [0.9668,1.0136]|

**本二进制/输入/WSL环境存在布局敏感性。** numeric p016/p048、own_integer p032/p048、own_method p032的预定义交互区间不跨0；Richards这三个交互均跨0。
例如numeric的M在p016比p000耗时约高5.39%，R同位置方向不明确；own_method的R在p032比p000约高5.71%。这些不是IC策略收益。
numeric R_p032的16个内部区间，11个约1262—1384ms，5个约2966—3149ms；外部时间也对应变长。全部保留，因此其M/R区间很宽。
没有逐正式样本CPU时间/加载基址或硬件事件，不能断言这种两簇来自调度、ASLR地址关系或I-cache。
完整绝对时间、同版本p000/pNNN和交互见[表](analysis/tables.md)、[ratios](analysis/ratios.csv)、[interactions](analysis/interactions.csv)、[原始分布](analysis/raw_distribution.csv)。

## 不能支持什么；下一步最小动作

perf一次能力检查退出127且无stdout/stderr，未取得cycles/instructions/branches/branch-misses；没有改权限/内核/ASLR、安装模拟器或再搜索布局。
因此不能在I-cache、分支预测、数据访问、频率/调度等解释中定根因。固定摆放不重排handler内部代码，方向不变也不能排除内部布局、metadata或其它成本。
Richards有真实退出，不能把它与三个无退出micro当同一机制。没有算总体GM，也没有把单一较快padding当优化成果。

**当前不足以据此选择一项新的IC优化实现。** 最小缺口是把同一二进制快/慢进程的CPU执行成本与墙钟延迟区分开，并取得实际native热点/分支证据；优先补可行的每进程CPU时间和加载映射，硬件事件可用时再观察具体handler。
这只是下一问题，本轮不继续加采样或改策略。正式上限已到，源码/对象/依赖/制品收尾核验通过；两次全新目录标准库raw重放各11个输出PASS，rel/abs=1e-12，原raw/发布输出未变。
复现分入口见[README](README.md)，失败与scope修正见[engineering_notes.md](engineering_notes.md)。未提交、推送或改历史数据。
