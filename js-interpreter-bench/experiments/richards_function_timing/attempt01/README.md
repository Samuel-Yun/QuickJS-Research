# 原 Richards 与原 isHeldOrSuspended 的计时补充

本轮只补计时与最小归因可行性证据，不优化VM、不改原Richards算法、不外提/缓存方法，不修改现有PPT。新数据不与历史Windows或先前WSL采样合并。

## 冻结环境

同一 `wsl2-ubuntu2404-x64-20261004` cohort，WSL2 Ubuntu24.04.2 / kernel5.15.167.4 / x86_64，Ryzen7 5800H；本次采集日期2026-10-18。宿主功耗、频率策略与后台隔离UNKNOWN/未控制，不改系统设置。

- upstream QuickJS2026-06-04，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，GCC13.3、上游-O2正式binary。
- 官方Linux V8/d8 15.6.21，`--max-opt=0 --no-lazy`，显式使用冻结snapshot，保留ICU；不是Node.js，不改成--jitless。精确制品源码/完整构建参数UNKNOWN。
- 完整binary、动态库、snapshot/ICU、adapter绝对路径及SHA256见manifest.json；本轮实际核验见raw/artifact_preflight.json。时钟复用原benchNow/native performance.now，不用Date.now。
- 原始Octane revision `570ad1ccfe86e3eecba0636c8f932ac08edec517`，base.js/richards.js原字节，源与原函数hash见manifest及diagnostics/source_identity.json。A复用call_path_followup的原始standalone driver，仅替换N。

## 三个不同指标

A：内部整批N次完整Run耗时/N，单位ms/Run。runRichards本来的构造、调度及2322/928正确性检查在内；源码加载/静态编译、ResetRNG、Setup、TearDown和输出在外。

B：内部整批M次调用耗时×1e6/M，单位ns/target invocation。原TaskControlBlock构造器和IdleTask/Scheduler对象在计时前建立，按原字段顺序创建link/id/priority/queue/task/state，原prototype方法不变。计时循环每次直接 `receiver.isHeldOrSuspended()` 并累计布尔结果，包含循环、方法读取、调用、结果累加与实际GC/helper等成本；不是函数self-time或get_field成本。

三条路径分别用原常量STATE_HELD=4、STATE_SUSPENDED=2、STATE_RUNNING=0；常量从冻结源解析，独立Python oracle给出true/true/false。固定state放在timer外；不以{state:...}替代TCB、不使用.call/.bind，不提前调用目标函数求expected。静态加载不执行runRichards或目标函数。

A/B每批只有开始/结束两次benchNow调用；第一次workload调用在内，后续自然重复并形成运行状态/反馈，不是每次都冷启动。每个正式样本都是新进程；pilot不与正式合并。

C：原程序内部该函数累计时间/占比，只接受匹配原Richards内部时间窗口、确切JS函数身份与相同时间基准的证据。旧85/9查找区域样本、B×10671均不能冒充C。A/B结束后最多约15分钟尝试现有profiler；不足即UNAVAILABLE，诊断值不进入正式表。

## 校准与统计

N/M从1按2倍增长，第一次两引擎pilot均≥300ms时，再各用2个新进程确认≥200ms。A选N256；B三条路径均选M8388608。B另做M/2、M、2M，每档每引擎3个独立进程，实际结果在pilot及scaling_summary.csv；不根据期望快慢换档。

每case/engine30个新进程，共240。seed20261018，四case在各轮打乱，每组QJS先/V8先各15轮。顺序见schedule.json，不并发引擎。所有原始stdout/stderr/错误/timeout保留，不删outlier，偏短正式样本也保留。

统计样本是30个独立进程的批量平均，**不是N或M个调用**。Q1/Q3按(n−1)p线性插值，IQR=Q3−Q1；给median/mean/样本std/min/max。V8/QJS为两个进程median之比，95%区间用两边各30进程独立重采样10000次的percentile bootstrap，seed与算法见manifest/bootstrap.json。不是显著性或因果解释。

## 入口与复现

Windows PowerShell（同一已存在Ubuntu WSL）：

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01/run.py prepare
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01/run.py correctness
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01/run.py pilot
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01/run.py formal
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01/run.py analyze
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01/run.py check
```

已有位置会读取原记录，不重新运行或覆盖；新采集需建立新attempt并复制入口脚本，不复制raw/manifest等历史输出。correctness也复核原函数dump（QJS16条29B，V814条31B）与原程序N1/N2调用频率。JS计数副本在diagnostics中，显式保存patch、额外state读取与扰动范围，不作正式时间。

`python -B check_results.py`为离线独立检查，只读本轮raw、summary、输入与制品记录，不跑引擎。C的命令与可行性单独记录，不包含于上述正式采样流程。

## 本轮完成状态及C诊断复现

A/B实际完成240/240，正式审计和独立离线审计均PASS；数值与IQR/区间见results.md、summary.csv，一页汇报表见ppt_summary.md。没有改动现有PPT。历史输入/制品hash保持一致，原始数据和失败过程全部保留。

C仅限时尝试现成能力，没有VM重建或新增全量profiler。QuickJS C为UNAVAILABLE（缺完整JS函数上下文，当前perf命令也不存在）；V8取得结构化CPU profile，提供DIAGNOSTIC_ONLY的粗略区间归属范围，不是无扰动self-time或跨引擎差距贡献。C不混入A/B。采集时间、WSL boot变化以各raw记录为准。

在WSL内可分步复现C；已存在位置读取缓存，新采集另建attempt：

```sh
cd /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/richards_function_timing/attempt01
python3 -B profiling.py capabilities
python3 -B profiling.py api_test
python3 -B profiling.py api_profiles
python3 -B analyze_profiles.py
python3 -B finalize.py
```

api_profiles在未改写的Richards原A输入上跑3对独立off/on（共同2048Run），然后改一次到2000µs采样；保持--max-opt=0 --no-lazy。完整profile随stdout留在raw/C，各CPU JSON另存diagnostics；窗口、目标身份、分母和扰动的解释见results.md。没有为C启用root/sysctl/电源设置，也没有使用B×调用次数。

## 主要文件

- raw/formal/：240条原始命令、时间、stdout/stderr和退出码；raw/formal.csv为索引。
- selected_n.json、pilot/、raw/pilot/：共同N/M和独立稳定性样本。
- summary.csv、bootstrap.json、scaling_summary.csv：正式统计与区间/数量级检查。
- diagnostics/：真实原函数/最终dump、只读mode证据、独立计数及失败的过滤器选择。
- results.md、ppt_summary.md：最终数值、局限和可用于一页PPT的表，不自动修改PPT。
- raw/recovery.md：入口/解析失败及恢复，没有删改失败记录来凑指令数。
