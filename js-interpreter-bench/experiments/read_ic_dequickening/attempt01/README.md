# 原M持续失配读点退出：A/M/R独立campaign

固定上游2026-06-04 / `04be246001599f5995fa2f2d8c91a0f198d3f34c`，myx参考提交7dca3cdc8461c5576a4d63badbcf295bf0ad4f7c。
**已实际完成2160/2160有效正式样本**（Octane1440/micro720）、48个workload诊断、18个机制诊断和144个RSS进程，主审计PASS。
环境匹配桥接另完成48条及4个诊断；初版48条配置偏差原样保留、不混入。全部74个诊断归档双SHA通过。
Windows标准库22个输出连续新路径重放两次通过；结论见[results.md](results.md)，完整24项表见[analysis/tables.md](analysis/tables.md)。
R相对M的排Crypto主GM仅小幅改善，仍未超过A，稳定读/Richards有代价；不把它称整体QuickJS已加速。
本轮唯一策略K=32，未搜索其它阈值/布局，未导入SW开关做优化底座。

## 版本、边界与材料

- A/M从校验过的固定归档恢复，源码逐文件核对前轮身份；分别新构建。本轮M用于有限bridge与主比较，过程中不改变。
- R仅从M增加每site uint8_t streak，实际含对齐**24字节/site**（M16）；函数头组件仍16字节。
- 第32次连续guard miss在正常读取前恢复同长普通get_field/get_field2+atom，清shape并释放；下一次不进入IC。
- R没有mode字段/配置/强制LOOKUP，A/M/R正式环境不含QJS_READ_IC_MODE。普通写和普通读handler源码保持原样。
- Setup/静态前端在内部区间外，首次Run在N内，无额外workload预跑；GC、builtin、regexp、动态compile按原Run计。
- 同一WSL2 Ubuntu24.04.2/x86_64、Ryzen5800H、GCC13.3.0、官方-O2/-g/-fwrapv、保留断言、无LTO/PGO。功耗/频率/宿主后台不受控。

源/编译/制品/输入身份：`manifest.json`、`sources/identities.json`、`patches/`。
协议在`design.md`先声明，`protocol.json`/`measurement_manifest.json`冻结输入，`frozen.json`冻结共同N/顺序/hash。
Release ELF只在独立Linux目录`/home/mzyx/read_ic_dequickening_attempt01/`，不进普通Git。
归档保留MIT/BSD原许可；不需bare历史库，不下载新源码、不修改历史raw/报告，不提交/推送。

## 先看有限bridge，不混主统计

`bridge_check/`：精确M/SW新构建，numeric_control/Richards各12对平衡顺序、48条独立性能记录。
两者完整normalized最终码/atom与逐函数**实测dispatch**计数匹配，数值目标无属性读；计数只来自独立N2诊断，不是正式时间。
实际native JS_CallInternal反汇编保存在`bridge_check/machinecode/`；perf不可用，不特权修改系统。
有限bridge不是对开关布局调参，根因未定位不阻塞独立AMR。细节及限制见`bridge_check/results.md`（完成报告后提供）。
本attempt初版桥接M少传旧mode占位，偏差与纠错预声明见`bridge_check/protocol_issue.md`；初48条不覆盖。
主所有VM阶段结束后用`bridge_matched.py`另收双方同mode=1的48条及4个N2诊断；不重跑或混入主2160条。
若重建新campaign时初桥接已同环境，修复脚本会报告NOT_NEEDED，不重复采集。

## 正确性与真实退出

`correctness/{semantic_gate,mechanism_gate,private_state}.json`：旧回归/上游、23新JS场景/1814断言，另3私有C场景/72断言。
R独立ASan/UBSan实际运行；GC1800函数、OOM192预算、激活/退出/混合保存加载、qjsc和ROM加载重置。
`exit_state_checks.csv`：31不退、32恢复普通opcode/atom、hit重置、getter/Proxy/异常、递归和共享闭包的实际计数与最终opcode。
`target_sites.json`：poly2/4/8各32 IC miss+8160普通读，稳定目标8191 hit/8192查询且不退出；普通控制无目标读。
`phase_changes.json`保留永久退出之后失去未来稳定命中机会的例子，不加恢复策略、不进入聚合。
私有C是独立正确性翻译单元，实际检查退出JS_DupAtom增1、重复退出不增、销毁site和ordinary operand释放2；不作性能二进制。
场景数与断言数分列，不声称完整test262。

## 计时与固定集合

16 Octane Run+8 micro（每完整Run4096内轮）。Crypto历史输入限制不解除：保留采样，预排主GM，仅敏感性含它。
Box2D/zlib/官方latency沿用既有覆盖边界，不新增shim。微基准不进入总体GM。
父绝对monotonic ns、子绝对CLOCK_MONOTONIC ms，核验包围/单位/单调/串行，UTC只日期。
共同N经AMR/MRA/RAM九进程全部>=1s才冻结；正式30组三元组，六排列各5次，位置各10次，seed20261024，目标2160。
性能严格串行，不与构建/诊断/RSS/硬件采样并行。raw追加保存，已有位置含失败均不自动重试，不删异常值，不补跑到显著。

`analysis/summary.csv`、`statistics.csv`、`tables.md`、区间SVG：A/R、M/R、A/M，均>1右侧更快；10000三元组配对bootstrap探索性95%区间。
`analysis/site_findings.md`及`lifetime_site_alignment.json`按源码/规范码/最终PC做跨进程family对齐，保留匿名/重复身份限制。
Octane suite内子项GM再suite等权、完整rep轮次分块bootstrap区间；不是官方Octane分数。
端到端ms/process单列，不由中位数相减求初始化或单操作self-time。

## 独立诊断与内存

48个选定M/R workload诊断，全进程范围，CodeLoad双方共同min(8,正式N)，实际N记`diagnostic_plan.json`，不可冒充正式总量。
total_site_reads=queries+post_exit_reads；queries=hits+fallback；第32次是最后一个IC miss，下一次开始post，不重复。
分别报告hits/queries及hits/total_site_reads，不能用退出后的缩小分母冒充改善。
退出依据固定32连续guard失败，查找结果reason另计，不能按inherited等事后分类倒造策略。
真实find_own_property调用/bucket/chain与shape比较分开；其它helper不经此函数的工作不在这项hash计数内。
普通handler中的PC归因、完整源码/字节码留存均只存在诊断版。源SHA+规范code/atom+最终PC对齐，instance_id只进程内有效。
`streak_reads`是策略读检查hook事件（每进入IC一次），不是CPU实际load计数；`streak_writes/resets`是策略实际更新事件。机器码可能合并源读取。
atom所有权由源码和实际私有C引用检查核实；没有把全atom池每一次refcount变化伪称全套实测。
shape边、请求/峰值直接字节及释放后live守恒；间接保活字节UNKNOWN。site数组退出后仍保留分配。
静态eager分配随静态编译位于内部区间外，体现在外部时间和内存；CodeLoad等动态编译的分配按原Run计入内部。没有取消或隐藏分配。
16 Octane×3版×3GNU time RSS=144独立进程，KiB完整分布，三样本不足以证明等效，不混正式时间。

## 入口一：数据重算，无旧ELF

```sh
python -B portable_check.py
python -B portable_check.py
python -B audit.py
python -B archives.py verify
```

每次新建`replays/replay_*`目录与audit，不比较历史host字符串；从raw重建统计、RSS与correctness输入，不读旧ELF或缓存CSV。
rel/abs=1e-12数值/结构比较；前后hash核对原raw与已发表输出未改。大JSON只gzip并留压缩/解压双SHA。
恢复诊断原文：`python -B archives.py restore --destination /new/nonexistent/path`。

## 入口二：从固定源码重建新campaign

```sh
python -B new_campaign.py ../attempt02
cd ../attempt02
export IC_DEQUICKEN_STORE=/absolute/new/linux/store_attempt02
python -B bridge_prepare.py
python -B bridge.py diag_build
python -B bridge.py collect
python -B bridge.py timing
python -B prepare_r.py
python -B build.py
python -B correctness_run.py
python -B diagnostic.py build
python -B mechanism.py
python -B machinecode.py
python -B timer.py
```

恢复依赖仓库内已核验的upstream base.tar.gz、上一轮baseline_M.tar.gz及M_to_SW.patch，逐文件校验，不依赖旧/home ELF。
需要Linux x86_64、GCC/make/binutils/gdb、GNU time、Python标准库与常规开发头文件；本轮没有安装大型新工具链。
首次开发bootstrap仅是文件复用来源记录，不对已经派生/冻结的attempt再次执行。

## 入口三：新采集与实际制品身份

```sh
python -B campaign.py pilot
python -B campaign.py formal
python -B campaign.py tail
python -B identity.py --save-post
python -B portable_check.py
```

也可pilot后台执行后用`campaign.py after-pilot`衔接正式与尾阶段。任何失败保存并停，不改raw/hash，不重试失败位置。
身份检查`identity.py --map oldprefix=newprefix`只允许路径映射，不改变期待SHA；与数据重算分离。
本轮结束只报告数据与一个后续问题，不自动实现第二策略、调阈值或开始另一批实验。
