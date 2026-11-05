# 退出的字节码与引用顺序

正式补丁只有`read_ic_types.h/read_ic_runtime.inc/read_ic_opcodes.inc/read_ic_exit.inc`。
`quickjs.c`与M字节完全相同，普通读/写handler没有新policy/disabled分支。

```text
最终编译/加载后的get_field atom
  -> M/R prepare: opcode=get_field_rdi, operand=site_index
     原atom引用由bytecode转交site（不dup）
  -> R连续miss #32:
     JS_DupAtom(site.atom)                 +1：给恢复后的bytecode
     site.shape=NULL, offset=0
     operand=atom, opcode=get_field        同长5字节，状态完成
     release(old_shape)                   之后才可能牵动其它对象引用
  -> 当前miss正常读取，无回填
  -> 后续普通handler，无site索引/probe/streak
  -> free_function_bytecode:
     rdi_free: free(site.atom)            释放site引用
     free_bytecode_atoms: free(atom)      释放恢复operand引用
```

`get_field2_rdi`对应恢复`get_field2`，receiver保留方式未改变。当前pc在分发后已经越过opcode，
所以一进入IC handler就保存`instruction=(uint8_t*)pc-1`，而非相信frame.cur_pc始终指向本opcode。
之后消费4-byte operand；恢复不影响现有局部pc、跳转/栈效果、异常cur_pc协议。
atom与对象当前值不混淆，不缓存undefined或getter失败，普通语义会重新执行。

`rdi_exit`先检查已经普通opcode，重复请求不再dup/释放；达到阈值前一帧与重入帧共享site状态。
普通miss更新前再检查streak<32，防止已退出site因重入回填。当前32次miss计IC，不重计post。

实际证据：

- `correctness/exit_state_checks.csv`：31次仍opcode244，32次后opcode61（get_field）；方法例恢复62（get_field2）。
  final_operand是该进程实际atom ID，跨进程须用atom名称和规范代码/PC，不以628等ID为稳定身份。
- `correctness/private_state.json`：私有C对同一个实际函数先warm，再调用正式rdi_exit，观测atom refcount+1，重复退出不变，
  函数销毁从site/普通operand分别释放，refcount合计-2；release和ASan/UBSan翻译单元都实际通过。
- 同一C检查用原`js_shape_prepare_update`准备真实unhashed对象，不假设JS外观就代表shape类别。
  mixed active/exited序列化后普通加载和ROM加载都重新得到空MIC、streak0，并执行原断言。
- `dequickening.js`覆盖递归getter/方法getter、抛异常、shared closures，以及退出后稳定阶段。

诊断`rdi_diag_exit`在真实dup和opcode写入之后记退出事件；shape占用及释放计数独立于普通查找结果。
额外atom引用每次退出1份可由此和源码推导；全suite的全atom池refcount逐次记录没有实现，不能冒称已实测。
这里的“1份”指逻辑所有权；带整数tag的atom的官方dup/free可能为无操作，不将退出数冒充所有atom的实际refcount增量。
原普通atom销毁代码未改，私有C和sanitizer验证其所有权配对。间接对象图字节仍UNKNOWN。
