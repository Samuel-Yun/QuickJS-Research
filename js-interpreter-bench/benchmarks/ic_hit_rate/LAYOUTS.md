# 同时适用于多态 V8 的命中率输入控制

`own_read_layouts.js` 是独立的新程序，旧 `own_read.js` 与所有旧实验保持不变。
新程序默认使用 65,536 个对象、1,048,576 个序列元素、201,326,592 次计时读取。
原版 A 单次时长验收为 **5.8039 秒**，记录见
`experiments/ic_microbench_20261109/layout_A_duration01/`。
这只是一次时长验收，不与旧微基准的时间作收益比较。

## 对象与访问序列

每个对象都有两个普通自身数据属性 `x` 和 `pad`，`x` 始终为 3。
每个对象使用独立的普通原型，使接收对象的 Map 不同；目标读取仍是自身字段，
不是沿原型链取值。交替按 `x,pad` 与 `pad,x` 的顺序创建字段，使目标字段位置不同。
这样避免所有布局都能由同一个字段 handler 覆盖的情况。
V8 原生检查确认所有对象仍为 fast properties，并确认相邻及相隔一个对象的 Map 不同。

先创建全部对象和序列；热循环仍只有数组取对象、`obj.x`、整数累加和循环控制。
没有在循环中分配对象、修改形状、清空反馈或关闭 IC。
`--run-length K` 表示同一形状连续读取 K 次，再换下一个对象。
大池导致新形状访问大多未命中，组内后续读取则能命中，因此可调节实际比例。

只有十几种形状时 V8 仍能通过其他缓存覆盖：本次 16 种形状对照组也测到 100%。
所以形状数超过多态反馈上限，并不能直接推出命中率接近零。

## 使用

在仓库根目录运行原版 A：

```bash
QJS_A=js-interpreter-bench/experiments/native_octane_20261107/attempt01/work/A/qjs
MICRO=js-interpreter-bench/benchmarks/ic_hit_rate/own_read_layouts.js
taskset -c 2 "$QJS_A" "$MICRO" --shapes 65536 --run-length 1
taskset -c 2 "$QJS_A" "$MICRO" --shapes 65536 --run-length 4
```

V8 原二进制的命中率诊断（需要 GDB 能追踪自己启动的子进程）：

```bash
python3 -B js-interpreter-bench/benchmarks/ic_hit_rate/probe_v8_layouts.py \
  --output js-interpreter-bench/experiments/ic_microbench_20261109/my_layout_probe01 \
  --shapes 65536 --run-length 1 --iterations 4096 --gate-total
```

该诊断入口固定序列长度为 1,048,576，形状数为 65,536 时连续次数可选 1/2/4/8/16。
独立 JS 本身还允许调整 `--sequence-length`（最大 8,388,608）、`--phase`、
`--iterations`、`--warmup-cycles` 和 `--min-ms`。
形状数、连续次数、序列长度要求是二的幂，并且形状数乘连续次数不超过序列长度。
输出目录必须新建，已有目录不能覆盖。

## 计数与范围

默认对同一读取函数先执行 2,097,152 次预热，再开始计时或计数，
用于研究循环复用工作集时的持续命中/未命中。预热次数在输出中明确记录。
这与旧实验“首次调用计时、无预热”的口径不同，不能直接拼接时间。

`v8_layout_controls01` 验证中，预热后的完整 65,536 形状周期只命中 191 次，
实测命中率 **0.291443%**。其余 65,345 次进入 IC miss，无无反馈/通用回退。
连续读取 2/4/16 次的 4,096 次诊断窗口分别测得 50.073242%、75.122070%、93.823242%。
这些比例是本次输入的实测值，后续改变机器、分配布局或版本仍应重新计数。

GDB 时间不能用于性能比较；本阶段没有新增三引擎五轮性能比较。
所有新时间比较应以相同的新输入、序列长度、迭代数和预热口径重测各引擎。
EVAL_COLD 在新布局下的实际命中率尚需另行计数，不自动沿用旧两形状实验结果。
