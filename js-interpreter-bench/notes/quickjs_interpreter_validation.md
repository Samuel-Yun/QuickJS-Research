# QuickJS interpreter dispatch 验证

## 验证结论

状态：`PASS`。

当前固定 commit 在本次 Windows x64 / MinGW64 optimized build 中实际启用了 `DIRECT_DISPATCH=1`。`JS_CallInternal` 使用 computed goto / direct-threaded dispatch，不是 C `switch` fallback。

该结论由源码、相同编译器预处理结果、对象文件符号和反汇编四层证据共同支持。

## 1. 源码证据

固定源码：upstream QuickJS commit `04be246001599f5995fa2f2d8c91a0f198d3f34c`。

[`quickjs.c`](../engines/quickjs-upstream/quickjs.c) 52–55 行：

```c
#if defined(__EMSCRIPTEN__)
#define DIRECT_DISPATCH  0
#else
#define DIRECT_DISPATCH  1
#endif
```

同一文件 17761 行开始定义两种分派；`DIRECT_DISPATCH=1` 分支在 17777 行使用：

```c
#define SWITCH(pc) goto *dispatch_table[opcode = *pc++];
```

dispatch table 的元素是 `&&case_OP_*` 标签地址。这是 GCC labels-as-values 扩展构成的 computed goto。

## 2. MinGW64 预处理证据

用本次实际 GCC 13.1.0 对同一 `quickjs.c` 执行 `-dM -E`，结果包含：

```text
#define DIRECT_DISPATCH 1
```

因此 Windows/MinGW 编译没有定义 `__EMSCRIPTEN__`，没有选择 `DIRECT_DISPATCH=0` 的 switch 路径。该宏是编译期选择，没有对应的 runtime flag。

## 3. 对象文件符号证据

对 optimized object `.obj/quickjs.o` 执行 MinGW `nm -a`，得到：

```text
00000000000065a0 r dispatch_table.8
0000000000010310 t JS_CallInternal
000000000000003a t JS_CallInternal.cold
```

这表明实际编译产物中同时存在 `JS_CallInternal` 和只读 dispatch table，而不是仅在未采用的源码分支中出现相关文本。

## 4. 反汇编证据

命令：

```powershell
E:\mingw64\bin\objdump.exe -d -Mintel `
  --disassemble=JS_CallInternal `
  .\engines\quickjs-upstream\.obj\quickjs.o
```

`JS_CallInternal` 中出现基于 opcode 索引跳表的间接跳转：

```text
10593: 41 ff 24 c7    jmp QWORD PTR [r15+rax*8]
105c7: ff e0          jmp rax
```

后续 handler 也重复出现 `jmp rax` 和 `jmp QWORD PTR [r15+rax*8]`。它与源码中的 `dispatch_table[opcode]` computed goto 一致；如果采用 C switch，预处理宏不会是 1，也不会生成这一组 handler 地址表分派形态。

完整机器可读证据保存在 [`quickjs_dispatch_validation.txt`](../results/raw/quickjs_dispatch_validation.txt)，其中还记录了：

- compiler banner 与 target；
- source line evidence；
- `DIRECT_DISPATCH` 预处理值；
- `dispatch_table`/`JS_CallInternal` 符号；
- `JS_CallInternal` 内的间接跳转；
- `qjs.exe` 的 PE x86-64 格式与 DLL imports。

## 5. 证据强度与限制

- 源码宏说明设计意图。
- 预处理结果说明本次 MinGW 编译选择了 direct-dispatch 分支。
- 对象符号和反汇编说明该分支确实进入 optimized object 的机器码。
- smoke test 说明这个 `qjs.exe` 可以执行基本 JavaScript 功能。

本阶段没有加入运行时 instrumentation，也没有修改 interpreter 以计数 handler。对于确认 dispatch implementation，上述编译期和二进制证据已经形成闭环；它不是性能结果，也没有测量 dispatch 的速度。

## 最终判定

| 检查项 | 状态 |
|---|---|
| 固定 upstream source/commit | `PASS` |
| 源码定义 computed goto | `PASS` |
| MinGW64 预处理为 `DIRECT_DISPATCH=1` | `PASS` |
| optimized object 含 dispatch table | `PASS` |
| `JS_CallInternal` 含 indexed/register indirect jump | `PASS` |
| interpreter/runtime 源码未修改 | `PASS` |

QuickJS 的 Windows baseline 与 interpreter dispatch 门禁已经完成。整个 P0 benchmark 尚未准入，因为 V8、SunSpider 固定和统一计时协议仍未完成。
