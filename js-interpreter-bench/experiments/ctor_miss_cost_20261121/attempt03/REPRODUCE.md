# 连续两次身份失配才允许学习

本轮从冻结原 SPARSE 独立派生 TWICE，不叠加前一轮 KEEP_PLAN 的永久保留策略。只比较 NORMAL、KEEP_PLAN、TWICE，不测其它引擎或全集。

## 策略的准确含义

先执行原 `four_ctor_try`。正命中时，只有 `identity_misses` 非零才写零。失配后：

1. 有正计划且 callee 身份不同：计数饱和增加到 2。值为 1 时只普通构造，跳过资格检查、负记录及学习；达到 2 后允许执行原逻辑，仍需原资格检查通过才学习。
2. 没有正计划，或同一 callee 因其它条件失配：打断连续身份失配，非零才清零，仍执行原来的回退与学习。
3. 成功发布新正计划后，非零才清零。达到 2 但未学成时保留饱和值；后续仍可尝试，直到命中/同目标失配打断或成功学成。

计数的是“连续与现有计划身份不同”的调用，不另存待切换目标的身份，不增加缓存槽。用 FourSite offset 30 的尾部 padding 存 1 字节，`sizeof(FourSite)==32`；FullPlan 保持 96 字节，原有成员偏移不变。编译期有布局断言。plan_try、模板、原型检查、分配和所有权不改变。

## 查看已有数据

在仓库根目录执行：

```bash
cat js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/results.md
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/analyze.py
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/check_assembly.py
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/audit.py
```

后三条不重新计时。`analysis/samples.csv` 保存 45 个原始 Release 时间，`summary.csv` 为主表，`switch_phases.csv` 为分段时间，`switch_trace.csv` 是 D 前 8 次调用的轨迹，`counts.csv` 包括状态增加/清零写入次数和首次命中/学习位置。

## 三份输入与测法

逐字节复用 attempt02 的 ctor.js、switch.js 和语义样例。交替输入使用 `positive 0 67108864`，全 C 使用 `positive 100 67108864`；先 C 后 D 使用 switch.js，参数为 `67108864`，前后各 33,554,432 次，调用同一个 ctorLoop、同一个 pc=18 的 new 位点。

三版每格 5 个新进程，共 45 个同批次计时，版本顺序轮换；无额外预热，首次 Run 计入，Setup 和校验在计时外。CPU 2、Asia/Shanghai、C locale。NORMAL/KEEP_PLAN 复用已验证的 Release 二进制，时间全部新测。9 个同 N 计数进程独立运行，其时间不进入表格。没有自动加轮、删除慢点或跑全集。

## 在新目录复现

仓库根目录执行。如果 attempt04 已存在，换一个新的编号：

```bash
BASE=js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03
REPRO=js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt04
mkdir "$REPRO"
cp "$BASE/build.py" "$BASE/run.py" "$BASE/analyze.py" "$BASE/audit.py" "$BASE/check_assembly.py" "$BASE/ctor.js" "$BASE/switch.js" "$BASE/semantics.js" "$BASE/policy_probe.js" "$REPRO/"

python3 "$REPRO/build.py" NORMAL release
python3 "$REPRO/build.py" KEEP_PLAN release
python3 "$REPRO/build.py" TWICE release
python3 "$REPRO/build.py" NORMAL counts
python3 "$REPRO/build.py" KEEP_PLAN counts
python3 "$REPRO/build.py" TWICE counts

python3 "$REPRO/run.py" gate
python3 "$REPRO/run.py" counts
python3 "$REPRO/run.py" measure
python3 "$REPRO/analyze.py"
python3 "$REPRO/check_assembly.py"
python3 "$REPRO/audit.py"
```

构建通过 attempt02/build.py 和 attempt01 的源包装载逻辑，核对冻结 SPARSE 源码与两个旧对照。旧二进制存在时原样复用；已移除时在新 attempt 内重新编译相同源码。`TWICE.release.patch` 相对原 SPARSE，只有 quickjs.c 和 four_runtime.inc 两个文件变化。

## 计数与正确性证据

诊断版只用全局固定数组，不定义 FOUR_DIAG，不增加每点日志字段或引用根。沿用前轮函数/位点选择和 C/D 身份分段，并记录各目标前 8 次的行为。trace flags：1=正命中、2=普通构造、4=计划更新、8=暂缓学习、16=达到两次门槛。计数的首次位置是该目标的第几次调用；没有发生用 0 表示。

`hit_reset_writes`、`other_reset_writes`、`learning_reset_writes` 分别在实际非零清零分支内增加；`increment_writes` 只在计数从 0/1 增加时增加。计数版不能单独证明 Release 的机器指令，因此另用 objdump 检查真实 Release：cmpb 零判断后的 je 会跳过 movb 清零。汇编和对应二进制哈希保存在 assembly/。

gate 继续对照 setter、只读字段、原型变更、目标替换、异常和非法目标。policy_probe 另构造“C 热→一次 D→同一 C 因 setter 失败→再 D”的输入，确认同目标的其它失败会打断连续身份失配，并保留 JS 结果；该样例不进入时间表。Release 与计数构建分开，旧结果和源码不修改。

## 后续完整 Octane / SunSpider 单轮筛选

`full_bench/` 是之后追加的独立阶段，不属于上面的微基准计时。只新跑 TWICE：Octane 17 项、SunSpider 26 项，各一个新进程；A/V8 沿用历史 30 进程中位数，SPARSE 沿用历史单轮。四版合表是跨批次筛选，不是四版同批交错。

在仓库根目录查看或重算已有结果：

```bash
cat js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/full_bench/results.md
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/full_analyze.py
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03/full_audit.py
```

如果要重新计时，应在新 attempt 复制 full_bench.py、full_analyze.py、full_audit.py 和构建/验证文件，并先准备对应 TWICE Release manifest 与通过的微基准 audit；`full_bench.py run` 会新建 full_bench 目录，已有结果不会覆盖。固定脚本来自 on_demand_ctor_cache/tests，逐字节核对 native_confirmation 的原输入和 N；复用原校验、CPU 2、时区和计时边界。
