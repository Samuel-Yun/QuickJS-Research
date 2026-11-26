# 实际执行字节码

来自 Run 结束后保存的诊断执行镜像；不是只打印改写前的编译输出。诊断记录尺寸会影响 IC delta，不将这里的 delta 当成 Release 元数据的大小。完整镜像和 hash 对应的命令均在 counts01/raw/。

这轮没有新增 opcode。instanceof、call_method、four_ctor 仍是入口；C handler 按记录选择路径。字节码没换名字不表示没有进入快路，Run 内提交计数才是证据。快照工具的 constructor_sites.positive_plan 只显示旧 FullPlan，不含 NumericPlan/NestedPlan，不能据此判断两者是否命中。

## 包装函数：实际准备镜像

来源：counts01/raw/RayTrace.RayTrace.NEST_COMBINED.counts.0.snapshot.jsonl

```text
函数 [31] <anonymous>  parent=30  args=0 locals=2 bytes=22
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  special_object             1
000004  put_loc1                    (arguments)
000005  v6_get_loc0                
000006  get_field_rdi              initialize  IC[0] delta=17
000011  get_field2_rdi             apply  IC[1] delta=36
000016  get_loc0                    (this)
000017  get_loc1                    (arguments)
000018  call_method                2
000021  return_undef               
  IC[0] initialize: 未填充, offset=0
  IC[1] apply: 未填充, offset=0
```

## 两实参 initializer

来源：counts01/raw/RayTrace.RayTrace.NEST_COMBINED.counts.0.snapshot.jsonl

```text
函数 [58] <anonymous>  parent=0  args=2 locals=1 bytes=17
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  get_loc0                    (this)
000003  get_arg0                    (pos)
000004  put_field                  position
000009  get_loc0                    (this)
000010  get_arg1                    (dir)
000011  put_field                  direction
000016  return_undef
```

## 包含子 new 的 initializer

来源：counts01/raw/RayTrace.RayTrace.NEST_COMBINED.counts.0.snapshot.jsonl

```text
函数 [77] <anonymous>  parent=0  args=0 locals=1 bytes=29
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  get_loc0                    (this)
000003  get_var                    0 (Flog)
000006  get_field_rdi              RayTracer  IC[0] delta=25
000011  get_field_rdi              Color  IC[1] delta=44
000016  dup                        
000017  push_0                     0
000018  push_0                     0
000019  push_0                     0
000020  four_ctor                  record[0] argc=3
000023  put_field                  color
000028  return_undef               
  IC[0] RayTracer: 自有字段, offset=0
  IC[1] Color: 自有字段, offset=0
  record[0] pc=20, argc=3, 正计划=False, 负目标=True
```

## 被适配的基类字段初始化

来源：counts01/raw/DeltaBlue.DeltaBlue.CALL_IC.counts.0.snapshot.jsonl

```text
函数 [44] Constraint  parent=0  args=1 locals=1 bytes=10
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  get_loc0                    (this)
000003  get_arg0                    (strength)
000004  put_field                  strength
000009  return_undef
```

## 真实 call_method 所在函数

来源：counts01/raw/DeltaBlue.DeltaBlue.CALL_IC.counts.0.snapshot.jsonl

```text
函数 [64] BinaryConstraint  parent=0  args=3 locals=1 bytes=59
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  get_var                    0 (BinaryConstraint)
000005  get_field_rdi              superConstructor  IC[0] delta=58
000010  get_field2_rdi             call  IC[1] delta=77
000015  get_loc0                    (this)
000016  get_arg2                    (strength)
000017  call_method                2
000020  drop                       
000021  get_loc0                    (this)
000022  get_arg0                    (var1)
000023  put_field                  v1
000028  get_loc0                    (this)
000029  get_arg1                    (var2)
000030  put_field                  v2
000035  get_loc0                    (this)
000036  get_var                    1 (Direction)
000039  get_field_rdi              NONE  IC[2] delta=72
000044  put_field                  direction
000049  get_loc0                    (this)
000050  get_field2_rdi             addConstraint  IC[3] delta=85
000055  call_method                0
000058  return_undef               
  IC[0] superConstructor: 未填充, offset=0
  IC[1] call: 未填充, offset=0
  IC[2] NONE: 自有字段, offset=0
  IC[3] addConstraint: 未填充, offset=0
```

## ASTSpan 的实际函数体

来源：counts01/raw/Typescript.Typescript.CALL_IC.counts.0.snapshot.jsonl

```text
函数 [108] ASTSpan  parent=107  args=0 locals=1 bytes=17
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  get_loc0                    (this)
000003  push_minus1                -1
000004  put_field                  minChar
000009  get_loc0                    (this)
000010  push_minus1                -1
000011  put_field                  limChar
000016  return_undef
```

## Token 的实际函数体

来源：counts01/raw/Typescript.Typescript.CALL_IC.counts.0.snapshot.jsonl

```text
函数 [1116] Token  parent=1115  args=1 locals=1 bytes=10
offset  opcode                     操作数
------------------------------------------------------------------------
000000  push_this                  
000001  put_loc0                    (this)
000002  get_loc0                    (this)
000003  get_arg0                    (tokenId)
000004  put_field                  tokenId
000009  return_undef
```

## Boyer 的 instanceof 热函数（只摘运算附近）

来源：counts01/raw/EarleyBoyer.Boyer.INSTANCE_HOOK.counts.0.snapshot.jsonl

```text
函数 [398] <anonymous>  parent=0  args=0 locals=9 bytes=341
offset  opcode                     操作数
------------------------------------------------------------------------
000033  set_loc8                   8 (sc_term_19)
000035  get_var                    3 (sc_Pair)
000038  instanceof                 
000039  lnot                       
000040  if_false8                  ->46
000093  set_loc8                   7 (sc_term_18)
000095  get_var                    3 (sc_Pair)
000098  instanceof                 
000099  lnot                       
000100  if_false8                  ->106
000161  set_loc8                   5 (term)
000163  get_var                    3 (sc_Pair)
000166  instanceof                 
000167  if_false                   ->315
000172  get_loc8                   5 (term)
000197  get_field_rdi              car  IC[7] delta=314
000202  get_var                    3 (sc_Pair)
000205  instanceof                 
000206  if_false8                  ->315
000208  get_loc8                   5 (term)
000231  get_loc8                   5 (term)
000233  get_var                    3 (sc_Pair)
000236  instanceof                 
000237  lnot                       
000238  if_false8                  ->244
```

