# 两案例的真实关键字节码

同一引擎内两案例caller和callee规范化序列均一致；完整实例/源码/原始字节和规范化规则见bytecode目录与micro_diagnostic_gate.json。下面不是性能成本计数。

## A methodLoop
```javascript
function methodLoop(obj) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.step(i);
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
 13 get_field2 624 [step]
 18 get_loc1 
 19 call_method 1
 22 add 
 23 put_loc0 
 24 inc_loc 1
 26 goto8 bytes:e9
 28 get_loc0 
 29 return 
```
标为bytes的操作数保持原始编码，未把相对跳转原字节伪装成目标PC；field/call_method/inc_loc按实际小端操作数展示，完整bytes另在JSON。

## A step
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
标为bytes的操作数保持原始编码，未把相对跳转原字节伪装成目标PC；field/call_method/inc_loc按实际小端操作数展示，完整bytes另在JSON。

## M methodLoop
```javascript
function methodLoop(obj) {
    var sum = 0;
    for (var i = 0; i < 4096; i++) {
        sum += obj.step(i);
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
 13 get_field2_rdi 0 [step]
 18 get_loc1 
 19 call_method 1
 22 add 
 23 put_loc0 
 24 inc_loc 1
 26 goto8 bytes:e9
 28 get_loc0 
 29 return 
```
标为bytes的操作数保持原始编码，未把相对跳转原字节伪装成目标PC；field/call_method/inc_loc按实际小端操作数展示，完整bytes另在JSON。

## M step
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
标为bytes的操作数保持原始编码，未把相对跳转原字节伪装成目标PC；field/call_method/inc_loc按实际小端操作数展示，完整bytes另在JSON。

## V8：caller目标读取/调用
```text
13 GetNamedProperty a0, [0:"step"], FBV[0]
17 Star3
18 CallProperty1 r3, a0, r1, FBV[2]
```
此处连续三条，来自V8.methodLoop.txt；前后循环、sum累加和返回省略，不能当完整函数。a0=obj，r3=取得的函数，r1=i；被调用的step中a0才是x。方法调用feedback与属性读取feedback分开，不能把所有调用反馈都说成use_ic关闭。

## V8：完整step指令
```text
0 Ldar a0
2 AddSmi [1], EmbeddedFeedback[None]
5 Return
```
来源bytecode/own_method_control/V8.step.txt，字节码长度6B。函数体没有this读取，两组传递receiver的调用形式仍相同；它不构成对调用帧开销的独立测量。
