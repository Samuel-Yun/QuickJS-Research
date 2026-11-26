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


[全集和总表](../results.md)
