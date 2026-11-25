# 三种解释器 IC 执行路径实验

三个 idea 都已独立实现、构建和测量。第一个在 RayTrace 有明确收益；另外两项虽省了工作，定向耗时没有变快。四个候选均从冻结 SPARSE 派生，比较的 FIRST/FULL 是同一识别器的两个配置。没有叠加，不改 benchmark 算法，不引入 JIT，不替换冻结版，不 push。

| 候选 | Octane 相对历史 SPARSE | SunSpider 相对历史 SPARSE | Octane 相对 A | SunSpider 相对 A |
|---|---:|---:|---:|---:|
| NUMERIC_PLAN | -3.61% | +1.64% | -11.19% | -2.22% |
| COMPARE_FIRST | +0.44% | +0.15% | -7.46% | -3.66% |
| COMPARE_FULL | +0.24% | -0.22% | -7.64% | -4.01% |
| COALLOC | +1.75% | +2.31% | -6.25% | -1.57% |

负数是耗时减少。完整基准各候选每项一个新进程；A、SPARSE、V8_ON 沿用已有成绩，因此这张总表是跨批次单轮筛选。父版 SPARSE 用最近 own_shape_guard/full_confirmation01 的冻结版本现场数据；A/V8 是 native_confirmation 的 30 轮中位数。旧发表的 SPARSE 时间也在 CSV 中保留。Octane 14 suite 分层等权 GM，SunSpider 26 项等权 GM，全部项目保留，不把两套 GM 合成一个数。

[A / SPARSE / 四个候选 / V8 --jitless 全部逐项 ms/Run 与耗时之和](full01/results.md) · [逐项 CSV](full01/comparison.csv)

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

## 2. 数字比较直接选择分支

Splay 最终镜像：PC41 加载 key，PC43 读 current.key，PC48 lt，PC49 的假边到136；PC138 再读 key，PC143 gt，PC144 的假边到229。因此目标为 L=51、G=146、E=229。识别器按局部/参数绑定、atom 和实际跳转目标匹配，沿假边检查第二段，不按函数名启用。

FIRST/FULL 识别完全相同的位点。替换首条 load 时保持原指令长度，其他指令与入口保留，跳转无需重定位。守卫失败前不动栈，单一 miss 出口执行原 first load 的 DupValue/压栈，再接回原余下指令。命中借用两个绑定，检查普通 own 数据 IC、两个真实 Number，再读一次槽；C 的 < / > 给出目标 PC，NaN 进 E。getter/valueOf 输入回原序列，可以读两次。

```c
if(x<y)*next=s->left;
else {
#if COMPARE_REUSE
    *next=x>y?s->right:s->equal;
#else
    *next=s->second;
#endif
}
```

| 版本 | 第一比较 | 假边 | Number/布局通过 | 真实二读 | 少读 | 少 dispatch |
|---|---:|---:|---:|---:|---:|---:|
| COMPARE_PROFILE | 4,552,149 | 2,657,559 | 2,457,517 | 2,657,559 | 0 | 0 |
| COMPARE_FIRST | 4,552,149 | 2,657,559 | 2,457,517 | 2,657,559 | 0 | 9,830,068 |
| COMPARE_FULL | 4,552,149 | 2,657,559 | 2,457,517 | 1,282,612 | 1,374,947 | 16,704,803 |

布局/记录守卫回退 2,094,632 次；这些调用多做新入口探测后仍走原序列。新入口还要通过 PC 映射取记录、读取动态绑定下标。少 dispatch 的收益没有抵消这些成本，5 对 Splay 结果为回退。保存约1670万次 dispatch 是这组入口的局部计数，不是整段程序指令数下降同样比例。

| 表项 | 版本 | 中位 ms/Run | 相对本批 SPARSE | 最小—最大 |
|---|---|---:|---:|---:|
| Splay.Splay | SPARSE | 1.34268 | +0.00% | 1.33133—1.37368 |
| Splay.Splay | COMPARE_FIRST | 1.35095 | +0.62% | 1.34427—1.38677 |
| Splay.Splay | COMPARE_FULL | 1.36789 | +1.88% | 1.36718—1.39261 |

| 表项 / 版本 | 5 次原始 ms/Run | 每一对候选 / SPARSE |
|---|---|---|
| Splay.Splay / SPARSE | 1.34268, 1.33731, 1.37368, 1.33133, 1.36068 | 1.000000, 1.000000, 1.000000, 1.000000, 1.000000 |
| Splay.Splay / COMPARE_FIRST | 1.38677, 1.35665, 1.34861, 1.34427, 1.35095 | 1.032833, 1.014455, 0.981749, 1.009722, 0.992847 |
| Splay.Splay / COMPARE_FULL | 1.36780, 1.36789, 1.36718, 1.39261, 1.37222 | 1.018711, 1.022866, 0.995272, 1.046034, 1.008479 |

补充入口回归：同一条件从左右两条 continue 与等于分支回到循环，另测 getter 抛错；A/SPARSE/两候选的 Release、计数和 ASan/UBSan 输出一致，见 entries01/gate.json。

### 其余真实负载扫描

完整检查 Octane17 + SunSpider26，只在 Splay.Splay 有实际比较入口命中。其余42项没有第二个动态覆盖负载，零覆盖行全部保留在 02_compare_branch/full_coverage.csv。

Tree 的单轮时间虽大降，新比较入口却是零次。计数版的原构造计划命中分布也发生变化，不能拿诊断版的精确比例还原 Release；本轮未确认该 Release 单项变化的原因，不把它计成数字比较快路的收益。完整 SunSpider GM 的轻微下降也不能单凭这个当成该机制有效。

每函数的 JSFunctionBytecode 160→184B，即使没有匹配位点也付24B。匹配函数另有每点48B及每字节2B的PC映射。Splay这个286B函数、一个匹配点额外620B。ReadICSite和原字段读取编码不变；三个新入口按1/2/3B恢复首条load，普通/ROM保存加载均通过。

## 3. 构造计划选择连续物理布局

Boyer诊断821万次正命中全部容量2，因此只选 final->prop_size<=2。保留原plan_try全部资格、对象身份、shape和引用处理。命中才用一次js_malloc申请64B对象头+实际容量的属性尾部，prop指向尾部。没有给普通get_field增加模式检查。

```c
size_t bytes=sizeof(*p)+sizeof(JSProperty)*(size_t)sh->prop_size;
p=js_malloc(ctx,bytes);
/* 原对象头初始化、shape/GC登记等在此省略 */
p->co_props=1;p->co_capacity=sh->prop_size;
p->prop=(JSProperty*)(p+1);
```

首次迁移申请外部数组，复制槽内容并转移所有权，不额外Dup/Free字段值。三处扩容/压缩入口和释放路径处理这个差异；迁移后旧尾部随对象头一起释放，内存统计也计入这块暂时不用的尾部。两个标志放在原对齐空隙，JSObject仍64B、prop仍offset32，GDB与sizeof/offsetof断言核对。

| 用例 / 版本 | 正命中 | 连续分配请求 | 普通两块请求 | 请求payload字节 | 迁移 | 迁移字节 | GC |
|---|---:|---:|---:|---:|---:|---:|---:|
| EarleyBoyer.Boyer / COALLOC_PROFILE | 8,211,290 | 0 | 16,422,580 | 788,283,840 | 0 | 0 | 6 |
| EarleyBoyer.Boyer / COALLOC | 8,211,289 | 8,211,289 | 0 | 788,283,744 | 0 | 0 | 6 |
| EarleyBoyer.Boyer / COALLOC_OFF | 8,211,290 | 0 | 16,422,580 | 788,283,840 | 0 | 0 | 6 |
| Splay.Splay / COALLOC_PROFILE | 982,620 | 0 | 1,965,240 | 94,331,520 | 0 | 0 | 0 |
| Splay.Splay / COALLOC | 982,620 | 982,620 | 0 | 94,331,520 | 982,620 | 47,165,760 | 0 |
| Splay.Splay / COALLOC_OFF | 982,620 | 0 | 1,965,240 | 94,331,520 | 0 | 0 | 0 |
| access-binary-trees / COALLOC_PROFILE | 10,558,564 | 0 | 21,117,128 | 1,182,559,168 | 0 | 0 | 2 |
| access-binary-trees / COALLOC | 10,600,630 | 0 | 21,201,260 | 1,187,270,560 | 0 | 0 | 2 |
| access-binary-trees / COALLOC_OFF | 10,600,630 | 0 | 21,201,260 | 1,187,270,560 | 0 | 0 | 2 |
| CodeLoad.CodeLoadClosure / COALLOC_PROFILE | 0 | 0 | 0 | 0 | 0 | 0 | 13 |
| CodeLoad.CodeLoadClosure / COALLOC | 0 | 0 | 0 | 0 | 0 | 0 | 13 |
| CodeLoad.CodeLoadClosure / COALLOC_OFF | 0 | 0 | 0 | 0 | 0 | 0 | 13 |

Boyer每个实际连续分配对象少一次QuickJS分配器请求；两版Run内GC次数都是6，未减少GC次数。当前QuickJS的小对象分配使用arena内存池，少一次请求不等于少一次系统分配。Splay的982620个连续对象后来全部迁到外部数组，原来的小尾部留到对象死亡才释放；Tree容量3不覆盖，Closure正命中0作为无覆盖对照。

COALLOC_OFF用同一ELF的QJS_CTOR_COALLOC_OFF=1选择原两块分配，保留相同标志、释放/存储管理和mode检查。Boyer连续分配比这个同布局对照更快，但仍略慢于原SPARSE；不能把allocator调用下降直接当成端到端提速。

| 表项 | 版本 | 中位 ms/Run | 相对本批 SPARSE | 最小—最大 |
|---|---|---:|---:|---:|
| EarleyBoyer.Boyer | SPARSE | 54.71540 | +0.00% | 54.56371—55.57033 |
| EarleyBoyer.Boyer | COALLOC | 55.28129 | +1.03% | 55.22564—55.72111 |
| EarleyBoyer.Boyer | COALLOC_OFF | 56.93535 | +4.06% | 56.87002—57.05431 |
| Splay.Splay | SPARSE | 1.33893 | +0.00% | 1.33041—1.34397 |
| Splay.Splay | COALLOC | 1.37345 | +2.58% | 1.37040—1.38733 |
| Splay.Splay | COALLOC_OFF | 1.35686 | +1.34% | 1.34858—1.36685 |
| access-binary-trees | SPARSE | 7.70796 | +0.00% | 7.70246—7.74411 |
| access-binary-trees | COALLOC | 7.77547 | +0.88% | 7.74485—7.92632 |
| access-binary-trees | COALLOC_OFF | 7.76296 | +0.71% | 7.75422—7.89635 |
| CodeLoad.CodeLoadClosure | SPARSE | 0.49082 | +0.00% | 0.49039—0.49249 |
| CodeLoad.CodeLoadClosure | COALLOC | 0.49185 | +0.21% | 0.49115—0.49949 |
| CodeLoad.CodeLoadClosure | COALLOC_OFF | 0.49149 | +0.14% | 0.49062—0.49235 |

| 表项 / 版本 | 5 次原始 ms/Run | 每一对候选 / SPARSE |
|---|---|---|
| EarleyBoyer.Boyer / SPARSE | 55.57033, 54.71540, 54.96313, 54.66628, 54.56371 | 1.000000, 1.000000, 1.000000, 1.000000, 1.000000 |
| EarleyBoyer.Boyer / COALLOC | 55.49534, 55.25699, 55.22564, 55.28129, 55.72111 | 0.998651, 1.009898, 1.004776, 1.011250, 1.021212 |
| EarleyBoyer.Boyer / COALLOC_OFF | 56.93535, 57.05431, 57.03057, 56.87002, 56.90857 | 1.024564, 1.042747, 1.037615, 1.040313, 1.042975 |
| Splay.Splay / SPARSE | 1.34058, 1.33893, 1.33768, 1.34397, 1.33041 | 1.000000, 1.000000, 1.000000, 1.000000, 1.000000 |
| Splay.Splay / COALLOC | 1.37156, 1.38733, 1.37345, 1.37040, 1.37759 | 1.023107, 1.036151, 1.026741, 1.019666, 1.035460 |
| Splay.Splay / COALLOC_OFF | 1.36119, 1.35027, 1.35686, 1.34858, 1.36685 | 1.015375, 1.008472, 1.014345, 1.003433, 1.027387 |
| access-binary-trees / SPARSE | 7.71569, 7.70796, 7.70399, 7.70246, 7.74411 | 1.000000, 1.000000, 1.000000, 1.000000, 1.000000 |
| access-binary-trees / COALLOC | 7.74485, 7.81160, 7.92632, 7.77547, 7.77508 | 1.003778, 1.013447, 1.028859, 1.009479, 1.004000 |
| access-binary-trees / COALLOC_OFF | 7.76296, 7.89635, 7.75422, 7.76119, 7.78688 | 1.006126, 1.024441, 1.006520, 1.007625, 1.005523 |
| CodeLoad.CodeLoadClosure / SPARSE | 0.49249, 0.49039, 0.49081, 0.49123, 0.49082 | 1.000000, 1.000000, 1.000000, 1.000000, 1.000000 |
| CodeLoad.CodeLoadClosure / COALLOC | 0.49949, 0.49178, 0.49529, 0.49185, 0.49115 | 1.014224, 1.002840, 1.009138, 1.001264, 1.000663 |
| CodeLoad.CodeLoadClosure / COALLOC_OFF | 0.49111, 0.49149, 0.49152, 0.49235, 0.49062 | 0.997212, 1.002232, 1.001461, 1.002288, 0.999595 |

## 校验与交付

三组与A差分、原有property_reads/safety、新增微样例、ASan/UBSan及准备后普通/ROM保存加载通过。连续分配的原生fixture验证1000个持有对象值的实例正常释放、迁移、压缩、循环GC、扩容OOM后恢复；所有finalizer恰好执行一次。一次初版测试误用了不存在的DeletePropertyInt64 API，另一次误以为limit=0必定让下一次小池分配失败；均修正测试，失败日志保留在validation01/02，最终validation03通过。没有改引擎来迎合这两个测试。LSan因当前ptrace环境关闭，未把它记成通过。

完整正式Release计时：定向95进程 + 全集172进程，共267；诊断进程不计入时间表。Release输入SHA均与冻结native协议相同，CPU2、C locale、Asia/Shanghai；第一次Run计入，没有追加工作负载热身。

独立补丁：01_forward_numeric/SPARSE-to-NUMERIC_PLAN.patch；02_compare_branch/SPARSE-to-COMPARE_FIRST.patch / SPARSE-to-COMPARE_FULL.patch；03_ctor_coalloc/SPARSE-to-COALLOC.patch。旧forward增量单列SPARSE-to-OLD_FORWARD.patch。冻结目录和旧结果不动。构建拷贝统一LF，补丁相对统一换行的冻结拷贝。

[全部逐项表](full01/results.md) · [每个进程原始时间](full01/raw_timings.csv) · [实际字节码](bytecode_raytrace/method.txt) · [Splay字节码](bytecode_splay/method.txt) · [结构尺寸](sizes.json)
