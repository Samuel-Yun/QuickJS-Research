# 逐读点 MIC 与匹配 PIC：attempt01

本轮标签 **A/P/M**。A 为 upstream QuickJS 2026-06-04，M 为新紧凑单槽读缓存，P 为同框架四槽对照。
不是旧 B/C/D 改名，不将历史时间与本轮相除。实验状态以 `analysis/completion.json`、`analysis/audit.json` 为准；尚无这些文件时不得称已完成。

本attempt已完成：2160/2160有效正式样本，48次选定workload诊断、22次机制诊断、144次RSS；计时/顺序/公开数据重算均通过。
结论先读 [results.md](results.md)，全部逐项表在 [analysis/tables.md](analysis/tables.md)。M在部分单态读和Richards获益，但主Octane聚合未获净加速，不能只保留正结果。
`coverage.csv` 是init时的预声明快照；完成后的实际correctness见 `analysis/compatibility.csv` 和 `correctness/summary.json`，不回写冻结前的pending记录。

## 定义和材料

- 先读 `design.md`（实现前记录）、`protocol.json`（pilot前冻结）。共同 workload、首次调用计入、无额外预跑。
- `manifest.json`：三版绝对路径/散列/构建参数；`measurement_manifest.json`：冻结 runner/输入；`frozen.json`：校准后 N、顺序、脚本散列。
- `implementation/`：共同实现和独立诊断模板；`patches/A_to_common_M.patch`、`M_to_P.patch`：正式实现补丁。
- `sources/identities.json` 保留源码原字节哈希和 LF 哈希，不篡改旧 CRLF 记录。P/M 只差容量配置。
- `correctness/`、`raw/build/`：语义/上游/两边 sanitizer/保存加载/qjsc/OOM/GC；`machinecode/`：实际布局、ELF text、反汇编。
- `raw/{correctness,calibration,pilot,selected_correctness,formal,memory}/`：分阶段逐进程 JSON/stdout/stderr；失败不删除。
- `raw/diagnostic/*.json.gz`：诊断原文压缩归档，旁边 metadata 保存压缩/解压 SHA256。不需提交几百 MB JSON、ELF 或 bare Git。
- `analysis/`：完整描述统计、配对区间、suite 层级聚合及区间、端到端、RSS、诊断、单独微基准图。

平台为同一 WSL2 Ubuntu 24.04.2 / x86_64，不混 Windows 历史结果。官方 Makefile `-O2 -g -fwrapv`，无 NDEBUG/LTO/PGO。
计时用捕获的原生 `performance.now`（Linux CLOCK_MONOTONIC），不是 Date.now；父进程保存绝对单调 ns 起止，UTC 仅日期标签。
主区间包含 N 次 Run、GC/helper/builtin/regexp/动态编译，不称纯 lookup self-time。Setup/静态 source frontend/输出在外；端到端单独报告。

## 入口一：仅重算公开数据（标准库，无旧二进制）

在本目录：

```sh
python -B portable_check.py
python -B audit.py
python -B archives.py verify
```

第一条输出 `analysis/portable_replay/`，不覆盖原结果；CSV/JSON 浮点比较预定 rel/abs tolerance 均为 1e-12。SVG坐标也允许相同数值容差，结构/文字必须一致。
`analyze.py formal`、`diagnostic.py summarize`、`supplementary.py` 可分别重算；不调用 runtime identity。
恢复原始诊断：`python -B archives.py restore --destination /new/empty/path`；目的目录必须不存在。
旧路径仅来源记录，统计不打开 `/home/mzyx` 或 `/mnt/c` 下的旧 ELF。

## 入口二：从固定源码重建（新目录，不覆盖本 campaign）

同仓库另开 attempt，示例：

```sh
python -B new_campaign.py ../attempt02
cd ../attempt02
export IC_MIC_STORE=/absolute/new/linux/store_attempt02
python -B prepare.py
python -B build.py release
python -B build.py correctness
python -B diagnostic.py build
python -B machinecode.py
python -B mechanism.py
python -B timer.py
```

`prepare.py` 校验并解开仓库既有 `legacy_ng_ic_slotfix/attempt01/recovery/sources/base.tar.gz`，核对固定上游 SHA 的逐文件身份，再生成 M/P；不依赖 bare history。
依赖：Linux x86_64、Python 3 标准库、GCC/make/binutils/gdb、GNU time、常用 libc 开发环境。源码/许可证来自冻结 upstream，未导入 NG runtime。
实际制品核验与统计分离：`python -B identity.py`；换存储位置可用 `--map oldprefix=newprefix`，只映射路径，原 SHA 不改。

## 入口三：启动新 campaign（必须先通过全部门禁）

```sh
python -B campaign.py pilot
python -B campaign.py formal
python -B campaign.py tail
python -B portable_check.py
```

或者在 pilot 完成后运行 `campaign.py after-pilot` 连续执行正式、诊断、RSS、分析。任何工具失败保留证据并停在真实失败阶段。
`run.py formal` 支持 resume：已有位置不重跑，包括失败位置；不自动补足“显著”。时钟异常写 BLOCKED_TIMER 并停止。
所有性能进程串行，正式不带计数/trace；不与构建、诊断或另一性能任务并行。

## 预先限定的覆盖与统计

16 Octane Run 单元，每边30；另8微基准每边30，目标2160新进程。各 case 六排列各5次；固定seed20261024；三元组相邻。
共同 N 经 APM/PMA/MAP 九个独立 pilot 全部≥1s 后冻结，偏短正式样本仍保留。
10000次三元组配对 bootstrap；A/M、P/M、A/P>1表示分母更快。Octane先suite内子项GM再suite等权，完整rep轮次分块bootstrap区间；不是官方总分。
Crypto加载随机padding未逐组固定，继续采集但预排除主GM，另给含Crypto敏感性GM。Box2D/zlib/latency保留旧边界，不扩展支持。
微基准不算总体GM。RSS为GNU time独立3进程/项/版，KiB，不把其时间混正式；直接请求字节、间接保活、RSS和text分开。

诊断 query 包括第一次冷查询。site按最终compiled bytecode + offset，不按atom共享；canonical字节码/atom映射/源SHA用于核对，instance_id仅本进程。
详细诊断全进程统计，与正式 timed region 不同。CodeLoad两项的独立诊断 N 预设上限8（P/M一致），避免保留每个新编译函数的源码/字节码产生超大原文；原始N和正式N写入 diagnostic_plan.json，不外推成全N计数。
M/P强保活shape边数可数，间接对象图字节 UNKNOWN。诊断独立分配/额外b指针不算正式IC请求。

不自动提交、推送；旧目录、旧数据不改。结论以同批次结果为准，不预设 MIC 胜出。
