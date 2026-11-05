# 得到Splay布局证据，但机制计时与完整Octane未完成

**状态：BLOCKED_EXECUTION_UNRELIABLE。机制正式0/240，Octane正式0/1530，没有OPT或新的性能结论。**
本轮完成了真实恢复检查、构建和正确性/诊断；不是完整性能实验交付。

## 1. 恢复和制品，实际做到了哪一步

|任务|实际结果|退出/资源证据|
|---|---|---|
|最小WSL启动|默认cwd失败；指定`--cd /`成功|宿主01退出4294967295，E_UNEXPECTED；02退出0|
|冻结A/M/d8和当前诊断副本|实际大小/ELF/SHA/smoke通过；旧A_diag5仍为0字节|preflight/check02/artifacts.json；d8依赖hash也通过|
|A/M Splay N1/N2恢复|4/4正常退出、单进程内boot相同|splay_recovery/；wait4峰值147704—147736KiB|
|新轻量M诊断|构建、实际smoke、N1/N2通过|last_recovery/；峰值147552/147528KiB；布局和频次无溢出|
|控制副本C/C_light|实际构建/ELF/SHA/smoke通过|builds/build04/manifest.json；C=5121440字节|
|最后机制计数门禁|16正确性成功，M.N1计数成功，C_ON.N1待保存处中断|宿主10退出1；没有Linux完成记录；宿主11显示Ubuntu Stopped|

全部绝对路径与完整SHA见[artifacts.csv](summary/artifacts.csv)。初始A/M/d8分别为`584335ad…`、`7b6fa1e8…`、`83b744a5…`；新C为`e392a32e…`，仅作机制控制，不是OPT。
编译为GCC13.3.0、原有`-O2 -g -fwrapv`等完整flags见构建stdout；没增加NDEBUG/LTO/PGO或padding。WSL2 Ubuntu24.04.2/x86_64、CPU2 affinity；功耗/温度/频率控制UNKNOWN。
三组有界恢复和代码构建修错分开记录于[engineering_notes.md](engineering_notes.md)。未重启WSL、改设置或终止无关任务。
原因仍UNKNOWN，不能说OOM、某引擎崩溃或cwd就是根因。中断后制品未重新访问，当前身份状态明确为UNKNOWN。

## 2. 三个读点的Run内shape/offset和计数

下表是**M轻量诊断、repetitions=2合计，不是时间**。L1=`key,value,right,left`，L2=`key,value,left,right`。

|PC/属性|L1/L2读取频次|目标下标L1/L2|命中|真实find=回退|替换/retain/release|
|---|---:|---:|---:|---:|---:|
|43/key|2249 / 2359|0 / 0|2432|2176|2176 / 2176 / 2176|
|138/key|1313 / 1363|0 / 0|1347|1329|1329 / 1329 / 1329|
|147/right|1157 / 1199|2 / 3|1209|1147|1147 / 1147 / 1147|

两种receiver均为普通非exotic、hashed shape；目标都是own普通数据属性。key字节偏移都0，right为32/48。
Run内实际布局和频次完整，无未知/溢出；转换轨迹仅保留前128次，标记截断。generation仅在单进程内表示生命周期身份。
新轻量N=2再次得到45664次读取、23001命中、22663回退、18343更新、18324替换；新恢复A/M进程的find分别48864/25863，相差23001。
三个点只覆盖4652/18324次替换，不能代表全Splay。

这把“不同shape”的具体差异缩小到两种字段顺序。key位置虽一样，M仍按精确shape失配；right的位置确实变化。
尚不能由这些次数确定维护时间，也不能仅凭key offset相同放宽安全守卫。详见[site_notes.md](site_notes.md)。

## 3. 机制对照：正确性通过，正式效果仍UNKNOWN

|case|A/M/C_ON/C_OFF N1/N2正确性|正式有效/目标|OFF/ON|ON/M桥接|
|---|---|---:|---|---|
|Splay|8/8 PASS|0/120|UNKNOWN|UNKNOWN|
|numeric_control|8/8 PASS|0/120|UNKNOWN|UNKNOWN|

C_ON/OFF使用同一个无计数ELF、同一JS，仅在必需Setup后、首次Run前配置三处opcode；热读取没有mode分支。
恢复等长get_field，保留栈/receiver与atom所有权；重复配置不再重复dup。每个正确性进程调用配置两次且原断言通过。
但独立计数门禁只保存1/6，未证明OFF目标查询/更新减少及普通查找增加，不能标为READY。ASan/UBSan、保存加载/嵌入运行等也未完成。
没有pilot或正式样本，表中不放短正确性时间，更不作中位数/净收益判断。

## 4. 完整17项Octane与独立复测：尚未开始

|固定Run单元|A/M/V8_ON正式有效/目标|绝对时间、相对比值|
|---|---:|---|
|Richards|0/90|UNKNOWN|
|DeltaBlue|0/90|UNKNOWN|
|Crypto.Encrypt|0/90|UNKNOWN|
|Crypto.Decrypt|0/90|UNKNOWN|
|RayTrace|0/90|UNKNOWN|
|EarleyBoyer.Earley|0/90|UNKNOWN|
|EarleyBoyer.Boyer|0/90|UNKNOWN|
|RegExp|0/90|UNKNOWN|
|Splay|0/90|UNKNOWN|
|NavierStokes|0/90|UNKNOWN|
|PdfJS|0/90|UNKNOWN|
|Mandreel|0/90|UNKNOWN|
|Gameboy|0/90|UNKNOWN|
|CodeLoad.Closure|0/90|UNKNOWN|
|CodeLoad.JQuery|0/90|UNKNOWN|
|Typescript|0/90|UNKNOWN|
|zlib|0/90|UNKNOWN|
|**合计**|**0/1530**|没有本轮GM或bootstrap|

独立Splay/numeric复测A/M也是0/120，未合并旧时间。核心16/13suite和扩展17/14suite的集合未改变；Box2D/官方latency仍不在本测量口径。
V8_ON继续固定官方d8与`--jitless --no-lazy --use-ic`。复用旧实际dump/Map日志：两个key共享FBV[12]且有多态状态转换；Run逐次命中/回退和直接槽快照仍UNKNOWN。未重建V8，不拿参考源码commit冒充制品精确构建commit。

## 目前能说什么，还缺什么

本轮确认Splay三读点在两种own布局间切换，M因此发生已记录的失配、真实查找和shape边维护；这是机制频率证据，不是退化时间归因。
还不能回答停用这三点是否更快、控制C与M是否可桥接、哪个一般修改有净收益，或新一批Octane中M与V8差多少。
**OPT=NOT_IMPLEMENTED_WITH_REASON**：缺少完成的机制效果证据，不是证明没有优化机会。
当前最短下一步是取得C_ON N1的可靠子进程启动/退出记录，见[next_commands.md](next_commands.md)；不是继续盲开长队列。
保存旧44条稀疏/41条密集记录，离线重放12文件逐字相同；没有把旧数据、缺失样本或诊断时长补成正式结果。
