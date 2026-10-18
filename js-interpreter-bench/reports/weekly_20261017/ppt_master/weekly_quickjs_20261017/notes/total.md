# 01_loop

本周先用同一小程序对照字节码，再分析未修改的Richards；这里是零到4095的求和，返回8386560，整数未溢出。QuickJS的add_loc直接更新局部sum并弹栈，inc_loc更新i；Ignition通过累加器运算和虚拟槽写回，Mov复制旧sum，Star0才写新sum，虚拟槽不是CPU寄存器。每完整调用的中位时间是43.782和54.839微秒，比值1.253，每次含4096轮，每引擎30个新进程，首次调用计入且没有计时前workload预跑。证据来自S1的源码、实际dump和正式样本；本例QuickJS更快，但条数、字节数或栈式组织本身不是已经证明的原因。

---

# 02_calls

这里四组累加i加3，返回8398848，不是上一页单纯求和；时间单位是每完整目标调用的微秒，含4096轮和摊薄driver，四组共240个正式样本。直接计算、普通调用、own方法、prototype方法的QJS/V8中位时间依次是67.132/60.388、159.969/116.395、217.156/120.905、225.086/125.348，比值依次为0.900、0.728、0.557、0.557。own与prototype共享同一循环和stepMethod，只在计时外改变对象建立方式，方法读取仍在循环内，因此多一层原型不足以解释这组跨引擎差距。普通调用显式传obj和x，方法调用传receiver和x，shape和反馈也可能变化，组间不能相减称为纯调用或纯查找成本；来源是S2原案例与正式记录。

---

# 03_richards

Richards模拟任务调度，Scheduler的currentTcb指向TCB，TCB的task指向具体任务；schedule中this是Scheduler，进入TCB.run后this变成TCB，取得对象、读run和执行run是不同步骤。三次插桩诊断共有5393个内部样本，其中1229个查找区域样本已映射，按属性聚合的currentTcb、state和两处run分别是280、204和79，占这个分母的22.8%、16.6%和6.4%，包含多个读写位置。分母不是全程序耗时，普通状态字段值得继续看，但尚未找到总体瓶颈。189个活跃opcode位置、N1/N2倍增核对、计数与采样分开只是方法说明，另有39次helper探查没有具体site；来源为S3和原始richards.js。

---

# 04_state_bytecode

选定原TaskControlBlock.prototype.isHeldOrSuspended：先读this.state与STATE_HELD按位与并比较，左侧为真就短路，否则再次读取state与STATE_SUSPENDED比较，进入本函数后的this是当前TCB。QuickJS先push_this保存局部this，再get_field；Ignition的GetNamedProperty直接取得值，用Star0保存到虚拟槽，TestEqual加LogicalNot实现不等判断，并用JumpIfTrue短路。这里是非连续的真实指令摘录，QuickJS的push_0、dup和drop等省略了，完整序列在两页附录，不能把正文当作连续可执行序列。r0不是CPU物理寄存器，offset不是native PC，证据来自S3两引擎的最终dump，而不是性能拆分。

---

# 05_observed

QuickJS原程序第一次state读取在offset3，每Run10671次，全为own普通数据属性命中，每次一次自身探查，结果为整数，原型命中与通用fallback均为零；自身命中仍涉及shape/hash、描述符检查、取值和receiver引用处理，整数state本身不做对象引用计数。V8同进程字节码和IC日志将offset0和19分别对到FBV0和4，均观察到状态码0到1以及相同receiver map 0x189b01023ef1。转换日志不是逐次命中记录，IC命中率仍UNKNOWN，机器码有map检查和字段读取路径不证明该site每次都走这条路径，精确源码/构建与制品的对应仍有缺口。QJS重复自身查找、V8可能复用稳定字段反馈是待验证解释，不是已证性能原因，也没有量出各步骤的时间；来源为S3计数、IC记录及实际反汇编。

---

# 06_limits

本周可以说快慢随操作改变，一层原型不足解释方法案例，原程序普通own字段提供了一个更具体的位置，但不能拼一个总体引擎排名。无信号N512小对照里冻结版和诊断开启版中位时间约1718与2223毫秒，相比高约29%，这是不同批次点估计，不是精确插桩成本。两次state读取频率为10671和10115次却只采到85和9个相关查找区域样本，而且请求1毫秒实际约10毫秒，采样相位和插桩会影响分布，不能当精确耗时排名。本周没有VM优化或方法外提A/B；想讨论的是下一步先验证V8该site实际快路径，还是先降低扰动复核分布，来源为S1/S2正式汇总和S3诊断记录。

---

# 07_qjs_full

这是原isHeldOrSuspended的完整QuickJS最终指令，共16条、29字节，局部0是this，栈深为2；省去的是源码注释和debug表，不是执行指令。可以在这里核对正文省略的push_0、dup、drop、第二次比较和return。它来自独立打印诊断构建，不能把这个诊断native代码或耗时当作冻结Release版的性能，静态条数和编码长度也不是执行时间。证据路径相对js-interpreter-bench为experiments/richards_site_attribution/attempt01/bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.txt及decoded.json。

---

# 08_v8_full

这是同一原函数在当前d8的完整Ignition最终指令，共14条、31字节，只有一个虚拟寄存器，frame为8字节；去掉了左侧地址、编码与调试列，指令和操作数保留完整。两个GetNamedProperty使用不同反馈槽，实际跳转地址只与同一进程日志对应，不拿它和另一个进程的ASLR地址比较。QJS16条29字节、V8十四条31字节，条数、长度和native分发次数不是同一指标，更不等于成本。S1是experiments/bytecode_whitebox_simple/attempt01，S2是experiments/call_path_followup/attempt01，S3是experiments/richards_site_attribution/attempt01，完整来源索引还保留在报告根目录notes.md。
