/* Internal diagnostic regression only, not a timed VM or workload. */
#include "quickjs.c"
static int assertions;
#define CHECK(c) do { assertions++; if(!(c)){fprintf(stderr,"INTERNAL_FAIL line=%d\n",__LINE__);return 1;} } while(0)
static int eval7(JSContext *ctx,const char *source) {
    JSValue v=JS_Eval(ctx,source,strlen(source),"H_internal_regression.js",0);
    int32_t n=-1;int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=7;
    if(JS_IsException(v)) {JSValue e=JS_GetException(ctx);const char *s=JS_ToCString(ctx,e);fprintf(stderr,"%s\n",s?s:"exception");JS_FreeCString(ctx,s);JS_FreeValue(ctx,e);}
    JS_FreeValue(ctx,v);return bad;
}
static JSValue global(JSContext *ctx,const char *name) {
    JSValue g=JS_GetGlobalObject(ctx),v=JS_GetPropertyStr(ctx,g,name);JS_FreeValue(ctx,g);return v;
}
static int empty_caches(JSValueConst v) {
    if(JS_VALUE_GET_TAG(v)!=JS_TAG_FUNCTION_BYTECODE)return 1;
    JSFunctionBytecode *b=JS_VALUE_GET_PTR(v);
    for(unsigned i=0;i<b->read_ic_count;i++)if(b->read_ic_sites[i].shape||b->read_ic_sites[i].holder_shape)return 0;
    for(int i=0;i<b->cpool_count;i++)if(!empty_caches(b->cpool[i]))return 0;
    return 1;
}
static void register_loaded(JSContext *ctx,JSValueConst v) {
    if(JS_VALUE_GET_TAG(v)!=JS_TAG_FUNCTION_BYTECODE)return;
    JSFunctionBytecode *b=JS_VALUE_GET_PTR(v);audit_register(ctx,b);
    for(int i=0;i<b->cpool_count;i++)register_loaded(ctx,b->cpool[i]);
}
int main(void) {
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    CHECK(!eval7(ctx,"function ih(o){return o.x;}var hp={x:7},ho=Object.create(hp);ih(ho);ih(ho);7;"));
    JSValue fn=global(ctx,"ih"),pv=global(ctx,"hp"),ov=global(ctx,"ho");
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(fn)->u.func.function_bytecode;
    CHECK(b->read_ic_count==1);
    ReadICSite *site=&b->read_ic_sites[0];JSObject *p=JS_VALUE_GET_OBJ(pv),*o=JS_VALUE_GET_OBJ(ov);
    CHECK(site->shape==o->shape && site->holder_shape==p->shape);
    AuditFunction *af=audit_function(b);CHECK(af!=NULL);
    unsigned pc=0;while(pc<af->length && af->before[pc]!=OP_get_field_rdi)pc+=short_opcode_info(af->before[pc]).size;
    CHECK(pc<af->length && af->sites[pc].h_proto_hits==1);
    unsigned long long oldhits=af->sites[pc].h_proto_hits;
    // Legal upstream mutation helper makes a fresh unhashed holder while the
    // cached old hashed shape is pinned. The H guard must miss, never refill it.
    CHECK(js_shape_prepare_update(ctx,p,NULL)==0 && !p->shape->is_hashed);
    CHECK(site->holder_shape!=p->shape);
    CHECK(!eval7(ctx,"ih(ho);ih(ho);7;"));
    CHECK(af->sites[pc].h_proto_hits==oldhits && af->sites[pc].h_holder_misses>=2);
    CHECK(js_shape_prepare_update(ctx,o,NULL)==0 && !o->shape->is_hashed);
    CHECK(!eval7(ctx,"ih(ho);ih(ho);7;"));
    CHECK(af->sites[pc].h_proto_hits==oldhits);
    JS_FreeValue(ctx,fn);JS_FreeValue(ctx,pv);JS_FreeValue(ctx,ov);
    // Distinct static site for own <-> inherited cache kind transitions.
    CHECK(!eval7(ctx,"function swapH(o){return o.x;}var sp={x:7},so=Object.create(sp);swapH(so);swapH(so);so.x=7;swapH(so);swapH(so);7;"));
    fn=global(ctx,"swapH");b=JS_VALUE_GET_OBJ(fn)->u.func.function_bytecode;site=&b->read_ic_sites[0];
    CHECK(site->shape!=NULL && site->holder_shape==NULL);
    CHECK(!eval7(ctx,"delete so.x;if(swapH(so)!==7)throw Error('shadow');7;"));
    JS_FreeValue(ctx,fn);
    // Hot compiled representation must export ordinary opcodes, reload empty,
    // and then really refill H; both normal and ROM modes are exercised.
    const char *source="function loadedH(o){return o.x;}var lp={x:7},lo=Object.create(lp);loadedH(lo);loadedH(lo);7;";
    JSValue compiled=JS_Eval(ctx,source,strlen(source),"H_internal_serial.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
    CHECK(!JS_IsException(compiled));
    JSValue v=JS_EvalFunction(ctx,JS_DupValue(ctx,compiled));CHECK(!JS_IsException(v));JS_FreeValue(ctx,v);
    size_t size;uint8_t *buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);CHECK(buf!=NULL);
    for(int rom=0;rom<2;rom++) {
        JSValue loaded=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));
        CHECK(!JS_IsException(loaded) && empty_caches(loaded));
        register_loaded(ctx,loaded); /* Narrow diagnostic ordinarily registers source compilation only. */
        v=JS_EvalFunction(ctx,loaded);CHECK(!JS_IsException(v));JS_FreeValue(ctx,v);
        fn=global(ctx,"loadedH");b=JS_VALUE_GET_OBJ(fn)->u.func.function_bytecode;
        CHECK(b->read_ic_count==1 && b->read_ic_sites[0].holder_shape!=NULL);
        af=audit_function(b);CHECK(af!=NULL);
        unsigned long long hits=0;for(unsigned i=0;i<af->length;i++)hits+=af->sites[i].h_proto_hits;
        CHECK(hits==1);JS_FreeValue(ctx,fn);
    }
    js_free(ctx,buf);JS_FreeValue(ctx,compiled);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    CHECK(h_live_bytes==0 && h_shape_retains==h_shape_releases);
    audit_report();
    printf("H_INTERNAL_PASS assertions=%d site_size=%zu retained=%llu released=%llu\n",assertions,sizeof(ReadICSite),h_shape_retains,h_shape_releases);
    return 0;
}
