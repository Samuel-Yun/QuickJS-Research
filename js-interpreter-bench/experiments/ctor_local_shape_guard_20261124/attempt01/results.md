# CTOR_LOCAL_SHAPE_GUARD：局部 shape 守卫实验

**结果：原白盒和 Boyer 的局部守卫覆盖都是 0，省下的按名查找是 0。五轮 Release 计时反而退化，不跑全集，不替换 SPARSE。**

唯一底座为 on_demand_ctor_cache/modified 的冻结 SPARSE（06aada4）。只增加可选局部记录，保留单槽、initial shape 门槛、原对象分配、GC 条件和两次中断检查；无全局 epoch，无其他优化叠加。

## 为什么没有真实覆盖

普通函数的 prototype 是 AUTOINIT 属性。第一次实例化会经过 js_shape_prepare_update，把函数布局变成未哈希。按本轮要求，这样的函数不能建立局部记录。Boyer 的 1,863 次计划发布全部被这一关拒绝，已有约 821 万次正命中仍走完整检查。
class 的实际最终字节码包含 check_ctor、class_fields_init 等，原 R3 模板本来就不支持。没有扩大模板、没有重新哈希真实 benchmark 的构造器。实际 class 字节码证据在 class_bytecode/。

## 同批 5 次正式计时

| 用例 | 原 SPARSE 中位数 ms（范围） | 新版中位数 ms（范围） | 变化 |
|---|---:|---:|---:|
| 原白盒高正命中循环 | 3686.4569（3674.4752–3691.0495） | 3778.0540（3770.3032–3950.1260） | +2.48% |
| Octane Boyer | 54.6709（54.5769–54.9541） | 57.3133（57.2021–57.4092） | +4.83% |

白盒 N=67,108,864，单位为整段循环 ms；完全复用 sparse_whitebox_20261116 的 ctor.js positive/100 输入。Boyer 单位 ms/Run，使用原输入与固定 N、Setup/Run 边界。每版每项 5 个新进程、交替先后顺序，CPU 2、C locale、Asia/Shanghai，首次 Run 计入。时间只来自未插桩 Release。未丢弃白盒新版第五轮的较慢样本。历史 3,677 ms 未作为基线。

### 五个原始时间（按轮次）

| 用例 | 版本 | 第1轮 | 第2轮 | 第3轮 | 第4轮 | 第5轮 |
|---|---|---:|---:|---:|---:|---:|
| 原白盒高正命中循环 | SPARSE | 3676.2519 | 3691.0495 | 3686.4569 | 3690.9611 | 3674.4752 |
| 原白盒高正命中循环 | CTOR_LOCAL_SHAPE_GUARD | 3770.3032 | 3784.1436 | 3778.0540 | 3776.4036 | 3950.1260 |
| Octane Boyer | SPARSE | 54.8530 | 54.5769 | 54.9541 | 54.6709 | 54.6537 |
| Octane Boyer | CTOR_LOCAL_SHAPE_GUARD | 57.4092 | 57.2469 | 57.3588 | 57.3133 | 57.2021 |

## 独立计数：实际省掉的工作

| 用例 | 版本 | 正命中 | 记录发布 | 新记录建成 | 局部守卫正命中 | 回完整检查 | 热路径 prototype 按名查找 | 热路径 chain 按名查找 |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| whitebox | SPARSE | 65,534 | 1 | 0 | 0 | 65,534 | 65,534 | 262,136 |
| whitebox | CTOR_LOCAL_SHAPE_GUARD | 65,534 | 1 | 0 | 0 | 65,534 | 65,534 | 262,136 |
| EarleyBoyer.Boyer | SPARSE | 8,211,401 | 1,863 | 0 | 0 | 8,211,401 | 8,211,401 | 32,845,604 |
| EarleyBoyer.Boyer | CTOR_LOCAL_SHAPE_GUARD | 8,211,401 | 1,863 | 0 | 0 | 8,211,401 | 8,211,401 | 32,845,604 |
| access-binary-trees | SPARSE | 4,164,533 | 198 | 0 | 0 | 4,164,533 | 4,164,533 | 24,987,198 |
| access-binary-trees | CTOR_LOCAL_SHAPE_GUARD | 4,164,533 | 198 | 0 | 0 | 4,164,533 | 4,164,533 | 24,987,198 |

计数覆盖整个脚本，包括 Setup/校验，和正式时间分开。白盒诊断 N=65,536；两个真实用例使用原 N。三个用例的新版本都没有局部记录，因此局部记录覆盖率、局部守卫尝试/成功/失败、新增记录分配和 shape 引用持有全部为 0；正命中仍回完整检查。
Tree 另有 6,605,699 次在构造前找不到 initial shape，尚未进入学习阶段；成功发布的 198 次也全部因构造函数未哈希而不建记录。没有添加 INIT_FREE 对照，因为即使解决空 shape，当前函数布局条件仍会拒绝，不把两个实验混在一起。

## 守卫分支和生命周期是否正确

普通 JS 差分：与 A / 原 SPARSE 比较 prototype 替换、直接/上层 setter、只读字段、删除、换链、未哈希布局、Proxy、异常；20 组对照通过。原生命周期、多 realm、显式 GC 测试通过，候选 ASan/UBSan 通过。没有修改字节码或序列化表示。
由于真实 JS 用例没有满足构造函数哈希条件，另用 shape_guard_fixture.c 在**测试中**复制并正确哈希已经物化的布局，专门覆盖这些分支。它不进入任何 benchmark qjs，不改变构造模板，不算真实覆盖或性能收益。
- 测试守卫成功 1,778 次、失败 28 次；失败后完整检查接受 20 次、拒绝 8 次。完整检查接受时仍走正计划，且未刷新记录。
- 强制只让额外记录分配失败：记录建成 0，原正计划仍命中 127 次，JS 构造结果正确。
- 16 份记录全部释放；48 份 shape 引用全部归还。同一 shape 下替换 prototype 当前值、函数/原型布局改变、setter/只读/删除/换链与两 realm GC 均通过。

## 内存和编译结果

FourSite 仍为 32 B。FullPlan 从 96 B 到 104 B，原 callee/initial/final/recipe 的偏移不变；可选记录为 48 B。带记录时计划 payload 合计 152 B，比原来多 56 B；不带记录的正计划也多 8 B。本机 QuickJS 小块分配头是 8 B，包含新增记录的分配头后，带记录的计划实际占用块合计增加 64 B；不含 arena 空闲容量或额外保活的 shape 图。记录最多额外持有 5 份 shape 引用（函数＋4 层），记录申请失败不影响原计划。
Release 汇编显示：原 plan_try 内联进 JS_CallInternal，新版生成独立 plan_try 入口，调用处多了 call。这是本次编译结果中可见的变化；没有再强行 inline 或调布局来救成绩。证据在 assembly/ 和 callgrind/*.symbols.txt。

## Callgrind：指令数单独看

| 版本 | 整段脚本 Ir | plan_proto 自身 Ir（含内联查找） | plan_chain 自身 Ir（含内联查找） |
|---|---:|---:|---:|
| SPARSE | 93,351,382 | 1,835,008 | 6,750,208 |
| CTOR_LOCAL_SHAPE_GUARD | 94,925,909 | 1,835,008 | 6,750,208 |

相同原白盒脚本、N=65,536，整段指令数 +1.69%；原型按名检查的指令数没有减少。使用同一对未插桩 Release，Callgrind 时间不作为速度结论。基线 plan_try 没有独立机器码入口，不能用它作两版共同的函数入口开关；因此完整采集后按函数/source attribution 列出目标路径。

## 实际 C 代码：命中检查

```c
static force_inline int local_shape_guard_matches(JSObject *f, FullPlan *s)
{
    LocalShapeGuard *g = s->local;
    if (f->shape != g->callee_shape || !f->shape->is_hashed) return 0;
    JSValueConst value = f->prop[g->prototype_offset].u.value;
    if (JS_VALUE_GET_TAG(value) != JS_TAG_OBJECT ||
        JS_VALUE_GET_OBJ(value) != s->final->proto) return 0;
    JSObject *p = JS_VALUE_GET_OBJ(value);
    for (unsigned i = 0; i < g->depth; i++) {
        if (!p || p->class_id != JS_CLASS_OBJECT || p->is_exotic ||
            p->shape != g->chain[i] || !p->shape->is_hashed) return 0;
        p = p->shape->proto;
    }
    return p == NULL;
}
```

函数 shape 相同后仍读取 prototype 槽的当前值，再逐层核对实际原型链和终点。plan_validate_proto 在记录缺失或此函数返回 0 时执行原 plan_proto + plan_chain；原检查通过，这次仍使用正计划。

## 最终回答

1. 真实用例省了多少次按名查找？**0 次**。原白盒、Boyer、Tree 的热路径查找次数均没有下降。
2. 多少原有正命中符合局部守卫？**0%**。新记录在学习时全部被构造函数的未哈希布局拒绝。
3. 未插桩 Release 是否变快？**没有**。五轮计时白盒与 Boyer 均退化，未继续跑全集。

Boyer 没有局部守卫覆盖或定向计时未显示可复现收益，停在定向实验，不跑全集。

源码证明：[source_evidence/proof.md](source_evidence/proof.md)；相对冻结 SPARSE 的独立补丁：`SPARSE-to-CTOR_LOCAL_SHAPE_GUARD.patch`；复现命令：[REPRODUCE.md](REPRODUCE.md)；原始计时 `timing/*.run.json`、`raw_timing.csv`；原始计数 `counts/*.counts.json`。
