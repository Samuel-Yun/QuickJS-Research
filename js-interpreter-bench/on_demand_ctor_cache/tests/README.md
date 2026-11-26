# 怎么测耗时

以下命令在 `on_demand_ctor_cache` 目录下执行。先编译：

```bash
python3 tools/manage.py build both
```

## 测一个样例

```bash
# Octane Richards：只测按需构造缓存
python3 tests/run.py octane Richards

# 同一个样例，对照 A 和按需构造缓存
python3 tests/run.py octane Richards --engine both

# SunSpider 单项对照
python3 tests/run.py sunspider access-binary-trees --engine both

# 一次选择多个样例
python3 tests/run.py octane Richards Splay RayTrace --engine both

# Crypto 会选择 Encrypt 和 Decrypt 两个子项
python3 tests/run.py octane Crypto --engine both
```

每个进程结束立即显示：

```text
运行 octane/Richards  按需构造缓存  第 1/1 次…
  2.2375 ms/Run  （N=1024，Run 总计 2291.20 ms，校验通过）
```

这里的数字仅作格式示例。`ms/Run` 是一次完整基准工作所需的平均毫秒数，**越小越快**。例如 Richards 在计时区间内执行 1024 次 Run，区间总耗时除以 1024，才能与之前的逐项表比较。外部启动进程、加载脚本的时间不混入这个数。

## 测整套

```bash
# 整套 Octane：17 项，A 和按需构造缓存各一轮
python3 tests/run.py octane --engine both

# 整套 SunSpider：26 项，A 和按需构造缓存各一轮
python3 tests/run.py sunspider --engine both

# 两套一起跑
python3 tests/run.py all --engine both
```

`--engine A` 只测原版；`--engine method` 只测按需版。默认是 `method`。每版每项默认只跑 **1 个新进程**，不会自动加轮。

想跑 5 次取中位数：

```bash
python3 tests/run.py octane Richards --engine both --repeat 5
```

两版在每个样例内相邻运行，下一轮交换先后顺序。默认固定 CPU 2、`Asia/Shanghai` 时区和 C locale，脚本会自行绑核，无需再套 `taskset`。要换 CPU：

```bash
python3 tests/run.py sunspider --engine both --cpu 3
```

## 查看样例名称

```bash
python3 tests/run.py octane --list
python3 tests/run.py sunspider --list
python3 tests/run.py all --list
```

支持表格中的简写（例如 `Richards`、`CodeLoad.Closure`）、历史全名（例如 `Richards.Richards`、`CodeLoad.CodeLoadClosure`）和 `.js` 文件名。`Crypto`、`EarleyBoyer`、`CodeLoad` 也能作为组名选择两个子项。

## 结果保存在哪里

每次运行会新建 `test_runs/时间戳/`，终端会显示完整路径：

| 文件 | 内容 |
|---|---|
| `summary.md` | 可直接阅读的逐项表；两版对照时附相对 A 的百分比 |
| `summary.csv` | 每项每版的中位数、最小值、最大值和进程数，可用 Excel 打开 |
| `results.json` | 同样的数据与汇总统计 |
| `raw.jsonl` | 每个进程的命令、原始结果、内部及外部耗时 |
| `*.stdout` / `*.stderr` | 每个进程的完整输出和报错 |
| `protocol.json` | 输入/二进制哈希、固定 N、CPU、时区、执行顺序 |
| `status.json` | 是否完整跑完；中止原因 |

需要自己指定新结果目录时，用 `--output 路径`。已有结果目录不会覆盖。

Octane 整体变化沿用 **14 suite 分层等权几何平均**；SunSpider 用 **26 项等权几何平均**。另外列出逐项 ms/Run 中位数之和。只跑几个样例时，汇总会标明是所选项，不冒充全集成绩。

## 直接执行 JS

`octane/`、`sunspider/` 中每份 JS 都包含原负载和计时驱动。例如：

```bash
taskset -c 2 build/A/qjs tests/octane/Richards.js
taskset -c 2 build/method/qjs tests/octane/Richards.js
taskset -c 2 build/method/qjs tests/sunspider/access-binary-trees.js
```

直接执行会输出原始 JSON，`elapsed_ms` 是计时区间总耗时，除以 `N` 是 ms/Run。zlib 另需 shell 读取接口：

```bash
taskset -c 2 build/method/qjs --std -I tests/support/zlib_read.js tests/octane/zlib.js
```

用 `tests/run.py` 时会自动带上这个参数，并把 JSON 整理成人能直接看的时间表。

## 输入来源

43 份 JS 都从 `native_confirmation_20261108/attempt02` 已冻结的 measure 脚本逐字节复制，仅简化外部文件名，JS 内容不改。固定 N、SunSpider 允许校验值和 Crypto 对应 N 的密文校验值保存在 `benchmarks.json`。首次 Run 计入，没有额外预热；Setup/加载和原驱动中位于计时区间外的校验仍放在区间外。

本目录及 `support/` 已包含运行所需内容，运行时不读取旧 `experiments/`。引擎 SHA 记录当前实际使用的二进制，方便以后修改方法、重新编译后继续比较。
