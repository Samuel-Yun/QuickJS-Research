# 四个候选的关键 C 代码

## NEG_DIRECT

```c
                    if(!s->plan && sparse_same(s,call_argv[-2])){
                        SCREEN(negative_direct);
#ifdef FOUR_DIAG
                        FourSite*oldscope=four_ctor_observer;four_ctor_observer=NULL;
#endif
                        ret_val=JS_CallConstructorInternal(ctx,call_argv[-2],call_argv[-1],call_argc,call_argv,0);
#ifdef FOUR_DIAG
                        four_ctor_observer=oldscope;
#endif
```

本批全集：Octane +0.94%，SunSpider +3.31%。未达到预设筛选门槛。

## P2_COLD

```c
    if(!p->dual){
        DualPlan*pair;
#ifdef SCREEN_DIAGNOSTIC
        if(getenv("SCREEN_FAIL_UPGRADE")){SCREEN(upgrade_failures);return NULL;}
#endif
        pair=js_mallocz_rt(ctx->rt,sizeof(*pair));
        if(!pair){SCREEN(upgrade_failures);return NULL;}
        pair->primary=*p; /* move its owned references, do not duplicate/free them */
        pair->primary.dual=1;pair->primary.next=0;
        pair->secondary.pc=slot->pc;pair->secondary.argc=slot->argc;
#ifdef FOUR_DIAG
        pair->secondary.diag=slot->diag;
#endif
        slot->plan=&pair->primary;js_free_rt(ctx->rt,p);p=slot->plan;
        SCREEN(upgrades);SCREEN_ADD(upgrade_bytes,sizeof(*pair));
    }
```

本批全集：Octane -0.40%，SunSpider +2.31%。未达到预设筛选门槛。

## PROTO_SMALL

```c
        if(count<=2){
            SCREEN(small_layers);
            JSShapeProperty*table=get_shape_prop(p->shape);
            for(unsigned j=0;j<count && pending;j++){
                JSShapeProperty*d=&table[j];
                if(d->atom==JS_ATOM_NULL)continue;
                SCREEN(small_desc_reads);
                for(unsigned i=0;i<r->n;i++)if(pending&(1U<<i)){
                    SCREEN(small_atom_compares);
                    if(d->atom==r->atom[i]){
                        if((d->flags&JS_PROP_TMASK) || !(d->flags&JS_PROP_WRITABLE))return 0;
                        SCREEN(small_matches);pending&=~(1U<<i);break;
                    }
                }
            }
```

本批全集：Octane +0.16%，SunSpider +0.62%。未达到预设筛选门槛。

## D16_STATIC

```c
#define V6_PREPARED_BORROW(slot, read_delta, field_size) do {                                    \
    JSValueConst receiver = (slot);                                    \
    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {                   \
        JSObject *object = JS_VALUE_GET_OBJ(receiver);                  \
        ReadICSite *site = (ReadICSite *)(pc + 1 + read_delta(pc+1));    \
```

实际 handler 传入的是编译期常量，没有运行期 field_size 变量：

```c
CASE(OP_v6_get_loc0): V6_PREPARED_BORROW(var_buf[0],get_u32,5); BREAK;
CASE(OP_v6_get_arg0): V6_PREPARED_BORROW(arg_buf[0],get_u32,5); BREAK;
CASE(OP_v6s_get_arg0): V6_PREPARED_BORROW(arg_buf[0],get_u16,3); BREAK;
CASE(OP_v6s_get_loc0): V6_PREPARED_BORROW(var_buf[0],get_u16,3); BREAK;
```

本批全集：Octane +1.24%，SunSpider +3.69%。未达到预设筛选门槛。
