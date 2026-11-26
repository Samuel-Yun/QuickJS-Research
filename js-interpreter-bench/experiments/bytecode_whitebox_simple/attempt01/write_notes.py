"""Assemble full existing source/dumps with separately authored explanations."""
from pathlib import Path
import csv
import json
from run import HERE, config, read, save

EXPLANATIONS = {
"arithmetic": """
输入为 Number 整数 a=7,b=3,c=4。独立参考：x=19,y=4，x>y，返回15；另一辅助输入(7,-3,4)返回5，验证另一分支，不进入正式计时。

- 输入读取/计算：QJS `get_arg0/get_arg1/get_arg2/mul/add`；V8 `Ldar a2/Mul a1/Add a0`。前者栈 `[]→[7,3,4]→[7,12]→[19]`；后者 A=4→12→19。
- 保存：QJS put_loc0 把顶部移入 x；V8 Star0 保存 A 到虚拟 r0。y 的减法同理；`Sub a0` 是 a0 减 A，不是相反。
- 比较/跳转：QJS get_loc0/get_loc1/gt/if_false8；V8 Ldar r1/TestGreaterThan r0/JumpIfFalse。条件真时分别返回 x-y，假时返回 x+y。
- 本例研究参数运算和比较，局部槽搬运、分支与 return 也是支撑成本。静态计数包含未走的另一条 return 路径；没有给此例正式时间。
""",
"numeric_loop": """
输入 n=4096，i∈[0,4095]，所有中间 sum≤8386560。独立参考 n(n-1)/2；目标函数没有整数溢出、字符串、动态编译。

- 初始化：两边均先置 sum=0,i=0。QJS push_0/put_loc0、push_0/put_loc1；V8 LdaZero/Star0、LdaZero/Star1。
- 比较：QJS 偏移4开始 get_loc1/get_arg0/lt/if_false8；V8偏移4 Ldar a0/TestLessThan r1/JumpIfFalse。QJS 显式 `[i,n]→[i<n]→[]`，V8 的 A 从 n 变为比较结果。
- 累加：QJS get_loc1/add_loc 0，直接从局部 sum 与栈顶 i 得到新 sum；V8 Ldar r1/Add r0/Mov r0,r2/Star0。Mov 复制旧 sum，该函数没有随后读取 r2；具体生成原因 UNKNOWN。
- 自增/回跳：QJS inc_loc 1/goto8 4；V8 Ldar r1/Inc/Star1/JumpLoop。最终 QJS get_loc0/return；V8 Ldar r0/Return。
- 例如 i=2、sum=1：QJS get_loc1 令栈[2]，add_loc 后栈[]且sum=3；V8 A=2，Add后A=3，Mov仍复制旧sum=1，Star0才令r0=3。
- 研究对象是局部循环整体，不是 add 的 self-time；比较、回跳、interrupt 检查、调用和 driver 不能忽略。深入实现见下文。
""",
"branches": """
固定序列[-3,4,-1,8]。独立参考为3+8+1+16=28，正/负条件各两次。额外独立进程实际检查每个单元素结果3、8、1、16（raw/diagnostics/*semantics_attempt02.json）。两次覆盖次数按给定输入和控制流推导，不冒充 opcode coverage counter。

- QJS get_arg0/get_length 配合 i 检查边界；V8 GetNamedProperty length/TestLessThan。数组索引读取是本例不可避免的支撑，不扩展为数组 benchmark。
- QJS get_arg0/get_loc1/get_array_el/set_loc2，V8 Ldar r1/GetKeyedProperty/Star2，得到 x。QJS set_loc 保留栈顶用于下一个比较。
- `x>=0`：QJS push_0/gte/if_false8；V8 LdaZero/TestGreaterThanOrEqual r2/JumpIfFalse。x=-3时 QJS `[x,0]→[false]`，跳到减法；x=4时为true，乘2再加。
- then：QJS get_loc0/get_loc2/push_2/mul/add/put_loc0；V8 Ldar r2/MulSmi [2]/Add r0/Mov/Star0。else 为 sub/Sub 的对应组合。
- 两臂汇合后自增回跳；最后返回sum。重点是分支及汇合，length/索引/乘法/搬运也有成本；本轮没有正式计时。
""",
"direct_call": """
输入 n=4096；小函数 f(i)=2i+1，最大8191；总和独立公式 n²=16777216，仍在有符号 int32 内。这里的调用是直接写 wbSmallFunction(i)，但名称是全局绑定；不能把全局读取成本假装不存在。

- 循环支撑与前例相同。QJS get_var wbSmallFunction/get_loc1/call1；V8 LdaGlobal/Star3/CallUndefinedReceiver1。
- QJS 调用前为 `[oldSum,fn,i]`，返回后 `[oldSum,2i+1]`；V8把 fn 存r3，以r1为参数，结果在A。
- QJS callee get_arg0/push_2/mul/push_1/add/return；V8 Ldar a0/MulSmi [2]/AddSmi [1]/Return。立即数算术融合是实际 dump 可见的编码差异，不等于其运行时间更低。
- 返回值参与 Add/保存sum，再进行下一轮；本例研究普通调用的组织，仍包含名称解析、循环与运算支撑，没有正式计时。
""",
"own_property": """
计时前建立普通对象 {value:3}；循环只读取自己的普通数据字段，n=4096，独立参考3n=12288。没有 getter、Proxy、对象形状修改或 mixed input。

- 边界检查沿用循环。QJS get_loc0/get_arg0/get_field value/add/put_loc0；V8 GetNamedProperty a0,value/Add r0/Mov r0,r2/Star0。
- 以oldSum=6为例：QJS `[6,obj]→[6,3]→[9]→[]`；V8 GetNamedProperty令A=3，Add得9，写回r0。
- get_field会消耗作为栈值持有的 receiver，并用字段值替代；与后面原型案例保留 receiver 的 get_field2 不同。
- 独立诊断实测4096次get_field、4096次own_hit、0次fallback和0次通用helper进入。helper=0不是lookup=0：inline代码已经进行了查找与引用管理。
- 两边主函数静态指令同为17；V8/QJS median=0.886，不能用“指令数相同”推断耗时相同。总时间仍含累加/循环/driver，不是 value load 的 self-time。
""",
"prototype_method": """
计时前创建两个共享同一prototype.step的 receiver；被测对象 own bias=3、没有 own step。n=4096，i∈[0,4095]；callee结果≤4098，总和 n(n-1)/2+3n=8398848。另一个receiver bias=5只在独立正确性探针调用，证明 this 绑定并不是全局固定3。

- 两边都直接在循环内读取方法并调用。QJS get_field2 step保留receiver，再call_method 1；V8 GetNamedProperty/Star3/CallProperty1 r3,a0,r1。
- QJS调用前 `[sum,obj,fn,i]`；调用后 `[sum,i+3]`。V8 fn在r3、receiver在a0、参数在r1，A保存返回值。不是 `.call`，也不是手工缓存方法。
- QJS callee先push_this/put_loc0，再get_arg0/get_loc0/get_field bias/add/return；V8 GetNamedProperty <this>,bias/Add a0/Return。前者显式建立this局部槽，后者直接使用参数区中的receiver操作数。
- QJS独立诊断实测step一层原型命中4096次，get_field2=4096；进入wbStep=4096；bias自身命中4096次；没有通用fallback。调用、属性读取和原型遍历是可区分的步骤，不把这些次数换算成时间占比。
- caller两边均19条；callee为7/3条。V8/QJS median=0.567，但无法断言“这4条指令就是差值原因”。该案例的lookup、call、this管理、整数运算/循环及feedback状态共同参与。
"""
}

DEEP = """
## 三个深入案例的具体实现

### 证据分类与版本

**实际观测**：两边最终 dump；冻结 d8 的 native handler 反汇编；独立 QJS 插桩进程的属性/调用次数；180个 release 新进程内部计时。

**源码解释**：下列 QJS 文件均来自04be246001599f5995fa2f2d8c91a0f198d3f34c，仓库源码与冻结 build source hash相同。行号指 upstream，不是加补丁后的诊断文件。受控的诊断改动在 source_evidence/reused_quickjs.patch 与 probes/ml_counters.h；它不改变字节码编译规则，不用于正式时间。

**待验证假设**：V8哪条IC/native分支被命中、QJS与V8引用/调用步骤各占多少周期、数值融合操作对总时间差的因果贡献。这些没有本轮动态采样证据。

### 数值循环

quickjs.c:18589–18604 的短get_loc/get_arg从局部/参数缓冲复制到操作数栈；put_loc将栈值转交给局部槽。数字不走对象引用计数分支。quickjs.c:19743 的 add_loc直接取var_buf[idx]及sp[-1]；若都是整数，使用int64相加并检查int32溢出，更新局部并弹栈。非整数进入float、string或js_add_slow路径。本例数学范围与源码支持整数路径解释，但没有单独测量它的命中次数。inc_loc在20047检查整数及INT32_MAX边界；比较宏20230进行tag检查；if_false8与goto8（18833/18901）还会poll interrupts，不能只把循环解释为加法。

JS_CallInternal:17746的DIRECT_DISPATCH分支在每次BREAK执行opcode-indexed间接跳转；同hash release的已有二进制证据在 ../../three_engine_baseline/probes/tier/summary.json。它不说明dispatch是瓶颈。

实际 d8 native LdarHandler 0x1d5c040从bytecode读有符号虚拟槽索引，0x1d5c049从帧内存读取到CPU rax，末尾经table跳转；MovHandler 0x1d5ca00在两个帧槽间复制。这是实际机器码证据，虚拟寄存器不等于物理寄存器。AddHandler 0x1d64da7/0x1d64db3有tag检查，0x1d64dbb相加、0x1d64dbe溢出跳转；0x1d64dc0–0x1d64dec读取并条件写回bytecode操作数位置。结合dump的EmbeddedFeedback位置，可以解释为该反馈相关分支，但是否本次更新、次数多少尚未测量。不要把其静态分支全部当实际执行。

### own 字段

quickjs.c:19107的GET_FIELD_INLINE读取atom和receiver；object tag成立时用6135的find_own_property。它用atom & prop_hash_mask定位shape hash槽，沿hash_next比较atom，命中后确定对象property槽。普通data property用JS_DupValue取值；accessor、exotic或非object等条件可进入JS_GetPropertyInternal。keep=0时释放原receiver栈引用并替换为结果；数字字段无需对象refcount，但receiver仍有引用维护。独立计数明确本次诊断4096次自身data hit，无fallback；不是仅仅根据源码存在快路径就声称命中。

实际 d8 GetNamedPropertyHandler 0x1d63143–0x1d63149解码并取receiver；0x1d63172读取FBV操作数，后面有比较/选择/读取分支，也存在通向Builtins_LoadIC_NoFeedback及调用getter类builtin的路径。精确源码与相关内部常量语义 UNKNOWN；code creation只证明这些机器码存在，不是own case的逐分支执行记录。不能宣称IC命中率100%，或因为对象稳定就把所有成本归结为某个固定内存load。

### 原型读取、方法准备与调用

GET_FIELD_INLINE也处理get_field2：在receiver shape找不到step后沿shape->proto，找到函数后JS_DupValue；keep=1保留receiver并追加fn。独立计数确认深度1的4096次命中。quickjs.c:18220的call_method取argc、fn、this；进入JS_CallInternal:17746，检查对象/函数class、stack空间，设置arg_buf/var_buf、frame与pc。返回后释放receiver/fn/参数占有的栈引用，压回结果；callee自己的this局部与取字段也涉及复制/释放。quickjs.h:687/707只对带引用计数tag的值执行计数增减；不能把普通数字和object/function混为一谈，也没有测出这些增减的独立成本。

V8目标dump明确把lookup、fn临时槽、receiver及参数分开。实际CallProperty1Handler含反馈相关检查，0x1d6f0cc跳向Builtins_Call_ReceiverIsNotNullOrUndefined；另有RecordWriteIgnoreFP路径。仅有分支代码不等于每次进入该write barrier，也不能从一次诊断code-event推断正式进程的IC状态或GC成本。本轮没有精确V8源码，不用相近版本冒充；官方15.6.21 tag源码获取超时记录在raw/diagnostics/v8_source_fetch.json，原先tag→commit参考也不是artifact source attestation。

### 长度、逻辑访问与native dispatch分开

bytecode/static_counts.csv按opcode宽度/编码字节解码，**不是dump文本行数**。QJS短跳转目标PC逐一交叉检查，V8字节总和与Bytecode length相等；指令字节不包括常量池、debug表、feedback vector、native handler代码。

derived_counts.csv按可见控制流推导，不是实测opcode profiler。数值循环QJS主函数8n+10，V8为11n+9；own分别11n+10与11n+9；原型caller分别13n+10与13n+9，另加callee分别7n与3n。这些是逻辑bytecode visits，不是CPU instructions、间接分发次数或cost。当前d8 AddHandler尾部0x1d653df–0x1d6541d检查后继short Star，并有直接存帧槽、跳过单独Star分发的代码；不能把每个打印opcode都算成一次独立native dispatch。这里没有采集该路径的动态命中次数。

## 与 Richards 的有限联系

只形成待核对问题：benchmarks/octane/upstream/richards.js:188的Scheduler.prototype.schedule在循环内调用currentTcb.run()；324/337的TaskControlBlock.prototype.run继续this.task.run(packet)。本例的prototype读取/receiver传递与这些源码语义相关，但Richards receiver种类、链深、对象更新与调用频率不同。应在原程序不改写算法的前提下核对这些位置的实际bytecode、频率与路径；本轮不解释Richards总体差距，不引用暂停的手工方法缓存A/B作为瓶颈证据。
"""


def main():
    cfg=config()
    counts=list(csv.DictReader((HERE/"bytecode/static_counts.csv").open()))
    pieces=["# 六类程序：完整源码、最终字节码与注释\n\n所有源码、输入和标准driver相同；adapter与对象建立在timer外。两边正式样本均包含第一次调用，无warmup。本文解释与raw dump分开，原始命令/hash/stdout/stderr见raw/dump/*.json。\n\nQuickJS的DUMP_BYTECODE & 1在最终JSFunctionBytecode建立后打印（quickjs.c:36265；打印器以pass=3读取b->byte_code_buf），不是中间IR。它来自独立诊断构建；同revision、编译规则与release表示一致性证据见source_evidence。V8由正式同hash d8在--no-lazy下的编译输出导出，用实际支持的print-bytecode-filter按函数过滤；WB_RESULT是计时后的诊断结果行，不是字节码，下文去掉该行。\n\n"]
    pieces.append("| Case/function | QJS instructions / bytes | V8 instructions / bytes |\n|---|---:|---:|\n")
    for case,c in cfg.items():
        for name in c['functions']:
            q=next(x for x in counts if x['engine']=='quickjs' and x['function']==name)
            v=next(x for x in counts if x['engine']=='v8' and x['function']==name)
            pieces.append(f"| {case}/{name} | {q['instructions']} / {q['bytes']} | {v['instructions']} / {v['bytes']} |\n")
    for number,(case,c) in enumerate(cfg.items(),1):
        pieces.append(f"\n## {number}. {case}\n\n### 完整源码与输入\n\n```javascript\n"+(HERE/'cases'/(case+'.js')).read_text()+"```\n\n### 分组解释\n"+EXPLANATIONS[case]+"\n")
        for name in c['functions']:
            for engine in ('quickjs','v8'):
                text=(HERE/'bytecode'/engine/(name+'.txt')).read_text()
                text='\n'.join(line for line in text.splitlines() if not line.startswith('WB_RESULT '))
                pieces.append(f"\n### {engine}: {name} 完整最终 dump\n\n```text\n{text.rstrip()}\n```\n")
    pieces.append(DEEP)
    save(HERE/'case_notes.md',''.join(pieces))
    derived=[]
    for case,qcoeff,qconst,vcoeff,vconst,qcallee,vcallee in (
        ('numeric_loop',8,10,11,9,0,0),('own_property',11,10,11,9,0,0),('prototype_method',13,10,13,9,7,3)):
        for e,coeff,const,callee in (('quickjs',qcoeff,qconst,qcallee),('v8',vcoeff,vconst,vcallee)):
            derived.append(dict(case=case,engine=e,inner_n=4096,caller_visits=coeff*4096+const,callee_visits=callee*4096,
                 total_logical_visits=(coeff+callee)*4096+const,kind='DERIVED_NOT_MEASURED',
                 unit='logical bytecode visits per target call, excluding harness and native/runtime work'))
    from run import export
    export(HERE/'derived_counts.csv',derived)
    save(HERE/'source_evidence/reference_values.json',dict(arithmetic='(7+3*4)-(7-3)=15',
         numeric_loop='sum(range(4096))=8386560',branches='abs(-3)+2*4+abs(-1)+2*8=28; both arms twice',
         direct_call='sum(2*i+1 for i in range(4096))=4096**2=16777216',own_property='3*4096=12288',
         prototype_method='sum(range(4096))+3*4096=8398848'))
    print('NOTES_WRITTEN',flush=True)


if __name__=='__main__': main()
