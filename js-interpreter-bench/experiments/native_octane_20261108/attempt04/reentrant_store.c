#include <stdio.h>
#include <string.h>
#include "quickjs.h"
static JSClassID exp_token_class;
static JSContext *exp_callback_ctx;
static JSValue exp_callback;
static int exp_callback_calls, exp_callback_failed;
static void exp_token_finalize(JSRuntime *rt, JSValue value)
{
    if(exp_callback_ctx){
        exp_callback_calls++;
        JSValue result=JS_Call(exp_callback_ctx,exp_callback,JS_UNDEFINED,0,NULL);
        if(JS_IsException(result))exp_callback_failed=1;
        JS_FreeValue(exp_callback_ctx,result);
    }
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JS_NewClassID(&exp_token_class);
    JSClassDef def={"StoreToken",.finalizer=exp_token_finalize};
    if(JS_NewClass(rt,exp_token_class,&def))return 1;
    const char *source="var target={x:1},observed=0;"
      "function overwrite(o,v){o.x;o.x=v;return o.x;}"
      "function reenter(){observed=target.x;target.extra=99;target.x=23;}"
      "for(var i=0;i<64;i++)overwrite(target,i);";
    JSValue value=JS_Eval(ctx,source,strlen(source),"store_reentry.js",0);
    if(JS_IsException(value))return 2;JS_FreeValue(ctx,value);
    JSValue global=JS_GetGlobalObject(ctx),target=JS_GetPropertyStr(ctx,global,"target");
    exp_callback=JS_GetPropertyStr(ctx,global,"reenter");
    JSValue token=JS_NewObjectClass(ctx,exp_token_class);
    if(JS_IsException(token)||JS_SetPropertyStr(ctx,target,"x",token)<0)return 3;
    exp_callback_calls=exp_callback_failed=0;exp_callback_ctx=ctx;
    const char *call="overwrite(target,71)";
    value=JS_Eval(ctx,call,strlen(call),"store_call.js",0);int32_t result=-1;
    if(JS_IsException(value)||JS_ToInt32(ctx,&result,value)||result!=23)return 4;
    JS_FreeValue(ctx,value);exp_callback_ctx=NULL;
    value=JS_GetPropertyStr(ctx,global,"observed");
    if(JS_ToInt32(ctx,&result,value)||result!=71||exp_callback_calls!=1||exp_callback_failed)return 5;
    JS_FreeValue(ctx,value);JS_FreeValue(ctx,exp_callback);JS_FreeValue(ctx,target);JS_FreeValue(ctx,global);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    printf("REENTRANT_STORE_PASS callback_observed_published_value=71 calls=%d\n",exp_callback_calls);return 0;
}
