# 外部中断后的记录：不是30轮完成结果

状态：INTERRUPTED_EXTERNAL_BOOT_CHANGED。修复版E已通过全部预定安全门禁、
17项N1/N2正确性和共同N校准，但客户端中断后WSL重启、采集进程消失。
正式只保存169/1530条，169条均通过结果门禁，没有版本独有错误记录；
尚未完成返回记录的started位置不补写，也不跨boot恢复。

`summary/`由公开raw真实重算；`independent_audit.json`确认已保存记录的
身份、脚本、串行次序和中位数重算一致，但状态为PARTIAL_OR_FAILED，
不是PASS_COMPLETE。每组不是30条，六种排列也未采满。

固定全17项共同完整轮次只有rep0、1、2。`summary/aggregate.json`仅给这3轮的
POST_INTERRUPTION_EXPLORATORY_COMMON_ROUNDS估计；3轮样本很少，不能把区间
当作充分证据或宣称完成了完整Octane优化评价。逐项表若用3/4轮，其实际n均保留。
不把不同子集或不完整轮次补齐成一张30轮结果。

E的正确性修复、实际Release/sanitizer回归证据仍在本目录，精确E SHA
3d36ec898484efca3a3a445662d1e9cfec1ec83c1fcce98e8cf8e0c7b908e482。
后续attempt03复用这一精确二进制和已核验门禁，不再改E；重新建立同主机、
同OS/architecture的新cohort，重做工作负载正确性/校准/采样，不混入本批时间。
说明见 `../attempt03/cohort_notes.md`。
