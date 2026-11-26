typedef struct FourSite {
    JSValue callee;
    JSShape *shape;
    JSAtom atom;
    uint32_t offset,pc;
    uint16_t argc;
#ifdef FOUR_DIAG
    FourDiag *diag;
#endif
} FourSite;
static inline __exception int js_poll_interrupts(JSContext *ctx);
static int four_field_recipe(JSFunctionBytecode*b,JSAtom*atom)
{
    const uint8_t*p=b->byte_code_buf;
    if(b->func_kind!=JS_FUNC_NORMAL || b->byte_code_len!=9 || b->var_count!=1 ||
       b->var_ref_count || b->closure_var_count || b->need_home_object || !b->has_simple_parameter_list ||
       p[0]!=OP_push_this || p[1]!=OP_put_loc0 ||
       (p[2]!=OP_get_loc0 && p[2]!=OP_v6_get_loc0) || p[8]!=OP_return)return 0;
    if(p[3]==OP_get_field)*atom=get_u32(p+4);
    else if(p[3]==OP_get_field_rdi)*atom=((ReadICSite*)(p+4+get_u32(p+4)))->atom;
    else return 0;
    return 1;
}
static int four_call_try(JSContext*ctx,FourSite*s,JSValueConst callee,JSValueConst receiver,JSValue*out)
{
    FOUR_COUNT(s,q);
    if(ctx->rt->interrupt_handler || JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT ||
       JS_VALUE_GET_TAG(receiver)!=JS_TAG_OBJECT)goto fail;
    JSObject*f=JS_VALUE_GET_OBJ(callee),*o=JS_VALUE_GET_OBJ(receiver);
    if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION || o->class_id!=JS_CLASS_OBJECT || o->is_exotic)goto fail;
    JSFunctionBytecode*t=f->u.func.function_bytecode;
    size_t bytes=sizeof(JSValue)*((s->argc<t->arg_count?t->arg_count:0)+t->var_count+t->stack_size)+sizeof(JSVarRef*)*t->var_ref_count;
    /* Fall through to the exact old check near a stack limit. No new error. */
    if(js_check_stack_overflow(ctx->rt,bytes+sizeof(JSStackFrame)+256))goto fail;
    if(JS_VALUE_GET_TAG(s->callee)==JS_TAG_OBJECT && JS_VALUE_GET_OBJ(s->callee)==f && s->shape==o->shape){
        if(js_poll_interrupts(ctx))goto fail; /* no host callback installed */
        *out=JS_DupValue(ctx,o->prop[s->offset].u.value);FOUR_COUNT(s,h);return 1;
    }
    JSAtom atom;JSProperty*pr;
    if(!o->shape->is_hashed || !four_field_recipe(t,&atom))goto fail;
    JSShapeProperty*desc=find_own_property(&pr,o,atom);
    if(!desc || (desc->flags&JS_PROP_TMASK))goto fail;
    FOUR_COUNT(s,eligible);
    JSValue old=s->callee;JSShape*oldshape=s->shape;
    s->callee=JS_DupValue(ctx,callee);s->shape=js_dup_shape(o->shape);s->atom=atom;s->offset=pr-o->prop;
    FOUR_COUNT(s,fill); /* Publish first; releases can reach native finalizers. */
    JS_FreeValue(ctx,old);js_free_shape_null(ctx->rt,oldshape);
fail:
    FOUR_COUNT(s,guard);return 0;
}
static size_t four_extra_size(JSFunctionBytecode*b);
static void four_prepare(JSContext*ctx,JSFunctionBytecode*b);
