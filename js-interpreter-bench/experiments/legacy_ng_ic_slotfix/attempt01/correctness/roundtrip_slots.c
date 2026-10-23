#include <stdio.h>
#include <string.h>
#include "quickjs.h"
static int answer(JSContext *ctx,JSValue v){
    int32_t x=-1;int bad=JS_IsException(v)||JS_ToInt32(ctx,&x,v)||x!=64;
    JS_FreeValue(ctx,v);return bad;
}
int main(void){
    const char *source="function rw(o){o.x+=1;return o.x;}"
      "var a=[{x:0},{a:1,x:0},{b:2,c:3,x:0},{d:4,e:5,f:6,x:0}];"
      "for(var i=0;i<64;i++)rw(a[i%4]);a[0].x+a[1].x+a[2].x+a[3].x;";
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JSValue compiled,loaded,error;uint8_t *buf;size_t size;
    int bad=0,failures=0,successes=0;
    compiled=JS_Eval(ctx,source,strlen(source),"multi_roundtrip.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
    if(JS_IsException(compiled))return 1;
    bad|=answer(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,compiled)));
    buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);if(!buf)return 2;
    loaded=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE);js_free(ctx,buf);
    if(JS_IsException(loaded))return 3;
    bad|=answer(ctx,JS_EvalFunction(ctx,loaded));JS_FreeValue(ctx,compiled);JS_RunGC(rt);
    for(size_t budget=0;budget<24576;budget+=128){
        JSMemoryUsage u;JS_ComputeMemoryUsage(rt,&u);JS_SetMemoryLimit(rt,(size_t)u.malloc_size+budget);
        compiled=JS_Eval(ctx,source,strlen(source),"multi_oom.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
        JS_SetMemoryLimit(rt,(size_t)-1);
        if(JS_IsException(compiled)){error=JS_GetException(ctx);JS_FreeValue(ctx,error);failures++;}
        else{JS_FreeValue(ctx,compiled);successes++;}JS_RunGC(rt);
    }
    JS_FreeContext(ctx);JS_FreeRuntime(rt);
    printf("MULTI_ROUNDTRIP_OOM %s failed_limits=%d successful_limits=%d\n",bad?"FAIL":"PASS",failures,successes);
    return bad||failures==0||successes==0;
}
