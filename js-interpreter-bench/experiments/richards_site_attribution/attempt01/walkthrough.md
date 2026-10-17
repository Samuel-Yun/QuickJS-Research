# 怎样复述原 Richards 的一次 state 读取

读这两份真实输出：

- [QuickJS最终函数](bytecode/quickjs/TaskControlBlock.prototype.isHeldOrSuspended.txt)
- [Ignition最终函数](bytecode/v8/TaskControlBlock.isHeldOrSuspended.txt)

目标不是调用 run，而是 schedule 每轮先问：当前 TCB 是否被 hold 或 suspended？

```js
this.currentTcb.isHeldOrSuspended()
// callee:
return (this.state & STATE_HELD) != 0 || (this.state == STATE_SUSPENDED);
```

调用者的this是Scheduler，点左侧的currentTcb是receiver；进入callee以后this才是这个TCB。
**取得currentTcb、查找isHeldOrSuspended、调用函数、函数内读取state，是四项不同的工作。**
本页只跟最后一项及它所需的比较，不把前三项的样本或时间混进来。

## 1. QuickJS：值怎样流动

以下用合法状态 `state=3` 演示，不是逐次事件trace。STATE_HELD=4，STATE_SUSPENDED=2。
栈左边为底，this局部槽与操作数栈不同：

|offset/指令组|栈或局部变化|做了什么|
|---|---|---|
|0 push_this / 1 put_loc0|局部0保存TCB，栈空|准备this引用|
|2 get_loc0|[TCB]|取得receiver，不是查找属性|
|3 get_field state|[3]|在TCB自身shape中找state，取得整数，替换并释放栈中的receiver引用|
|8 get_var STATE_HELD|[3,4]|读全局常量绑定|
|11 and|[0]|3 & 4|
|12 push_0 / 13 neq|[false]|0 != 0|
|14 dup / 15 if_true8|[false]|短路条件未满足；测试副本被消费|
|17 drop|[]|丢弃左侧false|
|18 get_loc0 / 19 get_field state|[3]|再读state，另一个真实site|
|24 get_var STATE_SUSPENDED / 27 eq|[false]|3 == 2|
|28 return|返回false|schedule随后允许任务运行|

若state=5，第一次按位与得到4，左侧为true，直接跳到28，第二次state根本不读。
若state=2，左侧false、右侧true，最终返回true。这些是源码语义演示，不是新性能实验。

原程序的独立native计数确认：offset3读取10671次，offset19读取10115次，都是own命中、
一次自身探查、普通整数数据、无fallback。两次相减556是**按控制流推导的短路次数**，
不是另外实测的分支计数。指令偏移均通过最终dump验证，并未使用可能过期的sf->cur_pc。

## 2. “own命中”仍做了什么

own的意思是不用到prototype找，不等于免费。原QuickJS:6135的find_own_property仍要取shape，
用atom与hash mask算桶，取桶索引、比较atom，必要时沿hash_next。找到后还要检查descriptor、
复制结果并处理栈receiver。本例整数结果没有对象refcount；receiver是对象，引用维护仍有。

本轮记录的一次 probe 是一次find_own_property调用，不保证只比较了一个atom。
内部hash链比较次数没有测，不能把它补成1。没有对这些步骤逐项计时。

## 3. Ignition：相同语义，不同值流

offset0的 `GetNamedProperty <this>, state, FBV[0]` 把值放累加器A；
Star0暂存到虚拟r0，LdaGlobal把4放A，BitwiseAnd r0得到0。之后比较、LogicalNot、
JumpIfTrue实现相同短路。没有跳出时，offset19用另一个反馈槽FBV[4]再读state。
这些虚拟槽位于frame，**不是CPU物理寄存器**。

V8实际dump与同进程IC日志中，offset0/19分别落在地址`...1650`/`...1663`，都出现
`LoadIC`状态码0→1、同一个receiver map；这证明我们已关联到这个site的真实反馈活动。
同hash的GetNamedProperty机器码确实有map/反馈检查及字段读取路径。

但是：状态转换日志不是每次属性读取的记录；没有后续转换也不等于100%命中。
没有该site的分支次数，就不能说它每次都绕过通用查找，也不能将整个V8 handler的机器码
存在性当成该site执行路径证据。精确制品源码映射仍UNKNOWN。

## 4. 为什么选它，不说它解释了所有差距

三次查找区域样本在offset3分别27/25/33，均靠前，且它短小、对象来源清楚。
但合计85只占全部内部5393个样本的1.58%，不是Richards有1.58%的精确state self-time。
更不能把85个样本乘一个常数换算时间。另一次20ms诊断仍见它，不能消除周期性混叠。

特别注意：第二次state读取频率接近，合计相关样本却只有9个。真实微观成本、采样相位、
诊断布局等还没分开；不应宣称首次读取“贵9倍”。插桩版也比冻结版慢，分布有扰动。

可以口头讲：“这次能把查找区域样本对到原程序的函数、字节码offset和属性。
多数相关样本不是两级run方法读取；普通currentTcb/state也很重要。选出来的state位置，
QuickJS实测每次做own shape查找，V8看到反馈槽及真实IC状态转换；但具体快分支命中率和
两者的成本差还没量出来，所以这是一处有依据的后续问题，不是总体性能原因已经确定。”
