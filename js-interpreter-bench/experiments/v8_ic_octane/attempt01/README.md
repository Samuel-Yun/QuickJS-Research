# Octane 16 Run单元：原版QuickJS / V8 use_ic ON、OFF

本目录是独立新campaign，继承 `experiments/v8_ic_on_off/attempt02/` 的冻结runtime与修订门槛。最终状态/数量以 `summary/audit.json`、`results.md` 为准，脚本存在不等于采样完成。旧270条以及Windows、IC改版、max-opt=0时间都不补入本轮。

截至2026-10-26：**COMPLETE**，16项正式1440/1440有效，N1/N2正确性96/96，选定N正确性48/48。225个pilot；共同N的9个pilot均达标，正式34个偏短区间照实保留。两次无引擎重放与发布表逐字一致。先看 [完整结果与解释](results.md)、[16行对照表](summary/comparison.md)、[探索区间](summary/ratios.csv) 和 [审计](summary/audit.json)。这不改变OFF槽直接观测及V8制品源码commit的UNKNOWN状态。

## 身份、模式与边界

- QJS_ORIGINAL：官方QuickJS2026-06-04，commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`，同一无IC补丁原版A。GCC13.3.0、`-O2 -g -fwrapv`，没有重建或改VM。
- V8_IC_ON/OFF：同一官方d8 15.6.21、snapshot/ICU。公共 `--jitless --no-lazy`，只差 `--use-ic` / `--no-use-ic`。实际路径/文件SHA及元数据见 `runtime.json`；全有效参数在 `effective_flags.csv`、`raw/capability/`。
- 同一WSL2 Ubuntu24.04.2/x86_64、Ryzen7 5800H主机；环境变量和系统快照见 `environment.json`、`raw/capability/environment.json`。温度、功耗、频率与期间后台未完全控制，不冒充原生Linux/Windows。
- `reference_evidence.json` 指向已重新核验的固定版本参考源码及ON位置正证据，不重试失效下载、打印接口、不关闭TLS。证据等级 `PASS_WITH_OBSERVABILITY_LIMITATION`。OFF槽直接观测及二进制精确源码commit仍UNKNOWN；不是关闭全部缓存，也不将jitless说成整个进程无机器码。

## workload与计时

16个canonical ID、原文件列表和旧N参考在 `case_catalog.json`；旧名映射显式记入 `aliases.json`。Octane源码commit `570ad1ccfe86e3eecba0636c8f932ac08edec517`，真实字节与LF身份分开存入 `inputs.json`，本轮源/adapter/driver以固定LF字节公开。基准算法、方法查找、对象布局和断言不改。

`inputs/driver.js`：加载前捕获原生performance.now；Setup/静态前端在外，局部Run/count在外捕获，首次Run及后续N次在内，无额外性能warmup。GC/helper/builtin/RegExp、CodeLoad及其它原Run动态编译照常在内。NavierStokes不足15帧的补验在外且记录次数；RegExp只保留已验证的输入构造，省略Setup额外priming Run。可信结果门禁、this语义与Crypto实际验证范围见 `correctness_contract.md`。这不是pure interpreter-loop self time。

内部时间/N的单位是ms/原始完整Run；父进程保存完整进程墙钟与起止，仅核对时长包围，不拼接父子时钟原点。原Run内断言不移出。

Crypto使用新 `BENCH_ONLY_XORSHIFT32_PRELOAD_V1`、seed305419896，安装在base/crypto之前且不重置RC4。N1/N2及选定N均有三条件×原函数/观察hook的独立输入验证；流式真实数据SHA和有限实际样本在 `raw/crypto/`、门禁在 `crypto/`。正式无hook，只核对原断言及最终密文；不能与历史随机池Crypto时间相除。**确定性PRNG不能用于真实安全加密。**

## 正式采样协议

协议已在pilot前写入 `protocol.json`：单进程180s，N上限131072，pilot+正式预算28800s（8小时，保守含选定N输入诊断）。N1/N2耗时与旧N决定合理起点，不直接跑很大旧N；共同N按2倍增长，每候选三轮轮转共9个独立pilot，全部>=1000ms才选定。`selected/` 与 `pilot_start/` 保留依据。

每单元30组三元组、六排列各5次、seed20261025，rep内打乱case，组内相邻且全部串行，目标1440条；N1/N2目标96项，选定N目标48项，pilot按实际计数。`schedule.json` 和 `frozen.json` 记录正式前计划、16份正式完整共同JS及SHA（见 `scripts/`），不只留下忽略的generated。

失败/超时/已启动中断/偏短与慢样本都保留，不自动重试。case-specific失败写 `status/` 并停止该case后续位置，其余继续；身份/host/flags/clock矛盾全局停止。未纳入Box2D、zlib和官方latency的理由见最终 `summary/coverage.csv`；不称完整官方Octane总分，不算GM。

## 实际入口与恢复

本轮按以下顺序在冻结Ubuntu中执行（同一目录）：

```sh
python3 prepare.py
python3 run.py correctness
python3 launch.py
```

launch维持同一WSL生存期，保存单调预算和启动标记。不要对已完成目录再次采样；新campaign必须新建attempt并核验runtime映射/新cohort。允许继续尚未启动位置，不覆盖既有失败或中断。跨boot/平台不能悄悄合并；预算/boot矛盾保留 `campaign_stop.json`。没有自动commit/push。

## 只用公开raw重算

```sh
python test_analysis.py
python analyze.py --output NEW_OUTPUT_DIRECTORY
python replay.py
```

Python标准库即可，不访问/home下ELF。显式case/condition及整数rep/order排序，脚本字节受本目录.gitattributes保护。每个输出目录必须新建；replay创建两个全新目录，核对发布结果逐字一致、raw等输入未变，绝不启动引擎。

`summary/comparison.csv`/`.md`固定16行，缺失/阻塞保留状态原因；`per_condition.csv`含median/mean/样本stddev/Tukey-halves Q1/Q3/IQR/min/max；`ratios.csv`含完整三元组三条件配对bootstrap10000次的OFF/ON、QJS/ON、QJS/OFF及探索性95%区间。跨1只表示方向不明确。`samples.csv`是便读派生表，不能代替 `raw/formal/` 的逐进程原始记录。完整进程墙钟另表，不能相减中位数算初始化或单次hash成本。

只有完整有效case才给干预比较区间；版本独有失败不以仅筛成功样本制造比值。只解释该V8配置的净效果，V8普通路径不是QJS查找的等价实现，V8收益不是QJS预期收益；不计算跨引擎差距解释百分比。所有结果只代表本cohort。

本目录不放ELF/构建树。完整JS有重复静态源码，但单文件远低于GitHub100MB限制；诊断只保存流式摘要和有限真实事件，不产生巨型全对象轨迹。
