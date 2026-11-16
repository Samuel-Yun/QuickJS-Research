# S002 本机Ubuntu复现

用户要求重新短测历史S002，查看完整Octane表项。每项5个新进程，共85条新性能样本；不跑SunSpider/V8_OFF，不重测A、PREP2或其他旧对照。

S002直接基于A，只改find_own_property：合格普通非exotic、hashed且无删除槽的对象，属性数不超过2时正向扫描描述符；超出范围使用原查找。没有加入PREP2，也没有启用读IC。历史短测只包含Splay和Closure，没有JQuery；这次完整17项会补齐覆盖。

28个源文件和历史S002身份中构建前/后的SHA逐项一致，补丁和生成器也核对。编译使用本机GCC15.2及相同-O2/-g/-fwrapv/HAVE_CLOSEFROM，不新增NDEBUG/LTO/PGO/march=native。新的Linux ELF不冒充旧WSL制品。

输入、共同N、首次Run边界及CPU2沿用此前原生Ubuntu协议。构建、正确性和采样串行；每条性能样本是新进程。旧对照只读取已冻结归档，跨批次探索区间不包含未观测到的环境漂移。

资格检查包含现有语义用例、小对象读写/descriptor/删除/原型/Proxy等专项、C API保存加载及GC，以及17项N=1结果门禁。本次为精确历史源码性能复现，未重跑sanitizer或完整test262。

入口为`python3 -u -B run.py all`。冻结后不修改runner、候选源码、专项用例或旧输入，不覆盖失败token。结果入口为results.md、statistics.csv、per_case_comparisons.csv、aggregate.csv；真实进度以原始记录和audit.json为准。

`python3 -B review.py`仅离线核对归档、调度、五轮中位数和suite权重，不执行JS引擎。

本批在正式采样前停止：两份不同路径的targeted.js使用同一记录名，第二次调用在启动前被防重试断言拦截。构建及三个已执行语义进程退出0；性能0/85，负载正确性0/17。原runner/协议/源码/记录保留，独立修订见attempt06。
