# 保留的入口和测试问题

这些记录用于区分工具/测试入口问题、环境问题与VM失败。

1. 首次未提权枚举WSL得到E_ACCESSDENIED。经正常工具权限审批后可访问既有Ubuntu；未改系统权限或TLS。
2. 首次B2的test_builtin.js入口漏传--std，ReferenceError为std未定义。
   `upstream_invocation_control.json`显示A/B2在相同缺参入口均失败，补--std均通过。
   原`safety.B2.json`保留FAIL，新`safety.B2.02.json`为修正入口后的独立检查。
3. 一次WSL转发python -c时引号丢失，Python SyntaxError在执行VM前发生。
   后改为脚本入口，没有将这次失败计为候选崩溃或采样。
4. 计数源码生成的严格锚点检查曾发现js_free(fd)/realm/pc+=5等并非唯一。
   改为带上下文的最终编译位置和宏行匹配。另修正Path导入。
   这些失败未生成性能样本，未用宽松模糊替换强行修改VM源码。
5. 初版L1内部探针要求空pending exception为null，实际原状态为tag4。
   保留`internal_prepare.c`及`internal.L1.recovery01.json`的exit9。
   新`internal_lazy_v2.c`比较原tag，`internal.L1.recovery01.probe02.json`通过。
   正式L1的源码和SHA未改，不能把旧测试前提错误称为VM回归。
6. initial与recovery01在内部探针编译中触发UTC/单调跨度差门槛，
   STOP及编译子进程结果保留。其后语义诊断只允许白名单阶段，时间不用作性能。
7. `clock_check.recovery02.json`在空闲30秒复查也失败，差1.054418655秒。
   `last_timing_try.py`因缺少通过检查的恢复environment被门禁拒绝，
   尚未运行其预检或计划144条短测。未清除STOP，未无限重试。
   此次clock_check当时只打印/保存BLOCKED，后续environment门禁仍拒绝采集；
   当前入口已补为失败返回码2，未重跑或修改原检查记录。

编译和语义诊断中的时钟标记不代表其时间可用，也不自动否定输出正确、同boot、
源码/制品可核查的机制计数。完整进程stdout/stderr、命令和返回码见runs.jsonl.gz。
