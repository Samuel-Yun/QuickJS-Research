/* Diagnostic C-API regression, not a benchmark or a VM patch.
 * The finalizer never executes JavaScript: it adds ordinary own int data fields
 * to a rooted ordinary object through the C API, while its context is alive.
 */
#include "quickjs.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>
static JSContext *active_ctx;
static JSValue active_target;
static int armed, finalized, mutations, mutation_errors;
static void resource_finalizer(JSRuntime *rt, JSValue value)
{
    (void)rt; (void)value;
    finalized++;
    if (!armed) return;
    for (int i=0;i<128;i++) {
        char name[64];
        snprintf(name,sizeof(name),"native_added_%d_%d",finalized,i);
        int ret=JS_SetPropertyStr(active_ctx,active_target,name,JS_NewInt32(active_ctx,i));
        if (ret<0) mutation_errors++; else mutations++;
    }
}
static int store(JSContext *ctx,JSValue function,JSValue obj,int x)
{
    JSValue args[2]={obj,JS_NewInt32(ctx,x)};
    JSValue result=JS_Call(ctx,function,JS_UNDEFINED,2,args);
    int bad=JS_IsException(result);
    if (bad) {
        JSValue exception=JS_GetException(ctx);
        const char *s=JS_ToCString(ctx,exception);
        fprintf(stderr,"exception: %s\n",s?s:"UNKNOWN");
        JS_FreeCString(ctx,s);JS_FreeValue(ctx,exception);
    }
    JS_FreeValue(ctx,result);return bad;
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JSClassID id;JS_NewClassID(&id);
    JSClassDef def={.class_name="NativeReleaseProbe",.finalizer=resource_finalizer};
    if (JS_NewClass(rt,id,&def)<0)return 2;
    const char *source="(function storeOnly(o,v){o.x=v;return 1;})";
    JSValue function=JS_Eval(ctx,source,strlen(source),"finalizer_store.js",JS_EVAL_TYPE_GLOBAL);
    if (JS_IsException(function))return 3;
    active_ctx=ctx;active_target=JS_UNDEFINED;
    for (int shape=0;shape<4;shape++) {
        JSValue prototype=JS_NewObject(ctx);
        JS_SetPropertyStr(ctx,prototype,"native_resource",JS_NewObjectClass(ctx,id));
        JSValue obj=JS_NewObjectProto(ctx,prototype);
        JS_SetPropertyStr(ctx,obj,"x",JS_NewInt32(ctx,0));
        for (int call=0;call<16;call++) if(store(ctx,function,obj,call))return 4;
        JS_FreeValue(ctx,obj);JS_FreeValue(ctx,prototype);
    }
    int before=finalized;
    JSValue prototype=JS_NewObject(ctx);
    JSValue target=JS_NewObjectProto(ctx,prototype);
    JS_SetPropertyStr(ctx,target,"x",JS_NewInt32(ctx,0));
    active_target=JS_DupValue(ctx,target);armed=1;
    int call_error=store(ctx,function,target,99);
    armed=0;
    int32_t observed=-1;
    JSValue result=JS_GetPropertyStr(ctx,target,"x");
    JS_ToInt32(ctx,&observed,result);JS_FreeValue(ctx,result);
    printf("FINALIZER_STORE expected=99 observed=%d before=%d after=%d mutations=%d mutation_errors=%d call_error=%d\n",
           observed,before,finalized,mutations,mutation_errors,call_error);
    JS_FreeValue(ctx,active_target);active_target=JS_UNDEFINED;
    JS_FreeValue(ctx,target);JS_FreeValue(ctx,prototype);JS_FreeValue(ctx,function);
    JS_FreeContext(ctx);JS_FreeRuntime(rt);
    if (observed!=99||call_error||mutation_errors)return 1;
    puts("FINALIZER_STORE_PASS");return 0;
}
