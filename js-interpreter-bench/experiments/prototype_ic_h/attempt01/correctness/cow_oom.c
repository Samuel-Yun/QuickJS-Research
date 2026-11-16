/* Narrow internal COW failure regression; separate from release and timing. */
#include "quickjs.c"
int main(void) {
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *s="function cowRead(o){return o.x;}var p={x:7};"
      "for(var k=0;k<128;k++)p['field'+k]=k;var o=Object.create(p);cowRead(o);cowRead(o);";
    JSValue v=JS_Eval(ctx,s,strlen(s),"H_COW_OOM.js",0);if(JS_IsException(v))return 1;JS_FreeValue(ctx,v);
    JSValue g=JS_GetGlobalObject(ctx),p=JS_GetPropertyStr(ctx,g,"p"),o=JS_GetPropertyStr(ctx,g,"o"),f=JS_GetPropertyStr(ctx,g,"cowRead");
    JSObject *holder=JS_VALUE_GET_OBJ(p);JSShape *saved=holder->shape;
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
    if(b->read_ic_count!=1 || b->read_ic_sites[0].holder_shape!=saved || !saved->is_hashed)return 2;
    if(get_shape_size(saved->prop_hash_mask+1,saved->prop_size)<=JS_MALLOC_MAX_SMALL_SIZE)return 7;
    int failures=0;
    for(int i=0;i<32;i++) {
        JS_SetMemoryLimit(rt,0); /* Force large COW allocation through checked allocator. */
        int result=js_shape_prepare_update(ctx,holder,NULL);
        JS_SetMemoryLimit(rt,(size_t)-1);
        if(result!=-1 || holder->shape!=saved)return 3;
        JSValue error=JS_GetException(ctx);if(JS_IsNull(error))return 4;JS_FreeValue(ctx,error);failures++;
        v=JS_Call(ctx,f,JS_UNDEFINED,1,&o);int32_t n=-1;
        if(JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=7)return 5;JS_FreeValue(ctx,v);
    }
    JS_FreeValue(ctx,f);JS_FreeValue(ctx,p);JS_FreeValue(ctx,o);JS_FreeValue(ctx,g);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    if(h_live_bytes || h_shape_retains!=h_shape_releases)return 6;
    printf("H_COW_OOM_PASS limits=%d cached_shape_and_value_preserved=32\n",failures);return 0;
}
