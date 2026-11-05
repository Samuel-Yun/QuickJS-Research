# IC生效与执行路径：独立attempt01

本轮仅三个案例、四个条件。最终完成状态见 `analysis/audit.json` 和 `completion.json`；脚本存在不代表已经执行。结论入口 `results.md`，机制计数 `mechanism_evidence.md`，源码解释 `path_comparison.md`，逐位置Richards覆盖 `coverage.csv`。

## 固定对象与计时

- WSL2 Ubuntu24.04.2/x86_64，Ryzen7 5800H，同一个WSL实例内串行运行。旧Windows时间不混入。
- A为冻结 upstream QuickJS2026-06-04 / 04be246…；M为read_ic_mic原始M的逐文件相同源码，本轮在独立目录干净构建。均官方optimized `-O2 -g -fwrapv`、GCC13.3.0，保留断言，无LTO/PGO。没有R退出或SW模式开关。
- V8 15.6.21同一d8/snapshot/ICU，`--jitless --no-lazy`共同，只有`--use-ic`/`--no-use-ic`不同。实际有效flags对照 `effective_flags.csv`；OFF反馈槽和逐site命中率UNKNOWN，不等于关闭全部缓存。
- `manifest.json`、`sources.json`记录完整SHA、绝对路径和依赖；绝对路径仅当前campaign来源。新M ELF与历史M SHA不同，未合并历史时间。主机功耗、频率、温度及Windows后台未控制/UNKNOWN，保留前后环境与进程快照。
- 原有native单调performance.now在适配器中预先捕获；正式内部区间为N次完整Run，首次Run在内，无额外workload预跑。Setup、静态加载/编译、输出在外；Run内部GC/helper/builtin/动态编译/原断言照计。不是property self-time，也不称纯解释器环时间。
- M1一次Run含4096次`obj.x`读取并累加，返回12288；M4一次Run是0..4095求和，返回8386560，无目标字段读取。Richards保留upstream断言，原base/richards内容未变，LF规范化身份单列。
- 四边同一完整JS/script SHA、输入、N与4096内循环。Richards继续复用原驱动中的`__tebTest.run()`，没有外提方法改写。N1/N2、选定N均独立正确性；3×4独立pilot达1s后冻结；正式30四元组，seed20261028，位置各7/8次。诊断与正式不并发，不删outlier/偏短样本，不补跑失败。
- 内外**时长**检查包围关系；没有把子/父时钟的绝对起点当同钟域。早期准备阶段WSL曾有不同boot_id；acquisition统一一个boot并逐条保存/核验，旧boot的单调绝对值不拼接。

## 入口一：只重算公开raw（无runtime，无WSL也可）

Python3标准库，在本目录运行；输出目录用新的名字，不覆盖已有结果：

```sh
python -B analyze.py --output replay_new
```

读取raw/formal、冻结配置/脚本、门槛及记录身份，不打开`/home/mzyx`下旧ELF。`statistics.csv`给内部ms/完整Run与端到端ms/process，sample_sd分母n-1，Q1/Q3为Tukey两半中位数；`ratios.csv`为10000次同案例四元组配对bootstrap，固定seed20261028，线性分位数95%探索区间。跨1是方向不明确，不是等效。无GM、无多重检验校正，也不相减中位数估初始化或单次miss。

`historical.py`单独读取原read_ic_mic公开raw，重算四个历史案例中位数、核对旧summary，并另存新bootstrap流；原完整24-case流的区间原样注明。它不运行引擎，不与本轮时间相除。

## 入口二：复查本机实际制品与本轮执行命令

以下为本轮实际使用的顺序；**不要在完成的attempt上重新采样**，文件写入拒绝覆盖：

```sh
python -B prepare.py
python -B diagnostic_build.py
python -B run.py init
python -B run.py correctness
python -B run.py timer
python -B diagnostic_run.py
python -B v8_diagnostic.py
python -B run.py campaign
python -B post_diagnostic.py
python -B prepare_probe.py
python -B analyze.py --output analysis
python -B audit_independent.py
python -B historical.py
python -B report.py
python -B close_identity.py
```

本次prepare前由Windows原生Python运行host_record.py记录Git状态（第一次WSL跨DrvFS status阻塞的失败保留）。prepare从已校验原M源树复制纯源码再build；首次诊断构建和选择失败记录保留，见evidence_index.md。V8额外机器码打印不支持，但实际objdump无需该运行时flag，放在正式结束后执行。

`common.verify_runtime()`用于当前WSL主机/ELF/依赖复查，和raw-only统计分离。重建或重新采集必须另开attempt/cohort并修改存储根；不要将旧manifest改为新路径、哈希后冒充原采样。本入口不承诺冻结ELF能跨工具链逐字节重建。

本轮分析还分别在Windows Python3.11与Linux Python3.12只读公开raw重算，按预定1e-12容差核对；独立计数/描述统计审计见analysis/independent_audit.json，CI重算一致性见analysis/portable_replay_verification.json。finalize.py由Windows原生Python最后记录Git状态与完成检查，不运行引擎。

## 固定源码恢复，不需要bare历史库

原upstream归档为 `../../legacy_ng_ic_slotfix/attempt01/recovery/sources/base.tar.gz`，来源/哈希/许可证沿用该目录清单；M补丁为 `../../read_ic_mic/attempt01/patches/A_to_common_M.patch`，P不参与新采样。可在**新的空目录**解包该归档、应用该补丁并令read_ic_config.h使用原M容量1；逐文件核对本轮sources.json的M_source_files后，才使用`make -j2 qjs qjsc`。旧CRLF原字节哈希不改；Git/LF恢复规则以read_ic_mic/sources/identities.json为准。若恢复后任一源码不同，报告差异而非更新冻结哈希。

新机器可先复用 `read_ic_mic/attempt01/new_campaign.py` 的恢复入口建立独立源树，固定编译器和Makefile参数，再给新campaign显式runtime路径。V8使用manifest指定的官方15.6.21制品及数据SHA；精确构建源码/工具链UNKNOWN，不能换latest。当前仓库既有源码材料已足够，本轮没有下载或重建V8。

## 诊断材料

`diagnostic_manifest.json`、`diagnostic/*.patch`与两个hook文件描述独立A/B/M聚合构建。没有改变IC算法、字节码规则或正式binary。`raw/diagnostic/*.json.gz`旁identity.json含压缩/解压SHA；例如：

```sh
python -c "import gzip,pathlib; p=pathlib.Path('raw/diagnostic/M.M1.own_integer.N2.json.gz'); pathlib.Path('/tmp/new_M1_report.json').write_bytes(gzip.decompress(p.read_bytes()))"
```

恢复目的文件应预先确认不存在；该例路径需自己选空路径。正文提供的是实际逻辑find_own_property进入、hash桶读和链atom比较；不是native call数、硬件周期或采样self-time。getter/嵌套JS frame通过独立scope回归核对；未插桩keyed/global不填0。额外原M理由计数版复用旧工具并核对source SHA+PC+queries/hits/fallback，不混诊断时间。

before为最终编译函数、M已完成prepare后的真实执行字节；after为该实例释放前快照。B的运行时改写可见，M从一开始为rdi；完整raw含源码/码字节/实例，便于离线复核。5B操作数是实际atom或site index，不能把同数值跨引擎/进程当同一opcode。

prepare_probe.py另存M自身rdi_prepare前/后两份真实最终字节（不运行性能采样），见prepare_snapshot_gate.json。新查找hook只登记源码编译函数；不是全VM总计，未登记的预编译标准库和37次无源码读取另列UNKNOWN，见diagnostic_scope_amendment.json。选定Richards/M1位置的计数匹配不受此缺口影响。

工作区仅新增本attempt，不自动Git add/commit/push。大型ELF/对象/未压缩报告留Linux构建目录；没有把bare历史或几百MB轨迹放入Git。
