# 从原M退出持续失配读点：实现前固定设计

2026-10-24，myx/7dca3cdc8461c5576a4d63badbcf295bf0ad4f7c，初始工作区干净，无AGENTS。
底座04be246001599f5995fa2f2d8c91a0f198d3f34c，A/M原源字节恢复、新干净构建，GCC13.3.0官方-O2/-g/-fwrapv；无NDEBUG/LTO/PGO。
本设计在R实现/校准/正式时间前固定，不尝试其它阈值、布局或策略选最快。

## 已完成的有限桥接，不是主数据

精确恢复旧M/SW源，新构建；numeric_control/Richards各12对，M/ON与ON/M各6对，seed20261024，共48条。
ON中位时间分别高7.37%/2.06%，均内部>=1秒。独立N2诊断逐函数规范最终码/atom和动态dispatch次数相同；数值目标无属性读。
原M与SW的JS_CallInternal起点/尺寸不同、.text相差304字节，但栈预留同为0x248。
perf不可用；寄存器/控制流与布局仍需区别，不能把这个变化叫一次mode分支成本。此项停止，不阻塞独立R。

## 唯一候选R与存储

R从原M派生，不带mode字段、环境配置、pthread_once、candidate_valid或强制LOOKUP。
每最终get_field/get_field2 site保留shape*、offset32、atom32，**另加uint8_t miss_streak**（预期x64含对齐24字节，构建实际核验）。
函数新增头组件仍与M相同16字节，不新建全局启用策略或逐字节正式映射。数组仍在编译定型时一次分配，不回收退出后的整块数组。
首次miss计入；每次guard失败/receiver不合格使streak饱和递增。命中时仅streak非0才写回0，避免无条件每hit写。
固定K=32。32次连续miss后永久退回普通opcode，直到该compiled-bytecode实例销毁；没有恢复、升格、其它容量或benchmark特例。

## 退出顺序与重入

IC handler在取操作数时保存指令起点和site索引。第32次miss进入正常查找**之前**：

1. 取得site原atom并JS_DupAtom，为恢复的普通bytecode操作数新增一份所有权（不缓存值、不分配新site）。
2. 保存旧shape到局部，site shape清NULL/offset清零，保持streak=32。
3. 用同长5字节普通get_field/get_field2及atom恢复原指令。没有跳转或栈效果变化。
4. 完成上述状态/字节码后，才释放原shape边。重复请求先识别已经普通opcode，幂等不重复dup/free。
5. 当前仍属于最后一次IC miss，执行正常属性语义，不再填槽；下一次直接分派普通handler。

atom生命周期：编译时原bytecode引用转给site；退出时额外dup给普通bytecode；销毁先rdi_free释放site引用，之后原free_bytecode_atoms释放普通operand引用。
没有GC运行期指针入序列化。混合active/退出态输出均为普通opcode/atom；读入重新prepare全空MIC，streak与退出态重置。
退出前已进入的帧/共享闭包可继续；任何miss回填前检查streak<32，避免重入期间已经退出后再次更新。
正常getter/Proxy/异常保持，包括第32次抛异常：退出状态已完成，当前访问只执行一次。

## 正确性与独立诊断

先A/M/R旧回归/上游/smoke、OOM192/GC1800、已激活与退出/混合序列化/qjsc/ROM；R独立ASan+UBSan。
新增31/32边界、hit reset、1/2/4/8shape、同atom独立site、特殊/继承/missing/primitive/unhashed、getter/Proxy异常与递归、共享compiled bytecode、删除/重定义、永久退出后的阶段变化。
断言数与独立场景数分列，不声称全test262。正确性/引用/真实退出失败即BLOCKED，不出正式性能结论。

M/R诊断相同基础计数：保存变换前最终PC/atom/规范码。R在普通handler中仅诊断地按PC映射已退出site，不给正式版加入该查表。
total_site_reads=ic_queries+post_exit_reads；ic_queries=hits+misses；当前退出miss不重复计post。每site退出<=1。
hits/ic_queries及hits/total_site_reads分别报，不能因退出缩小分母冒充命中改善。
实际find_own_property的调用、bucket及chain比较单列，不能拿shape probe替代hash。
记录streak读/写/重置、退出trigger=consecutive_guard_miss，与正常查找结果reason分开；释放/保活/直接字节守恒。间接对象图字节UNKNOWN。
诊断初始身份+最终指令快照用于证明普通opcode/atom恢复，不以C源码存在代替实际运行。

## 固定正式集合/口径/顺序

前轮完整16 Octane Run+8微基准，算法/输入/原断言不改，每micro完整Run4096轮。
Crypto保留历史driver，不用上轮N2新输入协议；两项只进预声明敏感性聚合。Box2D/zlib/latency边界不扩展。
Setup/静态前端在内部区间外，首次Run计N内，无额外workload warmup。重复中缓存自然变热；GC/helper/builtin/regexp/动态compile按原Run计入。
内部CLOCK_MONOTONIC绝对ms、父perf_counter_ns同域绝对ns，UTC只日期；核验包围/单位/串行，时钟异常BLOCKED_TIMER，不修raw。

共同N从前轮固定N起步，每次AMR/MRA/RAM九个独立pilot均>=1s才冻结，否则全体翻倍；上限131072、每进程timeout300秒。
每项30组三元组，六排列各5次，seed20261024打乱项目/组，组三版相邻。目标2160=1440Octane+720micro。
A/M/R环境同白名单、明确无QJS_READ_IC_MODE；正式无计数/trace。正式开始若改R逻辑另attempt。
失败保存不自动补跑、不删outlier、不为了区间方向增加样本。性能不与构建、诊断、RSS或硬件采样并行。WSL宿主功耗/频率/后台调度不受控。

## 统计、内存与复现

A/R、M/R、A/M均为前者中位数/后者中位数，>1右侧更快；报告ms/Run、变化率、N及有效数。
10000次三元组配对bootstrap、探索性95%线性分位区间；n-1标准差、Tukey-halves Q1/Q3/IQR、min/max。
Octane先suite内子项GM再suite等权，主排Crypto、另含Crypto敏感性；共享完整rep轮次分块bootstrap10000次给区间。micro不入GM，不称官方总分。
全部24项M/R独立诊断各1次，CodeLoad双方统一min(8,正式N)；不冒充正式N总量。
16 Octane×3版×3GNU time RSS=144新进程，KiB分布单列，不混正式时间；外部ms/process单列，不相减中位数推self-time。
公开数据标准库在新目录连续重算两次；rel/abs=1e-12，不比较历史host、不读旧ELF或缓存统计表。源码恢复/重建、统计重放、制品核验三个入口。
本轮结束只推荐一个下一问题，不调K、不追加第二优化，不提交/推送/覆盖历史。
