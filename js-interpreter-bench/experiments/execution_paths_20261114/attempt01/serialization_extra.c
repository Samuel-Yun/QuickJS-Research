#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void){
 const char *s="function bits(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}function inc(o){o.x++;return o.x;}bits(255)+inc({x:6});";
 JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);size_t size=0;
 JSValue compiled=JS_Eval(ctx,s,strlen(s),"extra_roundtrip.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
 uint8_t *buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);if(!buf||JS_IsException(compiled))return 2;
 JSValue value=JS_EvalFunction(ctx,JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE));int32_t n=0;
 int error=JS_IsException(value)||JS_ToInt32(ctx,&n,value)||n!=15;printf("EXTRA_ROUNDTRIP_%s %d\n",error?"FAIL":"PASS",n);
 js_free(ctx,buf);JS_FreeValue(ctx,value);JS_FreeValue(ctx,compiled);JS_FreeContext(ctx);JS_FreeRuntime(rt);return error;
}
