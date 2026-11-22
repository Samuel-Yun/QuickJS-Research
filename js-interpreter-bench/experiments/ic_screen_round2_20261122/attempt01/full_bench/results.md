# 第二轮 IC 独立候选单轮筛选

唯一底座：冻结 SPARSE（06aada4）。SPARSE 也现场新测；按表项轮换版本顺序，各版各项一个新进程。未插桩 Release，CPU 2，原输入与固定 N、原 Setup/Run 边界、首次 Run 计入，无额外热身。

| 版本 | Octane GM | SunSpider GM | 确实省掉的工作 | 最大单项回退 | 达到保留门槛 |
|---|---:|---:|---|---|---|
| SPARSE | +0.00% | +0.00% | 现场重测的冻结基线 | — | — |
| NEG_DIRECT | +0.94% | +3.31% | 无正计划的负命中跳过资格检查和重复记负缓存 | access-nbody +14.49% | — |
| P2_COLD | -0.40% | +2.31% | FourSite 保持 32B，第二目标学习成功才升级双计划记录 | access-binary-trees +12.31% | — |
| PROTO_SMALL | +0.16% | +0.62% | 0～2 项原型表直接看描述符，减少按 atom 查找 | math-partial-sums +3.13% | — |
| D16_STATIC | +1.24% | +3.69% | 准备时选择融合前缀，取指时不再判断宽窄 | bitops-nsieve-bits +16.21% | — |

负数表示耗时下降。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM；两套不合并计分。门槛为任一套至少快 2%，另一套最多慢 1%。

没有候选达到预先规定的整体保留门槛。
这些都是单轮筛选结果；不自动替换 SPARSE，也不叠加或调参补成绩。

完整表：[Octane](octane.md)、[SunSpider](sunspider.md)；原始进程记录 `runs.jsonl`，完整 CSV `comparison.csv`，[超过 5% 的回退清单](regressions_over_5pct.md)另附同名 CSV。

机制验证、代码摘录和后续建议见上一层 `mechanism_report.md`、`key_code.md`；复现命令见上一层 `REPRODUCE.md`。
