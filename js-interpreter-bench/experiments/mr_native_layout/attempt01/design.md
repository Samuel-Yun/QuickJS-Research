# M/R非目标变化：采样前固定方案

起点 myx/e9a71a01722a34bb9e61314965020d56d93141f9，工作区干净；未找到适用AGENTS.md。
2026-10-24，工具/机器码定位有效调查上限4小时，性能采样另计；无新IC策略、阈值或参数搜索。

## 假设与干预

只恢复前轮逐文件相同的M/R；upstream 04be246001599f5995fa2f2d8c91a0f198d3f34c。
M为原16字节单态读缓存，无SW；R固定K32永久退出，24字节site。GCC13.3.0，官方-O2 -g -fwrapv，保留断言，无LTO/PGO。
H1：numeric目标工作量相同，非目标源变化仍可能派生不同native代码；不把streak直接当numeric循环成本。
H2：own_method无退出的变化可能涉及生成代码或布局，不能归因于退出事件。
H3：固定编译对象的链接摆放可能影响时间；即使有影响，也不能单独归给I-cache。

唯一布局方法：在原链接命令的quickjs.o之前插入专用.text padding对象；固定0/16/32/48字节，填0x90，不导出动态符号，不添加入口/构造函数/调用。
原对象不变、不重编译quickjs.c。p000需与原base的.text/入口一致；至少两个实际热入口位置不同才采布局矩阵。
若无效，保留全部请求值并报告PARTIAL_WITH_LAYOUT_LIMITATION，不换方法/参数。

## 固定范围与计时

四项依次M4.numeric_control、M1.own_integer、M3.own_method、Richards.Richards；微测试每Run4096轮。
输入/原断言/adapter/driver与前轮相同，首次Run计时，无计时前workload预跑；Setup/静态编译在外。
内部CLOCK_MONOTONIC绝对ms，父perf_counter_ns绝对ns；GC/helpers/builtin照原Run计入。环境白名单统一，无QJS_READ_IC_MODE/LD_PRELOAD/LD_AUDIT；保留ASLR、同cwd/affinity。
先冻结源码/输入/制品/协议；共同N从前轮开始，各实际条件3独立pilot全部>=1000ms，否则全体翻倍，N上限131072，timeout300秒。
新进程的正式条件目录名均6字符、可执行文件均qjs。诊断与正式分开，性能阶段不并行构建/诊断/硬件采样。

原base前后两段各每项12对；每段MR/RM各6，共192条。seed20261024随机pair及case顺序。
有效布局8条件每项16个完整block：基础[0,1,7,2,6,3,5,4]加k mod8，k0..7，重复2遍；打乱block和case，512条。
每条件每位置2次、每有向相邻条件对2次。两个cohort不混池，base和p000也不合并。正式上限704，无GM、无挑最佳位置。
失败保存且不补跑；时钟异常BLOCKED_TIMER，不修改raw，不按耗时删样本或加轮次。

## 证据与分析

独立M/R诊断四项N1/N2，保存规范最终字节码、atom、逐函数/PC实际computed-goto dispatch及IC生命周期；实际dispatch不等于融合后的逻辑指令或CPU指令。
前三项核对无退出、命中/维护/结果一致；Richards保留恢复普通opcode差别，读数按IC+post统一。工具不足如实UNKNOWN。
完整正式JS_CallInternal、helper ASM与DWARF，原地址/操作数保留，分清候选控制流和实测分派，不用静态条数预测时间。
perf能力只尝试一次，不改权限/内核；不可用保存错误，继续静态/布局。可用才按用户给定24 stat/4 profile上限独立执行。
原base：10000次按前后段分层pair bootstrap；布局：10000完整8条件block bootstrap，共享索引。
报告median/mean/样本sd、Tukey halves Q1/Q3/IQR/min/max，ratio=M/R>1表示R快；同版本p000/pNNN。
交互预定义log(Rp/Mp)-log(R0/M0)，探索性95%区间，无多重校正。
两次全新目录标准库raw重放，rel/abs1e-12，原raw/统计hash不变；源码恢复/重编译重链接/新采集/重放分入口。
