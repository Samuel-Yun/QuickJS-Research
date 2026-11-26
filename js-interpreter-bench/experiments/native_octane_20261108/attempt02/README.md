# 后续三项改动：诊断与资格检查中断记录

本目录保留独立诊断，以及首个资格检查批次的失败。没有正式性能采样。

`diagnose.py`基于冻结PREP2建立两个独立诊断版。COUNTS在原N=1 Run循环外加开始/结束标记，统计加载组合和正常返回后的调用参数数量；Setup和后置验证不计入。PROFILE只在libc增加Callgrind控制入口，VM源码与冻结父版逐字匹配，采集四个case原Run区间的Ir。Callgrind指令数不是原生CPU耗时；JS_CallInternal包含解释器循环，不能把整个函数的计数当成调用入口成本。

诊断结果和原始Callgrind文件见diagnostics/。选择arg1/loc1以及0～2参数清理的依据在selection.json，先于任何新候选性能采样冻结。诊断生成阶段一次注释定位断言失败发生在构建前，原因和修正见diagnostics/setup_failure01.json。

资格检查已构建COALLOC并通过既有JS和C API检查，在新增call_cleanup.c编译时停止：测试误用了双参数JS_NewClassID，而冻结QuickJS接口只有一个参数。是新增测试脚手架错误；修正不涉及引擎源码。未覆盖失败命令、stdout/stderr或冻结协议。详情见qualification_failure.json及raw/。

修正后的独立完整批次见[attempt03](../attempt03/README.md)。本目录不继续采样，也不把这里的过程当作性能收益。
