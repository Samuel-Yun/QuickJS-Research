# A / E / V8_ON：同一小函数的真实字节码

本轮只做小段代码正确性和字节码诊断，没有性能测试，没有构建或替换引擎。使用 `v8_inspired_ic/attempt03/campaign_runtime.json` 中的冻结 A、修复版 E 和 V8_ON；运行前后 SHA256 均核验不变。主批次和 PPT 文件均未修改。

## 同一份 JavaScript

完整输入在 `example.js`。目标函数：

```javascript
function readPlusOne(o) {
    return o.x + 1;
}
```

输入 `o = {x: 3}`，每次返回 4。外层只执行 12 次并核对 checksum=48。三引擎均 PASS；这些调用用于正确性/诊断，不是性能样本或偷偷预热正式样本。目标 JS 和 driver 三边逐字相同，SHA256 为 `e510bfbe0199cc9a8dd80fd63675a39cdbf05199ab112894fc339ad1defa36ac`。

## 实际结果

以下是完整目标函数的指令，左侧为函数内 byte offset。QJS 解码来自实际冻结 ELF 进程的内存，不是手写的等价字节码。

|offset|A|E|
|---:|---|---|
|0|`get_arg0`|`get_arg0`|
|1|`get_field x`|`get_field_eic 0`|
|6|`push_1`|`push_1`|
|7|`add`|`add`|
|8|`return`|`return`|

A/E 均为 5 条、9 字节。A 原始字节为 `cf 3d 6c 02 00 00 b4 9b 28`；E 为 `cf f4 00 00 00 00 b4 9b 28`。A 的 `6c 02 00 00` 是本进程 atom 编号 620，实际解析为 `x`；E 的四字节操作数为 site index=0。E 旁表实读为 `site 0 -> {pc:1, atom:620, property:"x"}`。

V8_ON 原生 `--print-bytecode` 的完整目标函数指令：

```text
0 GetNamedProperty a0, [0:"x"], FBV[0]
4 AddSmi [1], EmbeddedFeedback[None]
7 Return
```

3 条、8 字节，register count=0。这里 `a0` 是显式参数 `o`，属性结果放入累加器，`AddSmi` 加立即数 1，最后返回。dump 的 parameter count=2 包含隐式 receiver，不代表源函数写了两个显式参数。`FBV[0]` 是反馈槽标注，不能与 E 的结构或命中路径直接等同。

## 指令怎么执行

QJS 的值栈在本例中依次为 `[o]`、`[3]`、`[3,1]`、`[4]`，然后返回。E 仍然是同一栈式解释器：改的是属性读取入口，并未把它改成 V8 的寄存器/累加器形式。

E 通过 site 0 找属性名和反馈记录。已建立合格 handler 且守卫成功时，可从当前属性槽取值；尚无反馈、没有命中或不支持时，保留普通查找与原语义。具体入口见冻结 `attempt03/engine/eic_opcodes.inc` 的 `GET_EIC`，改写见 `eic_prepare.inc`。本例没有测每步耗时，也没有做逐查询命中 trace。

本例在脚本运行之前实读 `eic_heat=0`、`feedback_vector_present=false`，但字节码已是 `get_field_eic`。因此新 opcode 的存在不等于已经缓存或命中。运行结束后的反馈状态未在此例捕获，仍为 UNKNOWN，不沿用失败方法冒充实测。

V8 将本例的常量加一放在 `AddSmi` 中；QuickJS 用 `push_1` 加 `add`。静态条数/字节数不是运行成本，不据此推断本例谁更快。

## E 修改范围与磁盘格式

冻结实现将最终字节码中的三类 5B 指令等宽替换：

```text
get_field  atom32 -> get_field_eic  site_index32
get_field2 atom32 -> get_field2_eic site_index32
put_field  atom32 -> put_field_eic  site_index32
```

属性名移入 metadata，保留真实 opcode 起始 PC；旁边的反馈结构另占内存。这里的等长不等于总内存相等。

从现有序列化实现/补丁可确认：写出时在输出副本中恢复原 opcode/atom，不把 runtime IC 指针和反馈写入磁盘；读入后重新 prepare。因此看 qjsc 保存形式可能看不到运行时的 `*_eic`。本例直接看内存形式；没有新增序列化测试，既有验证见主实验安全门禁。

## 原始输出和方法

- `bytecode/A.txt`、`E.txt`：从实际内存自动解码后的可读指令。
- `bytecode/A.entry2.live.json`、`E.entry2.live.json`：成功的原始内存字节、枚举 opcode、宽度、atom 和 metadata；读取时尚未执行脚本。
- `bytecode/V8_ON.full.txt`：d8 原生完整目标函数输出，含实际 opcode 字节及 constant-pool/反馈标注。
- `raw/{A,E,V8_ON}.correctness.json`：各自真实命令、退出码、stdout/stderr。
- `raw/{A,E}.gdb_entry_abi2.json`：成功 GDB 诊断命令及日志。
- `raw/V8_ON.help.json`、`raw/V8_ON.dump.json`：实际帮助和 dump 命令。
- `manifest.json`：最初身份/计划；其 `stages` 是初始尝试计划，**实际成功阶段以 `audit.json`、`method_resolution.json` 和成功 live JSON 为准**。

此前尝试帧入口源行时 `b` 被优化掉；释放函数被内联、没有独立符号；第一次 ABI 比较还遇到 GDB 将负 tag 返回为有符号值。失败文件保留。最终用实际存在的 `JS_CallInternal` 第一条机器指令，按 x86_64 SysV ABI 读取 caller_ctx、func_obj，遍历已编译根函数的常量池取得目标，避开优化局部变量。用 DWARF 枚举取得 opcode 数字，实际版本 header 取得宽度，从进程 atom table 解析属性名；没有调用 inferior helper 或修改 VM 源码。

## 复查命令

在 Windows PowerShell 中进入仓库后：

```powershell
wsl.exe -d Ubuntu -- python3 /mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/e_ic_bytecode_example/attempt01/run.py
```

脚本保留原始记录；已有捕获只读复用，不覆盖。需要全新诊断时，复制源脚本/示例到新的 attempt，不复制 raw/bytecode/manifest/audit。冻结 Linux runtime 必须仍在 manifest 所列路径且 SHA 匹配；不会自动下载或替换。
