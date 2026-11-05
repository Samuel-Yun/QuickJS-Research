# 原型 IC 开关续跑：attempt02

本目录只复用 attempt01 的 M、H、switch 三个冻结 ELF，比较 M/H/OFF/ON。
没有修改、重建引擎，也没有重新执行旧语义/诊断/序列化门禁。
最终状态、正式样本数和解释见 results.md、decision.md、analysis/audit.json。
attempt01 的 PERFORMANCE_ENV_UNSTABLE、0/384 与所有旧记录保持不变。

## 数据与身份

- reference commit：6e4e3b2925cbd9925b7bed8e3e725785ba9238e4，myx。
- manifest.json、runtime_frozen.json：本轮实际 ELF 路径、SHA256、架构、依赖及依赖 hash。
- reused_evidence.json：只引用旧门禁的路径/hash/范围，不计作本轮执行。
- scripts/workloads、scripts/identities：直接复制旧归档；需要倍增时只改共同外层 N 常量。
- environment.json、host_windows*.json、affinity0.json、one_environment_rearrangement.json：环境与唯一整理。
- raw/{precalibration,stability0,stability1,pilot,selected_correctness,formal}：逐新进程原始 JSON。
- raw/started：启动前记录。失败、异常值和偏短正式样本均保留，不自动重试。
- formal_frozen.json、identity_after.json：正式前冻结与结束核验。
- analysis/summary.csv、ratios.csv、per_round.csv、time_order_cpu_wall.csv、missing.json、audit.json：公开 raw 的派生结果。

## 口径

主指标为 native performance.now/CLOCK_MONOTONIC 内部 ms/完整 Run。
第一次 Run 在 N 次计时内，没有 workload 预跑。静态加载、微例对象建立、
最终输出在外；原 Richards Run 的创建、断言、helper、GC 和缓存演化在内。
N 次运行会逐渐变热，并非每次全冷，也不是某次查找的 self-time。
归档 payload 保留 H_FIRST_CALL_INCLUSIVE_MONOTONIC_V1 原标签以保持 JS 字节身份；
外层记录以本 attempt 的独立 cohort 区分，不混入旧时间。

每个直接 qjs 子进程前后取 RUSAGE_CHILDREN user/system 差分，期间无并发 child。
child_cpu_ms 是完整子进程生命周期的 CPU 时间，external_wall_ms 是其外部单调墙钟；
二者都与内部计时边界不同，只作独立辅助指标，不能相减得到属性操作成本。

工程门槛先于大批 pilot：原 H 数字控制最多3次预校准，再12进程稳定性检查；
至多一次真实 affinity 整理与第二组12次。Q1/Q3 是排序上下半段中位数，
IQR/median≤10% 且 max/min≤1.25。CPU 和备用 CPU 从一次系统负载观察预先选定，
不遍历 CPU 跑 benchmark 挑结果。不修改电源方案、governor、WSL 或 ASLR。
通过后不再寻找窗口。正式噪声照实保留，不重启 campaign。

正式计划为24个完整轮块，每块4案例×4条件；每案例24排列各一次，案例位置各6次。
种子20261029。每个条件一个新进程，同案例四条件相邻，全部串行。
统计沿用 attempt01 的 Tukey 四分位与完整16进程轮块共同 bootstrap：10000次，
种子20261029，重算中位数之比，95%线性百分位区间，未做多重比较校正。
比值 ON/OFF、ON/H、OFF/M、H/M；<1 分子更快，变化率100×(ratio−1)。
描述统计用全部有效样本，配对比值只用完整轮块，缺失不填 epsilon 或历史值。

## 已执行入口与只重算统计

采集入口（本目录一旦启动就拒绝再次采样，不能重跑覆盖）：

```powershell
wsl.exe -d Ubuntu --exec /usr/bin/python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/prototype_ic_ablation/attempt02/run.py
```

从仓库根目录用 Python3 标准库重算；不需要 WSL，不打开 /home ELF、不启动引擎：

```powershell
python -B js-interpreter-bench/experiments/prototype_ic_ablation/attempt02/analyze.py --output replay_proto_ablation_02
```

输出目录必须不存在。保留公开的 attempt01（特别是 workload.py、analyze.py、
脚本及引用门禁）和本 attempt 的 raw/identity/config，分析不依赖旧构建树。

## 若另择安静条件重新采集

仅在确有必要且另获任务授权时，在新的空 attempt 开始，绝不补到本批：

```powershell
wsl.exe -d Ubuntu --exec /usr/bin/python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/prototype_ic_ablation/attempt02/run.py --new-attempt attempt03
```

attempt03 必须未存在；入口只复制 runner/分析工具，再核验同一冻结 ELF，
不复制旧 raw、不构建引擎。若该编号已存在，选下一空编号。
该入口已交付；本轮不自动执行它。改变主机可改变路径但须单独记录且 hash 不变，
当前入口保留原路径，不宣称已测试跨机迁移。

## 安全与解释限制

switch 的新 sanitizer 构建在 attempt01 中断，仍为 NOT_COMPLETED_BUILD_INTERRUPTED。
旧 H 的安全检查不能冒充 switch 的新 sanitizer 通过。本轮未重建 sanitizer/OOM。
M 是 own 单槽实验版本，不是原版 A；没有 A/V8/JSC 或全 Octane 新数据。
ON/OFF 控制的是同一 switch 程序的继承填充，不是开关所有缓存。
旧85.1%查找次数减少不是时间收益；代码布局、公共路径、shape保活等未独立分项计时。
