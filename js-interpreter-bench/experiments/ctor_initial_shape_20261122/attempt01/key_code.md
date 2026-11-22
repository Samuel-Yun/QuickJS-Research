# 关键代码与保留的检查

INIT_FREE 从 SPARSE 独立派生；P2_COLD_INIT 从 P2_COLD 独立应用同一删除。并未把 KEEP_PRIMARY 与 INIT_FREE 组合。

## 1. initial 不是命中分配所用的布局

原 `plan_try` 实际使用 final：

```c
*out=JS_NewObjectFromShape(ctx,js_dup_shape(s->final),JS_CLASS_OBJECT,NULL);
```

命中路径从未读取 s->initial。它原来只在学习前后被查找，并被持有、标记和释放。

`find_hashed_shape_proto` 只找同原型的零字段 shape；普通构造没有找到时会新建，但原 IC 在此放弃学习。`add_shape_property` 会扩展未共享的 shape；空 shape 是否仍存在，不能用来判定构造模板或最终对象是否合法。

## 2. 删除学习门槛，热布局保持原样

```c
JSShape *reserved_initial, *final; /* reserved, does not own a reference */
/* FullPlan remains 96 B; reserved=16, final=24, recipe=32. */
if(!plan_base(ctx,callee,target,argc,&f) ||
   !plan_recipe(f->u.func.function_bytecode,&r) ||
   !(proto=plan_proto(f)))return 0;
return plan_chain(proto,&r);
```

删掉构造前 `find_hashed_shape_proto` 条件，以及构造后同样的 lookup/return。构造后的 prototype、字段描述符、final shape、属性顺序和数量检查全部保留；不再给 initial 增引用、GC 标记或释放。

## 3. KEEP_PRIMARY 只改满槽时的淘汰

```c
/* Existing same-target selection above is unchanged. */
return &s->extra->plan[0]; /* replace secondary only */
```

旧 P2 的四十字节位点、双槽探测顺序、资格检查和计划引用管理保持原样。Tree 没有重复 5% 收益，因此不跑其全集。P2_SIDE 根据覆盖恢复结果跳过。
