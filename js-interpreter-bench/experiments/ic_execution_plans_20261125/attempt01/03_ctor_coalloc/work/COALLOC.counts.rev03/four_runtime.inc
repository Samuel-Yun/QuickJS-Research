typedef struct FourRecipe {JSAtom atom[8];uint16_t arg[8];uint16_t n;} FourRecipe;
typedef struct FullPlan FullPlan;
struct FourSite {
    FullPlan *plan;
    JSValue negative;
    uint32_t pc;
    uint16_t argc;
#ifdef FOUR_DIAG
    FourDiag *diag;
#endif
};
struct FullPlan {
    JSValue callee;
    JSShape *initial,*final;
    FourRecipe recipe;
    uint32_t pc;
    uint16_t argc;
#ifdef FOUR_DIAG
    FourDiag *diag;
#endif
};
static inline __exception int js_poll_interrupts(JSContext*ctx);
#ifdef FOUR_DIAG
static FourSite *four_ctor_observer;
static void four_ctor_alloc(void){if(four_ctor_observer)FOUR_COUNT(four_ctor_observer,work3);}
static void four_ctor_resize(void){if(four_ctor_observer)FOUR_COUNT(four_ctor_observer,work4);}
static void four_ctor_search(void){if(four_ctor_observer)FOUR_COUNT(four_ctor_observer,work1);}
static void four_ctor_switch(void){if(four_ctor_observer)FOUR_COUNT(four_ctor_observer,work2);}
#endif
static int plan_recipe(JSFunctionBytecode*b,FourRecipe*r)
{
    FOLLOW(0);
    const uint8_t*p=b->byte_code_buf,*end=p+b->byte_code_len;
    if(b->func_kind!=JS_FUNC_NORMAL || b->var_count!=1 || b->var_ref_count || b->closure_var_count ||
       b->need_home_object || b->is_derived_class_constructor || !b->has_simple_parameter_list ||
       end-p<10 || p[0]!=OP_push_this || p[1]!=OP_put_loc0)return 0;
    p+=2;r->n=0;
    while(p<end && *p==OP_get_loc0){
        if(r->n==8 || end-p<7)return 0;p++;
        unsigned index;
        if(*p>=OP_get_arg0 && *p<=OP_get_arg3){index=*p-OP_get_arg0;p++;}
        else if(*p==OP_get_arg && end-p>=3){index=get_u16(p+1);p+=3;}
        else return 0;
        if(end-p<5 || *p!=OP_put_field || index>=b->arg_count)return 0;
        JSAtom atom=get_u32(p+1);for(unsigned i=0;i<r->n;i++)if(r->atom[i]==atom)return 0;
        r->atom[r->n]=atom;r->arg[r->n++]=index;p+=5;
    }
    return r->n && p+1==end && *p==OP_return_undef;
}
static JSObject*plan_proto(JSObject*f)
{
    JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,f,JS_ATOM_prototype);
    if(!d || (d->flags&JS_PROP_TMASK) || JS_VALUE_GET_TAG(pr->u.value)!=JS_TAG_OBJECT)return NULL;
    JSObject*p=JS_VALUE_GET_OBJ(pr->u.value);
    return p->class_id==JS_CLASS_OBJECT && !p->is_exotic?p:NULL;
}
/* Unhashed prototypes are NOT trusted by pointer identity. Check the current
 * descriptors along the current entire chain before performing any write. */
static int plan_chain(JSObject*proto,const FourRecipe*r)
{
    for(unsigned i=0;i<r->n;i++){
        JSObject*p=proto;unsigned depth=0;
        while(p){
            if(++depth>32 || p->class_id!=JS_CLASS_OBJECT || p->is_exotic)return 0;
            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);
            if(d){if((d->flags&JS_PROP_TMASK) || !(d->flags&JS_PROP_WRITABLE))return 0;break;}
            p=p->shape->proto;
        }
    }return 1;
}
static int plan_base(JSContext*ctx,JSValueConst callee,JSValueConst target,unsigned argc,JSObject**f)
{
    if(ctx->rt->interrupt_handler || JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT ||
       JS_VALUE_GET_TAG(target)!=JS_TAG_OBJECT || JS_VALUE_GET_OBJ(callee)!=JS_VALUE_GET_OBJ(target))return 0;
    *f=JS_VALUE_GET_OBJ(callee);
    if((*f)->class_id!=JS_CLASS_BYTECODE_FUNCTION || !(*f)->is_constructor || (*f)->is_exotic)return 0;
    JSFunctionBytecode*b=(*f)->u.func.function_bytecode;
    if(argc<b->arg_count)return 0;
    size_t size=sizeof(JSValue)*(b->var_count+b->stack_size)+sizeof(JSVarRef*)*b->var_ref_count;
    if(js_check_stack_overflow(ctx->rt,size+sizeof(JSStackFrame)+512))return 0;
#ifdef FORCE_GC_AT_MALLOC
    return 0;
#else
    /* JS_NewObjectFromShape's GC could run a native finalizer after guards.
     * Leave that construction to the original path; never redo it afterward. */
    return ctx->rt->malloc_ctx.malloc_state.malloc_size<=SIZE_MAX-sizeof(JSObject) &&
           ctx->rt->malloc_ctx.malloc_state.malloc_size+sizeof(JSObject)<=ctx->rt->malloc_gc_threshold;
#endif
}
static int plan_slow_eligible(JSContext*ctx,JSValueConst callee,JSValueConst target,unsigned argc)
{
    JSObject*f,*proto;FourRecipe r;
    if(!plan_base(ctx,callee,target,argc,&f) || !plan_recipe(f->u.func.function_bytecode,&r) ||
       !(proto=plan_proto(f)) || !find_hashed_shape_proto(ctx->rt,proto))return 0;
    return plan_chain(proto,&r);
}
static void plan_learn(JSContext*ctx,FourSite*slot,JSValueConst callee,JSValueConst result)
{
    if(JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT || JS_VALUE_GET_TAG(result)!=JS_TAG_OBJECT)return;
    JSObject*f=JS_VALUE_GET_OBJ(callee),*o=JS_VALUE_GET_OBJ(result),*proto;FourRecipe r;
    if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION || !plan_recipe(f->u.func.function_bytecode,&r) ||
       !(proto=plan_proto(f)) || !plan_chain(proto,&r) || o->class_id!=JS_CLASS_OBJECT || o->is_exotic ||
       !o->shape->is_hashed || o->shape->proto!=proto || o->shape->prop_count!=r.n || o->shape->deleted_prop_count)return;
    JSShapeProperty*d=get_shape_prop(o->shape);
    for(unsigned i=0;i<r.n;i++)if(d[i].atom!=r.atom[i] || d[i].flags!=JS_PROP_C_W_E)return;
    JSShape*initial=find_hashed_shape_proto(ctx->rt,proto);if(!initial)return;
    FOUR_COUNT(slot,eligible);
#ifndef FOUR_PROBE
    FullPlan*s=slot->plan;
    if(!s){
        s=js_mallocz_rt(ctx->rt,sizeof(*s));
        if(!s){FOLLOW(4);return;}
        s->pc=slot->pc;s->argc=slot->argc;
#ifdef FOUR_DIAG
        s->diag=slot->diag;follow_stats[9]++;follow_stats[10]+=sizeof(*s);
#endif
        slot->plan=s;FOLLOW(1);
    }
    JSValue old=s->callee;JSShape*oldinitial=s->initial,*oldfinal=s->final;
    s->callee=JS_DupValue(ctx,callee);s->initial=js_dup_shape(initial);s->final=js_dup_shape(o->shape);s->recipe=r;
    JSValue negative=slot->negative;slot->negative=JS_UNDEFINED;
    FOUR_COUNT(s,fill);
    JS_FreeValue(ctx,negative);
    JS_FreeValue(ctx,old);js_free_shape_null(ctx->rt,oldinitial);js_free_shape_null(ctx->rt,oldfinal);
#endif
}
static int plan_try(JSContext*ctx,FullPlan*s,JSValueConst callee,JSValueConst target,JSValue*args,JSValue*out)
{
    FOUR_COUNT(s,q);
#ifndef FOUR_PROBE
    JSObject*f;
    if(s->final && JS_VALUE_GET_TAG(s->callee)==JS_TAG_OBJECT && JS_VALUE_GET_TAG(callee)==JS_TAG_OBJECT &&
       JS_VALUE_GET_OBJ(s->callee)==JS_VALUE_GET_OBJ(callee) && plan_base(ctx,callee,target,s->argc,&f) &&
       plan_proto(f)==s->final->proto && plan_chain(s->final->proto,&s->recipe)){
        /* The two old entries each poll once. Hooks were excluded above. */
        if(js_poll_interrupts(ctx) || js_poll_interrupts(ctx))return 0;
        *out=co_enabled&&s->final->prop_size<=2?co_new(ctx,js_dup_shape(s->final)):JS_NewObjectFromShape(ctx,js_dup_shape(s->final),JS_CLASS_OBJECT,NULL);
        if(JS_IsException(*out)){FOUR_COUNT(s,h);FOUR_COUNT(s,overflow);return 1;} /* no retry after allocation */
        JSObject*o=JS_VALUE_GET_OBJ(*out);co_plan(o);
        for(unsigned i=0;i<s->recipe.n;i++)o->prop[i].u.value=JS_DupValue(ctx,args[s->recipe.arg[i]]);
        FOUR_COUNT(s,h);FOUR_ADD(s,work5,s->recipe.n);FOUR_COUNT(s,work6);FOUR_COUNT(s,work3);return 1;
    }
#endif
    FOUR_COUNT(s,guard);return 0;
}
#include "sparse_runtime.inc"
static size_t four_extra_size(JSFunctionBytecode*b);
static void four_prepare(JSContext*ctx,JSFunctionBytecode*b);
