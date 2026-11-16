# 环境分段记录

initial cohort 完成了独立的 restore_d05_01 全17项/三条件51条记录，
并完成七个新制品的构建与针对性检查。随后 ID_CTRL 内部诊断编译的
UTC 跨度22.021383s、外部单调跨度20.992555235s，相差1.028827765s，
超过沿用的1秒门槛。原过程日志和 STOP.json 保留，原因 UNKNOWN。

不修改门槛、不删除 STOP、不在原 campaign 追加性能样本。
30秒独立时钟检查若通过，另存 environment.recovery01.json，
保存 prior STOP 的 SHA256，并用全新的性能 campaign 名称。
新的进程继续检查 boot、binary/script/input SHA、内外单调包围和
UTC/单调跨度。原51条只作自己的独立初筛，不与恢复后的复测合并。
已有精确源码/制品的语义证据可以明确注明来源后复用，不冒称新采集。

recovery01 空闲30秒检查最大跨度差2.398微秒，9进程预检通过。
其后 ID_READ 诊断编译再次超过1秒门槛，STOP.recovery01.json 保留。
原因仍 UNKNOWN，不把编译时间当候选性能，也不把中断当 VM 崩溃。

性能继续停止。单独 V6_DIAGNOSTIC_ONLY=1 仅允许内部语义、计数、
反汇编及 sanitizer 的白名单阶段，禁止性能采样入口。
在 boot 不变、源码/制品身份和结果正确时，保留其机制证据。
这类进程若有时钟跨度异常，另记 diagnostic_clock_discontinuity，
其时长不能用于性能结论，不放宽任何性能门槛。
