# 怎样讲清“相同的方法调用字节码，却不一定是原型层数造成差距”

先看cases/own_method.js与prototype_method.js。共同部分没有任何改写：

```js
function stepMethod(x) { return x + this.bias; }
function cfMethodLoop(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) sum += obj.step(i);
    return sum;
}
```

own组的对象是`{bias:3,step:stepMethod}`。prototype组的对象自己只有bias，
`Object.getPrototypeOf(obj)`指向有step的对象。两边i范围0..4095，结果8398848。
建立对象在timer前；`obj.step`仍在循环中查找，没有缓存方法。

## 先跟一轮QuickJS

假设i=2，前两轮结果3和4，因此旧sum=7。操作数栈左为底；局部变量槽与栈分开。

|执行位置|栈/局部发生什么|属于哪项工作|
|---|---|---|
|比较与if_false8|判断2<4096，继续循环|支撑|
|get_loc0|压入旧sum，栈[7]|搬运|
|get_arg0|栈[7,obj]|取得receiver|
|get_field2 step|栈[7,obj,stepMethod]|属性查找，保留receiver|
|get_loc1|栈[7,obj,stepMethod,2]|取得参数|
|call_method 1|用this=obj、参数2执行callee|调用准备/进入|
|callee返回后|栈[7,5]|接收结果|
|add/put_loc0|sum=12，栈空|累加/保存|
|inc_loc/goto8|i=3，回到比较|支撑|

“找到stepMethod”和“执行它”是两步。own组的查找在obj结束；prototype组在obj找不到，
再到一层原型结束。独立native诊断确实分别记录4096次深度0/1命中，不是凭对象稳定猜测。
但原生helper=0不表示没有查找：GET_FIELD_INLINE内部已经做了shape hash查找和检查。

## 进入callee后this是什么

stepMethod的this就是刚才保存的obj，不是prototype，也不是stepMethod函数本身。
QJS实际7条指令：

```text
push_this
put_loc0             // 保存this到局部槽
get_arg0             // x=2
get_loc0             // obj
get_field bias       // 3
add                  // 5
return
```

源码quickjs.c:17933说明push_this检查非strict的this；本例是object，不需把数字包装成对象。
JSValue的复制不是把整个obj再复制一份；涉及带引用计数tag的对象/函数时维护引用。
callee返回与caller消费旧fn/receiver/参数时也有清理。源码出处在source_evidence/qjs_*.txt。
我们知道相关代码和路径存在，没有分别量出refcount、frame、查找各花多少时间。

普通调用stepPlain(obj,x)的callee只有5条：get_arg1/get_arg0/get_field/add/return。
它免去显式this局部，但caller必须显式传两个参数，而且函数从全局绑定取得。
因此own_method-direct_call不能直接叫“this成本”。

## 同一轮Ignition

看bytecode/own_method/v8/cfMethodLoop.txt与stepMethod.txt：

1. GetNamedProperty取得obj.step，Star3放入虚拟r3。
2. CallProperty1 r3,a0,r1表示函数r3、receiver=obj、参数i。
3. callee GetNamedProperty <this>,bias / Add a0 / Return得到5。
4. caller Add r0得到12，Mov/Star0写回sum，再自增回跳。

虚拟寄存器不是CPU物理寄存器；实际d8 Ldar/Mov等handler通过frame内存槽访问。
GetNamedProperty和CallProperty1的实际机器码在bytecode/v8_native/；可以看到检查与builtin入口，
但没有证据说每次命中哪个IC分支，更没有IC100%的结论。callee三条不等于总成本只剩三项。

## 最后再看时间，而不是用指令条数猜时间

own组median为QJS217.156µs、V8120.905µs，ratio0.55677；prototype组225.086/125.348µs，
ratio0.55689。两组caller/callee的opcode序列都相同。把方法变成own后跨引擎差距依然存在，
所以“多走一层原型就是这组差距的原因”不成立为充分解释。

这不证明原型查找免费；两边prototype/own都约1.037，shape/布局/反馈也同时改变。
它只帮助缩小候选范围：还要看方法获取、receiver/参数组织、callee this处理、调用帧和引用管理。
实际PC采样确实见到相关区域，但采样分辨率/归属有限，不能把组间差值当某一步self-time。
原始240个正式样本无profiler、无插桩、无预跑，所有诊断时间排除在外。

## 为什么不能直接换成“解释了Richards”

原程序的对象关系可以这样读：

```text
scheduler
  └─ currentTcb（TaskControlBlock对象）
       └─ task（Idle / Worker / Handler / Device对象）
```

在schedule中this是scheduler；执行currentTcb.run时this变为TCB；
执行this.task.run(packet)时this又变为具体task。每次调用按点左侧的对象传receiver。

原JS没有改变：native诊断记录每Run两级run读取各6573次，均沿一层prototype。
任务四种receiver分别1000/468/2328/2777次；这些是调用频率，不是耗时比例。

更关键的是，TCB末尾实际QuickJS字节码是：

```text
get_loc1              // this=TCB
get_field task        // task对象
get_field2 run        // 保留task receiver，取得task.run
get_loc0              // packet
tail_call_method 1
```

它没有小程序的“返回整数后继续add”；tail_call_method源码仍进入JS_CallInternal，
返回后直接走done清理，不应凭名称说它完全不建frame。V8对应CallProperty1/Return。
原程序还有对象/null参数、状态变化与四个task方法，不能照搬单一稳定receiver的数值结果。

能口头讲的结论是：“差距在own方法调用里已经出现，不能只怪原型链。
Richards确实频繁执行相关的查找和调用，而且采样也看到了这些执行区域；但当前尚不能
把样本分到具体JS位置，原调用还存在tail opcode等区别，所以只能确认值得继续研究，
不能说已经找到了主要原因。”
