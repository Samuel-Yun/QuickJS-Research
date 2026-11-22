# 第二轮 IC 筛选

唯一主基线：冻结 SPARSE_CTOR_IC（06aada4），`myx`。四版独立，不组合、不引入 JIT、不自动替换基线、不 push。

| 候选 | 改动 | 相对 SPARSE 的完整补丁 |
|---|---|---|
| NEG_DIRECT | 无正计划的已有负命中直接普通构造，跳过资格和重复 remember | [补丁](patches/NEG_DIRECT.patch) |
| P2_COLD | FourSite 32B、单槽 FullPlan 96B；用原 padding 标记按需升级的双记录 | [补丁](patches/P2_COLD.patch) |
| PROTO_SMALL | 物理属性表最多两项的普通原型层直接看有效描述符 | [补丁](patches/PROTO_SMALL.patch) |
| D16_STATIC | 沿用 D16 布局规则，准备时选宽/短融合前缀 | [补丁](patches/D16_STATIC.patch) |

- [本批一页总表](full_bench/results.md)
- [Octane 完整逐项表](full_bench/octane.md)
- [SunSpider 完整逐项表](full_bench/sunspider.md)
- [超过 5% 的单项回退](full_bench/regressions_over_5pct.md)
- [每版机制计数及定向 Release 时间](mechanism_report.md)
- [四版关键 C 代码](key_code.md)
- [D16_STATIC 实际字节码和 Release 汇编证明](assembly/results.md)
- [复现命令](REPRODUCE.md)

`prototype_histogram_before.json` 保存实现 PROTO_SMALL 前的 Boyer/Tree 实测覆盖，阈值固定为 2，没有扩大范围。`targeted/counts/` 与 `targeted/measure/` 分开保存机制和定向时间；旧 P2 / 旧 D16 只出现在定向用例中。

`full_bench/` 是现场 SPARSE 与四版的完整单轮，共 215 个新进程，按表项轮换版本顺序。每版逐项 CSV 在 `full_bench/by_version/`，合表为 `comparison.csv`，全部进程原始记录在 `runs.jsonl`。

实现由 `candidates.py` 生成，实际编译副本在忽略的 `work/`；每版 `*.manifest.json` 保留源码/二进制哈希。`audit.json` 核对独立补丁、固定布局、学习资格、实际汇编、原输入与 N、执行顺序和 GM。冻结源码、上一轮代码与旧结果均保留。
