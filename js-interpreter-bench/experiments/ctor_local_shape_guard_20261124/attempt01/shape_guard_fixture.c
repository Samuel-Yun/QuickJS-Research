/* Internal semantic fixture only. Never linked into a benchmark qjs.
 * Ordinary JS functions materialize .prototype into an unhashed shape. To
 * exercise otherwise-unreachable guard branches, this fixture clones and
 * correctly hashes that already-materialized layout before learning. It does
 * not change a constructor bytecode/template or claim real JS coverage. */
#include "quickjs.c"

static JSValue fixture_eval(JSContext *ctx,const char *source)
{
    JSValue value=JS_Eval(ctx,source,strlen(source),"shape-guard-fixture.js",JS_EVAL_TYPE_GLOBAL);
    if(JS_IsException(value)){
        JSValue error=JS_GetException(ctx);const char *msg=JS_ToCString(ctx,error);
        fprintf(stderr,"fixture exception: %s\n",msg?msg:"unknown");abort();
    }
    return value;
}
static void fixture_run(JSContext *ctx,const char *source)
{
    JSValue v=fixture_eval(ctx,source);JS_FreeValue(ctx,v);
}
static void fixture_hash_layout(JSContext *ctx,JSObject *p)
{
    if(p->shape->is_hashed)return;
    assert(!p->shape->deleted_prop_count);
    JSShape *old=p->shape,*sh=js_clone_shape(ctx,old);assert(sh);
    sh->hash=shape_initial_hash(sh->proto);
    for(unsigned i=0;i<sh->prop_count;i++){
        JSShapeProperty *d=&get_shape_prop(sh)[i];assert(d->atom!=JS_ATOM_NULL);
        sh->hash=shape_hash(shape_hash(sh->hash,d->atom),d->flags);
    }
    sh->is_hashed=TRUE;js_shape_hash_link(ctx->rt,sh);
    p->shape=sh;js_free_shape(ctx->rt,old);
}
static void fixture_prepare(JSContext *ctx,int strict,int inherited_data)
{
    fixture_run(ctx,strict?"C=function(x,y){'use strict';this.x=x;this.y=y;};":"C=function(x,y){this.x=x;this.y=y;};");
    if(inherited_data)fixture_run(ctx,"C.prototype.x=77;");
    JSValue global=JS_GetGlobalObject(ctx),c=JS_GetPropertyStr(ctx,global,"C");
    JSValue proto=JS_GetPropertyStr(ctx,c,"prototype");assert(JS_IsObject(proto));
    fixture_hash_layout(ctx,JS_VALUE_GET_OBJ(c));
    for(JSObject *p=JS_VALUE_GET_OBJ(proto);p;p=p->shape->proto)fixture_hash_layout(ctx,p);
    JSValue keep=JS_NewObjectProto(ctx,proto);assert(!JS_IsException(keep));
    JS_SetPropertyStr(ctx,global,"keep",keep);
    JS_FreeValue(ctx,proto);JS_FreeValue(ctx,c);JS_FreeValue(ctx,global);
    fixture_run(ctx,"for(var warm=0;warm<128;warm++){var o=make(C);if(o.x!==3||o.y!==4)throw Error('warm');}");
}
static void fixture_cases(JSContext *ctx)
{
    fixture_run(ctx,"var C,keep,calls=0;function make(c){return new c(3,4);}");
    fixture_prepare(ctx,0,0);
#ifdef LSG_HAS_LOCAL
    assert(lsg_counts[LSG_positive_hits_local]>0);
    uint64_t failures=lsg_counts[LSG_local_failures],accepted=lsg_counts[LSG_full_check_accepts];
    uint64_t records=lsg_counts[LSG_records_built];
#endif
    fixture_run(ctx,"C.extra=1;for(var i=0;i<8;i++){if(make(C).x!==3)throw Error('shape fallback');}");
#ifdef LSG_HAS_LOCAL
    assert(lsg_counts[LSG_local_failures]>failures && lsg_counts[LSG_full_check_accepts]>accepted);
    assert(lsg_counts[LSG_records_built]==records); /* no refresh on fallback */
#endif
    fixture_prepare(ctx,0,0);
    JSValue global=JS_GetGlobalObject(ctx),c=JS_GetPropertyStr(ctx,global,"C");
    JSShape *before=JS_VALUE_GET_OBJ(c)->shape;
    JSValue proto=JS_NewObject(ctx),keep=JS_NewObjectProto(ctx,proto);
    JS_SetPropertyStr(ctx,global,"keep",keep);
    JS_SetPropertyStr(ctx,c,"prototype",JS_DupValue(ctx,proto));
    assert(JS_VALUE_GET_OBJ(c)->shape==before); /* value changed, layout did not */
    fixture_run(ctx,"var o=make(C);if(o.x!==3||o.y!==4||Object.getPrototypeOf(o)!==C.prototype)throw Error('prototype value');");
    JS_FreeValue(ctx,proto);JS_FreeValue(ctx,c);JS_FreeValue(ctx,global);
    fixture_prepare(ctx,0,0);
    fixture_run(ctx,"Object.defineProperty(C.prototype,'x',{set:function(v){calls++;this.z=v+10;},configurable:true});var o=make(C);if(o.z!==13||o.y!==4||calls!==1)throw Error('setter');");
    fixture_prepare(ctx,1,0);
    fixture_run(ctx,"Object.defineProperty(C.prototype,'x',{value:99,writable:false,configurable:true});var threw=false;try{make(C);}catch(e){threw=e instanceof TypeError;}if(!threw)throw Error('readonly');");
    fixture_prepare(ctx,0,1);
    fixture_run(ctx,"delete C.prototype.x;if(make(C).x!==3)throw Error('delete');");
    fixture_prepare(ctx,0,0);
    fixture_run(ctx,"Object.setPrototypeOf(C.prototype,{pad:1});if(make(C).x!==3)throw Error('chain');");
    fixture_prepare(ctx,0,0);
    fixture_run(ctx,"Object.defineProperty(Object.prototype,'x',{set:function(v){calls++;this.z=v+20;},configurable:true});var o=make(C);if(o.z!==23||o.y!==4||calls!==2)throw Error('upper setter');delete Object.prototype.x;");
    JS_RunGC(ctx->rt);
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *a=JS_NewContext(rt),*b=JS_NewContext(rt);
#ifdef LSG_TEST_SPARSE
    void *measure=js_mallocz_rt(rt,sizeof(FullPlan));assert(measure);
    printf("PLAN_LAYOUT:{\"FourSite\":%zu,\"FullPlan\":%zu,\"FullPlan_usable\":%zu",
        sizeof(FourSite),sizeof(FullPlan),js_malloc_usable_size_rt(rt,measure));js_free_rt(rt,measure);
#ifdef LSG_TEST_LOCAL
    measure=js_mallocz_rt(rt,sizeof(LocalShapeGuard));assert(measure);
    printf(",\"LocalShapeGuard\":%zu,\"LocalShapeGuard_usable\":%zu",sizeof(LocalShapeGuard),js_malloc_usable_size_rt(rt,measure));
    js_free_rt(rt,measure);
#endif
    puts("}");
#endif
#ifdef LSG_HAS_LOCAL
    if(getenv("LSG_FAIL_RECORD_ALLOC")){
        fixture_run(a,"var C,keep;function make(c){return new c(3,4);}");
        fixture_prepare(a,0,0);
        assert(lsg_counts[LSG_record_allocation_failures]>0 && lsg_counts[LSG_records_built]==0);
        assert(lsg_counts[LSG_positive_hits]>0);
    }else
#endif
    {fixture_cases(a);fixture_cases(b);}
    JS_FreeContext(a);JS_RunGC(rt);JS_FreeContext(b);JS_RunGC(rt);JS_FreeRuntime(rt);
#ifdef LSG_HAS_LOCAL
    assert(lsg_counts[LSG_shape_refs_held]==lsg_counts[LSG_shape_refs_released]);
    assert(lsg_counts[LSG_records_built]==lsg_counts[LSG_records_freed]);
#endif
    puts("SHAPE_GUARD_FIXTURE_PASS");return 0;
}
