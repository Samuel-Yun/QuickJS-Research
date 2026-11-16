# 两个新控制：同一方法体、循环与调用形式

```javascript
function step(x) {
    return x + 1;
}

function methodLoop(obj) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.step(i);
    }
    return sum;
}

var sharedProto = { step: step };
var microObject;
if (CASE_KIND === "own") {
    microObject = { step: step };
} else {
    microObject = Object.create(sharedProto);
}

function microRun() {
    return methodLoop(microObject);
}

function microValidate(result) {
    if (result !== 8390656) throw Error("expected 8390656");
}

```

脚本在此共同源之前设置CASE_KIND为own或inherited，adapter在前、driver在后。对象/prototype/step均在timer_start前建立；共享函数、调用参数i、receiver表达式obj、4096循环、累加和结果规则相同。own对象含step自身数据属性；继承对象由Object.create(sharedProto)建立、自己无step，holder为一层sharedProto。对象layout、prototype/feedback随之改变，不叫“只改变纯lookup成本”。

独立预期：sum(i+1), i=0..4095，即4096×4097/2=8390656。x和结果均小整数，目标sum不溢出32位；外层checksum可转为double但小于2^53，四边相同。N1/N2及选定N均核对last和N倍checksum；正式区间不打印，最后校验在外。没有额外workload预热，第一次调用包含在N内。

## 实际诊断

- 两案例×四条件的layout检查：own descriptor.value===step；继承receiver无自身step、直接prototype===sharedProto且其descriptor.value===step。
- 另建明确标注的receiver诊断副本，只有step内部加入this===microObject断言，四边全部通过。该副本会改变字节码，未用于正式计时/原始dump，不能冒充原函数字节码。
- A/M N1/N2窄计数：每Run方法读实际4096；own A每次1次普通find，M仅首个普通find，后续命中。继承A/M每次各2次普通find；M还先做1次cache shape比较，理由计数每次inherited、无slot插入。完整计数micro_path_counts.csv、micro_reason_counts.csv。
- 调用4096次是源码控制流推导，并有真实call_method/CallProperty1；没有声称测得4096次native dispatch或函数入口计数。普通查找计数是force_inline函数体逻辑进入，不是CPU call数或周期。
- 同一引擎内caller和callee的opcode/规范化操作数相同；QJS以atom字符串替代进程局部atom号，保留PC/宽度/非atom原字节；M保留实际site index。V8比较完整instruction/bytes，忽略绝对地址。见micro_diagnostic_gate.json和bytecode_notes.md。
- V8两个微基准目标PC13/FBV0各有ON 0→1，分别关联同进程receiver map。own有map-details；继承receiver详情缺失，保留null，但map-create与运行后Brief相符，holder map-details有step。具体handler及逐次命中率UNKNOWN。

新step只做x+1，和旧call_path_followup/read_ic_mic中x+this.bias不是同一计算体。历史B/C/D、P、R的定义没有改变；正式条件只含冻结A、原M、V8 ON/OFF。
