# inherited_method_opportunity / attempt01

本轮只做两个新方法控制、四个冻结条件；不实现IC。先读 [results.md](results.md)，代码/证据见 [micro_cases.md](micro_cases.md)、[bytecode_notes.md](bytecode_notes.md)、[richards_notes.md](richards_notes.md)、[v8_path_evidence.md](v8_path_evidence.md)。实际完成量和门槛以completion.json、analysis/audit.json为准，不以脚本存在充数。

## 固定条件

同一WSL2 Ubuntu24.04.2 / x86_64、Ryzen5800H。主机环境在raw/commands/environment_before.json与environment_after.json；频率/温度/功耗、宿主后台未控制/UNKNOWN。没有混入旧Windows时间。

|条件|实际制品SHA256|运行选项|
|---|---|---|
|A|584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1|无额外flag|
|M|7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef|原M，无R/SW开关|
|V8 ON/OFF|83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133|共同--jitless --no-lazy，只差--use-ic/--no-use-ic|

绝对路径、依赖及其SHA见manifest.json；ICU与snapshot均核对。QuickJS底座2026-06-04/04be246…，GCC13.3.0、-O2 -g -fwrapv，无NDEBUG/LTO/PGO。全部直接复用上轮制品，本轮没有重建QuickJS或V8。V8精确构建commit/完整工具链UNKNOWN；37fb849…仅是固定官方参考源码，不能冒充下载binary构建提交。RegExp interpret-all=true、tier-up=false；OFF槽/逐次命中率UNKNOWN，不称全部缓存关闭。

## 计时和输入

共用cases/method_control.js，只在外部设置CASE_KIND。step返回x+1，方法读取保留在4096轮循环内。对象/prototype在timer外建立；同一case四边同一最终script SHA、同一输入、同一N；source/static compilation、adapter、输出及最终校验在外，首次Run包含在内部N次、无额外预热，GC/helper/实际必要工作在内。native单调benchNow来自原adapter，不回退Date.now，不拼接不同起点的时钟。

预期为4096×4097/2=8390656，N次checksum为N倍。N1/N2、最终N逐边检查。起始8192、共同倍增，两case最终16384；各12个独立final pilot均>=1s，失败门槛的较小N pilot保留。30轮×2case×4条件=240正式新进程，内层4096轮与外层N分开记录；案例先后15/15、各条件各位置7/8，seed20261028。诊断/构建/采样不与正式性能并行，没有补跑失败或删outlier。

UTC只作日期元数据；raw逐进程保存UTC跨度与父单调时长差，analysis/UTC_consistency.json汇总范围。UTC起点在reservation文件写前、单调起点在写后，因此差异包含未分离的记录I/O/可能时钟行为，不能直接认定为时钟漂移；不修raw。性能仅用内部单调时长并检查父时长包围。

## 入口1：只重算公开raw，无旧ELF/绝对路径依赖

在本目录，Python3标准库（Windows/Linux均可），选择新的输出目录：

```sh
python -B analyze.py --output replay_new
```

summary.csv含所有有效样本的median/mean/sample_stddev(n−1)/Q1/Q3/IQR/min/max，Tukey两半中位数；内部ms/完整Run与端到端ms/process分列。ratios.csv以共同完整8进程轮次为单位bootstrap10000次，seed20261028，线性百分位95%探索区间；描述统计不因不完整轮丢掉其他有效记录。ratio为分子/分母，>1分母快；inherited/own>1则继承慢。denominator_time_change_pct的方向是分母相对分子，不要误读为继承相对own。无总体GM，无相减中位数得到self-time。

独立审计audit_independent.py另查数量/顺序/描述统计；跨平台raw-only重算见analysis/portable_replay_verification.json。不访问历史绝对路径，旧路径只是来源记录。

## 入口2：本轮实际执行命令（记录，不在已完成attempt上重跑）

Windows原生先记录Git及起始状态：

```powershell
python setup.py host
```

在WSL中、同一attempt目录依次执行：

```sh
python3 -B setup.py init
python3 -B run.py correctness
python3 -B diagnostics.py micro
python3 -B run.py timer
python3 -B extra_diagnostics.py reasons
python3 -B extra_diagnostics.py richards
python3 -B profile_check.py
python3 -B run.py campaign
python3 -B evidence.py
python3 -B analyze.py --output analysis
python3 -B audit_independent.py
python3 -B report.py
```

另外Windows原生运行fetch_reference.py，仅获取四个固定commit小文件，每URL一次、TLS验证开启；URL/SHA在source_reference/manifest.json，不下载引擎树。仅source阅读，不影响正式选项。实际首次analysis/独立审计运行于Windows，后又在Linux公开raw重算，容差1e-12。

所有写入拒绝覆盖。正式进程失败/中断的started位置不会自动重试；阶段checkpoint、原始退出码/stdout/stderr保留。不应将本目录重新运行后覆盖原样本；新campaign另开空attempt及独立STORE路径，复制工具/inputs/cases而非raw/selected/frozen，重新生成manifest、门槛和顺序。

## 入口3：制品丢失时恢复版本

A使用仓库`../../legacy_ng_ic_slotfix/attempt01/recovery/sources/base.tar.gz`，固定upstream04be246001599f5995fa2f2d8c91a0f198d3f34c；M应用`../../read_ic_mic/attempt01/patches/A_to_common_M.patch`的原单槽配置。可复用read_ic_mic的new_campaign.py/prepare.py恢复纯源码。按上轮ic_mechanism_audit/sources.json逐文件核对，保留原CRLF与LF规范化哈希区别，不能改旧哈希“修通过”。

在新的空构建目录使用同GCC13.3.0与官方参数：`make -j2 qjs qjsc`（-O2 -g -fwrapv，不追加NDEBUG/LTO/PGO）。所得SHA必须登记为新制品；若不同，建立新cohort/新样本，不偷偷替换冻结manifest。无需bare历史库。V8只恢复同一官方15.6.21 artifact及snapshot/ICU身份，不能改latest或以Node替代，也不因观测受限编译V8。

## 诊断与材料

- A/M窄计数版直接复用ic_mechanism_audit的独立诊断制品，另用原M理由计数交叉核对。没有修改正式VM或IC算法；scope是已登记源码函数，不是全VM总计。
- bytecode/为实际caller/callee原始dump/快照。QJS canonical原atom号替为属性字符串、保留其余编码；M保留实际siteindex。两组methodLoop/step逐引擎规范化序列一致。
- receiver断言只加在明确标注的micro诊断副本，改变其字节码，不用于原dump或计时。未给Richards原方法加wrapper。
- Richards三处QJS频率/理由直接复核上轮N1/N2 gzip与源码/PC身份，不重采；本轮V8 N1全量有界dump一次、N2按`*.*`过滤。完整源码/PC/receiver map/holder对应在richards_sites.csv及相邻JSON。
- raw/diagnostic/*.gz旁identity.json保存压缩/解压SHA、binary/script身份。用`gzip -dk <archive>`或Python gzip.decompress恢复到**新文件**即可，不覆盖原raw。大型binary/未压缩报告留/home/mzyx/inherited_method_opportunity_attempt01，不进普通Git。
- perf检查仅一次，127/not found，未sudo/安装/改权限/改用信号采样；见profiling_status.md。位点时间贡献、安装handler、逐次命中率保持UNKNOWN。
- 解析阶段曾过强要求继承receiver map-details存在，已改为诚实null；成功runtime原始记录未覆盖重跑。权限自动审核曾超时、确认无进程启动后重试一次，见workflow_events.json；没有实际性能位置重试。

历史B/C/D/P/M/R定义见上轮version_map.csv。本轮只用A/M/V8 ON/OFF，不做旧批次相除、不继续方法外提、不实现prototype IC、不自动Git提交推送。
