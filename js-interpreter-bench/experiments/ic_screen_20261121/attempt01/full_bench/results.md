# IC 独立候选单轮筛选

唯一底座：冻结 SPARSE（06aada4）。SPARSE 也现场新测；按表项轮换版本顺序，各版各项一个新进程。未插桩 Release，CPU 2，原输入与固定 N、原 Setup/Run 边界、首次 Run 计入，无额外热身。

| 版本 | Octane GM | SunSpider GM | 确实省掉的工作 | 最大单项回退 | 达到保留门槛 |
|---|---:|---:|---|---|---|
| SPARSE | +0.00% | +0.00% | 现场重测的冻结基线 | — | — |
| M1 | +0.67% | +1.92% | 同次构造复用已验证的模板，少一次模板解析 | NavierStokes.NavierStokes +10.77% | — |
| M2 | +0.23% | +0.18% | 原型链按层走一趟；描述符仍逐字段检查 | PdfJS.PdfJS +2.59% | — |
| P2 | +2.12% | +1.77% | 同点保留 2 个正计划，减少目标交替时重学 | bitops-nsieve-bits +10.59% | — |
| P3 | +2.13% | +2.98% | 同点保留 3 个正计划，减少目标交替时重学 | access-binary-trees +28.20% | — |
| P4 | +1.55% | +2.32% | 同点保留 4 个正计划，减少目标交替时重学 | access-binary-trees +11.97% | — |
| D16 | +1.44% | +1.44% | 可重定位函数的字段读从 5 字节缩为 3 字节，融合保留 | NavierStokes.NavierStokes +10.49% | — |

负数表示耗时下降。Octane 为 14 suite 分层等权 GM，SunSpider 为 26 项等权 GM；两套不合并计分。门槛为任一套至少快 2%，另一套最多慢 1%。

没有候选达到预先规定的整体保留门槛。
这些都是单轮筛选结果；不自动替换 SPARSE，也不叠加或调参补成绩。

完整表：[Octane](octane.md)、[SunSpider](sunspider.md)；原始进程记录 `runs.jsonl`，完整 CSV `comparison.csv`，[超过 5% 的回退清单](regressions_over_5pct.md)另附同名 CSV。

机制验证、代码摘录和后续建议见上一层 `mechanism_report.md`、`key_code.md`；复现命令见上一层 `REPRODUCE.md`。
