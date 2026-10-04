# SunSpider three-engine comparison: BLOCKED_TIMER

## 实验事实

本轮已实际执行完整 correctness 和部分内部计时校准，不是仅实现脚本。三引擎仍在同一 `wsl2-ubuntu2404-x64-20261004` cohort：Ubuntu 24.04.2 / WSL2 / x86_64，AMD Ryzen 7 5800H 主机。没有使用旧 Windows 时间计算 ratio。

| 项目 | 实际结果 |
|---|---|
| 指标 | first-call-inclusive interpreter-mode execution time |
| MAIN 时钟 / warmup | Date.now / 0 次性能 warmup |
| SunSpider | 冻结的 1.0.2，WebKit commit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9` |
| correctness | **156/156 PASS**：26 cases × 3 engines × N=1/2 |
| 兼容交集 | **26/26**；没有因结果不同而扩大允差或发明新 checksum |
| pilot | **163 条**，161 条 payload gate PASS、2 条 invalid timer 失败，全部保留 |
| 初步达到校准门槛 | 6 cases；时钟质量失败后均不作为正式批准的 N |
| selected-N 独立 correctness | NOT_RUN |
| MAIN 正式有效 / 全套期望样本 | **0 / 2340** |
| 正式性能交集 | 空；所有 case 因全局时钟质量门槛阻塞，不是语义不兼容 |
| V8/QJS、JSC/QJS、JSC/V8 GM | **UNKNOWN / NOT_RUN**，JSON 为 null，不填零或 epsilon |
| warmup DIAGNOSTIC | 预先选择四案例，但校准和性能采样未运行 |

证据：[compatibility.csv](compatibility.csv)、[correctness CSV](raw/correctness.MAIN.csv)、[pilot CSV](raw/calibration.MAIN.csv)、[部分 N](selected_n/MAIN.partial.csv)、[独立审计](summary/audit.json)。每个 journal JSON 保存完整命令、runtime/script SHA256、stdout/stderr、退出码和外部单调计时。`raw/formal.MAIN.csv` 只有表头；per-case / pairwise 输出的缺失统计量留空，不伪造排名。

### 冻结 runtime 与输入

| Runtime | 版本 / revision | SHA256 |
|---|---|---|
| upstream QuickJS/qjs | 2026-06-04 / `04be246001599f5995fa2f2d8c91a0f198d3f34c`，Linux GCC 13.3.0、-O2 | `140d5233b0337d91cb0f994ae4a051e49aa04da8802acfaedf0a01b81a620b79` |
| V8/d8 | 官方 Linux64 rel 15.6.21 | `83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133` |
| JSC/jsc | WebKit `fd3406f133a4e56d7aaf399ba5611ae44b8da7e9`，Phase 1 Release -O3 | `65c824a055405bf62b05e21d54515a72a1f0187a4d91225d00a6da969d35879f` |

V8 保持 `--max-opt=0 --no-lazy` 和固定 snapshot；JSC 保持 `--useJIT=false --useLLInt=true --validateOptions=true`。运行 flags、adapter 和现有模式证据未改动，没有重复获取、build 或 hot tier probe。实际 Linux binary/运行依赖、全部 benchmark 文件和移植 patch 在本轮前后均重新核对哈希，旧 baseline/raw/summary 保持不变。见 [runtime_manifest.json](runtime_manifest.json)、[input_manifest.json](input_manifest.json)、`environment/{before,after_blocked}.hashes.json`。

MAIN 标准 driver 来自冻结的 `../three_engine_baseline/sunspider_driver.js`；每个 case/N/mode 的生成 JS 在三边逐字相同。脚本 SHA256 在所有 raw 中保存。独立审计重新从未修改的 standalone bytes、旧 checksum 表、标准 driver 重建生成内容，并核对命令和哈希；没有利用 engine-specific branch。函数包装/返回 checksum 与控制循环是共同 harness 成本，不是引擎优化。

### 计时阻碍：有运行证据，不是猜测

1. JSC `3d-morph` N=16 pilot 报 `Error: invalid timer interval`，退出码 3；失败保留为 attempt001。原 flags/脚本不变的 attempt002 通过。
2. V8 `access-nsieve` N=16 pilot 再次报 `invalid timer interval`，退出码 1。本次暂停校准，没有重复到成功后掩盖失败。
3. JSC `3d-raytrace` N=64 报内部 **2482 ms**，而包含启动、执行与退出的 Python perf_counter_ns 外部区间仅 **875.465375 ms**；V8 `access-binary-trees` N=256 类似，内部 **3196 ms**、外部 **1489.970802 ms**。这证明当前两种时基存在严重不一致，不能解释为正常 workload 性能差异。
4. 三引擎各 5 秒的独立 Date.now/performance.now 探针未捕获跳变。这一短窗口通过不能消除前面的矛盾。
5. 同一 Python/WSL 进程进行最多 180 秒的稳定性检查：36 个五秒窗口，观察到墙钟相对 monotonic 的偏差 `-34.69, +85.49, -89.75, -1672.37, -2112.49, -1757.62, -2024.76 ms`，未获得连续十二个稳定窗口，gate **FAIL**。没有更改时钟服务/clocksource/system time，没有执行 workload warmup。

证据：`records/calibration/MAIN/` 的两个失败 record 与所有正常 record；`diagnostics/{quickjs,v8,jsc}.clock.json`；[时钟服务](diagnostics/time_services.json)、[时钟状态](diagnostics/time_status.json)、`diagnostics/stabilization/*.json`。当前 WSL 有 systemd-timesyncd，报告 NTP=yes/synchronized=yes，clocksource=tsc；这些状态**不能单独证明跳变原因**。

pilot CSV 的 `valid=true` 是当时的退出码/输出/非负整数/结果 gate，不等于事后已证明物理计时有效。全局 clock-quality gate 失败后，所有 pilot 均不得用于性能排名或新的正式校准。没有删除正向异常值或两条失败，也没有用外部 wall time替代内部指标。

### 实现并固定的方法

runner 已实现同一 MAIN、独立 all-call correctness、2 倍增长共同 N、30 新进程样本、逐条保留失败及 resume。正式计划使用六种排列每 case 各五次，每引擎每位置十次；seed=20261005。**这是已实现的顺序策略，不是已完成的排列采样审计**。实际正式位置、每组 30 条和统计审计均 NOT_RUN。

统计约定：elapsed_ms/N；median、mean、样本标准差（n−1）、Tukey halves IQR、min/max；ratio 为 median 的商；GM 为 exp(mean(log(ratio)))，三个 pair 使用同一完整三引擎 case 交集。所有 outlier 和正式低于校准门槛的样本应保留；本轮没有正式样本，因此没有可执行的敏感性统计。

预选 DIAGNOSTIC cases：access-binary-trees、date-format-xparb、regexp-dna、string-unpack-code；各引擎一次显式 warmup，独立 mode/raw/校准/统计。若后续执行，差异只能说明方法/IC/对象/GC/全局与持久状态敏感性，不能直接换算 frontend 占比。

## 可能解释

墙钟调整、WSL 虚拟化时钟、host 时钟或其组合可能导致偏差。NTP 服务存在，但本轮没有隔离它与 WSL/host 的影响，不能断言“就是 NTP”。没有证据支持任何引擎性能原因、IC/dispatch 瓶颈或 JSC 速度排名。

## UNKNOWN

- 跳变的具体产生者，以及能否在当前环境长期稳定 Date.now。
- 三引擎正式 median/分布、三个 GM、代表性性能差异、winner 反例和机制标签子集统计。
- 20 个尚未得到初步共同 N 的 case，以及所有 case 的可信重新校准结果。
- JSC 首次调用 frontend 的成本份额；保持已批准 first-call-inclusive 披露，不把它当作本轮阻塞项。
- 真实逐样本 CPU 频率、温度和功耗；精确 d8 制品源码/编译器 revision；实际 V8 RegExp native execution。

## 限制

JSC 的首次静态函数 frontend 可能仍发生在 timer 内。QuickJS C regex VM、V8 允许 regex native compilation、JSC master useJIT=false 同时关闭 RegExp JIT，策略不对称。JS tier 禁用不意味着 runtime helper/builtin/generated code 都禁用。RegExp、dynamic code 与 runtime-specialized 标签子集只能说明机制敏感性，不能称为 builtin-free 或 pure interpreter-loop；配置标签是描述性且非穷尽列表，例如 string-tagcloud 本身也有动态 eval。后续完整子集审计必须据实际源代码完善标签，而不改 workload。

旧 Windows 数据仅保留历史身份，不与新 cohort 相除。当前结果只确认同环境兼容和计时失败，不确认谁更快。

## 最短恢复步骤与命令

1. 不改 runtime，先解决并验证墙钟长期稳定；随后建立新 calibration attempt，保留本轮全部失败/异常 pilot，**不可直接复用它们**作为重新校准。
2. 或明确授权三引擎统一使用已核实语义的 monotonic 内部时钟（候选 performance.now），创建新的 mode、合同、校准/raw/统计；不能偷偷替换当前 Date.now MAIN。

可以直接运行、不采样的复核命令：

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/sunspider_three_engine/run.py verify
```

复现本次有上限的时钟门槛（不修复服务）：

```powershell
wsl.exe -d Ubuntu -- python3 -B /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/sunspider_three_engine/run_stable.py
```

后者默认仅进行时钟诊断，会产生新的不可覆盖 stabilization 记录，门槛失败即停止，门槛通过也不执行 workload。原本用于续跑的 launcher 已保存在 `diagnostics/launchers/run_stable.before_blocked.py`；当前 launcher 增加了阻塞后的安全保护，禁止直接续用受污染的 pilot。主 runner、标准 JS driver、workload 和 flags 未改变。时钟恢复后仍须建立新校准 attempt。

独立审计结论：correctness、相同标准脚本、命令/flags/hash 和旧数据保存检查 PASS；计时质量 FAIL；总体 **BLOCKED_TIMER**。本阶段停止，不执行 Prompt 4。
