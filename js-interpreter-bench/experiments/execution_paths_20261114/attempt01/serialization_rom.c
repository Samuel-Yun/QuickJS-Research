#include "quickjs.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(void){
 const char *s="function sum(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}function bits(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}function f(o){o.x=o.x+1;return o.x;}function inc(o){o.x++;return o.x;}sum(16)+bits(255)+f({x:6})+inc({x:8});";
 JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);size_t size=0;
 JSValue compiled=JS_Eval(ctx,s,strlen(s),"rom_roundtrip.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
 uint8_t *buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);if(!buf||JS_IsException(compiled))return 2;
 uint8_t *rom=malloc(size);if(!rom)return 3;memcpy(rom,buf,size);js_free(ctx,buf);JS_FreeValue(ctx,compiled);
 JSValue v=JS_EvalFunction(ctx,JS_ReadObject(ctx,rom,size,JS_READ_OBJ_BYTECODE|JS_READ_OBJ_ROM_DATA));int32_t n=0;
 int error=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=144;
 printf("ROM_ROUNDTRIP_%s %d\n",error?"FAIL":"PASS",n);
 JS_FreeValue(ctx,v);JS_FreeContext(ctx);JS_FreeRuntime(rt);free(rom);return error;
}
