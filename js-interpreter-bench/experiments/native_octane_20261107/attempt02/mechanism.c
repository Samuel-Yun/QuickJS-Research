static unsigned long combo_fused_hits,combo_proto_hits;
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
    const char *source="(function(o){return o.x;})";
    JSValue own=JS_Eval(ctx,source,strlen(source),"own.js",0);
    source="(function(o){return o.step();})";
    JSValue method=JS_Eval(ctx,source,strlen(source),"method.js",0);
    source="(function(){var p={step:function(){return this.x+1;}};var o=Object.create(p);o.x=7;return o;})()";
    JSValue o=JS_Eval(ctx,source,strlen(source),"object.js",0);
    if(JS_IsException(own)||JS_IsException(method)||JS_IsException(o))return 1;
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(own)->u.func.function_bytecode;
    if(sizeof(ReadICSite)!=24||b->byte_code_len!=7||b->byte_code_buf[0]!=OP_v6_get_arg0||b->byte_code_buf[1]!=OP_get_field_rdi)return 2;
    for(int i=0;i<32;i++)if(invoke(ctx,own,o,7)||invoke(ctx,method,o,8))return 3;
    if(combo_fused_hits<31||combo_proto_hits<31)return 4;
    JSFunctionBytecode *m=JS_VALUE_GET_OBJ(method)->u.func.function_bytecode;
    if(m->read_ic_count!=1||!m->read_ic_sites[0].holder_shape)return 5;
    printf("COMBINATION_MECHANISM_PASS site_bytes=%zu fused_hits=%lu proto_hits=%lu second_entry_preserved=1\n",sizeof(ReadICSite),combo_fused_hits,combo_proto_hits);
    JS_FreeValue(ctx,o);JS_FreeValue(ctx,own);JS_FreeValue(ctx,method);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);return 0;
}
