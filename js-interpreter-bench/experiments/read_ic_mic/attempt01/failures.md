# 保留的工具失败与恢复

- 首次 GDB 布局查询用 `offsetof` 表达式，GDB不识别；记录保存在 raw/build/*layout.1.json。改用空结构字段指针表达式后成功，未改引擎。
- 首次独立 M diagnostic 构建使用 malloc，被 QuickJS 防误用宏重定向成 malloc_is_forbidden，链接失败。记录保存在 raw/build/M_diagnostic_build.1.json/log。
  仅诊断记录器改用calloc；原失败目录保留，新建 M_diagnostic2 后构建成功。正式模板、正式binary未更改。
- mechanism.py 首次离线读取使用 name_hex，而实际记录字段叫 function_hex。第一次M1原始记录保留，修正映射字段后复用该原始记录并完成剩余探针。没有重写或反造计数。
- 其它 correctness、pilot、正式、内存的真实成败分别保留在对应阶段raw；这里不替代逐记录审计。
- 初次交付文件检查通过后又新增报告，重跑交付检查时因文件数变化触发append-only保存保护，未覆盖第一次快照。交付工具改为每次新增编号快照，再检查通过；这不是性能/正确性失败。

本文件没有把可恢复工具错误算成正式样本，也不以修工具理由覆盖历史raw。
