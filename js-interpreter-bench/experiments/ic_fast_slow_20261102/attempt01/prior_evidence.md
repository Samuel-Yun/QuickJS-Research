# 已有证据与本轮新增问题

当前工作区 HEAD 为 107a4e3af5361163b96289a0869800f2b3dcff9a，myx；参考快照 cd1674f0f12b40b3e110ee295507b7f4fa55edcd 未被 checkout/reset。初始工作区与索引干净。本轮保留全部旧源码、制品和实验结果。

## 已经做过，不当作本轮发现

- `ic_mechanism_audit/attempt01/results.md`：稳定 own 目标 N2 的 8192 次读取，M 已有 8191 命中/1 次普通查找；A 为 8192 次普通 find/bucket/chain。find_own_property 是内联逻辑，不是每次 native call。
- `read_ic_hit_ablation/attempt01/results.md`：同一 SW 制品 ON/LOOKUP 在整数/引用/Richards 上支持直接取值的条件收益；稳定读 LOOKUP/ON 约 1.0598/1.0450。但 ON 相对原 M 的桥接不为零，数值控制也变化，不能把模式效果照搬为原 M 的 hash self-time。
- 同轮 `machinecode/notes.md`：已有 runtime 模式分支和确实存在的直接 load/hash 搜索；没有逐次 native trace，也没有把 C 名称当作真实 call。
- `read_ic_dequickening/attempt01/results.md`：K32 永久退出减少某些重复入口，但失去后续命中；单态目标未退出也能变慢。数值控制无目标读取却变化，不能归因于退出。
- `mr_native_layout/attempt01/results.md`：固定布局实验真实存在敏感性，旧 own_method 改善未复现；不能搜索最佳 padding 或只选最快布局。
- `v8_qjs_ic_source_compare/attempt01/own_path.md`：原 M 的 rdi_probe 本来 force_inline；atom=site->atom 本来在 miss 内。两项不作为新优化。
- `v8_inspired_ic/attempt03/results.md`：较完整 E 的同批 1530 条有效记录，核心 E/A=1.011485，未取得整体净收益。E 的读写/原型/延迟反馈等不作为本轮底座。

## 本轮新增

1. 原 A、原 M、M 派生同一个控制制品五档 100/75/50/25/0% 缓存结果采用比例；guard 真通过后才控制，强制普通查找不更新/清空缓存。独立诊断核对完整路径及引用活动，真实 shape miss 分开。
2. 三个已有 workload：稳定 own 整数、稳定 own 引用值、无目标读取数值控制。显式一次准备后再计时，独立机制 cohort；不搬进首次调用计入的正式基准。
3. 实际源码与机器码定位后，阶段二结束才冻结一项修改计划；从 M 独立实现，保留保护和所有权。控制器不进入修改版。
4. 修改版正确性通过后，新采 A/M/修改版/V8_ON 的 26 SunSpider、17 Octane 全部样本，以及三项 A/M/修改版小表。旧时间不作分母。

本地非公开材料只作只读参考，详细审阅留在本机排除目录。公共源码、补丁、机器码和记录不得含其原文或可还原副本。perf 不可用不阻断上述独立工作。
