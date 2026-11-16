# 新逐读点 MIC / 匹配 PIC：同批次结果

## 做了什么

在 myx、HEAD `1f977fd762e4308cbfe141c110ad208bdb1f10a0` 的干净工作区起步，保留历史实验。
底座固定 upstream QuickJS 2026-06-04 / `04be246001599f5995fa2f2d8c91a0f198d3f34c`。
同一 WSL2 Ubuntu24.04.2 / Ryzen5800H / x86_64，GCC13.3.0，官方 `-O2 -g -fwrapv`，无NDEBUG/LTO/PGO。
先实现M，再从同一源码生成P；A/P/M分别干净构建。本轮没有V8/JSC，也没有把旧campaign时间拼进来。

M是每个最终get_field/get_field2位置的独立16字节记录，直接shape guard；P为同一框架56字节四槽记录，先recent再搜索，空槽优先、满槽固定轮转。
两者编译定型时一次分配，相同准入、正常miss路径、当前值/receiver/引用处理、内联、GC和保存加载协议；只有容量配置不同。
普通写opcode源按LF规范化比较与A相同。与旧B/C/D的函数+atom共享、读写IC不同；旧B的未填满四槽不是本轮M。
详见 [design.md](design.md)、[implementation_notes.md](implementation_notes.md)、[正式补丁](patches/A_to_common_M.patch)、[P/M差异](patches/M_to_P.patch)。

Release回归、12项独立smoke、各版11个上游test入口、已使用缓存的保存/加载、qjsc嵌入、192个OOM预算、1800函数循环GC通过；M/P各自ASan+UBSan通过。
新site测试15场景/23211断言，旧多槽测试9场景/28151断言，不能把重复断言当独立场景；未跑完整test262。
24项×3版×N=1/2的144条workload correctness也通过。实际布局及内联机器码见 [machinecode/notes.md](machinecode/notes.md)。

## 时间怎样测，实际完成多少

保留冻结驱动：Setup/静态加载编译在内部区间外，首次Run计入N，不额外预跑workload；重复中状态自然变热。
内部用捕获的原生performance.now（CLOCK_MONOTONIC）；父进程保存同域绝对ns起止。GC/helper/builtin/regexp/动态编译仍在原Run边界内，不是lookup self-time。
微基准每完整调用4096轮；表中ms/Run不是每条读或每个循环迭代的成本。外层共同checksum/driver也有支撑成本。
Octane的CodeLoad动态编译在计时内，不能称排除了所有frontend。

共同N经APM/PMA/MAP九个独立pilot全≥1秒后冻结；六种正式排列各5次，seed20261024，组三版相邻、串行。
正式 **2160/2160有效**：Octane1440，微基准720；每项每版30新进程，零失败/重试/删样本，最短内部区间1123.131ms。
48次选定workload诊断、22次机制诊断、144个独立GNU time RSS进程完成；全部同一boot。
诊断、构建和RSS不与正式性能进程并行。频率/功耗及Windows宿主调度未受控，不能推广为所有平台的结果。
证据：[audit.json](analysis/audit.json)、[selected_n.csv](analysis/selected_n.csv)、[原始正式记录](raw/formal/)。

## 单态与多态：看到什么

下表单位ms/完整4096轮调用；A/M>1表示M快。95%区间来自10000次三元组配对bootstrap，探索性逐项区间，不是多重检验后的确认性结论。

| 微基准 | A | P | M | A/M [95%区间] | 结论边界 |
|---|---:|---:|---:|---|---|
| own_integer | .061973 | .061813 | .058504 | 1.0593 [1.0438,1.0795] | M时间低5.60% |
| own_reference | .081569 | .080549 | .079333 | 1.0282 [1.0164,1.0409] | M时间低2.74% |
| own_method | .236667 | .223140 | .233892 | 1.0119 [.9921,1.0313] | M对A方向不明确；P比M快 |
| numeric_control | .038821 | .037928 | .037409 | 1.0378 [1.0184,1.0540] | 目标没有字段读，不能算读缓存收益 |
| write_control | .043994 | .043664 | .043486 | 1.0117 [.9958,1.0365] | 目标只有写，方向不明确 |
| poly2 | .188389 | .187232 | .203884 | .9240 [.9121,.9349] | M比A慢8.23% |
| poly4 | .186678 | .185900 | .201945 | .9244 [.9124,.9355] | M比A慢8.18% |
| poly8 | .184952 | .208555 | .201414 | .9183 [.9093,.9317] | 都慢于A；M比P快 |

独立诊断中，稳定读的目标site除第一次外全部命中；own_method的caller方法读和callee bias读，两版各33554432查询、33554431命中。
但P/M时间比为0.9540 [.9446,.9654]，P反而更快；不能仅按一槽/四槽或指令长度预测时间。
同函数两个读x的位置PC1/7各4096次、4095命中，证实不再按atom共享。

poly2/poly4各33554432次目标查询：P分别只冷回退2/4次、占用2/4槽；M命中0、替换33554431次。
poly8轮流输入时两版都命中0，P占用4槽；这是该固定轮转序列，不是任意8shape输入都零命中。
P在2/4shape下比M快，但P对A的区间均跨1，高命中未证明净超过A。
见 [目标site原始计数索引](analysis/micro_target_sites.json)；这些是独立全进程诊断，不是正式样本逐次分支轨迹。

## Octane：局部有收益，主聚合没有净加速

Richards：A3.599165、P3.574788、M3.418458 ms/Run；A/M=1.0529 [1.0404,1.0675]，M时间低5.02%。
另有NavierStokes低6.82%、Typescript低3.16%、DeltaBlue低2.71%。
反例同时保留：RegExp高12.89%、RayTrace高10.31%、Splay高8.60%、CodeLoadClosure高9.92%、CodeLoadJQuery高5.79%。
Earley、PdfJS的M对A区间跨1。不能只选Richards描述整体。

按预声明suite内子项GM、suite等权，完整rep轮次分块bootstrap10000次：

| 范围 | A/M [95%区间] | P/M [95%区间] | A/P [95%区间] |
|---|---|---|---|
| 主：14单元/12suite，排除Crypto | .9881 [.9854,.9928] | 1.0020 [.9986,1.0060] | .9861 [.9825,.9913] |
| 敏感性：16单元/13suite，含Crypto | .9915 [.9890,.9959] | 1.0031 [1.0001,1.0069] | .9885 [.9849,.9933] |

主聚合不支持M整体加速，M/P方向不明确。Crypto加载随机padding未逐组固定，预先只进敏感性结果；不能反过来用它挑一个更好看的汇总。
Box2D/zlib/官方latency仍为旧覆盖边界；这不是官方Octane总分，微基准不进GM。
完整24项及全部A/P区间见 [tables.md](analysis/tables.md)、[summary.csv](analysis/summary.csv)；mean/sample std/Q1/Q3/IQR/min/max见 [statistics.csv](analysis/statistics.csv)。
区间图：[Octane A/M](analysis/octane_AM_CI.svg)、[Octane P/M](analysis/octane_PM_CI.svg)、[微基准 A/M](analysis/micros_AM_CI.svg)。

## 诊断、端到端与内存代价

Richards的P/M全进程查询均103358529、命中率均79.955%，都无替换；直接请求P18536、M6096 bytes，峰值缓存shape边都105。
Splay中P命中90.43%、M50.62%，M替换9650057次；但两者仍慢于A，命中改善不能单独等同净收益。
Typescript中P命中81.23%、M77.61%，P仍慢于M。这些比较包含探测、维护、空间和代码生成，不是单个miss成本。

CodeLoad详细诊断统一N=8，**不冒充正式N2048/128的总计**：Closure创建1913读点、只用105；JQuery创建24689、用3017。
两边直接请求分别为：Closure P115512/M38992 bytes，JQuery P1451896/M464336 bytes。
少量独立创建/复用探针也显示，200个函数各读一次，与一个函数读200次，有不同累计创建和冷查询负担；这里只是计数，不是创建耗时的测量。

独立GNU time每组每版3进程，KiB中位数：Closure A61684/P82948/M69128；JQuery A7332/P8112/M8144；Typescript A100968/P104552/M103448。
M比P的元数据小，不代表比A的RSS低；Closure/JQuery相对A分别高约12.07%/11.07%。其它小差异受三样本、分配器和WSL调度限制，不作等效性结论。
间接保活对象图字节 **UNKNOWN**。shape边计数、请求字节、RSS和text分开；全部缓存释放后live计数为0。

端到端为同一N次Run的新进程完整区间ms/process，不是旧单Run source-to-finish：Richards A1883.385/P1864.997/M1790.620；RegExp A1579.475/P1572.739/M1788.919；Closure A1407.302/P1516.224/M1547.435。
可见收益和回退在外部区间也保留；不相减内外中位数推“纯初始化成本”。完整见 [end_to_end.csv](analysis/end_to_end.csv)、[memory_comparison.csv](analysis/memory_comparison.csv)、[diagnostic_comparison.csv](analysis/diagnostic_comparison.csv)。

## 目前解释到哪里，还缺什么

真实布局、直接guard、独立site、容量和命中/回退已验证。M在整数/引用读与Richards有这份完整设计的净收益；不能把numeric_control的3.64%变化也算作跳过属性查找的收益。
RegExp诊断只有14次命中/1120922次查询，M查询比较比P少，正式时间却更长。其算法没改：三个libregexp.c及未重定位libregexp.o的27403字节.text完全相同。
新增解释器代码仍改变布局/编译器决策、metadata/guard及其它路径；目前没有硬件计数或逐helper耗时证据把RegExp回退分给其中一项。
见 [regexp代码核对](machinecode/regexp_derived_audit.json)。不能把相同库.text说成整个最终可执行文件执行行为相同。

诊断口径也有限：query比较有独立计数；P更新扫描另计，M更新入口的一次判等按updates明确推导，不冒充native cmp实测。
报告保留源和最终PC映射；同源码多次compile的instance_id不跨进程一一对应，间接字节和精确单步成本仍UNKNOWN。
正式计时不含计数；诊断分布不等于正式分支逐次记录，bootstrap区间也没有消除代码布局和后台调度等混杂。

下一轮只选一个问题：**稳定读中观察到的净收益，有多少确实来自跳过hash查找，而不是新增框架改变解释器生成代码的派生效应？**
先设计匹配控制来检验这个问题；本轮不自动加第四版、不实现自适应、不修改正则或继续调参直到获胜。

公开raw已在Windows上用标准库独立重算通过，28个输出按预定1e-12容差比较，未访问WSL旧binary。
70个诊断归档双SHA校验通过，合计约9.18MiB，最大约1.32MiB；大JSON和ELF不放普通Git。
历史tracked文件未改，未提交/推送/切分支。复现入口见 [README.md](README.md)。
