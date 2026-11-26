#include <stdio.h>
#include <string.h>
#include "quickjs.h"
static int check(JSContext *ctx, JSValue value) {
    int32_t n=-1;int bad=JS_IsException(value)||JS_ToInt32(ctx,&n,value)||n!=7;
    JS_FreeValue(ctx,value);return bad;
}
int main(void) {
    const char *source="function meth(x){return x+this.bias;}"
      "function call(o){return o.step(4);}function ref(o){return o.x;}"
      "var anchor={},obj={bias:3,step:meth},box={x:anchor};"
      "for(var i=0;i<32;i++){if(call(obj)!==7||ref(box)!==anchor)throw Error('warm');}call(obj);";
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JSValue compiled=JS_Eval(ctx,source,strlen(source),"read_roundtrip.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
    if(JS_IsException(compiled))return 1;
    int bad=check(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,compiled)));
    size_t size;uint8_t *buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);
    if(!buf)return 2;
    JSValue loaded=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE);js_free(ctx,buf);
    if(JS_IsException(loaded))return 3;
    bad|=check(ctx,JS_EvalFunction(ctx,loaded));JS_FreeValue(ctx,compiled);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    printf("READ_METHOD_REFERENCE_ROUNDTRIP_%s\n",bad?"FAIL":"PASS");return bad;
}
