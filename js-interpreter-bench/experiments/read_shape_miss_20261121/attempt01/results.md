# v6_get_arg0 shape 失配：跳过重复 IC 探测

改动合理，已实现并做小样例验证。交替布局时确实少了一次缓存探测，缓存更新照旧；Release 微测快了 2.22%。同布局本次反而慢了 1.89%，不能把这个改动说成所有场景都受益。

## 底座和改动范围

- 独立复制 `on_demand_ctor_cache/modified/` 的冻结原 SPARSE（06aada4），逐文件核对 package manifest 的 SHA-256。
- 改版名 `SKIP_REPROBE`，只有 `quickjs.c`、`read_ic_opcodes.inc` 改变。构造 IC、负缓存、构造记录和对象分配均未改；没有加入“两次失配”。
- 冻结原件及 `build/method` 均未修改；实验构建在本目录 `work/`。相对原 SPARSE 的补丁为 `SPARSE-to-SKIP_REPROBE.patch`。
- 没有新增 opcode、改变字节码编码或 IC 布局。新增的 `borrow_miss_site` 是解释器一次 C 调用内的临时指针，只在这条失配路径赋值，没有每访问点的新增存储。

## 为什么可以跳过

原融合指令已经确认接收者是 `JS_CLASS_OBJECT`、不是 exotic 对象，而且当前 shape 与这个静态点的缓存 shape 不同。到第二次探测之间只有值的引用保留和字节码分派，没有调用用户代码，也没有改变 shape 或更新 IC。因此，单槽 IC 的第二次探测仍然会失败。

新路径只用于 `v6_get_arg0` 的这一分支；用宏的常量参数保留 `v6_get_loc0` 的旧路径。命中分支仍使用原来的槽读取代码。非对象、非普通类别或 exotic 接收者仍按旧入口执行。

```text
原来：v6 shape 不符 → 压入 receiver → 分派 get_field_rdi
                   → 再做对象/类别/shape 探测 → 普通属性查找 → 更新 IC

现在：v6 shape 不符 → 压入 receiver → goto get_field_rdi_borrow_miss
                   → 共用普通属性查找 → 更新 IC
```

`get_field_rdi_borrow_miss` 恢复该 handler 使用的 `site` 和 `obj`，随后进入 `get_field_rdi_lookup`。后者就是原来的 `RDI_COUNT(fallback)`、按 atom 查找及其后续代码，未另抄一份查找实现。值的释放/替换、访问器和特殊情况的调用、异常出口都复用原代码。

跳转前 `pc += 5`，越过下一条 1 字节 opcode 和 4 字节操作数；到达查找入口时，PC 与原 handler 已读完操作数后的状态一致。例如 7 字节的 `readX` 中，PC 从 1 前进到 6，下一条就是 `return`。

这个改变也省掉了第二条字节码的分派；计时收益不能全部归给一次 shape 指针比较。

## 样例和正确性

`stable.js`、`alternating.js` 使用相同的 `readX(o) { return o.x; }` 和 `run` 循环，只有事先排好的两个接收者不同：

```js
var a = {x: 3, a: 0};
var b = {x: 3, b: 0};
// stable:      [a, a]
// alternating: [a, b]
for (var i = 0; i < n; i++) sum += readX(sequence[i & 1]);
```

两种布局下 x 的槽号与数值相同，shape 不同。序列生成不计时。每次只经过同一个 `readX` 里的命名属性读取点。

- 两版的计时样例校验均为 `sum === 3*n`。
- `semantics.js`、现有 `property_reads.js`、`safety.js` 对照原 A：两版 Release 和独立计数构建的 12 项输出比较全部一致。
- 额外小样例包含修改字段值、getter/抛错 getter、Proxy、原型属性、字符串/null、删除字段，以及读取后继续加 1，检查 PC、栈和异常返回是否正确。也覆盖保持旧路径的局部变量读取。

## 独立计数

只统计 `readX` 的唯一读取点。每组 65,536 次，计数构建不进入正式耗时表。计数插桩由 `build.py` 单独加入，Release 中没有这些计数。

| 输入 | 版本 | 读取次数 | 融合 shape 比较 | 第二次缓存探测 | 融合命中 | 普通属性查找 | IC 更新 |
|---|---|---:|---:|---:|---:|---:|---:|
| 同布局 | 原 SPARSE | 65,536 | 65,536 | 1 | 65,535 | 1 | 1 |
| 同布局 | SKIP_REPROBE | 65,536 | 65,536 | 0 | 65,535 | 1 | 1 |
| 交替布局 | 原 SPARSE | 65,536 | 65,536 | 65,536 | 0 | 65,536 | 65,536 |
| 交替布局 | SKIP_REPROBE | 65,536 | 65,536 | 0 | 0 | 65,536 | 65,536 |

交替时实际命中率两版都是 0%；总缓存比较从每次 2 次减为每次 1 次。65,536 次更新全部保留，没有停止学习。同布局实际命中率两版均为 99.9985%；唯一的首次冷失配也走了新入口。

## 未插桩 Release 简短计时

CPU 2，Asia/Shanghai、C locale，gcc 默认 `-O2`；同批交错运行，两版每输入各 3 个新进程。短测后固定所有正式样例使用 N = 67,108,864。计时只包住 `run`，首次读取计入，无额外热身；独立计数不与正式计时同时运行。本节只列微测试；用户随后要求的完整基准见末尾。

| 输入 | 原 SPARSE 中位数，范围 | SKIP_REPROBE 中位数，范围 | 相对原 SPARSE |
|---|---:|---:|---:|
| 同布局 | 1,591 ms（1,581–1,610） | 1,621 ms（1,618–1,633） | +1.89% |
| 交替布局 | 1,847 ms（1,846–1,852） | 1,806 ms（1,803–1,829） | −2.22% |

逐次原始时间：

| 输入 | 原 SPARSE，ms | SKIP_REPROBE，ms |
|---|---|---|
| 同布局 | 1610 / 1591 / 1581 | 1618 / 1621 / 1633 |
| 交替布局 | 1846 / 1852 / 1847 | 1803 / 1806 / 1829 |

本次得到的是一个小收益：确实删掉了重复探测，但交替场景的普通查找和缓存替换仍每次都发生。同布局有小幅回退，原因本轮没有单独确定；保持命中分支的 C 操作相同，不等于重新编译后的整段解释器机器码完全相同。保留实验补丁，不替换冻结正式版，不追加优化救数据。

## 文件与复现

- `SPARSE-to-SKIP_REPROBE.patch`：相对原 SPARSE 的全部执行路径改动。
- `build.py`：校验底座、派生补丁、分别构建 Release 和计数版；构造相关源码逐字节核对。
- `stable.js` / `alternating.js` / `semantics.js`：两份小测试及正确性检查。
- `raw.jsonl`：每个进程的命令、退出状态、stdout/stderr、轮次和 N，包含所有原始计时和计数。
- `counts.json`、`timing.csv`、`timing.json`：汇总。
- `*.manifest.json` / `*.build.log` / `protocol.json`：源码和二进制哈希、构建日志、测量设置。
- `audit.py` / `audit.json`：确认补丁可还原改版、仅两份读取路径文件变化、构造文件不变、汇总来自未插桩 Release 原始记录。

从本目录运行：

```bash
python3 build.py
python3 run.py gate
python3 run.py pilot
python3 run.py counts
python3 run.py measure
python3 audit.py
```

只看一遍输出，不重跑整组：

```bash
taskset -c 2 work/SPARSE.release/qjs stable.js 1048576
taskset -c 2 work/SKIP_REPROBE.release/qjs stable.js 1048576
taskset -c 2 work/SPARSE.release/qjs alternating.js 1048576
taskset -c 2 work/SKIP_REPROBE.release/qjs alternating.js 1048576
```

`raw.jsonl` 采用追加记录；完整重新测量请复制本轮脚本到新的 attempt 目录，避免混入已有批次。

## 后续完整 Octane / SunSpider 单轮

按用户后续要求，只新跑同一未插桩改版的 Octane 17 项、SunSpider 26 项，各一个新进程，43 项原校验全部通过。原 SPARSE 复用历史数据，属于跨批次单轮筛选。

| 套件 | SKIP_REPROBE 相对原 SPARSE 整体 GM |
|---|---:|
| Octane | +0.28% |
| SunSpider | +2.96% |

本轮未见整体净收益，不替换原 SPARSE。完整逐项数据、原始记录和复现命令见 [full_bench/results.md](full_bench/results.md)；Excel 表为 [full_bench/comparison.csv](full_bench/comparison.csv)。
