# 正式M/R真实布局与命中路径

来自本轮正式ELF，不是诊断版，不按指令条数推性能。实际哈希在manifest.json，完整JS_CallInternal反汇编分别在A/M/R子目录。

- sizeof(ReadICSite)：M16、R24；R streak偏移16。额外uint8_t因对齐使每site增加8字节（50%），不是只增加1字节请求。
- JSFunctionBytecode新增头组件两者都16字节，JSRuntime大小与A相同，无SW mode字段。
- .text：A760562、M762514、R763186字节；R比M多672。GNU size text另含只读内容，不与纯.text混同。
- quickjs.c原始字节M/R相同，普通读/写handler没有新增site索引、disabled判断、probe或streak逻辑。
  同一大C函数的最终机器码/布局仍会派生变化，源相同不代表机器码逐字相同。

## 命中时新增的真实工作

R的site寻址在0x2402c使用`lea rax,[rax+rax*2]`，继而0x24030用`[rsi+rax*8]`得到24字节stride。
在成功shape guard之后，命中代码保留streak条件清零。下面是**两个不同handler片段**，不能相接当连续路径：

```asm
; R get_field2_rdi片段，完整上下文见R/JS_CallInternal.asm
2b18d: test dl,dl
2b18f: je   2b196
2b191: mov  BYTE PTR [r8+0x10],0x0
2b196: mov  eax,ecx

; R get_field_rdi片段
2b670: test cl,cl
2b672: je   2b679
2b674: mov  BYTE PTR [r8+0x10],0x0
2b679: mov  eax,r9d
```

这证明本次GCC没有把C里的条件reset无条件化：zero streak可以跳过store。
不因此证明正式样本每次具体分支；独立诊断记录的是策略读检查/写回事件，不是CPU逐次load计数。
M原命中没有streak；R稳定命中仍多了streak读检查、分支和24字节stride，不能说完全零代价。

## 真正退出与普通handler

普通读实际opcode61/62，运行期MIC读244/245。阈值例子在correctness/exit_state_checks.csv：31miss仍244，32后恢复61/atom；方法例恢复62。
同一实际函数的私有C检查验证operand变为atom、重复退出不再次dup、当前值读正确，且site/bytecode各释放其引用。
独立诊断只在普通GET_FIELD_INLINE入口加PC归因：poly目标32次IC+8160次post，后续没有IC query/probe/维护计数。
正式版没有这项诊断PC映射；进入普通opcode仍有正常hash/辅助调用/值和receiver处理，不是跳过JS语义。

源码和真实dump结合支持“已切换到普通读取”，不是仅在IC handler上方加disabled分支。
代码布局、寄存器派生、其它路径与新metadata的性能影响未独立拆分；numeric/write控制若改变不能称为退回策略直接收益。
