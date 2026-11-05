# A/M/H/OFF/ON：既有16 Octane Run与扩展覆盖，同批比较

**状态：GLOBAL_BOOT_CHANGED_EXTERNAL_INTERRUPTION，未完成30轮。**
完成2181/2550条，全部完成记录有效；固定16项2051/2400，zlib130/150。
缺369个完成结果（含1个仅启动标记），无跨boot补位。见interruption_protocol.md、
campaign_stop.json、results.md和根目录audit.json。主总体不可完整估计；
共同25轮只在summary/exploratory_partial.*中明确标为中断后探索结果。

参考提交 f87dbff4536f6eb471f8d4e4a656b1e052604b17，myx。
这是独立新campaign，旧实验/旧raw/旧结论只读；没有引擎修改、重建或自动提交推送。
当前采集阶段与最终数量以 raw、collection_closed.json 和 summary/audit.json 为准，
文件或计划存在并不表示采样已经完成。最终报告见results.md、decision.md。

## 条件和输入

A为upstream04be246001599f5995fa2f2d8c91a0f198d3f34c的原版QuickJS，
M为原own单槽IC，H为M加受限一层原型data IC，OFF/ON共用同一个switch ELF。
OFF仅禁止继承条目填充，own IC仍开启，保持24B/site和原守卫/引用算法。
runtime.json记录实际四个ELF的路径、完整SHA256、x86_64身份和依赖hash。
没有用历史A或旧局部M/H/OFF/ON时间作本轮分母。

静态输入来自v8_ic_octane/attempt01的固定Octane570ad1ccfe86e3eecba0636c8f932ac08edec517，
adapter/driver逐字复制。16 canonical Run的生成JS与同N旧归档若存在则逐字核对。
Crypto仍是BENCH_ONLY_XORSHIFT32_PRELOAD_V1、seed305419896，在base/crypto前安装，
保留RC4跨Run演化；crypto_inputs.py只将旧验证器的环境传递/范围文字适配到五条件。
N1/N2与选定N均比较plain/observed五条件的真实明文/密文、随机字节、padding及RC4状态摘要。
正式不装观察hook，不把确定性随机数用于真实加密。

## 覆盖先于性能冻结

既有16项全部保留。扩展在约30分钟预算内重新检查五条件原Run：

- Box2D：五条件可执行，但原Run没有最终结果门禁，不制造expected或以退出0代替语义证明；保留原始输出与覆盖行，不纳入正式。
- zlib：原read缺失失败原样保留；五条件统一--std及inputs/zlib_read.js，读文件仍在实际调用位置，不提前I/O或动态编译。原长度与C strcmp断言保留，具体边界见extension_validation.md。
- 因此本轮正式清单为17项，目标2550条；其中原固定16集合目标2400条。
- Splay/Mandreel的官方latency指标不在完整Run耗时口径中，保留覆盖说明。

coverage_frozen.json、formal_cases.json在正式和pilot前写入，不按快慢改纳入项。
summary/coverage.csv与主时间表保留所有18 Run和两项latency的状态及缺失。
扩展完整18集合因Box2D门禁不足不估计；17个可比Run的扩展聚合明确标探索性可用子集。

## 计时、顺序和失败规则

主指标内部ms/完整Run：native performance.now/CLOCK_MONOTONIC，首次Run在内，无额外预跑。
静态源/编译、Setup和最终校验/TearDown在外；原Run的动态编译、I/O、helper、GC、RegExp与断言在内。
重复会变热，不是每次全冷，不是属性查找self-time。zlib首次动态初始化仍在首Run内。
各case五条件使用同一脚本/输入/N；OFF/ON同一绝对ELF路径，仅启动环境0/1不同，其余条件置1。
全部直接qjs子进程串行，RUSAGE_CHILDREN差分记录whole-process user/system/CPU；
外部perf_counter_ns墙钟另列，CPU不替代内部主指标，不能相减求某步成本。

数值控制只记录3个原H进程，不再设波动停测门槛。身份、时钟、boot矛盾才全局停止；
单case正确性/参数外的一般运行失败阻挡该case，其他继续。保留版本独有回归及所有已启动记录。
先160个既有N1/N2检查，扩展另计；每条件2个独立pilot都≥1秒才固定共同N，
由N1/N2估计和旧N取有界起点，必要时共同倍增，上限131072、每进程300秒、总预算8小时。
选定N每条件再独立校验；不合并pilot和正式，不删异常或偏短样本，不自动重试失败位置。

30轮，seed20261030。每case六个随机基序各取五种循环轮转，再打乱30组；
每条件每位置恰好6次，五条件相邻，轮内case顺序预先随机。没有声称覆盖全部120排列。
frozen.json冻结协议/coverage、依赖、脚本、schedule和配置的SHA；结束再次核验。

## 统计与总体

summary/per_condition.csv：每case/条件的实际n、median/mean、样本stddev(n−1)、
Tukey上下半段Q1/Q3/IQR/min/max，内部、外部和CPU分开。
summary/ratios.csv：M/A、H/A、ON/A、H/M、ON/M、ON/OFF、ON/H、OFF/M。
比值小于1分子更快，变化%=100×(ratio−1)。同轮五条件共同重采样10000次，
seed20261030，中位数之比，95%线性百分位探索性区间；未做多重比较校正。
缺失不填epsilon或旧时间，版本独有失败不从覆盖或结论中抹去。

总体先suite内子项时间比GM，再suite等权GM。固定16项（13suite、含固定输入Crypto）
为主；排除Crypto的14项只作历史口径补充，不能择优替换。完整18扩展集若不全可比则标不可估计，
可用17项（14suite）单独标探索性。总体区间的每次轮次抽样在所有case共享，重新计算逐项中位数和suite权重。
这不是官方Octane分数，不对不同case绝对毫秒求GM，不混入旧V8或Windows数据。

## 本轮入口和公开raw重算

已启动采集（拒绝对同目录重跑prepare，不覆盖旧位置）：

```powershell
wsl.exe -d Ubuntu --exec /usr/bin/python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/prototype_ic_octane/attempt01/run.py
```

从仓库根目录只重算，用Python标准库，Windows/Linux均可，不打开/home ELF、不启动引擎：

```powershell
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt01/test_analysis.py
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt01/analyze.py --output replay_octane_5condition_new
```

同时重算中断后共同完整轮的探索性补充（同样不启动引擎，输出目录必须新建）：

```powershell
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt01/analyze_partial.py --output replay_octane_partial_new
```

输出目录必须全新。保留本目录全部public输入/raw/config，以及reused_evidence.json引用的旧公开材料。
重算入口不要求运行依赖或旧构建树，实际制品核验与raw重算分开。

switch sanitizer仍为上轮NOT_COMPLETED_BUILD_INTERRUPTED，不能冒充新PASS。
频率、温度、连续宿主背景和物理SMT对应UNKNOWN；供电/电源方案只记录可查询事实，不擅改系统设置。
本轮不开发新IC、布局或调用优化；全部结果齐备后再讨论整套收益和回归范围。

## 中断后的实际恢复入口（本轮未自动执行）

先取得可持续完成批次的WSL运行窗口，保持接电/已知电源状态并避免主动关闭采集会话。
本轮没有证据证明具体哪个系统因素导致了重启，不自动改宿主或WSL配置。
必须新cohort，不补attempt01剩余369位置。下一空编号若为attempt02：

```powershell
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt01/new_campaign.py --attempt attempt02
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt02/test_analysis.py
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt02/analysis_ready.py
python -B js-interpreter-bench/experiments/prototype_ic_octane/attempt02/host_record.py
wsl.exe -d Ubuntu --exec /usr/bin/python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/prototype_ic_octane/attempt02/run.py
```

new_campaign.py实际存在，只创建工具/配置，不复制raw、不启动任何引擎；目标目录存在则拒绝。
上述新campaign命令未执行，不能称新30轮已验证。本轮停止于保存和分析真实部分数据。

## 分析重放核验与字段范围

Windows Python实际重放22份派生文件：21份逐字一致，exploratory_partial.json
仅by_suite对象键序列化顺序不同，全部数值与规范化JSON SHA一致，见replay_verification.json。
不宣称22份全都逐字相同；verify_replay.py不调用引擎。该键序问题不改变suite权重或估计值。
原预声明analyze.py未改，新增共同25轮估计器按interruption_protocol单列，均非官方分数。

summary/audit.json与independent_audit.json中each_condition_each_position_six是计划检查字段，
不代表中断批次实际已达到每位置6次。根目录audit.json为最终状态，
summary/actual_order_counts.csv给出实际每位置完成数；full_30_round_protocol_completed=false。
report.py生成报告骨架；results.md/decision.md已在其后补入跨boot事实与明确标注的25轮探索表，
不应重跑骨架覆盖这些说明。统计复现使用上述raw-only入口即可。
