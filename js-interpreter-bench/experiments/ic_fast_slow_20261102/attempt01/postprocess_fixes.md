# 后处理修正，不重跑或改写正式记录

初次独立审计independent_audit.json及jobs/019日志保留。所有计数、计时、hash、顺序、正确性检查通过，但SunSpider的90个QuickJS `3d-raytrace`位置被误报diagnostic flags：v1用了`'trace' in x`扫描command的**所有元素**，把JS文件名raytrace当成trace选项。真实command只有qjs和脚本路径，flags=[]；V8另有三个明确固定选项，均无trace。

修正仅对以`-`开头的命令行选项检查trace/log-ic/log_ic，同时保留原有完整命令长度、固定参数、脚本hash等严格核对。没有放宽任何VM参数或correctness门禁。v2写入新independent_audit_v2.json，不覆盖v1失败；报告与制品复核改读v2，旧失败020/021日志保留。此次只重跑raw-only后处理和最终身份检查，正式raw一条未改，也未补性能进程。
