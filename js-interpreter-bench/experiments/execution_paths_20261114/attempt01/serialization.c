#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void)
{
    const char *s="function f(o){o.x=o.x+1;return o.x;}function sum(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}f({x:6})+sum(16);";
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JSValue compiled=JS_Eval(ctx,s,strlen(s),"roundtrip.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
    size_t size=0;uint8_t *buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);
    if(!buf || JS_IsException(compiled))return 2;
    JSValue read=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE);
    JSValue result=JS_EvalFunction(ctx,read);int32_t value=0;
    int error=JS_IsException(result)||JS_ToInt32(ctx,&value,result)||value!=127;
    printf("roundtrip=%s value=%d\n",error?"FAIL":"PASS",value);
    js_free(ctx,buf);JS_FreeValue(ctx,compiled);JS_FreeValue(ctx,result);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    return error;
}
