# 采样未执行

只做一次已有perf可用性检查：`command -v perf; perf stat -e cycles -- true`。

```text
sh: 1: perf: not found

```

原始命令/返回码见raw/commands/perf_availability.json。没有sudo、修改权限、安装/编译内核工具，也未改用有扰动的SIGPROF或每字段时钟。Richards三处的耗时贡献UNKNOWN；现有位置计数是频率，不是耗时排名。正式240条不含采样。
