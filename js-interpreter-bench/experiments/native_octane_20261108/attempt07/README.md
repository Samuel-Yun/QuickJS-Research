# S002小对象查找迁移到PREP2和READ_STORE

用户希望保留PREP2/READ_STORE其他表项的时间，同时获得S002在Splay与两个CodeLoad上接近A的效果。本批独立验证PREP2_S002、READ_STORE_S002，每个版本完整17项Octane、每项5个新进程，共170条新性能样本。A/PREP2/READ_STORE/S002复用既有本机Ubuntu数据，不跑SunSpider/V8_OFF。

两个候选分别从逐文件SHA核验过的直接父版恢复，只改quickjs.c中的find_own_property：合格普通非exotic、hashed且无删除槽的对象，属性数不超过2时按S002逻辑正向扫描当前描述符，其他路径仍用原查找。保留父版的IC准备、指令、记录、借用融合、原型缓存，以及READ_STORE共享写入逻辑。没有按benchmark名称、文件名或单项成绩选择引擎；每个候选是一个固定ELF运行全部17项。

S002直接基于A，没有读IC准备和元数据成本，所以上述源码迁移不能保证复制其表项耗时。本批目标是验证三个目标项是否接近A，并完整报告其余14项相对直接父版的变化；未观测到回退不等于已证明稳定不退化。所有慢样本和负结果保留。

编译为本机GCC15.2/-O2/-g/-fwrapv/HAVE_CLOSEFROM，无新增NDEBUG/LTO/PGO/march=native；CPU2、原输入/N及首次Run计时边界沿用旧协议。候选按case交错、轮换顺序，构建/资格检查/性能采集串行。

资格检查含现有语义、小对象descriptor/Proxy/原型/删除、P1+B2/shared-store回归、C API保存加载/GC/native finalizer、针对性ASan/UBSan以及34条N1负载正确性。LSan依既有环境限制关闭，没有完整test262或完整OOM证明。

运行入口`python3 -u -B run.py all`。冻结后不修改源文件、runner或输入，不覆盖失败token。`python3 -B review.py`仅离线审计归档/调度/中位数/suite权重，不执行引擎。结果见results.md、statistics.csv、per_case_comparisons.csv、aggregate.csv；真实完成状态以audit.json为准。旧对照为跨批次探索，bootstrap不覆盖未观测到的环境漂移。

已完成170/170条性能样本、34/34条负载正确性、专项检查/ASan/UBSan及原始审计/统计独立复算。两个组合核心相对父版分别慢0.96%、1.48%，没有满足迁移目标；未提升候选。完整结论见[summary.md](summary.md)。性能之后仅做独立N=1计数诊断，保存在post_counts，不进入性能分数；其source/runtime和归档另有SHA。
