/* Path records are bounded runtime roots, allocated only on a qualifying
 * instanceof. Structural mutations of registered objects invalidate them.
 * Values are NOT cached: a same-layout hook replacement is read currently. */
typedef struct R2Hook {uintptr_t pc;JSValue rhs,holder;uint64_t epoch;uint32_t off;} R2Hook;
static int r2_plain_hook_object(JSObject*o){return !o->is_exotic&&(o->class_id==JS_CLASS_OBJECT||o->class_id==JS_CLASS_BYTECODE_FUNCTION||o->class_id==JS_CLASS_COLD_BYTECODE_FUNCTION||o->class_id==JS_CLASS_C_FUNCTION);}
static int r2_hook_load(JSContext*ctx,JSValueConst rhs,uintptr_t pc,JSValue*out){
 JSRuntime*rt=ctx->rt;R2C(ctx,pc,1);
 if(!rt->r2_hooks||!r2_plain_hook_object(JS_VALUE_GET_OBJ(rhs)))return 0;
 R2Hook*h=&rt->r2_hooks[(pc^(pc>>9))&63];
 if(h->pc!=pc||h->epoch!=rt->r2_epoch||JS_VALUE_GET_OBJ(h->rhs)!=JS_VALUE_GET_OBJ(rhs))return 0;
 /* All descriptors and links remain unchanged under this epoch; ordinary
    data value writes need not invalidate and are deliberately read now. */
 JSObject*holder=JS_VALUE_GET_OBJ(h->holder);*out=JS_DupValue(ctx,holder->prop[h->off].u.value);R2C(ctx,pc,2);return 1;
}
static void r2_hook_learn(JSContext*ctx,JSValueConst rhs,uintptr_t pc){
 JSObject*o=JS_VALUE_GET_OBJ(rhs);JSObject*path[8];unsigned depth=0;JSProperty*p=NULL;JSShapeProperty*d=NULL;
 while(o&&depth<8){if(!r2_plain_hook_object(o))return;path[depth++]=o;d=find_own_property(&p,o,JS_ATOM_Symbol_hasInstance);if(d)break;o=o->shape->proto;}
 if(!d||(d->flags&JS_PROP_TMASK))return;
 JSRuntime*rt=ctx->rt;if(!rt->r2_hooks){rt->r2_hooks=js_mallocz_rt(rt,64*sizeof(R2Hook));if(!rt->r2_hooks)return;}
 R2Hook*h=&rt->r2_hooks[(pc^(pc>>9))&63],old=*h;
 for(unsigned n=0;n<depth;n++)path[n]->r2_hook_watch=1;
 h->rhs=JS_DupValue(ctx,rhs);h->holder=JS_DupValue(ctx,JS_MKPTR(JS_TAG_OBJECT,o));h->off=p-o->prop;h->epoch=rt->r2_epoch;h->pc=pc;R2C(ctx,pc,3);
 if(old.pc){R2C(ctx,pc,4);JS_FreeValue(ctx,old.rhs);JS_FreeValue(ctx,old.holder);}
}
static void r2_hook_free(JSRuntime*rt){R2Hook*t=rt->r2_hooks;rt->r2_hooks=NULL;if(!t)return;for(unsigned n=0;n<64;n++)if(t[n].pc){JS_FreeValueRT(rt,t[n].rhs);JS_FreeValueRT(rt,t[n].holder);}js_free_rt(rt,t);}
