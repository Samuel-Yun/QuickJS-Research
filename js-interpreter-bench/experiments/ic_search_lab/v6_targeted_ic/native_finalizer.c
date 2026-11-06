/* C finalizers mutate a rooted target through C API only, never execute JS. */
#include "quickjs.h"
#include <stdio.h>
#include <string.h>
static JSContext *context;
static JSValue target;
static int armed, mode, releases, errors;
static JSValue get88(JSContext *ctx, JSValueConst obj, int argc, JSValueConst *argv)
{ (void)ctx; (void)obj; (void)argc; (void)argv; return JS_NewInt32(ctx,88); }
static void finish(JSRuntime *rt, JSValue value)
{
    (void)rt; (void)value; releases++;
    if (!armed) return;
    armed=0;
    if (mode==0) {
        for(int i=0;i<128;i++) {
            char name[32]; snprintf(name,sizeof(name),"added_%d",i);
            if(JS_SetPropertyStr(context,target,name,JS_NewInt32(context,i))<0) errors++;
        }
    } else if(mode==1) {
        JSAtom atom=JS_NewAtom(context,"x");
        if(JS_DeleteProperty(context,target,atom,0)<0) errors++;
        JS_FreeAtom(context,atom);
    } else if(mode==2 || mode==4) {
        if(JS_DefinePropertyValueStr(context,target,"x",JS_NewInt32(context,mode==2?77:99),
             JS_PROP_CONFIGURABLE|JS_PROP_ENUMERABLE|(mode==2?JS_PROP_WRITABLE:0))<0) errors++;
    } else {
        JSAtom atom=JS_NewAtom(context,"x");
        if(JS_DefinePropertyGetSet(context,target,atom,JS_NewCFunction(context,get88,"get",0),
              JS_UNDEFINED,JS_PROP_CONFIGURABLE)<0) errors++;
        JS_FreeAtom(context,atom);
    }
}
static int call(JSContext *ctx,JSValue f,JSValue o,int n)
{
    JSValue args[2]={o,JS_NewInt32(ctx,n)},v=JS_Call(ctx,f,JS_UNDEFINED,2,args);
    int failed=JS_IsException(v); JS_FreeValue(ctx,v); return failed;
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();context=JS_NewContext(rt);
    JSClassID id=0;JS_NewClassID(&id);
    JSClassDef cls={.class_name="V6Finalizer",.finalizer=finish};
    if(JS_NewClass(rt,id,&cls)<0)return 1;
    const char *source="(function store(o,v){o.x=v;return 1;})";
    JSValue f=JS_Eval(context,source,strlen(source),"native_finalizer.js",0);
    if(JS_IsException(f))return 2;
    for(mode=0;mode<5;mode++) {
        target=JS_NewObject(context);JS_SetPropertyStr(context,target,"x",JS_NewInt32(context,0));
        for(int i=0;i<8;i++)if(call(context,f,target,i))return 3;
        JS_SetPropertyStr(context,target,"x",JS_NewObjectClass(context,id));
        armed=1; if(call(context,f,target,42)||armed)return 4;
        JSValue v=JS_GetPropertyStr(context,target,"x");int32_t n=-1;
        if(mode==1) { if(!JS_IsUndefined(v))return 5; }
        else {if(JS_ToInt32(context,&n,v)||n!=(mode==0?42:mode==2?77:mode==3?88:99))return 6;}
        JS_FreeValue(context,v);
        if(call(context,f,target,43))return 7;
        v=JS_GetPropertyStr(context,target,"x");
        if(JS_ToInt32(context,&n,v)||n!=(mode==3?88:mode==4?99:43))return 8;
        JS_FreeValue(context,v);JS_FreeValue(context,target);target=JS_UNDEFINED;
    }
    JS_FreeValue(context,f);JS_RunGC(rt);JS_FreeContext(context);JS_FreeRuntime(rt);
    printf("V6_NATIVE_FINALIZER_PASS modes=5 releases=%d errors=%d\n",releases,errors);
    return errors||releases!=5;
}
