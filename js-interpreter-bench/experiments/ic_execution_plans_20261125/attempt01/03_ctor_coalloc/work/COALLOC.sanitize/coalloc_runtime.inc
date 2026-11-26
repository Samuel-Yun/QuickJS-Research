/* Only plan_try's ordinary-object allocation calls this narrow allocator. */
_Static_assert(sizeof(JSObject)==64,"preserve object header size");
_Static_assert(sizeof(JSObject)%_Alignof(JSProperty)==0,"aligned property tail");
_Static_assert(offsetof(JSObject,shape)==24&&offsetof(JSObject,prop)==32,"preserve hot fields");
static JSValue co_new(JSContext*ctx,JSShape*sh){
 JSObject*p;size_t bytes=sizeof(*p)+sizeof(JSProperty)*(size_t)sh->prop_size;
 js_trigger_gc(ctx->rt,sizeof(JSObject));
 p=js_malloc(ctx,bytes);
 if(!p){js_free_shape(ctx->rt,sh);return JS_EXCEPTION;}
 p->class_id=JS_CLASS_OBJECT;p->is_std_array_prototype=0;p->extensible=TRUE;p->free_mark=0;p->is_exotic=0;p->fast_array=0;p->is_constructor=0;p->has_immutable_prototype=0;p->tmp_mark=0;p->is_HTMLDDA=0;p->weakref_count=0;
 p->co_props=1;p->co_capacity=sh->prop_size;
#ifdef FOUR_DIAG
 p->ep_plan=0;
#endif
 p->u.opaque=NULL;p->shape=sh;p->prop=(JSProperty*)(p+1);
 js_rc(p)->ref_count=1;add_gc_object(ctx->rt,&p->header,JS_GC_OBJ_TYPE_JS_OBJECT);
 return JS_MKPTR(JS_TAG_OBJECT,p);
}
