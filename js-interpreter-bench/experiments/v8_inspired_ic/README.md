# V8关键IC机制迁移实验

- [attempt01](attempt01/results.md)：旧E新增C API回归失败，558条未完成时间保留但不作性能结论。
- [attempt02](attempt02/results.md)：修复E并通过门禁；外部中断/WSL重启，保存169条，3轮共同完整数据单列探索性分析。
- [attempt03](attempt03/results.md)：同一修复版E的新cohort，完整1530条通过；WSL/Windows双端重算和独立审计PASS。
  核心16项E/A=1.0115，约慢1.15%，本实现未取得整体净优化；含zlib扩展另列。

只有实际完成、独立审计通过的批次可称完整30轮。目录存在、脚本可用或进程已启动均不等于完成。
不将旧Windows、M/H或不同E哈希的时间混入本轮。
