# 可控属性读取微基准

`own_read.js` 是独立的 QuickJS 脚本，第一阶段只研究普通对象自身的整数属性读取。
默认循环 **201,326,592 次**，每次读取一次 `obj.x`。默认要求计时区间严格超过
3,000 ms；低于或等于此值会输出结果后报错，需要提高 `--iterations`。
硬件速度不同，固定次数不能保证所有机器均超过 3 秒，因此保留显式时长检查。

在仓库根目录运行：

```bash
QJS_A=js-interpreter-bench/experiments/native_octane_20261107/attempt01/work/A/qjs
MICRO=js-interpreter-bench/benchmarks/ic_hit_rate/own_read.js

# 默认接近 100% 命中；只用已有原版 A，无需重新编译。
taskset -c 2 "$QJS_A" "$MICRO"

# 手动设置预期命中率；两次运行使用相同循环次数。
taskset -c 2 "$QJS_A" "$MICRO" --hit-percent 0
taskset -c 2 "$QJS_A" "$MICRO" --hit-percent 50
taskset -c 2 "$QJS_A" "$MICRO" --hit-percent 99

# 换到更快机器后可手动增加固定次数；上限 500,000,000。
taskset -c 2 "$QJS_A" "$MICRO" --hit-percent 50 --iterations 300000000

# 检查序列、冷启动和跨周期计数公式，不进行长时间性能测试。
"$QJS_A" "$MICRO" --self-test
```

## 控制方式与计时范围

计时函数只有一处命名属性读取：

```javascript
function readLoop(sequence, iterations, mask) {
    var obj, sum = 0;
    for (var i = 0; i < iterations; i++) {
        obj = sequence[i & mask];
        sum += obj.x;
    }
    return sum;
}
```

提前创建两种形状：`{x: 3, a: 0}` 与 `{x: 3, b: 0}`，各两个实例。
两种对象的属性数量、`x` 的插入位置、属性描述符、原型和读取值相同。
当前 EVAL_COLD 的读取 IC 每个位置缓存最近一个形状；连续形状相同预期命中，
切换则预期未命中并重新填充。

访问序列长 65,536，使用位与循环索引。通过调整连续相同形状的段长控制切换次数。
0% 时两种形状逐次交替；50% 时大致每两次切换；100% 时只使用同一种形状。
小于 100% 的所有设置都保持两种形状各占一半。
序列支持约 0.003052 个百分点的周期命中率步长，输入会量化，实际量化值见输出。
这是一种固定、重复的规则序列；相同命中率但不同访问分布可能产生不同性能，
本版本尚未研究随机顺序或突发分布。

对象/序列构造、模型计算和检查均在计时外。使用现有 A 中基于
`CLOCK_MONOTONIC` 的 `performance.now()`；计时包含第一次调用 `readLoop`，没有工作负载预热。
循环中没有命中计数、随机数、按命中率判断的分支、对象分配或时钟调用。
总和必须等于 `3 * iterations`，限制次数使计数器与整数累加值均不超出 int32。

输出一行 JSON，其中：

- `requested_hit_percent`：手动指定的目标。
- `cyclic_hit_percent`：量化后周期稳态命中率。
- `modeled_hit_percent`、`modeled_hits/misses`：按单形状缓存模型计算，计入首次冷未命中及最后不完整周期。
- `actual_ic_hit_percent: null`：**未对引擎插桩，尚无真实 IC 计数**。原版 A 本身也没有这个 IC。
- `elapsed_ms`：整个读取循环的耗时；`duration_pass` 要求严格大于指定的 `--min-ms`。
- `ns_per_read_including_loop`：含取序列元素、循环及累加的每次读取平均耗时，不是独立 IC 指令的延迟。

100% 目标下首次访问仍是冷未命中，因此有限循环的模型命中率略低于 100%。
必须后续用优化版的诊断计数核实模型，不能将这里的模型值直接当成实测 IC 命中率。
与优化版比较时，应复用同一脚本、参数和序列，并对每个设置单独以 A 为对照。

## 原版 A 的时长验证

`validate_a.py` 固定 CPU，检查既有 A 的 ELF SHA，先运行 126 个短正确性检查，
然后串行验证 0/25/50/75/90/99/100 七种设置，各一次、同一循环次数。
每个子进程全新启动，保存命令、输出、返回码和外部墙钟时间；验证前后核对程序与 ELF SHA。
这次检查只验收可控性、结果及三秒时长要求，不是多轮性能对比。

```bash
python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/validate_a.py \
  --output js-interpreter-bench/experiments/ic_microbench_20261109/attempt01
```

输出目录必须不存在；重测应换新的目录，保留已有记录。
`--min-ms 0` 只供短正确性检查使用，不能用来满足三秒验收要求。
本次 A 时长验收未修改引擎或生成字节码对照。

## 实测 EVAL_COLD 的命中率

后续增加了独立的诊断构建，保持原 EVAL_COLD 的缓存容量、结构、判定条件和替换策略，
只增加计数。原 Release 源码和 ELF 不变，`own_read.js` 也不变。

```bash
python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/build_diagnostic.py \
  --output js-interpreter-bench/experiments/ic_microbench_20261109/diagnostic01

python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/measure_hits.py \
  --diagnostic-dir js-interpreter-bench/experiments/ic_microbench_20261109/diagnostic01 \
  --output js-interpreter-bench/experiments/ic_microbench_20261109/diagnostic01/counts01
```

已有结果目录不可覆盖；重做时请换新目录名。
只统计 `readLoop` 中唯一的 `obj.x`，不混入参数解析、序列生成、时钟等代码的属性访问。
计数覆盖普通读取指令以及 `V6_PREPARED_BORROW` 的融合成功路径，后者会跳过普通 IC 指令。
融合探测失败后继续执行普通读取，只计为同一次查询，避免重复计数。

实际命中率为 `hits / queries`；每组检查：

- `queries == hits + misses == iterations`。
- `hits == fused_hits + regular_hits`。
- `regular_queries == misses + regular_hits`，`fills == misses`。
- 首次冷未命中恰好一次；实际命中/未命中次数与模型精确相等。

先做 9 个短边界检查，再测试七组完整循环。所有运行单独启动新进程。
实际计数在 `*.stderr` 的 `IC_MICRO_COUNTS` JSON 以及汇总 `results.json` 中；
脚本自身 stdout 的 `actual_ic_hit_percent` 仍为 `null`，由外部读取诊断计数后补全汇总。
诊断版会改变执行开销，因此它输出的时间不能用于 A/EVAL_COLD 性能比较；
正式计时仍应使用未插桩的原 Release 二进制。

## 三引擎完整比较

`run_comparison.py` 对每种访问序列使用**完全相同的脚本字节**，分别交给 A、
未插桩的 EVAL_COLD 和 V8_ON `--jitless --no-lazy --use-ic`。
统一的前缀只在计时外设置 `scriptArgs`，解决 d8 与 qjs 命令行参数接口差异。
先运行三个自检和 42 个短正确性进程，通过后再进行七组、三个引擎、每点五轮的正式计时。
全部串行、固定 CPU 2；每轮打乱七组顺序，每组五轮使用五种不同的三引擎排列，
使每个引擎在各位置出现一到两次。无预热，不丢弃慢点，不选择性加测。
每次正式 A 循环必须严格超过 3 秒，其他引擎使用同样迭代数。

正式计时后，用现有独立诊断版对这七个**相同脚本**各执行一次完整循环，核实实际命中率。
理论和实际命中率仅描述 EVAL_COLD；A 没有该 IC，V8 的实际 IC 命中率没有在本次测量。

```bash
python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/run_comparison.py \
  --output js-interpreter-bench/experiments/ic_microbench_20261109/performance02

python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/analyze_comparison.py \
  js-interpreter-bench/experiments/ic_microbench_20261109/performance02
```

输出目录同样不能覆盖。分析脚本只处理已有数据，不调用引擎。
提供每点中位数、最小/最大值、样本 CV、相对 A 与 V8 的耗时变化及完整样本 CSV。
可选 `--plot` 使用 matplotlib 生成独立 PNG/SVG 图。
源码路径和解释限制见 `implementation_notes.md`。

首次比较的 `performance01` 在 V8 一次读取的短正确性检查中计时为 0 ms，
触发时长保护，正式性能样本为零。所有记录保留。
`performance02` 仅将该短检查改为 N=4096，正式程序/参数/循环次数/顺序均不变。

## V8 状态诊断与命中率的区别

`v8_state_probe.py --output <新目录>` 用相同的 V8_ON、jitless 参数和完整 0%/100%
输入，附加字节码输出、`--log-ic` 与 DebugPrint，检查目标 x 位点的缓存状态。
当前实际观察到 0% 输入进入多态状态，100% 输入进入单态状态。
这些是状态事件，**不是 V8 的逐次命中计数，不能据其日志条数算命中率**。
原三引擎表的命中率仍然仅描述 EVAL_COLD。
精确 V8 命中率需要进一步为目标位点增加诊断计数；当前探针不声称完成这一步。

## 原 V8 ELF 的实际命中计数（后续已完成）

原 V8 编译时关闭了 RCS，内置运行时统计无法使用；但 ELF 保留了原生符号。
`v8_counted_suite.py` 使用 GDB 临时断点，在两处 SystemBreak 标记之间统计
`Builtins_LoadIC_NoFeedback`、`Runtime_LoadIC_Miss`，并监控通用/嵌套回退。
不重编译、不修改 ELF 文件，也不启用 `--log-ic` 或强制提前分配反馈。

```bash
python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/v8_counted_suite.py \
  --output js-interpreter-bench/experiments/ic_microbench_20261109/v8_counted01
```

需要本机 GDB 支持追踪自己启动的子进程；已有目录不能覆盖。
参数属性求值及全局函数解析提前完成，`readLoop` 内核不变。
先做 9 个短测试，直接数命名读取入口并确认恰好为 N；再对七组完整循环只数少数未命中分支，
按 `命中次数 = N − 无反馈访问 − IC miss` 补出成功次数。
无反馈访问即使通过通用快速属性查找成功，也不计为 IC 命中；它内部的运行时回退不能重复扣除。
本次通用属性运行时回退及无反馈内嵌回退均为零，所有断点解析为唯一地址。
这是针对此处稳定自身数据属性的精确计数方法，不应直接套到任意复杂属性读取。

最终七组 V8 均接近 100%：前六组各有 10 次无反馈和 2 次 IC miss，
100% 组有 10 次无反馈和 1 次 IC miss。诊断时间不并入原五轮性能时间。
结果、审计与补全 V8 命中率的三引擎表位于 `v8_counted01/`。
之前的 `v8_gdb01`—`v8_gdb04` 是有记录的工具/区间校准探针，不混入最终结果。

## 将 V8 的实际命中率降到接近零

新增独立程序 `own_read_layouts.js`，用大形状池与不同字段位置，
已测得 V8 预热后的完整形状池周期命中率为 **0.291443%**。
连续读取同一对象 2/4/16 次还能调节到约 50%/75%/93.75%。
此程序默认使用显式预热，所有对象和序列在热循环外创建。
完整原理、参数、计数方法和范围见 [LAYOUTS.md](LAYOUTS.md)。
