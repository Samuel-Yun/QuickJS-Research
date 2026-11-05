# 搜索在第一个候选的构建阶段被阻断

**没有找到已验证改善；尚不能判断c001有效或无效，更没有20%收益结论。**

## 做了什么

读了现有M/P、R/K32、U负结果和最新Splay两shape证据，核对myx、工作区与旧任务进程。
冻结A/M实际ELF/SHA通过，8个独立算术/own读取smoke全部PASS。
在一个总目录建立了单一活动源码/构建位置、一次性M源码归档、A/M逐字制品副本、候选CSV和逐进程JSONL。
列出8条待试思路，未把已有数组化、force_inline、P四槽/R退出/U字节偏移冒充新算法。

实际仅改了c001：合格own-data miss的已验证offset与旧缓存相同，则保留旧shape锚点；原精确shape命中守卫、普通查找/取当前值及释放逻辑不变。
补丁SHA256：`b3627ebdda14987031dbd8e52500bfa789403d67cf36455bdb1bb00fe8c22f82`。

## 实际发生什么

|环节|结果|证据|
|---|---|---|
|有界执行检查|8/8成功，同次进程内boot不变|runs.jsonl / preflight.json|
|首个make调用|驱动错误地在无Makefile的目录运行；make退出2|完整stderr已保存；不是候选编译错误|
|修正cwd后重试同一c001|宿主wsl.exe约13.016秒后退出1，没有Python异常和Linux make完成记录|host_runs.jsonl、runs.jsonl最后process_start|
|未完成Linux进程|make PID590，boot `1dffc4ca-1d81-4aaa-b0de-3b6036f678c5`，10:34:09.170479Z启动|command=`make -B -j1 qjs qjsc`，cwd=本lab/active|
|宿主末尾状态|Ubuntu Stopped|仅list查询，没有新起Linux/重启WSL|
|候选制品|未生成c001.qjs，没有可发布的SHA|artifacts中只有A/M冻结副本|

没有Linux完成记录，不能把宿主exit1说成make/engine的exit1；缺少CPU、signal、完成后boot也保持UNKNOWN。
不能把这个异常归结为OOM、c001逻辑错误或WSL配置某一项。只读任务能通过，不等于构建/长采样具备可靠条件。
宿主当时C盘约11.45GB空闲，仅作为资源事实，不是根因证据。

## 候选与性能的准确数量

|项目|实际|
|---|---:|
|计划思路|8|
|实际尝试源码修改|1（c001/maintenance）|
|成功构建/最小正确性通过的候选|0 / 0|
|完成26项SunSpider初筛的候选|0|
|SunSpider复筛、17项Octane粗筛|0 / 0|
|最终确认与独立复测|0 / 0|

其余7条仍为PLANNED，没有“已覆盖三类实现”的说法。没有逐项候选时间、GM、置信区间、最优候选或总体性能结论；这里不能用旧M/R/U表代填。
7020断言的最小检查脚本已写，但**未运行**，不把它当正确性通过；完整GC/OOM/保存加载/qjsc运行/ASan/UBSan更未执行。

## 能解释什么

仅就源码，c001试图用保留旧精确shape锚点减少同offset失配时的shape替换。
新对象仍完整正常查找、检查描述并读取当前值；同offset不意味着允许用旧shape直接取新对象字段。
可能少维护，也可能多miss/保活旧shape更久。没有实际候选运行/计数/时间，不能判定这些成本的净方向。
简短源码推演见c001.md；这不是“第一个可信候选”的讲解或验证。

## 停点和下一步

已设置STOP_SEARCH，不再启动更多候选或同一长任务；冻结A/M、旧raw/报告和两个旧STOP均未改动。
要继续，首先必须恢复可以稳定完成普通编译/进程退出的执行条件；随后在本lab追加恢复记录，再构建同一补丁、最小正确性和完整26项初筛。
不需要先补旧24个诊断、不重建V8、不制作通用profiler。没有自动提交、push或读取/引用私有JWST。
