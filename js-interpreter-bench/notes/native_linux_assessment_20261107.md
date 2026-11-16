# 原生 Ubuntu 复现可行性核查（2026-11-07）

结论：**可以在当前原生 Ubuntu 上运行项目的 QuickJS、V8 及 IC 研究代码，核心运行能力已经实测；当前仓库中的历史实验入口不能全部原样直接运行。** 需要为本机新建实验批次，适配运行路径和环境校验。完整三引擎复现还缺 JSC 及其依赖。无需为了运行这些 Linux 程序保留 `wsl.exe`。

本次只检查代码、恢复源码、编译和做有界正确性验证，没有安装系统包、下载源码、迁移旧磁盘、启动正式性能采样或改写历史实验记录。测试产物位于 `/tmp/quickjs-native-assessment-20261107-cv98kk11/`；可持久保留的命令、输出、构建日志、哈希和目录清单见 [核查证据 JSON](native_linux_assessment_20261107.json)。临时目录中的 ELF 不作为已安装的长期运行环境。

**本机与旧环境**

| 项目 | 旧 WSL 实验 | 当前实测环境 |
|---|---|---|
| OS | WSL2 Ubuntu 24.04.2 | 原生 Ubuntu 26.04.1 |
| 内核 | Microsoft WSL2 5.15 | Linux 7.0.0-38-generic |
| CPU | AMD Ryzen 7 5800H | Intel Core i9-14900 |
| 架构 | x86_64 | x86_64 |
| 编译器 | GCC 13.3 | GCC 15.2 |
| Python | 旧记录所属环境 | Python 3.14.4 |

本机已有 gcc/g++、make、CMake、Ninja、Git、GDB、perf、binutils、taskset、tar、unzip，QuickJS/V8 的本次验证没有额外安装依赖。GCC 13、Docker、Podman 当前不在 PATH。`perf stat -- true` 虽返回 0，但周期计数显示 `<not supported>`；白盒采样、硬件计数器和 GDB 专项流程仍需独立验收，不能从工具已安装推断其全部功能可用。

**实际验证结果**

| 内容 | 操作与结果 |
|---|---|
| QuickJS upstream `04be246...` / `2026-06-04` | 从仓库 `experiments/three_engine_baseline/quickjs-04be246-source.tar` 解包，`make -j1 qjs qjsc` 成功，无源码修改。 |
| IC 候选 c004 | 现有 `recover_source.py c004 <空目录> --profile matched` 成功恢复；`make -B -j1 qjs qjsc` 成功。 |
| 最新 v7 AQ1 | 用仓库 `v3_mass_search/generate.py` 的 s001 种子及 `v7_adaptive_layout/variants.py` 恢复，补入已有的 compat 探测文件后编译成功。 |
| v7 七个性能候选 | IO2_LAYOUT、IO2_DIRECT、IO4_LAYOUT、IO4_DIRECT、AQ1、AP1、ST1 全部生成源码哈希与冻结 identity 一致；仅 AQ1 在本轮实际编译运行。 |
| V8 `15.6.21` | 仓库已有 Linux ZIP，解包即可运行；d8、snapshot_blob.bin、icudtl.dat 与旧 manifest 哈希全部一致，`ldd` 无缺失库。使用 `--jitless --no-lazy --use-ic` 冒烟成功。 |
| SunSpider | 上述三种新编译 QuickJS 和 V8 各完成 26/26，N=1，校验返回值。 |
| Octane 抽查 | 四个运行条件各完成 Richards、DeltaBlue、Crypto.Encrypt、RayTrace、CodeLoadClosure，共 20/20，N=1。未验证全部 Octane。 |
| 语义检查 | 三种 QuickJS 均通过 `checks.js`；AQ1 另通过 v7 `targeted.js` 和 v3 `semantic.js`。与 benchmark 检查合计 **129/129**。 |
| 时钟 | upstream `performance.now()` 的 10,000 次非倒退、非冻结检查通过；这只是有界检查，不代表长时间正式计时门禁已经通过。 |
| 输入 | v7 Octane 的 25 个、SunSpider 的 28 个冻结输入文件全部存在且 SHA-256 一致。 |
| 旧 v7 统计 | 在临时副本中读取归档并离线重算；四份 CSV 字段全部一致，`audit.json`、`first_round.md` 逐字一致。CSV 字节差异仅为 LF/CRLF。 |

三次 QuickJS 构建的核心编译行均含 `-O2 -g -fwrapv -DHAVE_CLOSEFROM`。这些是本机 GCC 15 构建，产生新的 ELF 身份；不能填入旧 GCC 13 制品的哈希。`qjs --help` 返回 1 是本版本的帮助退出行为，本次正确性判断依据实际脚本执行，不将它误判为无法启动。

**代码中真正需要迁移的部分**

- [ic_search_lab/host.py](../experiments/ic_search_lab/host.py) 是 Windows 包装层，拼接 `wsl.exe -d Ubuntu ... python3 /mnt/c/Users/mzyx/Desktop/0921/...`。Linux 工作脚本使用 `/proc`、`os.wait4`、进程组、CPU affinity 和原生单调时钟，本机具备这些接口；新入口应直接调用 Python 工作脚本。
- [three_engine_baseline/cohort.py](../experiments/three_engine_baseline/cohort.py) 的 `verify()` 强制检查内核包含 `microsoft`、发行版为 24.04，并校验旧动态库的路径与哈希。本机实际调用它会拒绝并报告 `this is the frozen WSL2 cohort, not a native Linux cohort`。
- [timer_recovery/campaign.py](../experiments/timer_recovery/campaign.py) 另检查旧主机名 `LAPTOP-QPKCPDCB`；后期 runner 还固定了旧 boot_id、制品路径和 write-once 输出目录。因此只修改 `wsl.exe` 或建立路径软链接不足以恢复实验入口。
- [three_engine_baseline/runtime_setup.py](../experiments/three_engine_baseline/runtime_setup.py) 等脚本固定 `/home/mzyx/...`；后期 `workspace.json`、`identities/*.json` 又保存 `/mnt/c/.../artifacts/*.qjs`。本次从 Python 字符串常量识别出的 25 个 `/home/mzyx/<目录>` 在当前旧路径下均不存在，完整引用清单位于证据 JSON 的 `external-directories`。
- `engines/quickjs-upstream` 和 `engines/webkit-fd3406f` 是 Git gitlink，目前目录为空，仓库没有 `.gitmodules`。不能假定普通 clone 已取得源码；QuickJS 可直接用现有源码归档恢复，WebKit 若需重新构建则仍要迁移固定 checkout 或另外获取。
- 最新 v7 的 [README](../experiments/ic_search_lab/v7_adaptive_layout/README.md) 明确要求新采集另建 campaign。旧 `pipeline/finish` 会复用已完成位置，不能把它们作为本机新一轮的默认入口。

**哪些目录需要从旧环境取回**

| 复现目标 | 建议取回的材料 | 是否为当前起步必需 |
|---|---|---|
| 新建 QuickJS/V8 本机实验 | 已有 QuickJS 源码归档、IC 种子/补丁和 Linux V8 ZIP，均在仓库中。 | 无需先搬旧目录。 |
| 保留旧 WSL 的精确运行制品 | `/home/mzyx/three_engine_20261004/`，包含旧 QuickJS 的 qjs/qjsc 和 V8 runtime。 | 可选；旧 V8 可从现有 ZIP 按相同哈希恢复。旧 QuickJS ELF 不能靠 GCC 15 重编译保证逐字恢复。 |
| 恢复三引擎 JSC | `/home/mzyx/jsc_build_fd3406f/JSCOnly/Release/bin/`、`lib/`，保留符号链接；需要重建时另取 `/home/mzyx/jsc_webkit_fd3406f/` 固定源码。 | 三引擎实验必需；QuickJS/V8 两引擎实验不依赖它。 |
| 继续最新 IC 工作、保留旧 ELF 身份 | 旧项目 `experiments/ic_search_lab/` 及各 v2/v3/v4/v5/v6/v7 中 Git 忽略的 `artifacts/`、`active/`、未归档 `runs.jsonl`、日志。重点是 v3 的 A/M/s001、v6 的 P1 和 v7 候选制品。 | 从源码重建新批次可不搬全部；要验证旧冻结二进制则需搬。 |
| 逐一重跑早期白盒实验 | 证据清单中的 `/home/mzyx/*_attempt01`、`*_attempt02` 等专用源码/诊断/构建目录。 | 按所选实验迁移，不是全部都要先搬。 |

第四行的旧项目位于 WSL 可见的 `/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/`，实际对应原 Windows C 盘。**只备份 WSL 的 `/home/mzyx` 或只重新 clone Git，都可能漏掉这些被忽略的制品。** 优先备份旧项目工作目录与相关 `/home/mzyx` 实验目录，再按需迁入本机。源码和未提交改动、ELF/qjsc、符号链接、原始记录的价值高于可重新生成的 `.obj/` 和 CMake 缓存；旧构建缓存不能直接沿用新路径。

JSC 还存在明确的库版本问题：旧 `jsc_ldd.json` 显示依赖 `libicui18n.so.74`、`libicuuc.so.74`、`libicudata.so.74`，本机 `ldconfig` 当前提供 ICU 78。本次没有旧 JSC ELF，因此尚未验证其本机启动。迁移后应先做 `ldd`，将缺少的旧库放进专用依赖目录，或在匹配的 Ubuntu 24.04 环境中运行/构建；不要覆盖本机 `/usr/lib`。也可以用固定 WebKit 源码在本机重建，但要记录新的构建身份和执行模式证据。

**建议的本机落地顺序**

1. 在项目内新建独立的 native Linux 运行目录和输出目录，恢复固定 QuickJS 源码、IC 候选及 V8 runtime。保留 A、候选、编译配置和数据文件的独立身份。
2. 新增可配置的本机入口：项目根目录由 `__file__` 推导，runtime store、输出目录和 affinity 由参数指定。为本机新建 cohort/manifest 和输入哈希；旧 WSL 的环境检查保留在历史入口中。
3. 在同一个本机工具链下构建相互比较的 QuickJS 版本，验证 V8 flags、正确性、时钟、校验和及系统依赖。若研究需要接近旧工具链，另准备 GCC 13.3；本次已经证明使用现有 GCC 15 可以编译启动。
4. 需要 JSC 时再补其 runtime、依赖和源码；需要重跑某个白盒诊断时再迁入对应实验目录。
5. 选择并记录 i9-14900 上的固定逻辑 CPU、核心类型和环境条件，先做计时门禁，再按新批次采集。旧 affinity=2 可执行不等于与 5800H 的 CPU 2 有等价性能属性。

可复用项目代码、输入、方法和旧数据的离线分析；**本机时间不能与旧 Windows/WSL 时间混合或直接相除，旧 v7 的时钟受限标记也不能因迁移而删除。** 本轮证据足以确认核心代码具备原生运行能力，尚未完成正式 runner 的迁移、完整 Octane/JSC/白盒流程和新性能实验。
