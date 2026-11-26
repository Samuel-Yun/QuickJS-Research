# 函数值读取与调用路径：2026-10-28独立新批次

入口读 [results.md](results.md)，详细证据读 [bytecode_evidence.md](bytecode_evidence.md)、[value_ownership.md](value_ownership.md)、[call_path.md](call_path.md)；下一项仅保留 [decision.md](decision.md) 中一个缺失证据。不与历史批次时间相除。

## 固定条件

- A：upstream2026-06-04/04be246001599f5995fa2f2d8c91a0f198d3f34c，SHA584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1。
- M：上一轮原单槽M（无R/SW），SHA7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef。
- V8/d8：官方15.6.21，SHA83b744a5953d2662ea723564d4035a333782a0cc85232d1025929a925150b133，固定snapshot/ICU，`--jitless --no-lazy --use-ic`。不是Node。
- 同一WSL2 Ubuntu24.04.2/x86_64，Ryzen7 5800H。准确绝对路径、命令、源码文件/依赖身份、QuickJS GCC13.3优化参数与未知环境字段见manifest.json。正式制品未重建；只新建两个独立诊断副本。
- 4案例×3条件×30新进程，共360有效记录。N=16384/Run内4096轮，首次Run包含、无计时前workload预跑。原始adapter/driver逐字复用，inputs.json记录来源SHA。

## 只重算公开raw：不需要任何旧binary

在仓库根执行（Windows Python或Linux Python标准库均可）：

```text
python js-interpreter-bench/experiments/function_value_call_path/attempt01/analyze.py --output /任意新的输出目录
python js-interpreter-bench/experiments/function_value_call_path/attempt01/audit_independent.py
```

第一个命令只打开本attempt公开原始记录/manifest/冻结脚本，绝不尝试打开其中的/home或/mnt/c制品路径。输出目录存在时仅允许字节一致，不覆盖旧统计。analysis/是首份统计，replay_linux/是Linux独立重放；root summary.csv/ratios.csv是首份的相同字节副本。Q1/Q3采用30样本上下半各15个的中位数；sample stddev分母n−1；bootstrap按完整12进程round共同抽10000次，线性95%百分位、seed20261028。没有GM。

## 已实际执行的入口（不要在冻结attempt原地重采）

脚本目录为本attempt，Windows执行setup.py host；其余runtime命令在Ubuntu/WSL内：

```text
python setup.py host
python3 setup.py init
python3 run.py correctness
python3 run.py timer
python3 diagnostics.py
python3 call_diagnostic.py
python3 source_evidence.py extract
python3 run.py campaign
python3 postflight.py
```

`campaign`先pilot、选定N正确性，再冻结顺序与输入并串行正式采集。独立call诊断必须在正式前完成，本批构建/诊断不与正式样本重叠。任何位置开始后不自动重试；已完成raw不覆盖；已有campaign_clock时拒绝重开。

**重建/新跑必须先建新的空attempt**，只复制这些工具和cases/shared.js，修改common.py的独立STORE、cohort后重新登记host。不要复制旧raw/selected/started/manifest/frozen/schedule/gate来伪装新campaign，不覆盖本attempt，也不自动替换丢失的runtime。冻结runtime由原manifest所列路径核验，源码恢复参考旧实验材料；本轮没有承诺仅凭本attempt重建V8官方制品。

source_reference中官方小文件首次因沙箱socket拒绝而未获取，失败元数据保留；网络授权后的单次定向请求成功，保持TLS校验，不下载完整源码树。固定参考commit37fb849…不等于已证明实际d8构建commit。未用developer-only builtin打印；只对实际ELF静态导出两个小型CallFunction builtin。

## 文件与范围

- cases/shared.js：用户方案；仅追加microValidate作既有driver兼容。共同函数对三条件逐字相同，只有CASE_KIND在计时外选择。
- bytecode/：完整目标caller、step、microRun和其余共同函数；raw/commands/保留V8完整输出。QJS的atom规范化不改变opcode/实际raw字节。
- path_counts.csv：原窄诊断A/M的字段读、find、IC、返回tag计数；call_counts.csv：本轮独立调用opcode及实际class分支计数。都不是正式时间。
- diagnostic/：最小计数补丁、首次准备失败和编码核对；二进制/对象留在/home独立目录，不纳入Git。现有source函数登记不覆盖全部嵌入stdlib，不能称全VM统计。
- source_evidence/：精确A/M源码摘录及header；正确的调用入口/退出用entry_and_frame.txt、actual_return_cleanup.txt。初次return_cleanup.txt误选了其它done label，保留但**不可作为调用清理证据**，修正说明及身份见supplement_identity.json。
- raw/{correctness,pilot,selected_correctness,formal}/：逐进程命令、制品/输入/脚本SHA、结果、内部/外部时长、输出/错误及UTC元数据。raw/started是防重复运行reservation，不是已完成样本。
- raw/diagnostic和raw/call_diagnostic：gzip原始计数，Python标准库gzip可恢复，SHA在各identity/CSV；完整诊断源码来源和补丁可查。没有巨大binary/archive/source_history.git。

UTC不作性能时钟，本批其跨度与parent单调时长有记录偏差，原因UNKNOWN；只使用duration与内外包围关系。功耗/频率/温度/后台未隔离。详细限制见results.md。完成状态以analysis/audit.json、independent_audit.json、final_identity.json和completion.json为准，不以“脚本已写好”代替实际360条采集。
