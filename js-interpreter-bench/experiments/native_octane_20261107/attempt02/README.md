# P1+B2 组合：只测新版本

用户要求复用刚完成的attempt01数据，不重测A/s001/P1/B2。实际实现严格叠加冻结P1与B2，不新增其它优化；两个变换按不同顺序生成的32文件逐字相同，原P1/B2源文件哈希也分别匹配历史身份。补丁保留相对s001、P1、B2三个视角。

只构建和执行新组合版及其独立诊断/安全构建。A、s001、P1、B2和V8_ON的性能数据全部来自attempt01，未伪装为本轮新采样。采集前确认同一boot、旧ELF哈希未变；原输入、N和原生CLOCK_MONOTONIC计时边界保持一致，固定逻辑CPU2。

安全检查包括own读取和继承方法交错、换值/换布局、原型改变、getter/Proxy/异常、GC和热字节码保存加载、qjsc嵌入，以及ASan/UBSan定向检查。mechanism.c只在诊断源中加两个命中计数，核实B2的准备后借用读取和P1的一层原型方法命中同时发生；不使用诊断时间排名。未声称完整test262。

Octane17项每项5个新进程，合计85条新性能样本。没有SunSpider、V8_OFF或旧对照的新执行。工具复用attempt01中冻结的进程记录器与结果校验器，其哈希、组合runner及来源文件在protocol.json冻结。

命令：`python3 -u -B run.py all`。已完成的不可变阶段不隐式重复执行；如需离线重算，用`python3 -B run.py analyze`。本轮使用的实际制品和生成源码在忽略的work/中；脚本复用attempt01冻结文件，输入/脚本哈希在协议中明确。

实际初次安全构建在LeakSanitizer启动时失败，完整stderr保留。`finish.py`在不修改冻结runner或性能ELF的前提下，用`ASAN_OPTIONS=detect_leaks=0`恢复ASan/UBSan构建与定向检查，再完成正确性、性能及审计。没有声明泄漏检查通过，相关限制见sanitizer_environment_issue.json。失败构建不删除、不计作性能样本。

核心16项/13suite和扩展17项/14suite分别聚合。跨批次区间采用10000次独立新/旧整轮重采样，保留旧批次内部相关性；区间不覆盖无法观测的系统漂移。因此较小增量属于探索性线索，而非同批交错控制下的确认性因果结论。

结果见results.md、statistics.csv、aggregate.csv及paired_ratios.csv；原始记录最终归档为raw/runs.jsonl.gz。旧对照和旧原始记录保留在attempt01，不改写。
