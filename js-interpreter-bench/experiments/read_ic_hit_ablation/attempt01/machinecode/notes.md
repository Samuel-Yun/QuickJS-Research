# 正式代码与模式：可确认的边界

同一SW/qjs SHA为53680f048a6f53c1f94cc1dc3c52e1263311fb0a36ea6b93b697547069d65267；两模式同路径、同静态.text，不是两个宏编译版本。
GDB实际在JS_NewContextRaw入口观察rdi_process_mode及rt字段分别为1/1、0/0。runtime mode偏移1440(0x5a0)，sizeof比M多8字节，site仍16字节。
原始nm另显示rdi_mode_once为4字节bss、rdi_process_mode为4字节data；这是一次性全局native状态，不是每site开销。
SW .text762818 bytes，M762514（+304），A760562。其它只读节增量另反映在GNU size text，不混成纯.text。
M和A的.text大小与前轮对应记录相同，不因此声称所有运行时行为或性能必须相同。

在 `ON_read_paths.asm` 两段互不连续的handler片段中：

- 0x29eb5、0x2a05d：形状直接比较；匹配后加载候选offset。
- 0x29ed6、0x2a07e：对rt+0x5a0的模式字节执行cmp；非零跳直接取值，零走正常查找。
- 零分支加载site atom，并设置candidate_valid标志，跳回原find_own_property的hash表/链搜索。
- direct分支保留从当前对象prop[offset]取值、JS_DupValue及原receiver处理。
- 正常查找后是否更新由candidate_valid控制；真正miss仍原M更新，LOOKUP候选命中不再保活/替换shape。

代码片段明确有省略，不按整段连续机器码解读。真实hash工作还由独立诊断核实：稳定目标ON只冷查找一次，LOOKUP每次都实际查找；候选序列与维护一致。
这不能把静态机器码存在说成正式逐次命中记录；正式不带计数。原native mode解析与constructor反汇编在raw/build。
无每次属性读getenv；pthread_once只在创建runtime入口，非法首次值报错，初始化后改变环境不改变新旧runtime的固定mode。

ELF为DYN/PIE，内核ASLR=2，GDB明确不关闭randomization；加载映射/实际地址保留在两份runtime_mode日志。
不同进程绝对基址可以不同，实验控制的是同一ELF的相对布局。没有特权改系统/频率/ASLR。
M/ON桥接仍必要：mode读取/分支、控制流、runtime分配和编译器派生变化共同存在，不能把ON/LOOKUP效果当原M的精确self-time。
