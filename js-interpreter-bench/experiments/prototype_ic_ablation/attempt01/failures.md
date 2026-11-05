# 实际准备失败，未用于性能

1. 最初构建请求审批超时，未执行；一次重试成功。没有用未执行请求计数。
2. `raw/commands/serial_build.json`：新 C 测试直接 include quickjs.c，
   其中禁止直接使用 malloc/free，导致链接 malloc_is_forbidden 失败。
   测试改用现有 js_malloc_rt/js_free_rt，build2 新日志重新构建。
   正式 switch/M/H 源码和二进制没有因此改变，旧失败不覆盖。
3. finish_prepare.py 在热序列化通过后、sanitizer 构建中退出1且无输出。
   后续检查 boot_id 已变化，构建区 quickjs.o 为0字节、无新 qjs，
   未取得编译完成记录。原因 UNKNOWN，不称为 ASan 报错或语义回归，
   也不记为 sanitizer PASS。新 sanitizer 在原任务中为可选短回归；
   保留限制及原H已有安全验证边界，不反复进行大型重编译。
4. 首次只读分析CLI漏import Path，参数解析时NameError，未产生统计
   文件、未运行引擎。补齐import后重算；没有覆盖任何raw。
   随后统计文件已全部写出，但末尾打印又漏import json而退出1。
   补齐后输出到新analysis_final目录；第一份analysis保留并逐字节
   对比，不能把打印失败说成统计通过的独立执行记录。
