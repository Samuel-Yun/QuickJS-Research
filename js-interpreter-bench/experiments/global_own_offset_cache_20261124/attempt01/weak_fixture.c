/* Internal cache/lifetime tests. No test API is linked into benchmark qjs. */
#include "quickjs.c"

static void number(JSContext *ctx,JSValue value,int expected)
{
    int32_t n;assert(!JS_IsException(value));assert(!JS_ToInt32(ctx,&n,value));assert(n==expected);JS_FreeValue(ctx,value);
}
static JSValue fresh(JSContext *ctx)
{
    JSValue proto=JS_NewObject(ctx),o=JS_NewObjectProto(ctx,proto);JS_FreeValue(ctx,proto);
    assert(!JS_IsException(o));
    assert(JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,3))>=0);
    assert(JS_SetPropertyStr(ctx,o,"y",JS_NewInt32(ctx,7))>=0);
    return o;
}
#ifdef GLOBAL_OWN_CACHE
static unsigned links(JSRuntime *rt,JSShape *sh)
{
    unsigned count=0;uint16_t previous=0;
    for(uint16_t i=sh->own_cache_head;i;i=rt->global_own_offsets[i-1].next){
        assert(i<=GO_CAPACITY);GlobalOwnEntry *e=&rt->global_own_offsets[i-1];
        assert(e->shape==sh && e->prev==previous);previous=i;assert(++count<=GO_CAPACITY);
    }
    return count;
}
static void fill_two(JSContext *ctx,JSValueConst o,JSAtom x,JSAtom y)
{
    JSObject *p=JS_VALUE_GET_OBJ(o);JSShape *sh=p->shape;JSProperty *pr;
    assert(sh->is_hashed && js_rc(sh)->ref_count==1);
    assert(global_own_bucket(sh,x)!=global_own_bucket(sh,y));
    assert(find_own_property(&pr,p,x));global_own_register(ctx->rt,sh,x,pr-p->prop);
    assert(find_own_property(&pr,p,y));global_own_register(ctx->rt,sh,y,pr-p->prop);
    assert(links(ctx->rt,sh)==2 && js_rc(sh)->ref_count==1); /* table is weak */
    global_own_register(ctx->rt,sh,x,0);assert(links(ctx->rt,sh)==2);
}
static void absent(JSRuntime *rt,uintptr_t address,JSAtom x,JSAtom y)
{
    assert(global_own_probe(rt,(JSShape*)address,x)==UINT32_MAX);
    assert(global_own_probe(rt,(JSShape*)address,y)==UINT32_MAX);
}
static JSValue getter(JSContext *ctx,JSValueConst this_val,int argc,JSValueConst *argv)
{return JS_NewInt32(ctx,17);}
static void lifecycle(JSContext *ctx)
{
    JSRuntime *rt=ctx->rt;JSAtom x=JS_NewAtom(ctx,"x"),y=JS_NewAtom(ctx,"y");
    JSValue o=fresh(ctx);JSShape *sh=JS_VALUE_GET_OBJ(o)->shape;uintptr_t address=(uintptr_t)sh;
    fill_two(ctx,o,x,y);
    JSShape *clone=js_clone_shape(ctx,sh);assert(clone && !clone->own_cache_head);
    js_free_shape(rt,clone);assert(links(rt,sh)==2);
    js_dup_shape(sh); /* force the real COW path while the old layout is alive */
    assert(JS_DeleteProperty(ctx,o,x,0)>0);
    assert(JS_VALUE_GET_OBJ(o)->shape!=sh && !JS_VALUE_GET_OBJ(o)->shape->own_cache_head);
    assert(links(rt,sh)==2);JS_FreeValue(ctx,o);assert(links(rt,sh)==2);
    js_free_shape(rt,sh);absent(rt,address,x,y);

    o=fresh(ctx);sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;fill_two(ctx,o,x,y);
    assert(JS_DeleteProperty(ctx,o,x,0)>0);absent(rt,address,x,y);JS_FreeValue(ctx,o);

    o=fresh(ctx);sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;fill_two(ctx,o,x,y);
    assert(JS_DefinePropertyGetSet(ctx,o,x,JS_NewCFunction(ctx,getter,"get",0),JS_UNDEFINED,JS_PROP_CONFIGURABLE)>=0);
    absent(rt,address,x,y);number(ctx,JS_GetProperty(ctx,o,x),17);JS_FreeValue(ctx,o);

    o=fresh(ctx);sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;fill_two(ctx,o,x,y);
    assert(JS_DefinePropertyValue(ctx,o,y,JS_NewInt32(ctx,19),JS_PROP_CONFIGURABLE)>=0);
    absent(rt,address,x,y);JS_FreeValue(ctx,o);

    o=fresh(ctx);sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;fill_two(ctx,o,x,y);
    // Third property forces the normal size-2 property allocation to grow.
    assert(JS_SetPropertyStr(ctx,o,"grow",JS_NewInt32(ctx,1))>=0);absent(rt,address,x,y);
    assert(!JS_VALUE_GET_OBJ(o)->shape->own_cache_head);
    for(int i=0;i<20;i++){char k[32];snprintf(k,sizeof(k),"grow%d",i);assert(JS_SetPropertyStr(ctx,o,k,JS_NewInt32(ctx,i))>=0);}
    fill_two(ctx,o,x,y);
    for(int i=0;i<16;i++){char k[32];snprintf(k,sizeof(k),"grow%d",i);JSAtom atom=JS_NewAtom(ctx,k);assert(JS_DeleteProperty(ctx,o,atom,0)>0);JS_FreeAtom(ctx,atom);}
    assert(!JS_VALUE_GET_OBJ(o)->shape->own_cache_head);number(ctx,JS_GetProperty(ctx,o,x),3);JS_FreeValue(ctx,o);

    o=fresh(ctx);sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;fill_two(ctx,o,x,y);
    JS_FreeValue(ctx,o);absent(rt,address,x,y); /* no shape ownership from cache */

    o=fresh(ctx);assert(JS_SetPropertyStr(ctx,o,"self",JS_DupValue(ctx,o))>=0);
    sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;fill_two(ctx,o,x,y);
    JS_FreeValue(ctx,o);JS_RunGC(rt);absent(rt,address,x,y);

    // No external atom reference remains when the shape is released.
    o=JS_NewObjectProto(ctx,JS_NULL);
    JSAtom a=JS_NewAtom(ctx,"weak_owned_atom_A"),b=JS_NewAtom(ctx,"weak_owned_atom_B");
    assert(JS_SetProperty(ctx,o,a,JS_NewInt32(ctx,23))>=0);assert(JS_SetProperty(ctx,o,b,JS_NewInt32(ctx,29))>=0);
    sh=JS_VALUE_GET_OBJ(o)->shape;address=(uintptr_t)sh;
    global_own_register(rt,sh,a,0);global_own_register(rt,sh,b,1);
    JS_FreeAtom(ctx,a);JS_FreeAtom(ctx,b);JS_FreeValue(ctx,o);
    absent(rt,address,a,b);JS_FreeAtom(ctx,x);JS_FreeAtom(ctx,y);
    puts("MULTI_ATOM_DELETE_GETTER_MOVE_FREE_GC_PASS");
}
static void collisions(JSContext *ctx)
{
    JSRuntime *rt=ctx->rt;JSAtom x=JS_NewAtom(ctx,"x");
    JSValue *held=calloc(8192,sizeof(*held));assert(held);
    int slot[2][GO_CAPACITY];for(unsigned k=0;k<2;k++)for(unsigned i=0;i<GO_CAPACITY;i++)slot[k][i]=-1;
    int first=-1,second=-1,count=0;
    for(int i=0;i<8192;i++){
        JSValue o=JS_NewObject(ctx);char key[40];
        if(i&1)assert(JS_SetPropertyStr(ctx,o,"pad",JS_NewInt32(ctx,99))>=0);
        assert(JS_SetProperty(ctx,o,x,JS_NewInt32(ctx,(i&1)?5:3))>=0);
        snprintf(key,sizeof(key),"collision_%d",i);assert(JS_SetPropertyStr(ctx,o,key,JS_NewInt32(ctx,0))>=0);
        held[count++]=o;JSShape *sh=JS_VALUE_GET_OBJ(o)->shape;assert(sh->is_hashed);
        unsigned bucket=global_own_bucket(sh,x),kind=i&1;
        if(slot[1-kind][bucket]>=0){first=slot[1-kind][bucket];second=i;break;}
        slot[kind][bucket]=i;
    }
    assert(first>=0 && second>=0);
    JSObject *a=JS_VALUE_GET_OBJ(held[first]),*b=JS_VALUE_GET_OBJ(held[second]);JSProperty *pa,*pb;
    assert(a->shape!=b->shape && global_own_bucket(a->shape,x)==global_own_bucket(b->shape,x));
    assert(find_own_property(&pa,a,x) && find_own_property(&pb,b,x));
    uint32_t oa=pa-a->prop,ob=pb-b->prop;assert(oa!=ob);
    global_own_register(rt,a->shape,x,oa);assert(global_own_probe(rt,b->shape,x)==UINT32_MAX);
    global_own_register(rt,b->shape,x,ob);assert(global_own_probe(rt,a->shape,x)==UINT32_MAX);
    assert(global_own_probe(rt,b->shape,x)==ob);
    printf("SHAPE_COLLISION_PASS bucket=%u offsets=%u,%u searched=%d\n",global_own_bucket(a->shape,x),oa,ob,count);

    // Same shape, different atoms, same bucket: full atom equality is required.
    JSValue many=JS_NewObject(ctx);JSAtom atoms[1025];
    for(int i=0;i<1025;i++){char name[48];snprintf(name,sizeof(name),"atom_collision_%d",i);atoms[i]=JS_NewAtom(ctx,name);assert(JS_SetProperty(ctx,many,atoms[i],JS_NewInt32(ctx,i))>=0);}
    JSObject *p=JS_VALUE_GET_OBJ(many);int buckets[GO_CAPACITY];for(int i=0;i<GO_CAPACITY;i++)buckets[i]=-1;
    int ai=-1,bi=-1;
    for(int i=0;i<1025;i++){unsigned k=global_own_bucket(p->shape,atoms[i]);if(buckets[k]>=0){ai=buckets[k];bi=i;break;}buckets[k]=i;}
    assert(ai>=0 && bi>=0);
    global_own_register(rt,p->shape,atoms[ai],ai);assert(global_own_probe(rt,p->shape,atoms[bi])==UINT32_MAX);
    global_own_register(rt,p->shape,atoms[bi],bi);assert(global_own_probe(rt,p->shape,atoms[ai])==UINT32_MAX);
    assert(global_own_probe(rt,p->shape,atoms[bi])==(unsigned)bi);
    printf("ATOM_COLLISION_PASS bucket=%u offsets=%d,%d\n",global_own_bucket(p->shape,atoms[ai]),ai,bi);
    for(int i=0;i<1025;i++)JS_FreeAtom(ctx,atoms[i]);JS_FreeValue(ctx,many);
    for(int i=0;i<count;i++)JS_FreeValue(ctx,held[i]);(free)(held);JS_FreeAtom(ctx,x);
}
static void leave_runtime_entries(JSContext *ctx)
{
    JSValue a=fresh(ctx);JSObject *pa=JS_VALUE_GET_OBJ(a);
    JSValue proto=JS_MKPTR(JS_TAG_OBJECT,pa->shape->proto),b=JS_NewObjectProto(ctx,proto);
    assert(JS_SetPropertyStr(ctx,b,"x",JS_NewInt32(ctx,3))>=0);assert(JS_SetPropertyStr(ctx,b,"y",JS_NewInt32(ctx,7))>=0);
    assert(pa->shape==JS_VALUE_GET_OBJ(b)->shape);
    JSAtom x=JS_NewAtom(ctx,"x"),y=JS_NewAtom(ctx,"y");
    global_own_register(ctx->rt,pa->shape,x,0);global_own_register(ctx->rt,pa->shape,y,1);
    assert(links(ctx->rt,pa->shape)==2);
    // The existing transition cache keeps this reused layout alive until teardown.
    JS_FreeValue(ctx,a);JS_FreeValue(ctx,b);JS_FreeAtom(ctx,x);JS_FreeAtom(ctx,y);
}
#endif

#ifdef TEST_SPARSE
static JSClassID native_class;
static JSContext *callback_ctx;
static ReadICSite *callback_site;
static JSValue callback_receiver,callback_other;
static int callback_fired;
static void native_finalizer(JSRuntime *rt,JSValue value)
{
    if(!callback_ctx || callback_fired)return;callback_fired=1;
    JSObject *other=JS_VALUE_GET_OBJ(callback_other);JSProperty *pr;JSAtom x=JS_NewAtom(callback_ctx,"x");
    assert(find_own_property(&pr,other,x));
    rdi_update(callback_ctx,callback_site,other->shape,pr-other->prop);
    // C-only reentry: free the just-published old descriptor and move prop[].
    for(int i=0;i<24;i++){char key[40];snprintf(key,sizeof(key),"reenter_%d",i);assert(JS_SetPropertyStr(callback_ctx,callback_receiver,key,JS_NewInt32(callback_ctx,i))>=0);}
    assert(JS_SetPropertyStr(callback_ctx,callback_receiver,"x",JS_NewInt32(callback_ctx,17))>=0);
    JS_FreeAtom(callback_ctx,x);
}
static void reentry(JSContext *ctx)
{
    JSClassDef def={"cache_finalizer",.finalizer=native_finalizer};JS_NewClassID(&native_class);assert(JS_NewClass(ctx->rt,native_class,&def)==0);
    JSValue special=JS_NewObjectClass(ctx,native_class),a=JS_NewObjectProto(ctx,special);
    assert(JS_SetPropertyStr(ctx,a,"x",JS_NewInt32(ctx,3))>=0);
    const char *code="(function readX(o){return o.x;})";
    JSValue fn=JS_Eval(ctx,code,strlen(code),"native-reentry.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(fn));
    number(ctx,JS_Call(ctx,fn,JS_UNDEFINED,1,(JSValueConst*)&a),3);
    JSFunctionBytecode *bc=JS_GetFunctionBytecode(fn);assert(bc->read_ic_count==1);
    callback_site=&bc->read_ic_sites[0];callback_receiver=fresh(ctx);callback_other=JS_NewObject(ctx);
    assert(JS_SetPropertyStr(ctx,callback_other,"pad",JS_NewInt32(ctx,99))>=0);
    assert(JS_SetPropertyStr(ctx,callback_other,"x",JS_NewInt32(ctx,9))>=0);
    JS_FreeValue(ctx,a);JS_FreeValue(ctx,special);assert(js_rc(callback_site->shape)->ref_count==1);
    callback_ctx=ctx;
    number(ctx,JS_Call(ctx,fn,JS_UNDEFINED,1,(JSValueConst*)&callback_receiver),3);
    assert(callback_fired==1);number(ctx,JS_Call(ctx,fn,JS_UNDEFINED,1,(JSValueConst*)&callback_receiver),17);
    callback_ctx=NULL;JS_FreeValue(ctx,callback_receiver);JS_FreeValue(ctx,callback_other);JS_FreeValue(ctx,fn);
    puts("RDI_UPDATE_NATIVE_REENTRY_PASS");
}
#endif
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    printf("LAYOUT:{\"JSRuntime\":%zu,\"JSShape\":%zu,\"JSObject\":%zu",sizeof(JSRuntime),sizeof(JSShape),sizeof(JSObject));
#ifdef GLOBAL_OWN_CACHE
    printf(",\"entry\":%zu,\"table\":%zu,\"head_offset\":%zu,\"runtime_table_offset\":%zu",
        sizeof(GlobalOwnEntry),sizeof(rt->global_own_offsets),offsetof(JSShape,own_cache_head),offsetof(JSRuntime,global_own_offsets));
#endif
    puts("}");
#ifdef GLOBAL_OWN_CACHE
    lifecycle(ctx);collisions(ctx);
#endif
#ifdef TEST_SPARSE
    reentry(ctx);
#endif
#ifdef GLOBAL_OWN_CACHE
    leave_runtime_entries(ctx);
#endif
    JS_FreeContext(ctx);JS_RunGC(rt);JS_FreeRuntime(rt);
    puts("WEAK_CACHE_FIXTURE_PASS");return 0;
}
