# initial shape 构造 IC：通过 Tree 门槛后的全集筛选

唯一底座：冻结 SPARSE（06aada4）。SPARSE 也现场新测；按表项轮换版本顺序，各版各项一个新进程。未插桩 Release，CPU 2，原输入与固定 N、原 Setup/Run 边界、首次 Run 计入，无额外热身。

| 版本 | Octane GM | SunSpider GM | 确实省掉的工作 | 最大单项回退 | 通过 Tree 门槛 |
|---|---:|---:|---|---|---|
| SPARSE | +0.00% | +0.00% | 冻结单槽主基线 | — | — |
| P2 | +1.87% | +1.87% | 旧双槽对照，仍依赖 initial shape | bitops-nsieve-bits +10.56% | — |
| INIT_FREE | +1.65% | +0.42% | 单槽去掉 initial 硬依赖和持有，保留热布局 | bitops-nsieve-bits +14.28% | 是 |
| P2_COLD_INIT | +0.79% | +0.06% | 从 P2_COLD 独立去掉 initial 依赖和持有 | bitops-nsieve-bits +14.13% | 是 |

负数表示耗时下降。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM；两套不合并计分。本轮进入全集的门槛来自此前 7 轮 Tree 和稳定命中用例，不用全集单轮改变这一结论。

通过 Tree / 稳定命中门槛：INIT_FREE、P2_COLD_INIT。
这些都是单轮筛选结果；不自动替换 SPARSE，也不叠加或调参补成绩。

完整表：[Octane](octane.md)、[SunSpider](sunspider.md)；原始进程记录 `runs.jsonl`，完整 CSV `comparison.csv`，[超过 5% 的回退清单](regressions_over_5pct.md)另附同名 CSV。

机制验证、代码摘录和后续建议见上一层 `mechanism_report.md`、`key_code.md`；复现命令见上一层 `REPRODUCE.md`。
