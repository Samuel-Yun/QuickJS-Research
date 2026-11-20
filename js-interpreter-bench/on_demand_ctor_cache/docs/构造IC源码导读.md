# 跟着 Pair 看构造 IC

这次只看一条路径：`new Pair(x, y)` 如何从普通构造变成缓存计划构造。源码对应冻结的“按需构造缓存”版本。代码节选重新排版、增加了说明性注释；完整检查条件以 `modified/` 中的源码为准。

## 1. 要优化的 JS 做了什么

来自 `tests/bytecode_demo.js`：

```js
function Pair(x, y) {
    this.x = x;
    this.y = y;
}
function construct(x, y) {
    return new Pair(x, y);
}
```

`new Pair(3, 4)` 要产生一个对象，字段 x 为 3、y 为 4。反复调用时，值可以变，写字段的方式和对象布局往往不变。

构造计划记住的是：

| 字段 | 从哪里取值 | 在本例结果对象的哪个属性槽 |
|---|---|---:|
| x | 第 0 个实参 | 0 |
| y | 第 1 个实参 | 1 |

这里保存字段到实参的映射和结果布局，没有把 3、4 固定成返回结果。下一次调用使用下一次的实际参数。

## 2. 缓存放在哪里

看 `modified/four_runtime.inc` 开头：

```c
typedef struct FourRecipe {
    JSAtom atom[8];    // 字段名称的内部编号
    uint16_t arg[8];   // 每个字段对应第几个实参
    uint16_t n;        // 字段数量，最多 8 个
} FourRecipe;
```

本例的 recipe 相当于 `atom=[x,y]`、`arg=[0,1]`、`n=2`。`JSAtom` 是名称的内部表示，读这里时先理解成“字段名编号”即可。

每个静态 new 位点有一个 `FourSite` 小记录，里面有 `FullPlan *plan`。这个指针为空，表示还没有完整计划；学到合格计划后才另分配 `FullPlan`。

`FullPlan` 里比较关键的内容是：

```c
JSValue callee;          // 记住是哪一个构造函数
JSShape *initial,*final; // 起始布局和结果布局
FourRecipe recipe;      // 字段从哪些实参取得
```

shape 可以先理解成对象的“布局说明书”：包括原型、字段描述和排列。字段的实际值保存在对象自己的属性数组中。

## 3. 学习：确认 Pair 真的符合模板

先看 `four_runtime.inc:30` 的 `plan_recipe`。它读的是最终字节码，不是搜索 JS 文本。

本例 Pair 的实际字节码如下，两版相同：

```text
000000  push_this
000001  put_loc0
000002  get_loc0
000003  get_arg0
000004  put_field x
000009  get_loc0
000010  get_arg1
000011  put_field y
000016  return_undef
```

可以按赋值理解：取 this、取参数、写字段；再取 this、取另一个参数、写另一个字段。

解析器中最直接的两行是：

```c
r->atom[r->n] = atom;
r->arg[r->n++] = index;
```

它们把“写哪个字段、取哪个参数”加入 recipe。前面的检查确保只接受简单参数写字段，不把任意 JS 构造函数当成这个模板。

随后看 `plan_learn`（第 97 行）。它在普通构造成功后检查真实结果：对象类别、原型、字段数量、顺序、属性 flags 等都符合要求，才发布计划。发布的核心赋值为：

```c
s->callee = JS_DupValue(ctx, callee);
s->initial = js_dup_shape(initial);
s->final = js_dup_shape(o->shape);
s->recipe = r;
```

也就是说，先通过真实构造确认，再记住目标、布局和映射。暂时条件不满足时可能仍然学不到计划，并不保证第一次调用就学会。

## 4. 命中：最值得先读的几行 C

重点看 `four_runtime.inc:127` 的 `plan_try`。

它首先确认当前构造目标仍是记录里的函数，并调用 `plan_base`、`plan_proto`、`plan_chain` 检查调用条件、原型和字段写入资格；保留中断轮询。这些检查都通过后，执行：

```c
*out = JS_NewObjectFromShape(
    ctx, js_dup_shape(s->final), JS_CLASS_OBJECT, NULL);
```

直接按已知的最终布局创建对象。这一步仍然分配对象和属性数组。分配异常会立即返回异常，代码不会再普通构造一次。

分配成功之后：

```c
JSObject *o = JS_VALUE_GET_OBJ(*out);
for (unsigned i = 0; i < s->recipe.n; i++)
    o->prop[i].u.value = JS_DupValue(ctx, args[s->recipe.arg[i]]);
```

代入 Pair 的 recipe，就很好理解：

```text
i=0：对象属性槽 0 ← args[0]，得到 x=3
i=1：对象属性槽 1 ← args[1]，得到 y=4
```

`JS_DupValue` 保留要存入字段的值；对于带引用的值，它增加引用，保证调用结束清理实参后，字段里的值仍然有效。这里不是深复制整个对象。

这样省掉了普通构造调用入口、构造器解释帧、逐条解释赋值指令和逐次新增字段的工作。对象分配、引用管理以及必要检查还在。

## 5. 从哪里进入这条快路

`four_prepare.inc` 为 new 位点建立记录，并把 `call_constructor argc` 改成同长度的 `four_ctor record_index`。本例实际 argc 仍是 2，存放在记录里。

`quickjs.c:18329` 的 `OP_four_ctor` 大致按下面顺序工作：

```text
取出该位点的记录
    ↓
four_ctor_try → plan_try
    ├─ 成功：获得新对象，完成调用栈清理
    └─ 失败：执行原 JS_CallConstructorInternal
                 ↓
             成功后尝试学习计划，或记录确定不支持的目标
```

这是流程说明，异常、值释放等完整逻辑仍看原文件。

## 6. “按需”和“负缓存”分别在哪

- `plan_learn`：只有真的学到合格计划时才分配完整 `FullPlan`；没有计划的位点保留小记录。
- `sparse_runtime.inc:15`：当前目标等于负缓存目标时，跳过重复判型。
- `sparse_runtime.inc:22`：仅记住确定不支持模板的目标。负命中后仍执行普通构造；它与上面的正计划快路是两回事。

## 7. 本次运行看到的结果

2026-11-19 执行：

```bash
python3 tools/bytecode.py tests/bytecode_demo.js --engine both --function Pair --function construct
```

两版均输出 `sum=700`。循环 100 次，每次取 x+y=7，所以结果是 700。

`construct` 的实际入口差异：

| offset | A | 按需构造缓存 |
|---:|---|---|
| 0 | get_var 0 (Pair) | get_var 0 (Pair) |
| 3 | dup | dup |
| 4 | get_arg0 (x) | get_arg0 (x) |
| 5 | get_arg1 (y) | get_arg1 (y) |
| 6 | call_constructor 2 | four_ctor record[0] argc=2 |
| 9 | return | return |

按需版还输出：

```text
record[0] pc=6, argc=2, 正计划=True, 负目标=False
```

这证明此位点已学到正构造计划；快照本身不提供具体命中次数。Pair 函数体的字节码仍然相同，优化发生在 new 的调用入口，命中时由 C 快路完成构造。

本次完整输出在 `bytecode_runs/20261119_223026_823441/`。这是源码和执行入口的演示，未把诊断构建时间当作性能成绩。

## 建议的阅读顺序

先读 `plan_try` 的对象创建和填槽几行，再回头看 `plan_recipe` 怎么得到映射，接着看 `plan_learn` 如何发布计划，最后看 `OP_four_ctor` 的回退与清理。第一遍可先略过诊断计数宏，集中理解真正执行的操作。
