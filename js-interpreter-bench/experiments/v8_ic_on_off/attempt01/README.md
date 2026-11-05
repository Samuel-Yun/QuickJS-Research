# V8 use_ic 三条件能力检查（attempt01）

**BLOCKED_IC_INTERVENTION：不是已完成的性能实验。** 三条件/三案例没有扩大，未改 VM、未构建、未下载新 runtime、未开始 pilot 或正式计时。参见 [results.md](results.md) 和 [summary/audit.json](summary/audit.json)。

## 制品与实际命令

WSL2 Ubuntu 24.04.2，x86_64，AMD Ryzen 7 5800H。原版 QuickJS commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`；复用原版 A，GCC 13.3.0，`-O2 -g -fwrapv`，未添加 NDEBUG/LTO/PGO。实际历史编译命令见 `runtime.json` 指向的原构建日志。

| 文件 | SHA-256 |
| --- | --- |
| 原版 qjs | `584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1` |
| d8 15.6.21 | `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133` |
| snapshot_blob.bin | `5af8f6d23e18aca97e3d89b1cab0815a56235c29f37728ffe10255fdea035749` |
| icudtl.dat | `495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1` |

来源：`https://storage.googleapis.com/chromium-v8/official/canary/v8-linux64-rel-15.6.21.zip`。archive SHA、大小、元数据、绝对路径及 UNKNOWN 构建字段见 `runtime.json`。官方分发渠道不等于构建元数据的 `official_build` 必为 true。该制品精确源码 commit、完整 compiler/GN args 保持 UNKNOWN。

以下是本轮真实执行的三个命令前缀；`SCRIPT` 指相同公开探针，而非尚未生成的正式计时脚本：

```sh
/home/mzyx/read_ic_dequickening_attempt01/A/qjs SCRIPT
/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/d8 --snapshot_blob=/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/snapshot_blob.bin --jitless --no-lazy --use-ic SCRIPT
/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/d8 --snapshot_blob=/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/snapshot_blob.bin --jitless --no-lazy --no-use-ic SCRIPT
```

没有退回 `--max-opt=0`。`runtime.json` 中 `historical_*_not_used_in_this_attempt` 只保留制品旧使用口径。全部实际 argv/stdout/stderr/退出码保存在 `raw/capability/`。诊断的 native-syntax 会打印 developer-only 警告；普通模式/正确性均无警告。不能把诊断开关带入正式命令。

## 已有材料

- `cases/`：前轮两微程序的原字节复制，来源身份见 `inputs.json`。
- `probes/correctness/`：每案例 N=1/2 的共同完整 JS；三个条件每次使用同一脚本 SHA。原 Richards 源码直接内嵌，原断言和许可头保留；完整许可位于仓库 `benchmarks/octane/upstream/LICENSE`。
- `correctness/results.json`、`summary/correctness.csv`：18 项均通过。此驱动有额外 correctness 校验，不是正式计时驱动。
- `raw/capability/`：版本/help、全量 flags、接口检查、真实 dump、时钟小检查、动态依赖。`raw/ic/`：8 份独立诊断日志。
- `source/fetch.json`：五个固定版本小文件的 TLS 失败；`source/version_reference.md`：tag 参考映射及边界。
- `summary/selected_site_*`：同进程 bytecode-PC/IC-log 对应；OFF 状态保留 null。
- `identity_after.json`：77 源码文件、两 runtime、snapshot/ICU/元数据校验和当前动态依赖；原字节及 LF 规范化 hash 分开。
- `protocol.json`：预定门禁、计时和统计规则，不是执行完成记录。正式 N、顺序和三份正式脚本均未冻结；没有正式 raw/性能表/区间。

## 不运行任何引擎的证据重放

在本目录下使用 Windows 或 Linux 的 Python 3 标准库：

```sh
python replay.py
python replay.py
python analyze.py
```

前两条各创建一个新 `replays/evidence_*`，只读公开 raw 和正确性脚本，重建七份能力/正确性汇总并检查逐字一致、raw 和已发布汇总未变；无需 `/home/...` 的 ELF。已实际执行两次，记录见 `replays/`。第三条**预期拒绝**生成性能表：当前没有授权的正式数据，退出非零并报告 BLOCKED。不得将这种证据重放称为“性能统计已重算”。

`review.py --output NEW_DIRECTORY` 也可在新目录仅重建能力汇总。`probe.py`、`mechanism.py`、`vector_probe.py` 等是本次真实探测入口；**不要在已冻结 attempt01 上重跑采集**。IC 日志有禁止覆盖保护，部分制品清单按首次采集时间冻结。

## 最短恢复步骤

1. 先恢复可信 TLS/网络，或提供经核验的固定 commit `37fb84941c9be9f9914ee50b1ad366f06a1bd764` 的 `flag-definitions.h`、`ic.cc`、`runtime-test.cc`、`accessor-assembler.cc` 和 `interpreter-generator.cc`。不关闭 TLS 校验，不以 main 冒充对应版本。tag 仅是参考映射，不把它升级为二进制来源证明。
2. 利用现有二进制的轻量观测，取得 OFF 的目标 `stableOwn` PC=0 / FBV[0] 未初始化或不安装缓存的**正证据**，并用该版本源码解释。ON 已有 0→1 记录；OFF 无日志、GetFeedback 返回 undefined 都不能补足这一步。不得强制改变某一边的反馈分配策略。
3. 外部条件变化后使用新 attempt，重新确认必要身份并补齐上述门禁。通过后才实现/冻结正式三个脚本、共同 N 和六排列顺序，按 `protocol.json` 的 270 条新进程方案运行。不用本目录的正确性过程墙钟凑性能表，不导入旧时间。

本轮没有交付可工作的完整正式采集/统计框架：`analyze.py` 是明确拒绝输出的门禁入口。pilot、selected-N correctness、正式采样和配对 bootstrap 均未执行。原版源码可从冻结官方 commit 恢复，无需提交 ELF、构建树或历史裸仓库；本目录最大原始文件小于 1 MiB，无需大文件归档。
