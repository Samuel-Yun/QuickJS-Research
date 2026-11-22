# 复现命令

以下在仓库根目录执行。已保存的原始记录不能覆盖；这里只整理结果时，不会重新启动 benchmark。

```bash
python3 js-interpreter-bench/experiments/ctor_initial_shape_20261122/attempt01/analyze.py
python3 js-interpreter-bench/experiments/ctor_initial_shape_20261122/attempt01/report.py
python3 js-interpreter-bench/experiments/ctor_initial_shape_20261122/attempt01/audit.py
```

要从头重跑，先复制脚本到同级的新 attempt，不复制数据和 manifests。下面的新目录若已存在，就换另一个编号。

```bash
cd js-interpreter-bench/experiments/ctor_initial_shape_20261122
mkdir attempt02
cp attempt01/*.py attempt01/*.js attempt01/*.c attempt01/*.h attempt01/.gitignore attempt02/
cd attempt02

# 三父版，未插桩 Release 和详细计数版
python3 build.py --labels SPARSE P2 P2_COLD --modes release diag
python3 run.py initial
python3 diagnose.py

# 先读诊断。此次冷双槽 8,372,555 次卡在构造前 initial，才执行其 INIT_FREE 分支。
# 旧 P2 有 342 次替换，因此没有跳过 KEEP_PRIMARY。
cat diagnostics/summary.json
cp ../attempt01/anchor.json ../attempt01/decisions.json .

# 三候选独立构建；不叠加 KEEP_PRIMARY 和 INIT_FREE
python3 build.py --labels INIT_FREE P2_COLD_INIT P2_KEEP_PRIMARY --modes release diag
python3 gate.py --labels INIT_FREE P2_COLD_INIT P2_KEEP_PRIMARY
python3 sanitize.py
python3 diagnose.py --labels INIT_FREE P2_COLD_INIT P2_KEEP_PRIMARY --output candidate_diagnostics
python3 extra_counts.py
python3 run.py candidates --labels SPARSE P2 P2_COLD INIT_FREE P2_COLD_INIT P2_KEEP_PRIMARY
python3 keep_micro.py
python3 screen.py

# 只有 Tree 重复快至少 5%、稳定用例没有明显回退的候选会进入全集
python3 full_bench.py
python3 analyze.py
python3 report.py
python3 audit.py
```

复制的 `decisions.json` 是本轮历史决定，不应拿它代替新一批的诊断判断。`screen.py` 会按新记录重新筛选，`full_bench.py` 只跑入选者及现场 SPARSE、旧 P2。`report.py` 和 `audit.py` 内有此次覆盖数及入选版本的断言；新的诊断分布如果变化，应保留原始数据并据实更新新 attempt 的报告，不能改数据迎合断言。

当前 attempt 的三个父版 Release 直接复用了 7c941da 第二轮的未插桩二进制，启动的都是本轮新进程，没有复用旧时间。每次启动前核对二进制和源码 SHA256；冷/热布局、同一编译配置见各 `*.manifest.json`。上面的从头命令会在新 attempt 重建父版，旧二进制不在也能重建。

`extra_counts.py` 为检查详细诊断是否扰动分布，会调用前一轮的轻计数构建。如果旧 `work/` 被清理，先在仓库根目录恢复这些构建：

```bash
python3 js-interpreter-bench/experiments/ic_screen_round2_20261122/attempt01/build.py --labels SPARSE OLD_P2 P2_COLD --modes counts
```

## 测量口径

固定 CPU 2、`TZ=Asia/Shanghai`、`LC_ALL=C`、同一台 Ubuntu、原 Makefile 的 gcc/O2 配置。Tree 使用冻结包原 `tests/sunspider/access-binary-trees.js`、N=256。完整套件沿用 `native_confirmation_20261108/attempt02` 的脚本哈希、N、校验、Setup/Run 边界，首次 Run 计入，没有额外热身。

Tree 与稳定用例每版各 7 个新进程，轮换版本顺序；稳定用例每进程 16,777,216 次，记录循环耗时。全集每版每项一个新进程，按表项轮换版本顺序，Octane 和 SunSpider 交错执行。所有正式计时都是未插桩 Release。计数构建单独运行，不用计数耗时评价性能。

Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM，另外列逐项 ms/Run 之和。不合并两套分数。额外 KEEP 小用例只各跑一次，其时间不能当作稳定统计结论。

语义对照覆盖原有安全/属性测试、原型描述符、异常、目标切换、负缓存、GC 生命周期，以及准备后字节码保存/加载和 ROM。ASan、UBSan 单独构建通过；工具的 ptrace 环境不支持 LeakSanitizer，因此未声称通过 LSan。

## 补丁怎么用

补丁是 LF 格式，相对规范化后的冻结源码。`build.py` 会按冻结 manifest 恢复原行尾并生成构建目录，推荐直接使用上面的构建命令。

- `SPARSE-to-INIT_FREE.patch`：冻结单槽 → 去掉 initial 依赖。
- `P2_COLD-to-P2_COLD_INIT.patch`：只看冷双槽这次新增的改动。
- `OLD_P2-to-P2_KEEP_PRIMARY.patch`：只看旧 P2 淘汰规则改动。
- 其余 `SPARSE-to-*`：用于从同一冻结底座完整复现对应候选，包含其父版必要改动。

`audit.py` 会把补丁实际应用到临时目录，和构建脚本的最终源码逐文件比较，同时核对冻结哈希、热路径、布局、所有计时、校验及 GM。
