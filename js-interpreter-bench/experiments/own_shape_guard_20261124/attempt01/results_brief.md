# OWN_SHAPE_GUARD 本轮结果

结论：两版都没有明显的整体收益。RELAX_CLASS 几乎持平，SHAPE_ONLY 在 SunSpider 略慢。保留代码和数据，不替换冻结 SPARSE。

## 完整基准：相对同批现场 SPARSE

| 版本 | Octane GM | SunSpider GM |
|---|---:|---:|
| RELAX_CLASS | -0.15% | -0.05% |
| SHAPE_ONLY | -0.03% | +0.72% |

每版每项一个新进程，输入/N/校验不变；Octane 14 suite 分层等权、SunSpider 26 项等权。负数更快，单轮筛选。RELAX_CLASS 最大回退 Crypto.Decrypt +2.03%；SHAPE_ONLY 最大回退 3d-cube +4.21%。

## 这次到底改了什么

- RELAX_CLASS：真实自有数据读不再要求 class 必须是普通 Object，仍检查非 exotic 与 shape。
- SHAPE_ONLY：独立从 SPARSE 派生，命中只检查对象 tag 与已填自有记录的 shape。填槽前仍必须确认真实自有数据描述符与已哈希布局。
- 方法读取 get_field2_rdi、原型 IC、写入和构造路径没改；字节码和记录尺寸没改，新增元数据 0B。

实际 SHAPE_ONLY 融合命中源码节选：

```c
if (site->shape == object->shape) {
    *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);
    pc += 5;
    break;
}
```

原来在 shape 前还查 class 和 exotic；现在把这两项去掉。取当前槽值、引用处理和失配回退照旧。Release 汇编确实少了相应比较与条件跳转，Callgrind 融合读的整进程指令数少 0.81% / 1.02%，但不是同样幅度的时间收益。

## 两个问题的答案

1. 稳定普通对象：5 次中位数，融合读 RELAX_CLASS −0.28%、SHAPE_ONLY −0.67%；非融合读 +0.22% / +1.84%。没有清楚的普遍改善。
2. 新类别：诊断各读 65,536 次，函数和 RegExp 在两版都从 0 命中变成 65,535；数组仅 SHAPE_ONLY 达到 65,535。相应 Release 小测试函数快约 5%、RegExp 快约 5%、SHAPE_ONLY 数组快 6.74%。但真实 RegExp / Gameboy / Typescript 的新增类别命中均为 0；exec 是继承方法读取，不走这次改的自有字段路径。

定向五轮真实时间：Gameboy −1.66% / −1.69%，Typescript −1.23% / −1.45%。因此按原条件进入全集；全集并未给出相近的整体提升。SHAPE_ONLY 的 Gameboy 单轮 +0.28%，与定向结果不一致，原样保留。

A/SPARSE 差分、getter/删除/Proxy/数字属性、同 shape 跨类别、GC 和 ASan/UBSan 均通过。

[完整说明与复现命令](results.md) · [43 项逐项表和耗时之和](full_confirmation01/results.md) · [原始计时](raw_timings.csv) · [布局依据](layout_proof.md) · [RELAX_CLASS 补丁](SPARSE-to-RELAX_CLASS.patch) · [SHAPE_ONLY 补丁](SPARSE-to-SHAPE_ONLY.patch)
