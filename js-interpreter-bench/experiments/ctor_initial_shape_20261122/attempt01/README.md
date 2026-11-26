# Tree 构造 IC：initial shape 依赖实验

起点为 `7c941da`，冻结 SPARSE 为主基线。没有改冻结源码、旧实验或本地 jwst-compiler，没有 push。

这轮先复现旧 P2 的 Tree 收益，再定位学习从哪一步分叉，最后筛选三个独立候选。`P2_COLD_INIT` 是用户要求的条件分支：仅在确认冷双槽也卡在 initial shape 后，从 P2_COLD 独立去掉同一依赖。它没有混入 KEEP_PRIMARY。

- [结果和全部七轮原始时间](results.md)
- [机制、失败分类及前两个静态位点](mechanism_report.md)
- [关键 C 代码](key_code.md)
- [Octane 17 项](full_bench/octane.md)、[SunSpider 26 项](full_bench/sunspider.md)
- [全部超过 5% 的回退](full_bench/regressions_over_5pct.md)
- [复现命令](REPRODUCE.md)、[核对结果](audit.json)

Tree 七轮中位数：SPARSE 7.7225、旧 P2 6.3940、INIT_FREE 4.4959 ms/Run。INIT_FREE 比同批 SPARSE 快 41.78%，但全集单轮 Octane / SunSpider 为 +1.65% / +0.42%。这轮没有整体赢家，保留实验，不替换 SPARSE。

`patches/` 同时提供相对 SPARSE 和各自父版的补丁。`OLD_P2-to-P2_KEEP_PRIMARY.patch` 只改淘汰规则；`P2_COLD-to-P2_COLD_INIT.patch` 只去掉 initial 依赖。`P2_SIDE` 根据覆盖恢复结果跳过，没有伪造实现或时间。

原始数据：`initial/runs.jsonl`（21 个进程）、`candidates/runs.jsonl`（84 个进程）、`full_bench/runs.jsonl`（172 个进程）。独立详细计数在 `diagnostics/`、`candidate_diagnostics/`；轻计数对照及 KEEP 小用例在 `extra_counts/`；额外小用例的 Release 时间在 `keep_micro_times/`。CSV 可以直接用表格软件打开。

`work/` 是忽略提交的构建目录。源码由冻结包、前两轮定义和本目录脚本重建；不需要提交编译产物。
