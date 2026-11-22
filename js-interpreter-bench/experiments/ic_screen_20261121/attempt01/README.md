# IC 独立候选筛选

开始于 2026-11-21，完整批次跨到 2026-11-22。分支 `myx`。

唯一底座为 `on_demand_ctor_cache/modified/` 冻结 SPARSE（06aada4）。六个候选分别从这份源码派生，互不叠加；冻结源码、旧结果和本地 jwst-compiler 不动。

| 名称 | 本轮改动 | 独立补丁 |
|---|---|---|
| SPARSE | 原样现场重测 | 无，源码哈希逐文件等于冻结底座 |
| M1 / REUSE_RECIPE | 同一次构造资格检查与学习之间复用模板 | [M1.patch](patches/M1.patch) |
| M2 / PROTO_WALK_ONCE | 每次检查沿原型链按层遍历一次 | [M2.patch](patches/M2.patch) |
| P2 | 主槽加按需扩展，共 2 个正计划 | [P2.patch](patches/P2.patch) |
| P3 | 同一实现，容量 3 | [P3.patch](patches/P3.patch) |
| P4 | 同一实现，容量 4 | [P4.patch](patches/P4.patch) |
| D16 | 安全的直线函数中，字段读指令从 5 字节压到 3 字节 | [D16.patch](patches/D16.patch) |

先看结果和代码：

- [一页筛选结果](full_bench/results.md)
- [Octane 17 项完整对照](full_bench/octane.md)
- [SunSpider 26 项完整对照](full_bench/sunspider.md)
- [所有超过 5% 的回退](full_bench/regressions_over_5pct.csv)
- [机制计数与内存数据](mechanism_report.md)
- [最值得复测的版本及关键 C 代码](key_code.md)
- [复现命令](REPRODUCE.md)

正式数据：`full_bench/runs.jsonl`（301 个新进程）、`comparison.csv`、`summary.json`。计数数据独立在 `mechanisms/`，不使用其时间评价性能。`*.manifest.json` 保存独立源码/二进制哈希；`audit.json` 核对底座、补丁、验证、执行顺序与 GM。

实现入口为 `candidates.py`、`d16_prepare.inc`、`d16_runtime.inc`；`build.py` 生成每版独立源码和补丁。实际构建位于忽略的 `work/`，不把生成的解释器源码副本混入补丁。

预检记录保留：初次微计数把循环外的 `new Array` 也计入构造次数，已在正式批次前将序列容器改为 `[]`，循环、N、目标和值均未变，最初记录在 `mechanisms_setup_count_attempt/`。D16 的初始构建失败记录也保留；修正集成后所有七版均通过验证才进入正式筛选。LeakSanitizer 与工具的 ptrace 环境不兼容，ASan/UBSan 定向检查已通过，未把这项环境失败当成候选的语义失败。

不自动替换 SPARSE、不组合候选、不 push。
