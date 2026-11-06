/* Independent internal mechanism check, never a timed binary. */
#include "quickjs.c"
static int read_int(JSContext *ctx,JSValue f,JSValue o,int expected)
{
    JSValue v=JS_Call(ctx,f,JS_UNDEFINED,1,&o);int32_t n=-1;
    int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=expected;
    JS_FreeValue(ctx,v);return bad;
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *source="(function read(o){return o.x;})";
    JSValue f=JS_Eval(ctx,source,strlen(source),"id_mechanism.js",0);
    JSValue o=JS_NewObject(ctx);JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,7));
    if(read_int(ctx,f,o,7)||read_int(ctx,f,o,7))return 1;
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
    JSShape *before=JS_VALUE_GET_OBJ(o)->shape;uint64_t old_id=before->v6_layout_id;
    if(!old_id||sizeof(ReadICSite)!=16)return 2;
    JS_SetPropertyStr(ctx,o,"y",JS_NewInt32(ctx,8));
    int inplace=before==JS_VALUE_GET_OBJ(o)->shape;
    if(read_int(ctx,f,o,7))return 3;
    uint64_t changed=JS_VALUE_GET_OBJ(o)->shape->v6_layout_id;
    if(changed==old_id)return 4;
    JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,11));
    if(read_int(ctx,f,o,11)||JS_VALUE_GET_OBJ(o)->shape->v6_layout_id!=changed)return 5;
    JS_FreeValue(ctx,o);
    int reused=0;
#ifdef V6_ID_READ
    /* Force observed same-address, different-layout reuse, or report failure.
       No inference from merely not observing a reuse. */
    for(int i=0;i<10000 && !reused;i++) {
        JSValue a=JS_NewObject(ctx);JS_SetPropertyStr(ctx,a,"x",JS_NewInt32(ctx,17));
        if(read_int(ctx,f,a,17))return 6;
        uintptr_t address=(uintptr_t)JS_VALUE_GET_OBJ(a)->shape;
        uint64_t prior=JS_VALUE_GET_OBJ(a)->shape->v6_layout_id;
        JS_FreeValue(ctx,a);
        JSValue next=JS_NewObject(ctx);JS_SetPropertyStr(ctx,next,"pad",JS_NewInt32(ctx,99));
        JS_SetPropertyStr(ctx,next,"x",JS_NewInt32(ctx,23));
        if((uintptr_t)JS_VALUE_GET_OBJ(next)->shape==address) {
            if(JS_VALUE_GET_OBJ(next)->shape->v6_layout_id==prior)return 7;
            reused=1;
        }
        if(read_int(ctx,f,next,23))return 8;
        JS_FreeValue(ctx,next);
    }
    if(!reused)return 9;
#endif
    rt->v6_next_layout_id=UINT64_MAX-1;
    o=JS_NewObject(ctx);JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,31));
    if(read_int(ctx,f,o,31))return 10;
    JS_SetPropertyStr(ctx,o,"new_layout",JS_NewInt32(ctx,0));
    if(read_int(ctx,f,o,31)||rt->v6_next_layout_id!=UINT64_MAX)return 11;
    if(JS_VALUE_GET_OBJ(o)->shape->v6_layout_id!=0)return 12;
#ifdef V6_ID_READ
    if(b->read_ic_sites[0].layout_id==0) return 13; /* old ID may remain, never matches0 */
#endif
    printf("V6_ID_PASS site_bytes=%zu shape_bytes=%zu runtime_bytes=%zu inplace=%d address_reuse=%d saturated=1\n",
           sizeof(ReadICSite),sizeof(JSShape),sizeof(JSRuntime),inplace,reused);
    JS_FreeValue(ctx,o);JS_FreeValue(ctx,f);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    return 0;
}
