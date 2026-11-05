# 组会汇报提纲（6页，不生成PPT）

1. 已有基线与本轮问题：同WSL cohort；Richards原V8/QJS0.616、Navier1.213反例、
   RegExp0.107。first-call-inclusive，不是pure-loop。复算270旧样本一致，不重跑3780。
2. Richards证据链：10671谓词/Run；V8 GetNamedProperty；JSC函数hash与源码关联；
   QJS/JSC实际handler差异。合法字段缓存对照保留校验，移除了调度器语义，披露限制。
3. Navier反例：QJS优于V8，JSC更快；lin_solve采样与get_array_el动态计数。
   同核Array/F64，独立oracle；helper有typed专门化，不把慢标签当哈希成本。
4. 对照结果：展示results.md的B/A和引擎ratio小表，360/360、N256、30新进程。
   QuickJS字段缓存相对预测未获支持；表示变化不是自动加速，也不是原Octane新排名。
5. RegExp与测量限制：native代码PC/可执行映射实际关联；JSC Yarr解释仍有Regex样本。
   whole-process采样、QJS无self-time、first-call frontend及状态演进、WSL频率UNKNOWN。
6. 下一步：先核查prototype查找/调用成本，再谈优化；PIC/fusion已有技术，创新未成立。
   向老师确认引擎名称/版本话语，不把整理稿当commit/IC授权证据。

页4实际数值：

| 组 | 引擎 | B/A | 变化 |
| --- | --- | --- | --- |
| richards | quickjs | 0.966237 | -3.38% |
| richards | v8 | 0.966170 | -3.38% |
| richards | jsc | 0.918646 | -8.14% |
| navier | quickjs | 1.181889 | +18.19% |
| navier | v8 | 1.073154 | +7.32% |
| navier | jsc | 1.348157 | +34.82% |
