/* Index occupies old FourSite tail padding; target is owned by that site.
 * Runtime storage is not a root: function-bytecode mark/free follows the index.
 * Indices survive realloc; no entry address escapes a callback or allocation. */
static JSValue negative_value(JSRuntime*rt,const FourSite*s)
{
    if(!s->negative_index)return JS_UNDEFINED;
    assert(s->negative_index<=rt->negative_used);
    return JS_MKPTR(JS_TAG_OBJECT,rt->negative_entries[s->negative_index].object);
}
static int negative_match(JSContext*ctx,FourSite*s,JSValueConst callee)
{
#ifdef NEGATIVE_DISABLED
    return 0;
#else
    if(!s->negative_index || JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT)return 0;
    return JS_VALUE_GET_OBJ(callee)==ctx->rt->negative_entries[s->negative_index].object;
#endif
}
static void negative_remember(JSContext*ctx,FourSite*s,JSValueConst callee)
{
#ifndef NEGATIVE_DISABLED
    JSRuntime*rt=ctx->rt;uint32_t index=s->negative_index;
    if(!index){
        if(rt->negative_free){index=rt->negative_free;rt->negative_free=rt->negative_entries[index].next;}
        else{
            if(rt->negative_used==UINT32_MAX-1)return;
            if(rt->negative_used+1>=rt->negative_capacity){
                uint32_t cap=rt->negative_capacity?rt->negative_capacity*2:32;
                if(cap<=rt->negative_capacity || (size_t)cap>SIZE_MAX/sizeof(R3NegativeEntry))return;
                R3NegativeEntry*p=js_realloc_rt(rt,rt->negative_entries,(size_t)cap*sizeof(*p));
                if(!p){NEGSTAT(11);return;} /* optional: no pending exception */
                memset(p+rt->negative_capacity,0,(cap-rt->negative_capacity)*sizeof(*p));
                rt->negative_entries=p;rt->negative_capacity=cap;NEGSTAT(10);
            }
            index=++rt->negative_used;
        }
        s->negative_index=index;rt->negative_live++;NEGSTAT(9);
    }
    JSObject*old=rt->negative_entries[index].object;
    JS_DupValue(ctx,callee);rt->negative_entries[index].object=JS_VALUE_GET_OBJ(callee);
    NEGSTAT(2);
    if(old)JS_FreeValue(ctx,JS_MKPTR(JS_TAG_OBJECT,old)); /* publish first; no entry use after callback */
#endif
}
static void negative_release(JSRuntime*rt,FourSite*s)
{
    uint32_t i=s->negative_index;if(!i)return;s->negative_index=0;
    JSObject*old=rt->negative_entries[i].object;rt->negative_entries[i].object=NULL;
    rt->negative_entries[i].next=rt->negative_free;rt->negative_free=i;rt->negative_live--;
    JS_FreeValueRT(rt,JS_MKPTR(JS_TAG_OBJECT,old));
}
static void negative_destroy(JSRuntime*rt)
{
    assert(!rt->negative_live);js_free_rt(rt,rt->negative_entries);
}
