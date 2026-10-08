# 六页组会提纲（只报告真实已完成工作）

## 第1页：已有基线与本轮唯一问题

旧同WSL cohort Richards QJS/V8/JSC median3.644672/2.245410/2.137383 ms/Run
（whitebox summary/baseline_recomputed.csv），不是旧Windows数据。已有own-state
对照没有支持QJS特别受益。本轮只问 inherited-method 查找准备是否是部分
差距候选；不重新排名全部benchmark，不优化正式VM。

## 第2页：原 Richards 的真实调用点

Schedule→TCB.run→四类task.run；state/task/currentTcb 是own，run是prototype。
每Run6573次选定调用；保留完整调度、出队/state/task/packet和2322/928断言。
展示source_evidence/original.schedule.js及microbench/A.schedule.js/B.schedule.js。
无getter/Proxy/override/原型变更是此缓存合法性的必要输入限制。

## 第3页：诊断路径而非耗时占比

独立O2 GCC13.3计数构建，原N512，选定 lookup3365376次/一跳/无fallback；
B降到512但函数调用仍3365376。Begin/end只包围Run循环。27个独立语义
sequence探针全部一致。A/B都有同一QJS.call helper；JSC有.call intrinsic
identity guard的direct-call分支。复用旧whole-process profiles，不当self-time。

## 第4页：A/B实际结果（180/180，新进程，无warmup）

| engine | A_median_ms | B_median_ms | B_over_A |
|---|---|---|---|
| quickjs | 3.701276 | 3.530698 | 0.953914 |
| v8 | 2.168374 | 2.129047 | 0.981863 |
| jsc | 2.105957 | 2.078730 | 0.987072 |

V8/QJS：0.585845→0.603010；
QJS/V8：1.706936→1.658347。QJS改善较大，但仍明显更慢。
N512是从内部1000ms公共门槛重新校准；全部排列/位置平衡。

## 第5页：计时与因果边界

first-call-inclusive interpreter-mode derived execution；不是pure loop。
Setup外；原Run构造/首次调用/GC/helper/builtin/断言/残留准备内。
B缓存每Run内部一次，未移到外部warmup。A额外own currentTcb读取/局部
赋值也被移动，布局/IC/GC/builtin仍可能混杂；改善不能等于原lookup百分比。
旧45输入实际SHA精确保留，21Gitblob差异；ZIP/Git导出跨平台验证通过。

## 第6页：下一步候选与需要导师澄清

唯一候选：轻量 inherited-method cache 的guard/失效/内存成本是否值得？
已有PIC/NG v0.8 own-slot缓存并非新颖；历史IC已被NG删除，不能照泛化文档。
需保留own shadowing、getter/Proxy/原型变更、this/副作用及fallback语义，
本轮未实现。没有保证CGO/CCF B产出。
请导师确认模糊转写的引擎名称和“0.7/0.8”指什么；不把它解释成指定
WebKit revision或IC on/off实验授权。已独立完成可执行研究，不因转写暂停。
