# expand01 完整对照

用户本轮要求补齐 W1、P1、C1、ID_CTRL、ID_READ，并与 A、s001、B2、K1 及已有延迟准备版本比较。
冻结清单只有 L1，没有 L2。按已有 L1 制品执行，已在进度消息中披露该解释。

采用新的独立批次 expand01，十个条件在同一 WSL2 boot 内串行交错。
每个条件每个案例三轮新进程，Octane 17 项共 510 条，SunSpider 26 项共 780 条。
这一补充授权扩展原先最多三个入围版本的复测范围，原 selection.accept01.json 和 protocol.json 保留。
冻结工作量 N、输入、驱动、制品及 CLOCK_MONOTONIC 内部计时协议沿用。
首次 Run 计入，无额外 workload 预跑。沿用 accept_performance.py 的固定 seed 及轮次顺序规则。
原始记录继续追加，每个 suite 另存 protocol、完成状态和制品后验。
旧短测、accept01、accept02 不作为本批分母，不跨批拼接样本。

运行前进行有限时钟检查和已有实际负载预检，任一原有时钟、boot、身份、退出码或正确性门禁失败就保存并停止。
执行复用已冻结 Release 制品，复测计时不启用 trace、采样或计数。
本批仅完成探索性三轮对照，是否晋级依据逐项结果及探索性区间判断。

统计采用每组中位数、样本标准差、Tukey hinges Q1/Q3、IQR、min/max。
耗时变化率为 100 × (T_version / T_A - 1)，负数较快。
Octane 分别报告核心 16 项 / 13 suite 和扩展 17 项 / 14 suite，先 suite 内 GM，再 suite 等权 GM。
SunSpider 采用 26 case 等权 GM。两个 suite 分别比较，不计算混合 GM。
沿用 10000 次、seed 2026110706 的整轮配对 bootstrap，区间为探索性逐项区间，未作多重检验校正。
跨 1 记录为方向不明确。保留全部有效慢样本及不足 1000ms 的样本。

复现入口

```powershell
wsl.exe -d Ubuntu --exec python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/keeper.py expand01
wsl.exe -d Ubuntu --exec python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/clock_check.py expand01
wsl.exe -d Ubuntu --exec env V6_EPOCH=expand01 python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/accept_performance.py precheck
wsl.exe -d Ubuntu --exec env V6_EPOCH=expand01 python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/accept_performance.py full --name full_expand01_octane --kind octane --labels A s001 B2 K1 L1 W1 P1 C1 ID_CTRL ID_READ
wsl.exe -d Ubuntu --exec env V6_EPOCH=expand01 python3 -u /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v6_targeted_ic/accept_performance.py full --name full_expand01_sunspider --kind sunspider --labels A s001 B2 K1 L1 W1 P1 C1 ID_CTRL ID_READ
```

已有同名完成文件时只运行离线统计，重跑采集须使用新的 epoch，保留旧记录。
