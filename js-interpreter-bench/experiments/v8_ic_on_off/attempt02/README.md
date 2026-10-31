# 原版 QuickJS / V8 use_ic 配置开关对照（attempt02）

本目录沿用同一 WSL2 cohort 的冻结 runtime，独立采集三案例/三条件。与 attempt01 的区别是用户明确修订观测门槛；见 [protocol_amendment.md](protocol_amendment.md)。attempt01 的 BLOCKED、raw、报告和哈希只读保留。

最终执行量与结果见 `summary/audit.json`、`results.md`；本 README 不用旧时间填补新结果。门槛状态为 `PASS_WITH_OBSERVABILITY_LIMITATION`，**OFF 目标反馈槽直接观测仍 UNKNOWN**。不声称关闭了全部 V8 缓存。

## 固定身份与来源

`runtime.json`：精确绝对路径、SHA256、依赖和可用构建元数据。QuickJS 是无 IC 补丁的原版 A，2026-06-04 / `04be246001599f5995fa2f2d8c91a0f198d3f34c`，GCC13.3.0，官方优化 `-O2 -g -fwrapv`，未加 NDEBUG/LTO/PGO。本轮未重建或改 VM。

| 制品 | SHA256 |
| --- | --- |
| 原版 qjs | `584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1` |
| d8 15.6.21 | `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133` |
| snapshot_blob.bin | `5af8f6d23e18aca97e3d89b1cab0815a56235c29f37728ffe10255fdea035749` |
| icudtl.dat | `495c45cc7a65562ec461f860c310c6b66e006acd96833f61d1aa31f77fe18cf1` |

d8 来自固定官方 archive：`https://storage.googleapis.com/chromium-v8/official/canary/v8-linux64-rel-15.6.21.zip`，本轮没有下载、升级或替换。Engine=V8，shell=d8，NOT Node.js。两边都是同一 binary/data，参数只差 `--use-ic` / `--no-use-ic`，公共参数 `--jitless --no-lazy` 及固定 snapshot 路径。

`materials/V8_IC_Resume_Materials_20261025/` 是用户提供的参考材料：CONTINUE_PROMPT、五个固定 commit 源文件和 LICENSE，`source_verification.json` 记录6文件SHA256/大小/Git blob SHA1核验及原ZIP SHA256。不是本机成功下载的记录，参考 commit 不是制品构建 commit 证明。具体控制范围、打印限制、剩余缓存边界见 `source_notes.md`。精确 V8 compiler/GN args/source commit 仍 UNKNOWN。

## 环境与计时

同一 WSL2 Ubuntu24.04.2/x86_64、Ryzen7 5800H、8核16线程、kernel5.15.167.4。快照在 `raw/capability/environment.json`；环境变量在 `environment.json`。功耗策略、频率锁定和温度 UNKNOWN，不能推广为原生 Linux 或历史 Windows 结果。

正式模式 `USE_IC_CONFIGURATION_FIRST_CALL_INCLUSIVE_V1`：加载 benchmark 前捕获原生 `performance.now`，Setup/静态源加载编译在外；计时内首次 Run 与后续 N 次调用都执行，无额外 workload 预热，缓存自然变热。保留 GC、helper、builtin、动态工作与 Richards 原断言。时钟不能称 pure interpreter-loop self time。

共同 driver 在计时外捕获局部 Run，循环不读 `test.run`。runRichards 入口不使用 this；内部 receiver/方法查找均不改。两个微案例一次完整 Run 含4096轮，不是单次读属性。内部 elapsed/N 单位 ms/完整Run；外部进程墙钟单独保留为诊断，不能相减中位数声称初始化成本。父子时钟只核对时长包围，不拼接原点。

## 文件与采集规则

- `cases/`：冻结两微程序和原始 Octane base/richards/LICENSE；仅按LF固定新脚本字节，算法和断言未改。原始字节及LF身份分开见 `inputs.json`。Octane commit `570ad1ccfe86e3eecba0636c8f932ac08edec517`。
- `historical_newline_audit.json`：按旧冻结输入恢复 Richards N1/N2 的历史混合行尾SHA；不修改旧脚本或旧CSV，不以当前Git规范化字节冒充旧raw身份。
- `raw/correctness/`、`correctness.csv`：N1/N2，18项；`raw/selected_correctness/`：选定N的9项独立复核。
- `raw/pilot/`、`selected/`：三条件共同N，每条件三个独立pilot均>=1000ms。初始N来自旧协议，不能各条件选不同N。
- `scripts/`：每个N的完整、共同JS；三份正式脚本及SHA由 `frozen.json` 索引，不依赖被忽略的generated目录。保持Git二进制字节属性以免换行改hash。
- `schedule.json`：seed20261025、每案例六排列各5次，共270个位置；组内三个条件相邻、所有进程串行。每条件在各位置恰好10次。
- `raw/formal/`：逐进程命令/身份/输入/N/位置/时钟/stdout/stderr/校验和/退出码/有效性。`raw/started/` 为启动前预留记录，避免中断后偷偷重跑已启动位置。
- `pre_pilot_freeze.json`、`analysis_freeze.json`、`frozen.json`：运行前固定采集、分析方法和脚本身份。`identity_after.json`：制品/源码/依赖与旧attempt未变核对。
- 不自动重试失败，不删慢样本/偏短样本/异常值。超时60s，N上限131072，pilot+正式预算7200s。新矛盾必须停止，OFF快照不可读不是阻塞原因。

## 已冻结正式程序的实际运行形式

在Ubuntu中，用 `frozen.json` 所列的相同 `scripts/CASE/Nxxx.js`：

```sh
/home/mzyx/read_ic_dequickening_attempt01/A/qjs scripts/CASE/Nxxx.js
/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/d8 --snapshot_blob=/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/snapshot_blob.bin --jitless --no-lazy --use-ic scripts/CASE/Nxxx.js
/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/d8 --snapshot_blob=/home/mzyx/three_engine_20261004/v8-linux64-rel-15.6.21/snapshot_blob.bin --jitless --no-lazy --no-use-ic scripts/CASE/Nxxx.js
```

以上用于解释真实命令；**不要往已完成的 attempt02 追加重跑**。本轮实际入口顺序为 `prepare.py` → `run.py correctness` → `launch.py`（pilot+选定N正确性+正式采样）。同一个 launch 进程维持WSL生存期及单调预算。无原始失败时可恢复尚未执行位置；已有记录不覆盖。跨WSL boot不拼接预算，需单独记录新的恢复决定。

需要新campaign时另建attempt，不复制旧raw/summary/selected/freeze作为新采样。新主机需明确映射并核验相同runtime路径/依赖且建立新cohort；不能默认为旧/home路径仍有效，不混合不同机器的数据。本轮不自动启动新campaign。

## 无需原机 binary 的统计复算

在本目录使用任意平台Python3标准库：

```sh
python test_analysis.py
python analyze.py --output NEW_OUTPUT_DIRECTORY
python replay.py
```

分析只读公开raw、冻结脚本和身份记录，不执行/查找/home下的ELF。显式按case/condition索引及整数rep/order排序，不依赖Windows/Linux路径排序。新输出目录禁止覆盖。`replay.py` 创建两个全新统计目录，逐字比较发布结果并核对raw等输入未变；它不会再采样。

`summary/per_condition.csv` 包含中位数、均值、样本标准差、Tukey-halves Q1/Q3/IQR/min/max；`comparison.csv` 为三条件主表；`ratios.csv` 为OFF/ON、QJS/ON、QJS/OFF及10000次完整三元组配对bootstrap探索性95%区间；`samples.csv` 为全部正式记录的便读副本（不能代替JSON raw）。`process_wall_diagnostic.csv` 单列整进程时间。没有总体GM、官方Octane分数、多重校正或因果占比分解。

本目录不包含ELF、对象文件、构建树或历史git库；材料较小，无需另造大型归档。原用户ZIP在仓库根保持原状，包内许可证随参考源码交付。
