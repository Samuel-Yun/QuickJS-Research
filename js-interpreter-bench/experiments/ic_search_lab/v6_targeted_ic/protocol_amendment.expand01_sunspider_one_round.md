# 用户将 SunSpider 改为一轮

用户在 expand01 运行期间要求 SunSpider 只跑一轮以节省时间。
Octane 已完成的三轮 510 条保留。SunSpider 的新完成目标为 26 项 × 10 条件 × 1 轮，共 260 条。
本批有效目标合计 770 条。

原始 full_expand01_sunspider.protocol.json 记录最初三轮计划，保持不变。
完成第一轮后，由专用监控脚本暂停并终止本轮自有控制进程，避免继续执行第二、三轮。
若停止边界已经启动第二轮进程，保留其原始记录并单列为用户截停，排除于一轮统计，不能算作候选失败。
停止记录见 sunspider_one_round_stop.expand01.json。

第一轮样本仍来自新进程，输入、N、顺序、计时、正确性门禁保持原计划。
SunSpider 每组只有一个样本，报告点估计及 26 case 等权几何平均。
样本标准差和 bootstrap 置信区间记为 UNKNOWN / 空值。
Q1/Q3 如给出，均是同一个观测值，不能解读为稳定性证据。
Octane 三轮继续沿用原探索性整轮配对 bootstrap 统计。

报告清楚标明 Octane n=3、SunSpider n=1，两个 suite 分别呈现相对 A 的变化。
本次用户缩减不影响已完成 Octane 的正确性和制品后验。
