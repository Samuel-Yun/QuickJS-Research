# 第3页：四组调用方式——关键字节码对照

本页紧接“四组调用方式”的性能表。2026-10-19只读复核已有材料，未重新导出字节码、运行实验或修改VM。资料仍取自2026-10-17那轮实验，不加入后来的Richards函数计时结果。当前主稿main_fixed.tex由8个frame变为9个：7页正文＋2页附录；原有8个frame的内容全部保留。

## 一分钟口头讲稿

上一页是四种写法的耗时，这一页看它们实际怎样组织执行。第一组直接读取bias，再把i和结果加进sum，没有额外小函数；第二组先取得stepPlain，把obj和i作为两个显式参数传入。第三、四组先从obj读取step，再带着obj这个receiver调用。QuickJS的get_field2不仅取函数，还把对象留在栈上，使call_method知道this是谁；普通函数则从显式obj参数读bias。own和prototype组的caller、callee字节码相同，但原来独立诊断确认，一组在对象自身命中step，一组到一层原型命中，两组的this仍是obj。上一页own方法中跨引擎差距已经存在，因此不能只用多一层原型解释。方法准备、this处理和属性读取是可继续检查的步骤，还没有分别测出它们的成本。

## 来源、版本和身份

下文简称S2为`js-interpreter-bench/experiments/call_path_followup/attempt01/`。全部offset来自该轮完整最终dump及其decoded.json；本轮核对了二者，没有重写“等价指令”。页上只删绝对地址/编码/长源码注释，不改变opcode、参数、寄存器、FBV槽或顺序。完整跳转注释地址留在下文caller材料，地址只能在其原进程内解释。

- [case_notes.md](../../experiments/call_path_followup/attempt01/case_notes.md)：源码、栈效果、实现解释及诊断路径。
- [manifest.json](../../experiments/call_path_followup/attempt01/manifest.json)：WSL2 Ubuntu24.04.2/x86_64；QuickJS upstream2026-06-04、commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`；官方d8/V8 15.6.21、`--max-opt=0 --no-lazy`及制品hash。
- [method_bytecode_equal.json](../../experiments/call_path_followup/attempt01/source_evidence/method_bytecode_equal.json)、[shared_method_core.json](../../experiments/call_path_followup/attempt01/source_evidence/shared_method_core.json)：own/prototype循环与方法源码相同；两引擎的caller/callee opcode及操作数相同，V8跳转地址注释按进程归一化，不表示IC行为相同。
- QuickJS打印来自同revision独立诊断构建的最终JSFunctionBytecode，不是qjs -d，不是中间IR。该轮已有正式/诊断qjsc序列化表示一致性记录；不把诊断native布局或时间当作正式binary性能。
- V8打印来自冻结d8实际制品；完整制品精确源码/构建参数与逐次IC命中率仍UNKNOWN。本页不从handler分支存在推断该site每次实际走到。

原始打印命令、stdout/stderr、退出码在S2/raw/dump/：`final_quickjs_{inline,direct_call,own_method,prototype_method}.json`；V8为`cfInline_v8_inline.json`、`cfDirectLoop_v8_direct_call.json`、`cfMethodLoop_v8_{own_method,prototype_method}.json`及`stepPlain_v8_direct_call.json`、`stepMethod_v8_{own_method,prototype_method}.json`。本轮没有新增这类运行记录。

### 完整dump索引

下表的.txt保留真实打印上下文；相邻同名.decoded.json给出offset、opcode、操作数和指令size。

| 组别/函数 | QuickJS原始txt | V8原始txt |
| --- | --- | --- |
| inline / cfInline | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/inline/quickjs/cfInline.txt) | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/inline/v8/cfInline.txt) |
| direct_call / cfDirectLoop | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/direct_call/quickjs/cfDirectLoop.txt) | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/direct_call/v8/cfDirectLoop.txt) |
| direct_call / stepPlain | [完整callee](../../experiments/call_path_followup/attempt01/bytecode/direct_call/quickjs/stepPlain.txt) | [完整callee](../../experiments/call_path_followup/attempt01/bytecode/direct_call/v8/stepPlain.txt) |
| own_method / cfMethodLoop | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/own_method/quickjs/cfMethodLoop.txt) | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/own_method/v8/cfMethodLoop.txt) |
| own_method / stepMethod | [完整callee](../../experiments/call_path_followup/attempt01/bytecode/own_method/quickjs/stepMethod.txt) | [完整callee](../../experiments/call_path_followup/attempt01/bytecode/own_method/v8/stepMethod.txt) |
| prototype_method / cfMethodLoop | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/prototype_method/quickjs/cfMethodLoop.txt) | [完整caller](../../experiments/call_path_followup/attempt01/bytecode/prototype_method/v8/cfMethodLoop.txt) |
| prototype_method / stepMethod | [完整callee](../../experiments/call_path_followup/attempt01/bytecode/prototype_method/quickjs/stepMethod.txt) | [完整callee](../../experiments/call_path_followup/attempt01/bytecode/prototype_method/v8/stepMethod.txt) |

## 页上四行分别讲什么，省略在哪里

caller是循环函数，callee才是stepPlain/stepMethod。每个页面代码框都是**同一caller内的连续片段**，没有把两个函数拼起来。

| 行 | 源码表达式 | 页上QJS offset | 页上V8 offset | 未展示部分 |
| --- | --- | --- | --- | --- |
| 直接计算 | `sum += i + obj.bias` | 12、17、18 | 11、15、18 | QJS前面9/10/11已将sum、i、obj入栈，后面19保存sum；两边的循环与return也未展示 |
| 普通调用 | `sum += stepPlain(obj,i)` | 10、13、14、15 | 11、14、15 | QJS前面9取得sum，片段后16加返回值；V8后20加sum，后面还有保存与循环 |
| own方法 | `sum += obj.step(i)` | 11、16、17 | 11、15、16 | QJS前9/10准备sum和obj，后20累加返回值；V8后21累加，循环/return省略 |
| prototype方法 | 同上 | 同上 | 同上 | 同上，方法在一层原型，this仍是原obj |

每行省略的是前后，不是中间；callee不在页面caller框中。V8的a/r是虚拟参数/寄存器槽，不是CPU物理寄存器；累加器另记为A。`EmbeddedFeedback[None]`和`FBV[0]/[2]`均逐字保留，不据其名称推断实际命中率。

### 值怎样变化

- inline：QJS进入offset12前栈为`[sum,i,obj]`（栈底→顶），get_field后`[sum,i,bias]`，两次add得到新sum。V8 GetNamedProperty把bias放A，Add r1得到i+bias，再Add r0加旧sum。
- 普通调用：QJS取得stepPlain、obj、i后用call2传两个显式参数；V8 LdaGlobal取函数、Star3保存，CallUndefinedReceiver2传obj和i。两者返回后仍须把结果加进sum。
- 方法：QJS offset11前为`[sum,obj]`，get_field2后为`[sum,obj,fn]`；取i后call_method以this=obj调用，返回后为`[sum,result]`。V8 GetNamedProperty取函数，Star3存r3，CallProperty1以r3为函数、a0=obj为receiver、r1=i为显式参数。
- own/prototype源码和此处caller/callee序列相同；真正不同的是对象建立后的查找。原型上的方法不把this改成原型对象。

### “路径不同”的实际证据与限制

[own_method_paths.json](../../experiments/call_path_followup/attempt01/raw/diagnostics/own_method_paths.json)：step own_hit=4096，prototype_hit=0；[prototype_method_paths.json](../../experiments/call_path_followup/attempt01/raw/diagnostics/prototype_method_paths.json)：step own_hit=0，prototype_hit=4096、hops[1]=4096。两组get_field2都4096次，来自既有独立QuickJS诊断，不是正式计时，也不是V8的逐次IC命中证据。

上一页的own/prototype耗时比均约0.557，数据不变。因此在这组对象/输入下，多一层原型不足以单独解释跨引擎差距。own/prototype保持相同循环、方法、参数与this形式，改变的是计时外对象建立、属性所在位置及布局/反馈；普通函数/方法之间才另外改变显式对象参数与receiver的传递。组间时间不直接相减成单独操作成本。

## callee完整对照（与caller分开）

参数编号只在各自函数内解释：caller的a0=obj、a1=n；stepPlain的a0=obj、a1=x；stepMethod的a0=x，receiver为`<this>`。不能把这些a0当同一个变量。

### QJS / stepPlain(obj,x)：完整5条

```text
0 get_arg1 1: x
1 get_arg0 0: obj
2 get_field bias
7 add
8 return
```

### QJS / stepMethod(x)：完整7条，own/prototype两份相同

```text
0 push_this
1 put_loc0 0: this
2 get_arg0 0: x
3 get_loc0 0: this
4 get_field bias
9 add
10 return
```

### V8 / stepPlain(obj,x)：完整3条

```text
0 GetNamedProperty a0, [0:"bias"], FBV[0]
4 Add a1, EmbeddedFeedback[None]
7 Return
```

### V8 / stepMethod(x)：完整3条，own/prototype两份相同

```text
0 GetNamedProperty <this>, [0:"bias"], FBV[0]
4 Add a0, EmbeddedFeedback[None]
7 Return
```

这份dump中，QJS方法比普通函数多push_this/put_loc0两步this初始化，读取参数/对象的编号也不同；V8两者均三条、receiver/参数槽不同。这是具体检查方向，尚未量出两步的独立耗时，不能据条数解释全部差距；静态指令少不等于总时间短。

## 完整caller序列（不进PDF）

以下仅去掉地址/机器码列、源码和调试元数据；保留所有offset、opcode、操作数及真实跳转注释。它们是完整指令序列，不含常量池/debug表；原始完整输出仍见上方.txt索引。

### inline / QuickJS / cfInline

```text
0 push_0 0
1 put_loc0 0: sum
2 push_0 0
3 put_loc1 1: i
4 get_loc1 1: i
5 get_arg1 1: n
6 lt
7 if_false8 24
9 get_loc0 0: sum
10 get_loc1 1: i
11 get_arg0 0: obj
12 get_field bias
17 add
18 add
19 put_loc0 0: sum
20 inc_loc 1: i
22 goto8 4
24 get_loc0 0: sum
25 return
```

### inline / V8 / cfInline

```text
0 LdaZero
1 Star0
2 LdaZero
3 Star1
4 Ldar a1
6 TestLessThan r1, EmbeddedFeedback[None]
9 JumpIfFalse [25] (0x1bf801000406 @ 34)
11 GetNamedProperty a0, [0:"bias"], FBV[0]
15 Add r1, EmbeddedFeedback[None]
18 Add r0, EmbeddedFeedback[None]
21 Mov r0, r2
24 Star0
25 Ldar r1
27 Inc EmbeddedFeedback[None]
29 Star1
30 JumpLoop [26], [0], FBV[2] (0x1bf8010003e8 @ 4)
34 Ldar r0
36 Return
```

### direct_call / QuickJS / cfDirectLoop

```text
0 push_0 0
1 put_loc0 0: sum
2 push_0 0
3 put_loc1 1: i
4 get_loc1 1: i
5 get_arg1 1: n
6 lt
7 if_false8 22
9 get_loc0 0: sum
10 get_var 0: stepPlain
13 get_arg0 0: obj
14 get_loc1 1: i
15 call2 2
16 add
17 put_loc0 0: sum
18 inc_loc 1: i
20 goto8 4
22 get_loc0 0: sum
23 return
```

### direct_call / V8 / cfDirectLoop

```text
0 LdaZero
1 Star0
2 LdaZero
3 Star1
4 Ldar a1
6 TestLessThan r1, EmbeddedFeedback[None]
9 JumpIfFalse [27] (0x131e01000408 @ 36)
11 LdaGlobal [0:"stepPlain"], FBV[0]
14 Star3
15 CallUndefinedReceiver2 r3, a0, r1, FBV[2]
20 Add r0, EmbeddedFeedback[None]
23 Mov r0, r2
26 Star0
27 Ldar r1
29 Inc EmbeddedFeedback[None]
31 Star1
32 JumpLoop [28], [0], FBV[4] (0x131e010003e8 @ 4)
36 Ldar r0
38 Return
```

### own_method / QuickJS / cfMethodLoop

```text
0 push_0 0
1 put_loc0 0: sum
2 push_0 0
3 put_loc1 1: i
4 get_loc1 1: i
5 get_arg1 1: n
6 lt
7 if_false8 26
9 get_loc0 0: sum
10 get_arg0 0: obj
11 get_field2 step
16 get_loc1 1: i
17 call_method 1
20 add
21 put_loc0 0: sum
22 inc_loc 1: i
24 goto8 4
26 get_loc0 0: sum
27 return
```

### own_method / V8 / cfMethodLoop

```text
0 LdaZero
1 Star0
2 LdaZero
3 Star1
4 Ldar a1
6 TestLessThan r1, EmbeddedFeedback[None]
9 JumpIfFalse [28] (0x3e6e0100041d @ 37)
11 GetNamedProperty a0, [0:"step"], FBV[0]
15 Star3
16 CallProperty1 r3, a0, r1, FBV[2]
21 Add r0, EmbeddedFeedback[None]
24 Mov r0, r2
27 Star0
28 Ldar r1
30 Inc EmbeddedFeedback[None]
32 Star1
33 JumpLoop [29], [0], FBV[4] (0x3e6e010003fc @ 4)
37 Ldar r0
39 Return
```

### prototype_method / QuickJS / cfMethodLoop

```text
0 push_0 0
1 put_loc0 0: sum
2 push_0 0
3 put_loc1 1: i
4 get_loc1 1: i
5 get_arg1 1: n
6 lt
7 if_false8 26
9 get_loc0 0: sum
10 get_arg0 0: obj
11 get_field2 step
16 get_loc1 1: i
17 call_method 1
20 add
21 put_loc0 0: sum
22 inc_loc 1: i
24 goto8 4
26 get_loc0 0: sum
27 return
```

### prototype_method / V8 / cfMethodLoop

```text
0 LdaZero
1 Star0
2 LdaZero
3 Star1
4 Ldar a1
6 TestLessThan r1, EmbeddedFeedback[None]
9 JumpIfFalse [28] (0x36f0100044d @ 37)
11 GetNamedProperty a0, [0:"step"], FBV[0]
15 Star3
16 CallProperty1 r3, a0, r1, FBV[2]
21 Add r0, EmbeddedFeedback[None]
24 Mov r0, r2
27 Star0
28 Ldar r1
30 Inc EmbeddedFeedback[None]
32 Star1
33 JumpLoop [29], [0], FBV[4] (0x36f0100042c @ 4)
37 Ldar r0
39 Return
```

## 使用与验证状态

main_fixed.tex已直接内嵌新增frame，仍是可上传Overleaf的单文件；call_bytecode_frame.tex是逐字相同的可插入副本，不要再input到已经新增的主稿以免重复一页。可选call_bytecode_minimal.tex只用于单页预览，需要同时上传frame文件。

当前Windows与现有WSL均未找到XeLaTeX/latexmk/tectonic/kpsewhich；**本轮未在本地编译，没有新增PDF，也没有声称完成视觉或Overfull检查**。离线检查只验证frame数量、原8页内容未改、八片段连续且逐字匹配、完整caller/callee匹配、来源hash与TeX结构；约9pt代码的列宽估计不能代替实际排版。Overleaf请选择XeLaTeX，编译后需检查新增第3页及全稿9页。
