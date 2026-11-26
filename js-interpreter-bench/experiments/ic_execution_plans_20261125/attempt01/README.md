# 三种解释器执行路径实验

结果：[results.md](results.md)。两套完整逐项表（A、父版 SPARSE、四个候选、V8 --jitless）：[full01/results.md](full01/results.md)。

- `01_forward_numeric`：new 位点上的包装/数值三字段计划 `NUMERIC_PLAN`，含旧 forward 对照和同 ELF 关闭提交的对照。
- `02_compare_branch`：同一识别器的 `COMPARE_FIRST` / `COMPARE_FULL`，分别只融合第一次比较、再复用假边上的第二读取。
- `03_ctor_coalloc`：容量不超过 2 的原构造正命中连续分配 `COALLOC`，含同 ELF 的原两块分配对照。

三组互不叠加。每组 `SPARSE-to-*.patch` 独立对冻结 `on_demand_ctor_cache/modified`，完整构建源在 `work/`，以各 `*.release.manifest.json` 的路径和哈希为准。构建拷贝统一 LF，冻结源不动。旧的开发构建和失败日志保留，不进入正式时间表。

正式输入完全复用 `on_demand_ctor_cache/tests/{octane,sunspider}`，并核对 native_confirmation 的 SHA/N/校验。计数只对 Run 前后加 `__ep_begin/end`，不改工作负载；计数进程不取性能数据。这里没有使用用户示例的 JS 直接构造改写版作为正式输入。

历史对照：A/V8 取原 03_sparse_ctor/analysis 所引用的 native 30 次中位数；SPARSE 取最近 own_shape_guard/full_confirmation01 已有现场单轮。新候选全集和历史列是跨批次筛选，定向 5 对则现场测 SPARSE。全部历史文件哈希见 full01/protocol.json。旧发表 SPARSE 时间另保留 CSV 列，不覆盖。

## 首次复现顺序

在同级新 `attempt` 目录中复制本目录的 Python/JS/C/inc 文件和三个子目录中的脚本源码后执行。`work`、raw、manifest、gate 和结果不复制，避免把旧成绩当新成绩。也可保留此目录只看已有数据；各执行入口拒绝覆盖已有原始记录。

```sh
# 当前工作目录应是该实验 attempt 目录。
python3 ../../../on_demand_ctor_cache/tools/bytecode.py ../../../on_demand_ctor_cache/tests/octane/RayTrace.js --engine method --output bytecode_raytrace > bytecode_raytrace.log
python3 ../../../on_demand_ctor_cache/tools/bytecode.py ../../../on_demand_ctor_cache/tests/octane/Splay.js --engine method --output bytecode_splay > bytecode_splay.log

python3 build.py SPARSE OLD_FORWARD NUMERIC_PLAN COMPARE_FIRST COMPARE_FULL COMPARE_PROFILE --modes release counts sanitize
python3 build.py COALLOC_PROFILE --modes counts
python3 run.py co_profile
python3 build.py COALLOC --modes release counts sanitize

python3 validate.py numeric
python3 validate.py compare
python3 validate.py coalloc --output validation03

python3 run.py numeric_counts
python3 run.py compare_counts
python3 targets.py
python3 full.py
python3 post_counts.py
python3 inspect_sizes.py
python3 report.py
python3 audit.py
```

构建会验证冻结源码，以当前 GCC 同一 Makefile 选项构建；这里实际使用 GCC 15.2.0。CPU 2、C locale、Asia/Shanghai，原 Setup/Run 边界、首次 Run 计入、没有额外热身。用户给出的 GCC 14.2.0 源码改写实验是另一台/另一配置的参考，不和本轮时间直接合并。

初次运行 coalloc 的验证输出可以直接命名 validation03，使 full.py/targets.py 使用同一 gate 路径。计数/计时目录自动选下一个编号；本轮已完成的是各 target01、full01、mechanism01。`report.py` 汇总本轮这些固定目录；要汇总新的完整复跑，应改为相应编号，保留旧记录。

## 直接跑单个正式输入

从每个 manifest 读取 `binary` 路径，或按本轮实际目录，例如仓库根：

```sh
taskset -c 2 js-interpreter-bench/experiments/ic_execution_plans_20261125/attempt01/01_forward_numeric/work/NUMERIC_PLAN.release.rev04/qjs js-interpreter-bench/on_demand_ctor_cache/tests/octane/RayTrace.js

# 同一个 ELF：学习与守卫保留，只有提交关闭。
QJS_NUMERIC_ENTRY_OFF=1 taskset -c 2 js-interpreter-bench/experiments/ic_execution_plans_20261125/attempt01/01_forward_numeric/work/NUMERIC_PLAN.release.rev04/qjs js-interpreter-bench/on_demand_ctor_cache/tests/octane/RayTrace.js

# COALLOC 同一 ELF 的原两块分配对照使用 QJS_CTOR_COALLOC_OFF=1。
```

原始计时：三个 `target01/raw_timings.csv` 和 `full01/raw_timings.csv`；每条 JSON 含原命令、stdout、退出状态、输入/ELF 哈希。独立计数：`counts02`、`mechanism01`。实际执行字节码：`bytecode_raytrace/`、`bytecode_splay/`，以及候选计数目录的 `snapshot.jsonl`。结构尺寸由未插桩 Release ELF 的 DWARF 经 GDB 只读取得，见 `sizes.json`。

补充说明：构造模板匹配中的数值 `special_object 1` 对应源码 enum 的 `OP_SPECIAL_OBJECT_MAPPED_ARGUMENTS`。计数同时覆盖 mapped/unmapped 两种物化入口。

字节码查看器的 `constructor_sites.positive_plan` 仍表示旧 R3 的正计划，不包含新增 NumericPlan。新增计划的发布和提交以独立 numeric 计数为准。旧 wrapper / initializer 字节码也仍在，快路是在 new 入口跳过它们的执行，并非删除源码或缓存返回值。
