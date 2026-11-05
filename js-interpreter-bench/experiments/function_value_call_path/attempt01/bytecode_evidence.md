# 实际最终字节码与本轮操纵检查

原始命令/输出在 raw/commands/dump.V8.*.json；QuickJS原始完整报告在raw/diagnostic/*.json.gz。下列QuickJS是从最终code_before_hex和实际opcode元数据解码，不是手写等价序列；DUMP_BYTECODE=0只提供名称，不打印中间IR。两个独立诊断版不用于正式计时。

每案例完整目标caller、step、microRun分别列出；其它共同函数的完整dump也保存在bytecode/<case>/。QJS按atom字符串作跨进程对应，原atom/site index和rawbytes在JSON；不能用绝对指针跨进程比较。V8仅移除绝对地址，保留真实PC/字节/操作数。静态指令数与编码字节分开，不是动态dispatch或执行成本。

## number_value_read

### A / valueReadLoop: 29条，45B

源码SHA `97c133cc5262373f248662f4a4d1c33df387ae24388c8a2d050dd02a390120e0`；compiled instance 4。
```javascript
function valueReadLoop(obj, expected) {
    var sum = 0, last;
    for (var i = 0; i < 4096; i++) {
        last = obj.slot;
        sum += i + 1;
    }
    if (last !== expected) throw Error("value identity");
    return sum;
}
```
```text
  0 push_0
  1 put_loc0
  2 push_0
  3 put_loc2
  4 get_loc2
  5 push_i16 bytes:0010
  8 lt
  9 if_false8 bytes:12
 11 get_arg0
 12 get_field 632 [slot]
 17 put_loc1
 18 get_loc0
 19 get_loc2
 20 push_1
 21 add
 22 add
 23 put_loc0
 24 inc_loc 2
 26 goto8 bytes:e9
 28 get_loc1
 29 get_arg1
 30 strict_neq
 31 if_false8 bytes:0b
 33 get_var 0
 36 push_atom_value 633 [value identity]
 41 call1
 42 throw
 43 get_loc0
 44 return
```

### A / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### A / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### M / valueReadLoop: 29条，45B

源码SHA `97c133cc5262373f248662f4a4d1c33df387ae24388c8a2d050dd02a390120e0`；compiled instance 4。
```javascript
function valueReadLoop(obj, expected) {
    var sum = 0, last;
    for (var i = 0; i < 4096; i++) {
        last = obj.slot;
        sum += i + 1;
    }
    if (last !== expected) throw Error("value identity");
    return sum;
}
```
```text
  0 push_0
  1 put_loc0
  2 push_0
  3 put_loc2
  4 get_loc2
  5 push_i16 bytes:0010
  8 lt
  9 if_false8 bytes:12
 11 get_arg0
 12 get_field_rdi 0 [slot]
 17 put_loc1
 18 get_loc0
 19 get_loc2
 20 push_1
 21 add
 22 add
 23 put_loc0
 24 inc_loc 2
 26 goto8 bytes:e9
 28 get_loc1
 29 get_arg1
 30 strict_neq
 31 if_false8 bytes:0b
 33 get_var 0
 36 push_atom_value 633 [value identity]
 41 call1
 42 throw
 43 get_loc0
 44 return
```

### M / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### M / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### V8 / valueReadLoop: 29条，61B
```text
  0 LdaZero
  1 Star0
  2 LdaZero
  3 Star2
  4 LdaSmi.Wide [4096]
  8 TestLessThan r2, EmbeddedFeedback[None]
 11 JumpIfFalse [28] (ADDR @ 39)
 13 GetNamedProperty a0, [0:"slot"], FBV[0]
 17 Star1
 18 Ldar r2
 20 AddSmi [1], EmbeddedFeedback[None]
 23 Add r0, EmbeddedFeedback[None]
 26 Mov r0, r3
 29 Star0
 30 Ldar r2
 32 Inc EmbeddedFeedback[None]
 34 Star2
 35 JumpLoop [31], [0], FBV[2] (ADDR @ 4)
 39 Ldar a1
 41 TestEqualStrict r1, EmbeddedFeedback[None]
 44 JumpIfTrue [14] (ADDR @ 58)
 46 LdaGlobal [1:"Error"], FBV[4]
 49 Star3
 50 LdaConstant [2:"value identity"]
 52 Star4
 53 CallUndefinedReceiver1 r3, r4, FBV[6]
 57 Throw
 58 Ldar r0
 60 Return
```

### V8 / step: 3条，6B
```text
  0 Ldar a0
  2 AddSmi [1], EmbeddedFeedback[None]
  5 Return
```

### V8 / microRun: 8条，18B
```text
  0 LdaGlobal [0:"selectedLoop"], FBV[0]
  3 Star0
  4 LdaGlobal [1:"microObject"], FBV[2]
  7 Star1
  8 LdaGlobal [2:"expectedValue"], FBV[4]
 11 Star2
 12 CallUndefinedReceiver2 r0, r1, r2, FBV[6]
 17 Return
```

## function_value_read

### A / valueReadLoop: 29条，45B

源码SHA `97c133cc5262373f248662f4a4d1c33df387ae24388c8a2d050dd02a390120e0`；compiled instance 4。
```javascript
function valueReadLoop(obj, expected) {
    var sum = 0, last;
    for (var i = 0; i < 4096; i++) {
        last = obj.slot;
        sum += i + 1;
    }
    if (last !== expected) throw Error("value identity");
    return sum;
}
```
```text
  0 push_0
  1 put_loc0
  2 push_0
  3 put_loc2
  4 get_loc2
  5 push_i16 bytes:0010
  8 lt
  9 if_false8 bytes:12
 11 get_arg0
 12 get_field 632 [slot]
 17 put_loc1
 18 get_loc0
 19 get_loc2
 20 push_1
 21 add
 22 add
 23 put_loc0
 24 inc_loc 2
 26 goto8 bytes:e9
 28 get_loc1
 29 get_arg1
 30 strict_neq
 31 if_false8 bytes:0b
 33 get_var 0
 36 push_atom_value 633 [value identity]
 41 call1
 42 throw
 43 get_loc0
 44 return
```

### A / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### A / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### M / valueReadLoop: 29条，45B

源码SHA `97c133cc5262373f248662f4a4d1c33df387ae24388c8a2d050dd02a390120e0`；compiled instance 4。
```javascript
function valueReadLoop(obj, expected) {
    var sum = 0, last;
    for (var i = 0; i < 4096; i++) {
        last = obj.slot;
        sum += i + 1;
    }
    if (last !== expected) throw Error("value identity");
    return sum;
}
```
```text
  0 push_0
  1 put_loc0
  2 push_0
  3 put_loc2
  4 get_loc2
  5 push_i16 bytes:0010
  8 lt
  9 if_false8 bytes:12
 11 get_arg0
 12 get_field_rdi 0 [slot]
 17 put_loc1
 18 get_loc0
 19 get_loc2
 20 push_1
 21 add
 22 add
 23 put_loc0
 24 inc_loc 2
 26 goto8 bytes:e9
 28 get_loc1
 29 get_arg1
 30 strict_neq
 31 if_false8 bytes:0b
 33 get_var 0
 36 push_atom_value 633 [value identity]
 41 call1
 42 throw
 43 get_loc0
 44 return
```

### M / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### M / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### V8 / valueReadLoop: 29条，61B
```text
  0 LdaZero
  1 Star0
  2 LdaZero
  3 Star2
  4 LdaSmi.Wide [4096]
  8 TestLessThan r2, EmbeddedFeedback[None]
 11 JumpIfFalse [28] (ADDR @ 39)
 13 GetNamedProperty a0, [0:"slot"], FBV[0]
 17 Star1
 18 Ldar r2
 20 AddSmi [1], EmbeddedFeedback[None]
 23 Add r0, EmbeddedFeedback[None]
 26 Mov r0, r3
 29 Star0
 30 Ldar r2
 32 Inc EmbeddedFeedback[None]
 34 Star2
 35 JumpLoop [31], [0], FBV[2] (ADDR @ 4)
 39 Ldar a1
 41 TestEqualStrict r1, EmbeddedFeedback[None]
 44 JumpIfTrue [14] (ADDR @ 58)
 46 LdaGlobal [1:"Error"], FBV[4]
 49 Star3
 50 LdaConstant [2:"value identity"]
 52 Star4
 53 CallUndefinedReceiver1 r3, r4, FBV[6]
 57 Throw
 58 Ldar r0
 60 Return
```

### V8 / step: 3条，6B
```text
  0 Ldar a0
  2 AddSmi [1], EmbeddedFeedback[None]
  5 Return
```

### V8 / microRun: 8条，18B
```text
  0 LdaGlobal [0:"selectedLoop"], FBV[0]
  3 Star0
  4 LdaGlobal [1:"microObject"], FBV[2]
  7 Star1
  8 LdaGlobal [2:"expectedValue"], FBV[4]
 11 Star2
 12 CallUndefinedReceiver2 r0, r1, r2, FBV[6]
 17 Return
```

## own_method_call

### A / methodCallLoop: 19条，30B

源码SHA `9de90ef148e79781cfce61c295eab626a29135fdba28874e66e781f42840d9da`；compiled instance 5。
```javascript
function methodCallLoop(obj, expected) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.slot(i);
    }
    return sum;
}
```
```text
  0 push_0
  1 put_loc0
  2 push_0
  3 put_loc1
  4 get_loc1
  5 push_i16 bytes:0010
  8 lt
  9 if_false8 bytes:12
 11 get_loc0
 12 get_arg0
 13 get_field2 632 [slot]
 18 get_loc1
 19 call_method 1
 22 add
 23 put_loc0
 24 inc_loc 1
 26 goto8 bytes:e9
 28 get_loc0
 29 return
```

### A / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### A / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### M / methodCallLoop: 19条，30B

源码SHA `9de90ef148e79781cfce61c295eab626a29135fdba28874e66e781f42840d9da`；compiled instance 5。
```javascript
function methodCallLoop(obj, expected) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.slot(i);
    }
    return sum;
}
```
```text
  0 push_0
  1 put_loc0
  2 push_0
  3 put_loc1
  4 get_loc1
  5 push_i16 bytes:0010
  8 lt
  9 if_false8 bytes:12
 11 get_loc0
 12 get_arg0
 13 get_field2_rdi 0 [slot]
 18 get_loc1
 19 call_method 1
 22 add
 23 put_loc0
 24 inc_loc 1
 26 goto8 bytes:e9
 28 get_loc0
 29 return
```

### M / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### M / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### V8 / methodCallLoop: 19条，42B
```text
  0 LdaZero
  1 Star0
  2 LdaZero
  3 Star1
  4 LdaSmi.Wide [4096]
  8 TestLessThan r1, EmbeddedFeedback[None]
 11 JumpIfFalse [28] (ADDR @ 39)
 13 GetNamedProperty a0, [0:"slot"], FBV[0]
 17 Star3
 18 CallProperty1 r3, a0, r1, FBV[2]
 23 Add r0, EmbeddedFeedback[None]
 26 Mov r0, r2
 29 Star0
 30 Ldar r1
 32 Inc EmbeddedFeedback[None]
 34 Star1
 35 JumpLoop [31], [0], FBV[4] (ADDR @ 4)
 39 Ldar r0
 41 Return
```

### V8 / step: 3条，6B
```text
  0 Ldar a0
  2 AddSmi [1], EmbeddedFeedback[None]
  5 Return
```

### V8 / microRun: 8条，18B
```text
  0 LdaGlobal [0:"selectedLoop"], FBV[0]
  3 Star0
  4 LdaGlobal [1:"microObject"], FBV[2]
  7 Star1
  8 LdaGlobal [2:"expectedValue"], FBV[4]
 11 Star2
 12 CallUndefinedReceiver2 r0, r1, r2, FBV[6]
 17 Return
```

## local_function_call

### A / localCallLoop: 21条，30B

源码SHA `a3e6288c6bd36a3cd7faf025785977fdac9ff78629f1f77ef26f5b0cf0abf3dd`；compiled instance 6。
```javascript
function localCallLoop(obj, expected) {
    var fn = obj.slot, sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += fn(i);
    }
    return sum;
}
```
```text
  0 get_arg0
  1 get_field 632 [slot]
  6 put_loc0
  7 push_0
  8 put_loc1
  9 push_0
 10 put_loc2
 11 get_loc2
 12 push_i16 bytes:0010
 15 lt
 16 if_false8 bytes:0b
 18 get_loc1
 19 get_loc0
 20 get_loc2
 21 call1
 22 add
 23 put_loc1
 24 inc_loc 2
 26 goto8 bytes:f0
 28 get_loc1
 29 return
```

### A / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### A / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### M / localCallLoop: 21条，30B

源码SHA `a3e6288c6bd36a3cd7faf025785977fdac9ff78629f1f77ef26f5b0cf0abf3dd`；compiled instance 6。
```javascript
function localCallLoop(obj, expected) {
    var fn = obj.slot, sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += fn(i);
    }
    return sum;
}
```
```text
  0 get_arg0
  1 get_field_rdi 0 [slot]
  6 put_loc0
  7 push_0
  8 put_loc1
  9 push_0
 10 put_loc2
 11 get_loc2
 12 push_i16 bytes:0010
 15 lt
 16 if_false8 bytes:0b
 18 get_loc1
 19 get_loc0
 20 get_loc2
 21 call1
 22 add
 23 put_loc1
 24 inc_loc 2
 26 goto8 bytes:f0
 28 get_loc1
 29 return
```

### M / step: 4条，4B

源码SHA `3fd76de4bafceff5573d775d7160c45629a6731b00a31052a493bc2de756f0cc`；compiled instance 3。
```javascript
function step(x) {
    return x + 1;
}
```
```text
  0 get_arg0
  1 push_1
  2 add
  3 return
```

### M / microRun: 4条，12B

源码SHA `98c903e310cf05926de43a8bb8510d29f67261a6cb2e1c08ca7db9805490f783`；compiled instance 7。
```javascript
function microRun() {
    return selectedLoop(microObject, expectedValue);
}
```
```text
  0 get_var 0
  3 get_var 1
  6 get_var 2
  9 tail_call 2
```

### V8 / localCallLoop: 19条，41B
```text
  0 GetNamedProperty a0, [0:"slot"], FBV[0]
  4 Star0
  5 LdaZero
  6 Star1
  7 LdaZero
  8 Star2
  9 LdaSmi.Wide [4096]
 13 TestLessThan r2, EmbeddedFeedback[None]
 16 JumpIfFalse [22] (ADDR @ 38)
 18 CallUndefinedReceiver1 r0, r2, FBV[2]
 22 Add r1, EmbeddedFeedback[None]
 25 Mov r1, r3
 28 Star1
 29 Ldar r2
 31 Inc EmbeddedFeedback[None]
 33 Star2
 34 JumpLoop [25], [0], FBV[4] (ADDR @ 9)
 38 Ldar r1
 40 Return
```

### V8 / step: 3条，6B
```text
  0 Ldar a0
  2 AddSmi [1], EmbeddedFeedback[None]
  5 Return
```

### V8 / microRun: 8条，18B
```text
  0 LdaGlobal [0:"selectedLoop"], FBV[0]
  3 Star0
  4 LdaGlobal [1:"microObject"], FBV[2]
  7 Star1
  8 LdaGlobal [2:"expectedValue"], FBV[4]
 11 Star2
 12 CallUndefinedReceiver2 r0, r1, r2, FBV[6]
 17 Return
```

## 按操作理解，而非逐条硬配

- 两read使用同一个valueReadLoop编码。QuickJS PC12取得slot、17覆盖last；18–23进行i+1和sum累加；28–31做最终身份检查。V8 PC13/17读取并保存last，18–29加法/保存，39–44身份检查。循环中没有step调用；错误分支的call未执行由A/M实际call计数0支持。
- own方法：QJS get_field2/_rdi先保留obj，再压方法；call_method传一个参数。V8 GetNamedProperty FBV[0]把结果给accumulator，Star3保存函数，再CallProperty1 FBV[2]传obj和i。读取反馈与调用反馈不同。
- local：QJS PC1和V8 PC0的slot读取在循环入口比较之前；后续回跳目标分别PC11和PC9，不会回到字段读取。QJS循环内get_loc0仍复制函数；V8将fn保存在r0供CallUndefinedReceiver1使用。fn并非每进程只取一次，而是每个Run一次。
- 所有call案例的step只做x+1；QJS get_arg0/push_1/add/return，无push_this；V8 Ldar a0/AddSmi1/Return。QJS的a0命名在这里不用来指V8物理寄存器，V8的a0/r0都是字节码参数/虚拟寄存器。
- 原始跳转操作数字节未解成绝对PC时显示bytes:，不冒充已解码目标。完整V8文本保留原跳转注释，QJS回跳位置以源实现读取相对编码核对；不能按文本行数替代指令数。
- 数字/函数值的差异不会自动生成另一个读取opcode；M查询/返回tag计数提供真实执行证据，见path_counts.csv。调用次数另见call_counts.csv，不与属性operation混计。
