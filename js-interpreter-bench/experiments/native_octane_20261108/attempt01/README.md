# P1+B2 的准备扫描与记录布局改进

用户授权依次实现两项独立改动，每个新版本先测五轮，沿用近期冻结对照；只跑Octane，不重跑A、s001、P1、B2、P1+B2和V8_ON。

- PREP2：只改变read_ic_prepare.inc，把B2融合标记并入读opcode改写扫描；含字段读取的函数从三遍扫描变为两遍。记录布局、准入条件、opcode长度和保存格式保持原定义。独立内部探针把执行图像还原为普通opcode，再用冻结父版准备函数重建，与新准备结果逐字比较（包括PC相对记录定位）。
- SPLIT16：保留父版三遍扫描，只改变记录布局及相应遍历。普通get_field记录16B，保留receiver的get_field2记录24B；同一分配内按两类数组存放。每个有IC的函数另有8B布局头，JSFunctionBytecode不增加字段；只含少量普通读或只含get_field2的函数可能没有净空间收益。普通命中仍直接用PC相对偏移，不追侧表。GC/释放/状态转换/序列化分别适配两类记录。

两版都直接从冻结P1+B2生成，不互相叠加。只有两者各自取得明确的净收益信号后，才考虑组合，不用未验证的收益相加作结论。

阶段：prepare生成并冻结源码/协议；qualify串行构建、语义和C API检查、保存加载/GC/qjsc、ASan/UBSan以及独立机制探针；通过后执行34条Octane N=1正确性，再采集170条新性能记录（17项×2版×5进程）。不并行构建、消毒器与性能采样。

LSan在前一批的受限环境下启动失败，故本轮预先关闭泄漏检测，保留ASan/UBSan；不声明完整test262或泄漏验证通过。针对性JS覆盖普通/原型/own状态互换、复合赋值、getter、Proxy与异常。C API检查覆盖热字节码roundtrip、GC、原生finalizer与qjsc嵌入。机制计数只在独立探针中启用，不用于性能时间。

执行 `python3 -u -B run.py all`。分阶段执行可使用prepare、qualify、measure、analyze、audit；已有阶段不自动隐式重试或覆盖。`work/`和现场`runs.jsonl`不进Git，结束后raw/runs.jsonl.gz及SHA清单保留完整过程记录。

固定逻辑CPU2，所有QuickJS均使用本机GCC15.2的相同默认优化配置；输入、N、首次Run包含的原生单调时钟边界复用冻结协议。新版本之间交错运行；相对旧对照为跨批次探索。区间使用独立新旧整轮bootstrap，不包含无法观测的批次漂移。所有偏短及慢样本保留，核心16项/13suite与扩展17项/14suite分别汇总。

结果为results.md、statistics.csv、aggregate.csv和paired_ratios.csv。父版为20261107/attempt02，A等对照为20261107/attempt01；旧数据保持不变。

已完成：170条新性能样本及34条Octane正确性全部通过，原始数据审计和独立统计复算通过。PREP2核心相对父版-0.44%、相对A-4.79%，增量探索区间跨零；SPLIT16相对父版+0.77%，不继续叠加。结论及限制见[summary.md](summary.md)，完整表项见[results.md](results.md)。`python3 -B review.py`仅复算冻结数据，不执行benchmark；另外生成同批两个新版本的配对比较new_variants_pairwise.csv。
