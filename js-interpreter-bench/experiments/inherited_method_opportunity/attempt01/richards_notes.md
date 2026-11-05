# 原始 Richards：三个实际位置

|源码位置|QJS真实PC|V8真实PC|M每Run读取/命中/回退|V8 N1/N2直接观测|
|---|---:|---:|---|---|
|schedule → currentTcb.isHeldOrSuspended|30|20|10671 / 0 / 10671|0→1，1个TCB map|
|schedule → currentTcb.run|83|64|6573 / 0 / 6573|0→1，同一类TCB map|
|TCB.run → this.task.run|73|58|6573 / 0 / 6573|0→1→P，后续P→P；4个task map|

QJS计数复用上轮N1/N2原始压缩报告，核对源码SHA、opcode起点、compiled instance和理由计数；未重跑Richards正式时间。V8是本轮同一冻结d8的独立N1/N2，按**函数+实际字节码地址**匹配LoadIC PC，而非按属性run合并。完整散列和数据见richards_sites.csv、richards_v8_evidence.json。

## receiver不是调用者的this

`Scheduler.schedule`自己的this是Scheduler；取出currentTcb后，前两处属性读取的receiver是TCB。方法属于TaskControlBlock.prototype，调用isHeldOrSuspended/run时this为当前TCB，不是Scheduler或prototype。TCB.run的this.task再得到四种task对象之一，run方法属于该task的prototype，调用this为该task；QJS此处是tail_call_method，不等同于微基准调用后继续累加。

## map与holder的实际关联

richards_map_holder_matching.json将各receiver map详情中的prototype对象地址，与同进程、workload结束后DebugPrint的prototype对象地址逐一对应，并检查其own descriptor为函数值。未给原函数加wrapper，未保存临时scheduler局部变量，也未用新建对象冒充运行时receiver。此处证明对象关系/反馈状态，不证明每次命中某个handler。

N1/N2分别对应6条receiver/holder关系（两个TCB site加四个task map）；跨进程不比较裸指针。安装handler、每site命中率、时间贡献仍UNKNOWN；转换事件数不能当调用次数。
