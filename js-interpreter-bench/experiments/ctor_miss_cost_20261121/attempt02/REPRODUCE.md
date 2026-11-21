# 保留旧正计划：复现与查看

本轮在前一个零命中实验上加 KEEP_PLAN，底座仍是冻结 SPARSE_CTOR_IC。已有正计划且实际 callee 身份不同时，直接普通构造，不做正缓存尝试、模板判型、负记录检查或学习，不替换旧计划。同一个 callee 沿用原来的所有检查、回退和学习。没有加入第二槽、自适应退避、原型票据或其它优化。

## 看已有结果

仓库根目录：

```bash
cat js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt02/results.md
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt02/analyze.py
python3 js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt02/audit.py
```

后两条只整理和检查已有数据，不重新跑计时。analysis/samples.csv 是 45 个未插桩时间，summary.csv 是 9 格主表，switch_phases.csv 是 C/D 分段，counts.csv 是独立计数。

## 三种输入

- alternating：逐字节复用旧 ctor.js，参数 `positive 0 67108864`。同一个 new 位点逐次交替两个目标。
- all_c：同一个旧 ctor.js，参数 `positive 100 67108864`。全程一个目标。
- c_then_d：switch.js，参数 `67108864`。先调用同一个 ctorLoop 做 33,554,432 次 C，再调用同一个函数做 33,554,432 次 D；保持同一个静态位点和缓存记录。两段分别计时，输入数组提前生成。

switch.js 的 ctorLoop 函数体与旧脚本逐字节一致。没有在循环里插入阶段判断；也没有用环形数组反复重复 C 块、D 块。三版对每种输入都执行完全相同的 JS、参数和校验。

每格 5 个新进程，各版顺序轮换；CPU 2、上海时区、C locale、首次 Run 计入、无额外预热。不运行全集，不自动追加轮数。原 NORMAL/BYPASS 二进制原样复用，但其时间全部同批次重测。KEEP_PLAN 的唯一 Release 源码改动在 KEEP_PLAN.release.patch。

## 在新 attempt 重跑

以下命令在仓库根目录执行。如果 attempt03 已存在，改用新编号，保留旧数据。

```bash
BASE=js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt02
REPRO=js-interpreter-bench/experiments/ctor_miss_cost_20261121/attempt03
mkdir "$REPRO"
cp "$BASE/build.py" "$BASE/run.py" "$BASE/analyze.py" "$BASE/audit.py" "$BASE/ctor.js" "$BASE/switch.js" "$BASE/semantics.js" "$REPRO/"

python3 "$REPRO/build.py" NORMAL release
python3 "$REPRO/build.py" BYPASS release
python3 "$REPRO/build.py" KEEP_PLAN release
python3 "$REPRO/build.py" NORMAL counts
python3 "$REPRO/build.py" BYPASS counts
python3 "$REPRO/build.py" KEEP_PLAN counts

python3 "$REPRO/run.py" gate
python3 "$REPRO/run.py" counts
python3 "$REPRO/run.py" measure
python3 "$REPRO/analyze.py"
python3 "$REPRO/audit.py"
```

构建复用 attempt01 的冻结源码装载/计数生成逻辑、probe.inc 和 probe_site.inc，并从该处核对 NORMAL/BYPASS 已有二进制。如果旧 work 二进制已清除，则在新 attempt 内按相同冻结源码重新编译；不会覆盖旧计时结果。本次实际复用了两个旧二进制。新的诊断版在旧计数上增加总调用数、因身份不同而直接普通构造的次数，以及按 C/D 身份划分的命中/更新/普通构造次数。没有增加缓存记录尺寸或额外引用根。

计数分母是所有构造调用；KEEP_PLAN 身份不同而跳过检查的调用不算正命中。`four[0]` 是实际尝试正缓存的次数，`total_calls` 才是全部调用数。阶段 C/D 通过受测目标对象的身份区分；两个函数在这些输入中始终保活。所有诊断时间都不参与正式表。

gate 检查三版在目标切换、同目标修改原型/setter/只读描述符、异常、非法构造目标等样例上输出一致，并短测三种输入，确认缓存确实建立及走到期望分支。正式计数另跑同 N，Release 正式时间另跑。
