/* Public QuickJS API gate: first-entry OOM, retry, cold/warm copy and ROM read. */
#include <stdio.h>
#include <string.h>
#include "quickjs.h"
static int check(JSContext *ctx, JSValue value) {
    int32_t n=-1;int bad=JS_IsException(value)||JS_ToInt32(ctx,&n,value)||n!=64;
    JS_FreeValue(ctx,value);return bad;
}
int main(void) {
    const char *source="function f(o){return o.x;}var o={x:64};f(o);";
    int bad=0,failed=0,passed=0;
    for(int round=0;round<4;round++) {
        JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
        JSValue compiled=JS_Eval(ctx,source,strlen(source),"v2entry.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
        if(JS_IsException(compiled))return 1;
        if(round==0) {
            JSMemoryUsage u;JS_ComputeMemoryUsage(rt,&u);JS_SetMemoryLimit(rt,(size_t)u.malloc_size);
            JSValue v=JS_EvalFunction(ctx,JS_DupValue(ctx,compiled));
            if(JS_IsException(v)){JSValue e=JS_GetException(ctx);JS_FreeValue(ctx,e);failed++;}
            else {bad|=check(ctx,v);passed++;}
            JS_SetMemoryLimit(rt,(size_t)-1);
        }
        bad|=check(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,compiled)));
        size_t length=0;uint8_t *buf=JS_WriteObject(ctx,&length,compiled,JS_WRITE_OBJ_BYTECODE);
        if(!buf)return 2;
        JSValue loaded=JS_ReadObject(ctx,buf,length,JS_READ_OBJ_BYTECODE|(round&1?JS_READ_OBJ_ROM_DATA:0));
        if(JS_IsException(loaded))return 3;
        bad|=check(ctx,JS_EvalFunction(ctx,loaded));js_free(ctx,buf);
        JS_FreeValue(ctx,compiled);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    }
    printf("FIRST_ENTRY_ROM_RETRY_%s limited_fail=%d limited_success=%d\n",bad?"FAIL":"PASS",failed,passed);
    return bad;
}
