# 源码、窄计数和机器码

## d03 的实际改动

`patches/d03.patch` 修改 quickjs.c 的八种短参数/局部变量加载。缓存记录仍为16字节。下面是真实宏中相邻的关键行，省略了慢路和外围 do/while。

```c
JSValueConst receiver = (slot);
if (*pc == OP_get_field_rdi && JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {
    JSObject *object = JS_VALUE_GET_OBJ(receiver);
    ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));
    if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic &&
        site->shape == object->shape) {
        *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);
        pc += 5;
        break;
```

`slot` 仍持有对象。该区间没有分配、getter、Proxy 或用户回调。返回值仍 Dup，字段值改变后读取当前值。原 `get_field2_rdi` 方法语义没有被融合。两种不同布局与换值的走读见 walkthrough.md，源码可由 `python recover.py d03 --destination NEW_DIRECTORY` 恢复，32文件 SHA256 已逐项核验。

## 字节码与执行次数

独立诊断源于对应正式源码，新增计数只在诊断制品。字节码生成/prepare规则保持对应版本的实现。`site(o){return o.value;}` 的准备后字节码长度均为7字节。

| 版本 | 实际字节 | 说明 |
|---|---|---|
| d03诊断 | `cf f4 06 00 00 00 28` | get_arg0=207，get_field_rdi=244，最后return |
| d04诊断 | `fa f4 06 00 00 00 28` | 第一条改为准备后rdi_get_arg0=250，后续字段与偏移保留 |
| e02诊断 | `cf f6 06 00 00 00 28` | 运行后字段读取变为rdi_immediate=246 |

d03 沿用 s001 的 bytecode compiler、opcode定义与prepare源码，变化发生在解释执行 handler。d04 会改变准备后的首个opcode，写出时恢复原编码，第二条独立跳转入口保留。完整保存加载/qjsc专项验收尚未执行，当前结论限于已完成的检查。

d03/d04 的微测试都先经历不同shape，再固定对象，记录到999次融合。原始 Richards 用与恢复批次相同 SHA256 的完整脚本、N=1024，两个诊断制品均记录142849974次。范围为整进程，包含 Setup 和 driver，不能当作单 Run 或单源码位置的精确次数。数值控制两个制品均为0。文件为 `probe.d03.json`、`probe.d04.json`、`fusion_count.d03.json`、`fusion_count.d04.json`。

## 正式制品机器码

`native.s001.json`、`native.d03.json` 由 frozen ELF 的256项 dispatch table 解析207/195号入口，再读取入口起始192字节。地址由该制品自身解析，没有沿用别的binary地址。

```text
s001 get_arg0 0x2471f
  24735: cmp $0xfffffff6,%eax
  2473a: addl $0x1,-0x4(%rdx)

d03 get_arg0 0x2471f
  2472a: cmpb $0xf4,(%r12)
  2473a: je 29d58 <JS_CallInternal+0x7278>
```

s001 段显示原加载中的类型判断和引用增加。d03 段显示下一条 opcode 检查与其条件分支。192字节片段可能含相邻块，未覆盖远处全部分支，也没有直接证明正式样本逐次走哪条分支。动态路径证据来自独立计数。静态代码、动态频率与总耗时保持分开。

## 其他路线的真实核验

| 诊断 | 观察 |
|---|---|
| a02 | primary16B，side40B，目标缓存占4槽 |
| b03 | primary16B，共享动作side32B，目标缓存占4槽 |
| c02 | prototype记录安装成功，3次命中，getter重定义后epoch改变，结果保持正确 |
| e02 | 无引用结果专用opcode实际建立 |
| f01 | 预解码frame大小与当前函数元数据计算一致 |

d03/d04 的 JSFunctionBytecode 为144B，a02/b03/c02/f01为152B。c02 的 JSRuntime 为1448B，其余所测为1440B。所测 JSObject 均为64B，c02 的watch位在此编译中未增大对象结构。结构大小没有计入间接保活和分配器/RSS代价。

这些探针限于自己的小程序。它们确认机制实际建立，不能推广为全部 Octane site 的命中率或内存峰值。正式时间使用未插桩的冻结 binary；诊断时间只留作过程记录。

## 待验证解释

融合在有实际命中的字段读取中可能减少 dispatch 与临时引用操作，而八类普通短加载都要承担额外 lookahead。Richards 出现大量成功融合，数值控制没有。SunSpider 的 crypto-sha1 回归与这种非目标成本相容，但尚未取得该case完整的尝试/成功次数或独立的成本分解。编译器寄存器分配、代码位置和分支布局仍可能参与。

d05 只保留arg0/loc0，正是检验覆盖与检查开销的缩减对照。它的当前性能数据不完整，任何整体收益结论均为 UNKNOWN。
