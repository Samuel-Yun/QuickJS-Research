typedef struct FwdCall {JSValue target,receiver,apply;int argc,consumed;JSValue*argv;struct FwdCall*previous;} FwdCall;
typedef struct FwdSite {JSValue target,apply;JSAtom init_atom,apply_atom;uint32_t call_end;
#ifdef FOUR_DIAG
 FourDiag*diag;
#endif
} FwdSite;
static int follow_forward_match(JSFunctionBytecode*b);
static size_t follow_extra_size(JSFunctionBytecode*b);
static void follow_prepare(JSContext*ctx,JSFunctionBytecode*b);
/* A raw descriptor inspection, never a second observable JS property read. */
static int fwd_data(JSObject*o,JSAtom atom,JSValue*out)
{
 for(unsigned depth=0;o && depth<32;depth++,o=o->shape->proto){
  if(o->is_exotic)return 0;
  JSProperty*p;JSShapeProperty*d=find_own_property(&p,o,atom);
  if(d){if(d->flags&JS_PROP_TMASK)return 0;*out=p->u.value;return 1;}
 }return 0;
}
static int fwd_resolve(JSContext*ctx,FwdSite*s,JSValueConst receiver,int construct,JSValue*target,JSValue*apply)
{
 FOUR_COUNT(s,q);FOLLOW(0);
 if(!construct || ctx->rt->interrupt_handler || JS_VALUE_GET_TAG(receiver)!=JS_TAG_OBJECT)goto fail;
 JSObject*o=JS_VALUE_GET_OBJ(receiver);
 if(o->class_id!=JS_CLASS_OBJECT || o->is_exotic ||
    ctx->rt->malloc_ctx.malloc_state.malloc_size+sizeof(JSObject)>ctx->rt->malloc_gc_threshold)goto fail;
 JSValue t,a;if(!fwd_data(o,s->init_atom,&t) || JS_VALUE_GET_TAG(t)!=JS_TAG_OBJECT)goto fail;
 JSObject*f=JS_VALUE_GET_OBJ(t);
 if((f->class_id!=JS_CLASS_BYTECODE_FUNCTION && f->class_id!=JS_CLASS_COLD_BYTECODE_FUNCTION) || f->is_exotic ||
    !fwd_data(f,s->apply_atom,&a) || JS_VALUE_GET_TAG(a)!=JS_TAG_OBJECT)goto fail;
 JSObject*p=JS_VALUE_GET_OBJ(a);
 if(p->class_id!=JS_CLASS_C_FUNCTION || p->u.cfunc.cproto!=JS_CFUNC_generic_magic ||
    p->u.cfunc.magic || p->u.cfunc.c_function.generic_magic!=js_function_apply)goto fail;
 FOUR_COUNT(s,eligible);FOLLOW(1);
#ifndef FOLLOW_PROBE
 if(JS_VALUE_GET_TAG(s->target)==JS_TAG_OBJECT && JS_VALUE_GET_OBJ(s->target)==f &&
    JS_VALUE_GET_TAG(s->apply)==JS_TAG_OBJECT && JS_VALUE_GET_OBJ(s->apply)==p){
  *target=JS_DupValue(ctx,t);*apply=JS_DupValue(ctx,a);FOUR_COUNT(s,h);FOLLOW(2);return 1;
 }
 JSValue oldt=s->target,olda=s->apply;s->target=JS_DupValue(ctx,t);s->apply=JS_DupValue(ctx,a);
 FOUR_COUNT(s,fill);JS_FreeValue(ctx,oldt);JS_FreeValue(ctx,olda);
#endif
fail:FOUR_COUNT(s,guard);FOLLOW(3);return 0;
}
