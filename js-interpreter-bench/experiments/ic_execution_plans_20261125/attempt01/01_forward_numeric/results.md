## 1. 把包装与三字段数值初始化编成计划

正式输入始终是原 RayTrace，N=128，内部 checkNumber===2321 校验保留。没有使用手工改写成直接构造器的 JS。先从实际执行缓冲区确认 wrapper 为 22 字节；两种 initializer 都为 42 字节，具体见 bytecode_raytrace/method.txt。`special_object 1` 是本源码的 MAPPED_ARGUMENTS；零形参包装器仍会物化参数对象。

两种数据流分别识别：先规范化三参数再写字段；每个字段右侧用分支选参数或零。字段名、参数下标、默认零从字节码取出。热命中仍检查当前 callee/new.target、prototype、initializer 和内置 apply 的当前值、数值类型与原型链写入资格。读取描述符不调用 getter；同 shape 换函数值也会失配。NaN、+0、−0 使用原默认常量，其余类型走原路径。

正常构造成功后验证实际 final shape：三个字段、插入顺序、普通可写描述符均须一致。只持有这个实际结果布局，不再要求全局表里存在空 initial shape。计划绑在 new 位点，一个共享的 wrapper 字节码不会把所有构造目标混在一个 wrapper-body 槽里。原 R3 正计划仍然保留。

旧路径：普通构造 → wrapper → arguments → 原生 apply → 参数列表 → initializer → 三次 put_field。新命中：检查当前条件 → 用 final shape 创建实例 → 三次数字槽写 → 返回对象。这里的实例创建仍使用原 JS_NewObjectFromShape，仍有对象头和属性数组两次分配；没有混入第三项的连续分配。

实际提交代码节选，前面的身份、类型、原型写入和预算守卫未在此重复：
```c
*out=JS_NewObjectFromShape(ctx,js_dup_shape(p->final),JS_CLASS_OBJECT,NULL);
if(JS_IsException(*out)){NP_COUNT(s,18);return 1;}
JSObject*o=JS_VALUE_GET_OBJ(*out);
for(unsigned n=0;n<3;n++)
    o->prop[n].u.value=np_value(args[p->recipe.fields.arg[n]],p->recipe.zero[n]);
```

两次原构造入口之外，本路径还省掉原生 apply 和 initializer 的调用入口，保留四次 poll；有 interrupt hook 时回原路径。GC 预算仍复用 plan_base，不在可能执行原生 finalizer 的 GC 后信任旧守卫。分配失败按原快路异常出口清理，不重新构造。

### 实际少执行了什么（独立计数，只计 Run）

| 版本 | wrapper 帧 | initializer 帧 | arguments 物化 | 匹配 initializer 的 put_field | 原生 apply 帧 | 参数列表构建 | 新计划提交 |
|---|---:|---:|---:|---:|---:|---:|---:|
| SPARSE | 8,524,032 | 6,571,520 | 8,524,032 | 19,714,560 | 6,571,520 | 6,571,520 | 0 |
| OLD_FORWARD | 8,524,032 | 6,571,520 | 5,277,952 | 19,714,560 | 6,571,520 | 3,325,440 | 0 |
| NUMERIC_PLAN | 1,952,543 | 31 | 1,952,543 | 93 | 31 | 31 | 6,571,489 |
| NUMERIC_OFF | 8,524,032 | 6,571,520 | 8,524,032 | 19,714,560 | 6,571,520 | 6,571,520 | 0 |

实际少进入 wrapper / initializer 各 6,571,489 / 6,571,489 次；arguments 少物化 6,571,489 次，对应普通字段写少 19,714,467 次。是从真实解释器入口记录得到，不用机会数冒充命中。

NUMERIC_OFF 与 NUMERIC_PLAN 使用同一 ELF、同样的学习和守卫，只用 QJS_NUMERIC_ENTRY_OFF=1 关闭提交。其计数确认普通帧、参数对象和写入全部回来；计时仍用未插桩 Release。

| 表项 | 版本 | 中位 ms/Run | 相对本批 SPARSE | 最小—最大 |
|---|---|---:|---:|---:|
| RayTrace.RayTrace | SPARSE | 27.64231 | +0.00% | 27.53273—27.98888 |
| RayTrace.RayTrace | OLD_FORWARD | 26.43498 | -4.37% | 26.35755—26.59858 |
| RayTrace.RayTrace | NUMERIC_PLAN | 14.92197 | -46.02% | 14.88271—15.04162 |
| RayTrace.RayTrace | NUMERIC_OFF | 30.91681 | +11.85% | 30.84086—31.14565 |

| 表项 / 版本 | 5 次原始 ms/Run | 每一对候选 / SPARSE |
|---|---|---|
| RayTrace.RayTrace / SPARSE | 27.64231, 27.81426, 27.53476, 27.98888, 27.53273 | 1.000000, 1.000000, 1.000000, 1.000000, 1.000000 |
| RayTrace.RayTrace / OLD_FORWARD | 26.39107, 26.35755, 26.48811, 26.43498, 26.59858 | 0.954734, 0.947627, 0.961988, 0.944481, 0.966071 |
| RayTrace.RayTrace / NUMERIC_PLAN | 14.88271, 15.04162, 14.92197, 14.94896, 14.88735 | 0.538403, 0.540788, 0.541932, 0.534103, 0.540715 |
| RayTrace.RayTrace / NUMERIC_OFF | 30.91681, 30.91301, 31.14565, 30.84086, 31.12452 | 1.118460, 1.111409, 1.131139, 1.101897, 1.130455 |

### 两个最热的新位点

| 原脚本位置 | new 的 PC | 提交 | 省掉的字段写 |
|---|---:|---:|---:|
| RayTrace.js:661 | 85 | 1,671,423 | 5,014,269 |
| RayTrace.js:932 | 20 | 1,524,735 | 4,574,205 |

第一个是 Vector.subtract 返回新 Vector，三个已经算好的差值作为数值实参；第二个是 IntersectionInfo.initialize 创建 Color(0,0,0)。两者都能省掉整段 wrapper/apply/initializer。第二个即使三个参数都是假值零，仍要保留默认常量及插入顺序。这里按成功提交数选两个最热位点，没有把它们单独编造成未测过的毫秒贡献。

按 PC 的识别、数值资格、发布与首个拒绝原因在 01_forward_numeric/site_counts.csv；原始完整数组及三版 VM 工作计数在 counts02/。每个 new 位点多 8B（FourSite 32→40B）；成功学习的 NumericPlan 为 168B，含 104B 配方。wrapper/initializer/apply 和 final shape 按现有引用规则保活，借用的 atom 由所持函数/布局保活。同一 wrapper 的 initializer/apply 改写后先回原路径，本轮不另做热刷新策略。


[全集和总表](../results.md)
