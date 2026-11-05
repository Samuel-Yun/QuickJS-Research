# 未修改 Richards：选择依据、真实字节码和可用范围

## 原程序身份与计时

官方冻结 Octane commit 570ad1ccfe86e3eecba0636c8f932ac08edec517。
source_evidence/richards_identity.json 固定 base.js/richards.js/generated hashes；原字节只拼接一次。
original.N1.js / original.N2048.js 不替换方法，不定义 method.call，不用暂停的 A/B。
ResetRNG/必需Setup在外，首次Run计入，保留runRichards每次原断言2322/928。
三个独立N2048采样进程/引擎；它们只是诊断，不是补采正式性能结果。

## 先看实际采样区域，再选位置

perf 命令不存在；没有因此重建庞大工具链。V8复用实际--prof；QuickJS对冻结Release
qjs使用小型SIGPROF/ITIMER_PROF采样库，实际/proc/self/maps+ELF PT_LOAD+addr2line定位PC。
QJS按同一CLOCK_MONOTONIC截取JS内部区间；请求1ms不等于实际1ms，观察到的间距见表。
采样有信号扰动、定时混叠、优化代码行号/内联归因和样本分辨率限制。

|engine/rep|范围|样本数|查找/属性读取区域|调用入口区域|
|---|---|---:|---:|---:|
|quickjs/1|internal region signal top PC|688|201 (29.2%)|不单列：JS_CallInternal同时包含多种handler|
|v8/1|whole process top PC|4022|1420 (35.3%)|775 (19.3%)|
|quickjs/2|internal region signal top PC|684|188 (27.5%)|不单列：JS_CallInternal同时包含多种handler|
|v8/2|whole process top PC|3991|1403 (35.2%)|731 (18.3%)|
|quickjs/3|internal region signal top PC|649|161 (24.8%)|不单列：JS_CallInternal同时包含多种handler|
|v8/3|whole process top PC|3988|1392 (34.9%)|797 (20.0%)|

QJS“查找区域”是实际PC解析到find_own_property，可能是内联代码；V8是GetNamedProperty
handler，两者不是相同分母或相同成本类别，不能横向相减或解释引擎绝对差值。
这些是实际耗时执行区域证据；不是某个JS函数、某个atom或单个调用点的self-time。
据此选择下面两个频繁使用属性读取/解释调用的原位置深入，而不是宣布它们已被定位为
整个程序最耗时的两个函数。自己的state/currentTcb字段访问也可能贡献很多查找样本。

## 位置一：Scheduler.schedule，原richards.js:188–202

核心为this.currentTcb=this.currentTcb.run()。QJS在读取own currentTcb后，
get_field2 run保留TCB receiver，再call_method 0，结果写回currentTcb；
V8对应GetNamedProperty/CallProperty0/SetNamedProperty，不是小程序的CallProperty1。
这里返回的是TCB/null，不是整数累加。完整两边dump在richards/bytecode/Scheduler.schedule.*.txt。

## 位置二：TaskControlBlock.run，原richards.js:324–338

核心为return this.task.run(packet)。QJS get_field task得到own task，get_field2 run
取得继承方法并保留task，get_loc packet后实际使用tail_call_method 1；V8为
GetNamedProperty/CallProperty1/Return。QJS该opcode实现仍调用JS_CallInternal，随后
直接走done清理返回；不能按名称声称没有新callee frame、实现了无成本调用或复用整个frame。
它与小程序的call_method/add/put_loc0不同，不能直接套用小程序总时间差。

## 实际频率和对象关系

native hooks在原JS上测到：TCB.run读取6573、task.run读取6573，两者均深度1、
get_field2=6573、fallback/helper=0；选定TCB.run函数进入6573。数值来自独立诊断binary，
不当作正式Release硬件计数或时间。JS诊断副本（两个引擎相同结果）还给出：
schedule进入1次，isHeldOrSuspended进入10671次；task receiver分别Handler2328、
Device2777、Idle1000、Worker468，合计6573；全部TCB的run不是own且其原型为TCB.prototype，
task为TCB own属性、task.run不是own。诊断新增代码可能改变字节码，patch已保存，
它不替代原程序dump。四个task.prototype.run的函数身份不同，但未测V8 IC命中率。

## 小程序结论是否适用

共同点有运行证据：循环内方法读取、深度1的继承查找、receiver传递、进入JS函数。
因此这些步骤确实值得在原程序继续看，不是人为小程序独有的机制。
差别也明确：原程序的TCB/task状态持续变化、task有四种原型、packet为对象/null，
返回TCB/null且更新调度器，并有上述tail opcode。小程序是稳定单一receiver、整数参数和结果。
没有site-specific self-time，不能把查找样本全分配给run方法，更不能说6573次就是耗时瓶颈。
当前只能说：原程序有显著采样区域与这些机制相关，两个候选位置频繁使用它们；
不能声称已经解释Richards总体差距，或将小程序own/proto差值当它的原型成本占比。
