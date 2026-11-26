# 第二轮复现命令

目录：`js-interpreter-bench/experiments/ic_screen_round2_20261122/attempt01/`，`myx` 分支。
唯一主基线为 `on_demand_ctor_cache/modified/` 的冻结 SPARSE。四版补丁都相对它；D16_STATIC 包含明确要求沿用的 D16 布局层，没有混入其他候选。旧 P2、D16 仅作为定向对照重新构建。

从本实验目录运行：

```bash
# 正式五版与两个定向旧对照；Release 和计数构建分开
python3 build.py

# 额外诊断：只统计原型资格检查内 find_own_property 的真实 atom 比较
python3 build.py --labels SPARSE PROTO_SMALL --modes atomcounts

# 现有语义测试、新小用例、GC、准备后保存/加载与 ROM
python3 gate.py --labels SPARSE NEG_DIRECT P2_COLD PROTO_SMALL D16_STATIC OLD_P2 OLD_D16

# P2_COLD 引用转移与 D16_STATIC 字节码处理的 ASan/UBSan
python3 sanitize.py

# 机制计数及升级失败注入；保留真实执行镜像
python3 targeted.py counts

# 对实际 Release dispatch_table 的入口取 CFG，核对宽窄判断消失
python3 assembly.py

# 未插桩 Release 的定向单轮：RayTrace、Boyer、Tree、构造/读取小用例
python3 targeted.py measure

# 等编译、计数和定向测量全部结束，再开始完整同批次计时
# 五版按表项轮换，每版每项一个新进程，共 215 个进程
python3 full_bench.py

# 整理已有数据和核对，不追加计时
python3 analyze.py
python3 report.py
python3 audit.py
```

已有结果目录时跑数脚本拒绝覆盖；完整重跑请复制脚本到新的 attempt。构建 manifest 已存在且二进制哈希一致时直接复用，避免无意重新编译。

单独运行示例：

```bash
taskset -c 2 work/NEG_DIRECT.release/qjs negative_micro.js negative 65536
taskset -c 2 work/NEG_DIRECT.release/qjs negative_micro.js positive_then_bad 65536
taskset -c 2 work/P2_COLD.release/qjs ctor_micro.js all 65536
taskset -c 2 work/P2_COLD.release/qjs ctor_micro.js rotate2 65536
taskset -c 2 work/P2_COLD.release/qjs ctor_micro.js rotate3 65536
taskset -c 2 work/D16_STATIC.release/qjs read_micro.js short 33554432
taskset -c 2 work/D16_STATIC.release/qjs read_micro.js wide 33554432
```

分配失败注入仅在独立计数构建中存在：

```bash
SCREEN_FAIL_UPGRADE=1 taskset -c 2 work/P2_COLD.counts/qjs ctor_micro.js rotate2 65536
```

实际字节码样例（写入新文件）：

```bash
SCREEN_IMAGE_PATH=/tmp/d16_static_readX.jsonl SCREEN_IMAGE_FUNCTION=readX taskset -c 2 work/D16_STATIC.counts/qjs read_micro.js short 65536
```

冻结源码和旧实验不修改。`build.py` 只读取上一轮的可复现 D16 / P2 定义和诊断辅助函数；四版完整补丁在 `patches/`，不需要逐层套用补丁。正式编译均为原 Makefile 的 gcc `-O2` 配置；CPU 2、Asia/Shanghai、C locale，原输入、N、计时边界和首次 Run 计入。

当前工具的 ptrace 环境不支持 LeakSanitizer；定向检查启用 ASan/UBSan，未启用 LSan。正式 Release 没有诊断计数或故障注入逻辑。
