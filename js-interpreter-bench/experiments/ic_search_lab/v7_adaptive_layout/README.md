# P1独立复测与四个新方向（v7）

本轮实际实现和测量：复用冻结A/s001/P1，新增IO2/IO4 LAYOUT与DIRECT、AQ1、AP1、ST1。
起点为myx的35c6b80445ca95e1b052574900625fd0a4cbc09c；upstream底座为
04be246001599f5995fa2f2d8c91a0f198d3f34c。没有自动提交或推送。

## 本轮已完成

11个完整新批次，2967/2967条有效性能记录：P1五轮，七个新候选各一轮完整初筛，
IO2_LAYOUT/AQ1/AP1各三轮完整复测。没有满足追加五轮确认的整体信号；未提升候选。
逐项时间/分布/相对真实父版及底座的比值均已写入CSV，完整回答见results.md。
7/7新版本的生成源码与冻结源码一致，最终制品/输入重新校验通过；归档离线重算PASS。

OOM压力补测不是PASS：初版探针对null异常处理有误，修订探针及A/s001独立ASan
对照仍复现低内存异常回溯问题。原脚本和失败全部保留，详见oom_followup.py、
oom_followup.explore01.json及results.md末节。没有修补冻结VM，也没有把共同失败
转写成候选安全通过；完整OOM安全仍未证明。后续独立诊断完成，不再追加性能采样。

## 数据边界

用户明确允许忽略计时交叉核验阻塞，故建立独立 `explore01` 批次，标为
`EXPLORATORY_CLOCK_LIMITED`。仍使用原内部CLOCK_MONOTONIC，不改系统设置。
RAW/UTC差异只记警告；boot、制品/输入身份、结果与内部区间被外部包住仍是硬门槛。
这不证明计时误差消失，不能据约1%的变化确认收益，bootstrap也不含时钟误差。
详见 `protocol_clock_warning.md`。

原STOP、预检失败与73条部分数据保留并隔离，不混入新批次。
`README.history.md`、`results.initial.md`、`results.restored01.md` 是历史记录，
其中“尚未实现/停止”不代表新批次状态。最新可检查状态见 `audit.json`、
`candidates.csv`；完整数据见 `comparison_octane.csv`、`comparison_sunspider.csv`、
`aggregate.csv`，最终总结为 `results.md`。

## 条件与指标

WSL2 Ubuntu24.04.2/x86_64，Ryzen7 5800H，GCC13.3，固定CPU affinity 2。
沿用 `-O2 -g -fwrapv -DHAVE_CLOSEFROM`，无额外NDEBUG/LTO/PGO/JIT。
加载、必需Setup在计时外；首次Run计入，无workload预跑。单位ms/完整Run，
N与原输入/断言冻结，不因候选快慢改变。GC/helper/builtin/RegExp按实际计入。

- Octane核心16项/13suite、扩展17项/14suite：先suite内GM，再suite等权。
- SunSpider完整26case等权GM；不与Octane合成总分。
- 比值为候选/同批分母，百分比 `(ratio-1)*100`，负数表示候选用时较低。
- 单轮只作点估计；三/五轮用10000次固定seed整轮配对bootstrap，未作多重校正。
- 不跨各自小批次拼成精确排名，不用旧Windows数据作分母。

## 一个入口（在Linux/WSL中串行运行）

进入本目录。已有worker运行时不要启动第二个；不并行构建、sanitizer和计时。

```sh
# 已初始化，不重复init/explore；跳过已完成有效位置：
V7_EPOCH=explore01 V7_WARN_CLOCK=1 python3 -u run.py pipeline --labels all
# 初筛后：P1剩余轮次、有信号复测、独立内存/机制检查及汇总归档：
V7_EPOCH=explore01 V7_WARN_CLOCK=1 python3 -u run.py finish
# 只重算统计，不执行引擎、不依赖旧绝对二进制路径存在：
python3 analyze.py --use-archive
```

P1原定五轮；有信号的每方向最多一个代表各三轮；只有广泛名义收益满足预先条件，
才追加一个候选五轮。所有结果仍计时受限，不默认跑每候选30轮。
本轮已全部收齐，finish现会复用已完成位置/检查，只更新统计与报告；
冻结OOM诊断不可用同名输出反复重跑。要新采集应另建campaign并保留本次记录。
boot改变不可用旧epoch补样本。保存记录后另建cohort和新同批对照；
不自动关闭WSL、修改时钟源或系统服务。

## 复核与恢复材料

`runs.jsonl` 为本地追加原始记录；结束后归档为 `raw/*.runs.jsonl.gz`，
`raw/archive*.json` 保存压缩/解压SHA及拼接offset。离线分析校验后直接读归档。
`offline_recompute.*.json`（生成后）核对归档统计与现场输出逐字一致。
缺失值保留为空，不填0/epsilon，不删除失败case来改善汇总。

`identities/*.json` 保存路径、制品/源码SHA和编译命令；
`patches/*.from_s001.patch` 可在冻结s001上恢复，`*.patch` 是相对实际父版差异。
`variants.py` 确定性生成，`builder.py` 保持一份active并检查防覆盖。
冻结A/s001/P1不重建。正式版与sanitizer、计数版分离，不用诊断时间排名。
`source_correspondence.*.json`（生成后）核对生成源码与冻结制品来源。

布局、状态转换、快慢路径见 `mechanism.md`。有界检查见 `correctness.*.json`、
`sanitizer.*.json`；未跑完整test262。独立计数为全进程N=1（含Setup/校验/清理），
不是计时区间或某条指令self-time。

active、ELF、生成JS、现场JSONL、日志及keeper文件已.gitignore；不提交大制品。
不上传私有jwst-compiler；本轮未访问该项目。不自动提交或推送。
