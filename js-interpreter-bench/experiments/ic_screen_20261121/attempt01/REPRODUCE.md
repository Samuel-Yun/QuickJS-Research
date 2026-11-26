# 复现命令

本轮目录：`js-interpreter-bench/experiments/ic_screen_20261121/attempt01/`。
每个候选独立来自 `on_demand_ctor_cache/modified/` 冻结 SPARSE，运行脚本先核对源码和二进制 SHA-256。
没有继承 TWICE、KEEP_PLAN、SKIP_REPROBE，没有访问或修改 jwst-compiler。

以下命令从本实验目录执行。已有原始结果目录时脚本拒绝覆盖；重新完整跑数请复制这些脚本到同一实验下新的 attempt 目录。

```bash
# 同一个 gcc、Makefile 和 -O2；独立构建七版 Release 和七版计数构建
python3 build.py

# 输出对照 A、小用例、GC 生命周期、准备后字节码保存/加载及 ROM
python3 gate.py

# P4 共用多槽实现、D16 的 ASan/UBSan 定向检查
python3 sanitize.py

# 只跑独立机制计数，不用其时间推断性能
python3 mechanisms.py

# 等所有构建与计数完成后，再独占 CPU 2 启动正式单轮
# 每表项轮换七版顺序，各版各表项一个新进程，共 301 个进程
python3 full_bench.py

# 仅整理已有记录，不增加计时
python3 analyze.py
python3 mechanism_report.py
python3 audit.py
```

只重建一版示例：

```bash
python3 build.py --labels M2 --modes release counts
```

构建清单已经存在且二进制哈希一致时会直接复用，避免无意改变待测二进制。

单独运行构造小用例，保持同一个 new 位点：

```bash
taskset -c 2 work/SPARSE.release/qjs ctor_micro.js rotate2 65536
taskset -c 2 work/P2.release/qjs ctor_micro.js rotate2 65536
taskset -c 2 work/P3.release/qjs ctor_micro.js rotate3 65536
taskset -c 2 work/P4.release/qjs ctor_micro.js rotate4 65536
taskset -c 2 work/P4.release/qjs ctor_micro.js rotate5 65536
taskset -c 2 work/P4.release/qjs ctor_micro.js all 65536
taskset -c 2 work/P4.release/qjs ctor_micro.js switch 65536
```

计数版将聚合计数写到 stderr：

```bash
taskset -c 2 work/M1.counts/qjs ctor_micro.js rotate2 65536
taskset -c 2 work/M2.counts/qjs ctor_micro.js rotate2 65536
```

`mechanisms/` 中的完整负载计数仍使用原 N；SPARSE 和 D16 两版扫描全部 43 项已进入执行的函数字节码镜像，其他构造候选额外计数 RayTrace、Boyer、access-binary-trees。

`patches/` 中六份补丁均相对原 SPARSE，不是逐层叠加。补丁按 LF 展示；`build.py` 保留冻结文件原本的 CRLF/LF 表示。`audit.py` 在临时目录按 LF 应用补丁并逐文件核对。

本工具环境下 LeakSanitizer 报 ptrace 不兼容，因此定向检查启用 ASan/UBSan，关闭 LSan；原始失败日志与说明保留。正式 Release 未启用这些工具。
