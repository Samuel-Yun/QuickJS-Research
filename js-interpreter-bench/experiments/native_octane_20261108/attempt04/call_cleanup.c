#include <stdio.h>
#include <string.h>
#include "quickjs.h"
static JSClassID box_class;
static int released[128], count;
static void finalize(JSRuntime *rt, JSValue value)
{
    int *id=JS_GetOpaque(value,box_class);
    if(id){released[count++]=*id;js_free_rt(rt,id);}
}
static JSValue make(JSContext *ctx, JSValueConst t, int argc, JSValueConst *argv)
{
    int32_t id=0;if(JS_ToInt32(ctx,&id,argv[0]))return JS_EXCEPTION;
    JSValue value=JS_NewObjectClass(ctx,box_class);if(JS_IsException(value))return value;
    int *p=js_malloc(ctx,sizeof(*p));if(!p){JS_FreeValue(ctx,value);return JS_EXCEPTION;}
    *p=id;JS_SetOpaque(value,p);return value;
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    JS_NewClassID(&box_class);JSClassDef def={"Box",.finalizer=finalize};
    if(JS_NewClass(rt,box_class,&def))return 1;
    JSValue global=JS_GetGlobalObject(ctx);
    JS_SetPropertyStr(ctx,global,"make",JS_NewCFunction(ctx,make,"make",1));
    const char *setup="function sink(a,b,c,d,e){return 7;}";
    JSValue result=JS_Eval(ctx,setup,strlen(setup),"setup.js",0);
    if(JS_IsException(result))return 2;JS_FreeValue(ctx,result);
    JSValue proto=JS_NewObject(ctx),sink=JS_GetPropertyStr(ctx,global,"sink");
    JS_SetPropertyStr(ctx,proto,"step",sink);JS_SetClassProto(ctx,box_class,proto);
    for(int method=0;method<2;method++)for(int argc=0;argc<=5;argc++){
        char source[256],piece[32];snprintf(source,sizeof(source),"%s(",method?"make(-2).step":"sink");
        for(int i=0;i<argc;i++){snprintf(piece,sizeof(piece),"%smake(%d)",i?",":"",i);strcat(source,piece);}
        strcat(source,");");int before=count,n=-1;
        result=JS_Eval(ctx,source,strlen(source),"cleanup.js",0);
        if(JS_IsException(result)||JS_ToInt32(ctx,&n,result)||n!=7)return 3;
        JS_FreeValue(ctx,result);
        if(count-before!=argc+method)return 4;
        if(method&&released[before++]!=-2)return 5;
        for(int i=0;i<argc;i++)if(released[before+i]!=i)return 6;
    }
    JS_FreeValue(ctx,global);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    printf("CALL_CLEANUP_ORDER_PASS finalized=%d\n",count);return 0;
}
