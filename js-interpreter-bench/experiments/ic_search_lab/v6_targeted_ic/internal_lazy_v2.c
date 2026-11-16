/* Corrected pending-exception check: the normal empty value is not assumed null. */
#include "quickjs.c"
static int invoke(JSContext *ctx,JSValue f,JSValue o,int expected)
{
    JSValue v=JS_Call(ctx,f,JS_UNDEFINED,1,&o);int32_t n=-1;
    int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=expected;
    JS_FreeValue(ctx,v);return bad;
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *s="(function value(o){return o.x;})";
    JSValue f=JS_Eval(ctx,s,strlen(s),"lazy_entry_v2.js",0);
    JSValue o=JS_NewObject(ctx);JS_SetPropertyStr(ctx,o,"x",JS_NewInt32(ctx,7));
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
    if(b->read_ic_ready||b->read_ic_sites)return 3;
    for(int i=0;i<2;i++)if(invoke(ctx,f,o,7)||b->read_ic_ready)return 4;
    if(invoke(ctx,f,o,7)||!b->read_ic_ready||b->read_ic_count!=1)return 5;
    JS_FreeValue(ctx,f);
    char source[16384];strcpy(source,"(function many(o){return ");
    for(int i=0;i<300;i++)strcat(source,i?"+o.x":"o.x");strcat(source,";})");
    f=JS_Eval(ctx,source,strlen(source),"optional_oom_v2.js",0);
    if(JS_IsException(f))return 6;
    b=JS_VALUE_GET_OBJ(f)->u.func.function_bytecode;
    for(int i=0;i<2;i++)if(invoke(ctx,f,o,2100))return 7;
    const uint8_t *old=b->byte_code_buf;
    int prior_tag=JS_VALUE_GET_TAG(rt->current_exception);
    JS_SetMemoryLimit(rt,0);
    int bad=invoke(ctx,f,o,2100);
    JS_SetMemoryLimit(rt,(size_t)-1);
    if(bad||b->read_ic_sites||b->byte_code_buf!=old||!b->read_ic_ready)return 8;
    if(JS_VALUE_GET_TAG(rt->current_exception)!=prior_tag)return 9;
    if(invoke(ctx,f,o,2100))return 10;
    printf("V6_LAZY_PREPARE_PASS threshold=3 cold_calls=2 optional_oom_keeps_image=1 pending_tag=%d\n",prior_tag);
    JS_FreeValue(ctx,f);JS_FreeValue(ctx,o);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    return 0;
}
