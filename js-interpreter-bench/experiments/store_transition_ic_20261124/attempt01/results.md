# STORE_TRANSITION_IC 实测结果

新增写入快路在受控小例子上有效，在本轮 RayTrace / Tree 上没有一次新增 IC 命中。Tree 的时间确实下降，但诊断中原整函数构造快路覆盖也变化了，不能把它算成本写入 IC 的收益。

原 SPARSE 和候选均从冻结源码独立构建。CPU 2、C locale、Asia/Shanghai，GCC 原 Makefile Release；每项两版轮换，各 5 个新进程。计数与计时分开，首次调用计入，无额外热身。负数表示更快。

## Release 时间

| 项目 | 单位 | 原 SPARSE 中位数 [最小, 最大] | 候选中位数 [最小, 最大] | 相对变化 |
|---|---|---:|---:|---:|
| plain | ms / entire loop | 8643.5215 [8578.3222, 8897.5463] | 7801.5100 [7796.3004, 7831.4828] | -9.74% |
| plus_one | ms / entire loop | 7364.4386 [7341.7184, 7385.0505] | 5607.6564 [5596.1777, 5646.9523] | -23.85% |
| RayTrace.RayTrace | ms/Run | 27.5344 [27.4950, 27.7362] | 28.5493 [28.4587, 29.4125] | +3.69% |
| access-binary-trees | ms/Run | 7.7169 [7.6895, 7.8518] | 6.3849 [6.3620, 6.4174] | -17.26% |

微基准 N = 67,108,864。plain：每轮 Object.create(null)、写 pad、同一 writeX 位点新增 x；plus_one：每轮 new Calc(3)，构造体 this.pad=1; this.x=x+1。两版使用同一 JS 和输入，整段循环计时，不把对象创建成本排出去。null 原型用于建立符合本轮守卫条件的正例，不能拿这组替代真实负载。

### 每轮原始时间

| 项目 | 原 SPARSE 5 次 | 候选 5 次 |
|---|---|---|
| plain | 8897.5463, 8578.3222, 8581.2885, 8672.3949, 8643.5215 | 7796.3004, 7801.5100, 7801.2454, 7831.4828, 7828.9832 |
| plus_one | 7364.4386, 7341.7184, 7385.0505, 7369.2149, 7345.7524 | 5636.6103, 5607.6564, 5596.1777, 5606.0478, 5646.9523 |
| RayTrace.RayTrace | 27.4950, 27.5060, 27.7362, 27.5344, 27.5553 | 28.5493, 28.4846, 28.4587, 29.4125, 28.5768 |
| access-binary-trees | 7.8518, 7.6895, 7.7116, 7.7169, 7.7342 | 6.3828, 6.3905, 6.3620, 6.4174, 6.3849 |

## 原写入覆盖诊断

下表来自原脚本完整执行，含 Setup/校验；普通 put_field 与既有 put_field_shared 分开。“已有”指命中自有属性分支；AUTOINIT 重试在同一调用只计一次。新 IC 命中和旧全局转换表复用不是同一计数。

| 项目 / 版本 | 指令 | 执行 | 已有自有属性 | 新增自有属性 | 复用目标 shape | 其中无需扩容 | 新 IC 命中 |
|---|---|---:|---:|---:|---:|---:|---:|
| RayTrace.RayTrace / SPARSE | 普通写点（含本轮同长改写） | 25,125,950 | 172,816 | 24,953,134 | 24,916,179 | 16,854,706 | 0 |
| RayTrace.RayTrace / SPARSE | put_field_shared | 5,032,193 | 5,032,192 | 1 | 0 | 0 | 0 |
| access-binary-trees / SPARSE | 普通写点（含本轮同长改写） | 19,817,953 | 0 | 19,817,953 | 19,816,416 | 13,210,773 | 0 |
| access-binary-trees / SPARSE | put_field_shared | 0 | 0 | 0 | 0 | 0 | 0 |
| RayTrace.RayTrace / STORE_TRANSITION_IC | 普通写点（含本轮同长改写） | 25,125,950 | 172,816 | 24,953,134 | 24,890,006 | 16,865,323 | 0 |
| RayTrace.RayTrace / STORE_TRANSITION_IC | put_field_shared | 5,032,193 | 5,032,192 | 1 | 0 | 0 | 0 |
| access-binary-trees / STORE_TRANSITION_IC | 普通写点（含本轮同长改写） | 10,731,700 | 0 | 10,731,700 | 7,617,057 | 4,040,165 | 0 |
| access-binary-trees / STORE_TRANSITION_IC | put_field_shared | 0 | 0 | 0 | 0 | 0 | 0 |

RayTrace 原版有 16,854,706 次同容量复用；候选诊断有 16,865,323 次，全部在局部原型验证遇到未哈希布局，学习为 0。Tree 原版有 13,210,773 次；候选有 4,040,165 次，同样全部被未哈希原型拒绝。TreeNode 本身属于原构造模板，保留普通写指令；这些是机会诊断，不能报成新 IC 执行。没有强行把未哈希布局变成可信记录。

| 项目 | 原 SPARSE 旧构造尝试 / 命中 | 候选旧构造尝试 / 命中 |
|---|---:|---:|
| RayTrace.RayTrace | 8,524,292 / 0 | 8,524,292 / 0 |
| access-binary-trees | 10,770,432 / 4,164,533 | 10,770,432 / 7,193,284 |

Tree 的旧构造命中多了 3,028,751 次，恰好对应少执行 9,086,253 次构造体字段写入（三个字段）。本轮没有改构造算法、资格或淘汰；新增函数元数据和分配会改变内存/GC 条件，诊断用 C 分配还可能改变地址分布。Release 的具体构造次数没有混入计时测量，因此这里只报告路径变化，不用诊断比例精确拆解 Release 时间。

## 微基准的白盒证据

诊断 N=65,536。plain / plus_one：原版各进 add_property 131,072 次，候选各 5 次，少 131,067 次，等于新 IC 命中数。两组各发布 2 条计划，未替换。只看目标 x 写点：writeX 的 PC=2、Calc 的 PC=13，各执行 65,536 次、命中 65,534 次、发布 1 次。Calc 的旧整函数构造尝试 65,536 次、命中 0，所以这里确实是赋值快路在工作。

已有 x、需要扩容、交替布局三个对照，均没有误命中，值校验通过。resize 有 65,535 次复用目标但需要扩容，均回原路径；本版没有优化它。

验证程序的实际执行缓冲区（validation/*.fixture.run.json）展示单个 writeX 的：`PC 2 put_field_sti site=0 atom=x from_count=0 to_count=1 capacity=2 offset=0 depth=1`。这里 site=0 是旁表编号，offset=0 是对象属性槽号。对应原版同一 PC 是 put_field x；两条均 5 字节。

```c
if (p->shape != s->from) return 0;   /* 另有 class/exotic/extensible/容量守卫 */
for (int i = 0; i < s->depth; i++) {
    if (!proto || proto->class_id != JS_CLASS_OBJECT || proto->is_exotic ||
        proto->shape != s->chain[i]) return 0;
    proto = proto->shape->proto;
}
if (proto) return 0;
JSShape *old = p->shape;
p->shape = js_dup_shape(s->to);
p->prop[s->offset].u.value = val;
js_free_shape(ctx->rt, old);
```

代码为原实现关键行的节选（计数及拒绝分支省略）。命中时不查属性名、不逐层查描述符、不进入 add_property，也不探旧的全局 32 项转换表。它仍要做对象/布局/链条件比较、shape 引用交接，以及原栈对象释放。

## 验证和内存

A / SPARSE / 候选对照：已有 property_reads.js、safety.js，以及本轮原型 setter、只读、换链、删除、getter、Proxy、preventExtensions、对象 RHS/身份/副作用与大数字属性名。ASan/UBSan 通过。内部 fixture 还覆盖实际学习、守卫失败后原检查、可选记录 OOM、普通和 ROM 保存/加载、缓存-原型-函数环的 GC、发布后释放旧计划所触发的原生重入。ptrace 环境关闭 LSan；QuickJS FreeRuntime 断言保留。

JSRuntime 仍 2,216 B，JSShape 仍 56 B。JSFunctionBytecode 从 160 B 到 176 B（每函数 +16 B）；每个启用写点 64 B。另有只写且无原准备镜像的函数复制代码，不把它遗漏。RayTrace 记录累计请求/释放 7,808 B，额外代码复制 352 B；Tree 记录请求/释放 64 B，代码复制 0 B。未把这些请求量冒充进程堆净增量，保活的 shape/原型还会影响寿命。

## 完整基准与结论

用户追加要求后，两版现场交错跑完整 Octane / SunSpider，各项各 1 个进程，原输入/N/校验和计时边界不变。

| 套件 | 整体 GM 变化 | 改善 / 回退 |
|---|---:|---:|
| octane | +3.25% | 0 / 17 |
| sunspider | +2.62% | 5 / 21 |

[全部 43 项时间、GM、逐项和](full_confirmation01/results.md)，[原始逐项时间](full_confirmation01/raw_timings.csv)。Octane 按 14 suite 分层等权，SunSpider 按 26 项等权。单轮筛选，不替换默认版。

新快路省写入工作的证据在受控微基准成立；RayTrace / Tree 没有实际新增快路覆盖。即使 Tree 的总体时间下降，也不能据此说本写入 IC 的命中有收益。本轮停在这个范围，不放宽未哈希守卫、不继续调策略、不 push。

交付：[独立补丁](SPARSE-to-STORE_TRANSITION_IC.patch)、[运行和设计说明](README.md)、[原始 5 轮计时](raw_timings.csv)、[写入诊断](write_profile.csv)、[主要拒绝位点](top_rejected_sites.csv)。开发版本只归档，不混入正式表。
