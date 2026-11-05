/* Positive lookup hint must not resurrect an unlinked property during release. */
#include <stdio.h>
#include <string.h>
#include "quickjs.h"
static JSContext *saved_ctx;
static JSValue saved_receiver;
static int finalized,saw_undefined;
static void finalizer(JSRuntime *rt,JSValue object) {
    (void)rt;(void)object;finalized++;
    JSValue v=JS_GetPropertyStr(saved_ctx,saved_receiver,"x");
    saw_undefined=JS_IsUndefined(v);JS_FreeValue(saved_ctx,v);
}
int main(void) {
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);JSClassID id;
    JSClassDef def={0};def.class_name="V2DeleteProbe";def.finalizer=finalizer;
    JS_NewClassID(&id);if(JS_NewClass(rt,id,&def))return 1;
    JS_SetClassProto(ctx,id,JS_NewObject(ctx));
    saved_ctx=ctx;saved_receiver=JS_NewObject(ctx);
    JSValue value=JS_NewObjectClass(ctx,id);
    if(JS_SetPropertyStr(ctx,saved_receiver,"x",value)<0)return 2;
    JSValue global=JS_GetGlobalObject(ctx);
    if(JS_SetPropertyStr(ctx,global,"receiver",JS_DupValue(ctx,saved_receiver))<0)return 3;
    const char *source="receiver.x;";
    JSValue primed=JS_Eval(ctx,source,strlen(source),"prime_hint.js",0);
    if(JS_IsException(primed))return 4;JS_FreeValue(ctx,primed);
    JSAtom atom=JS_NewAtom(ctx,"x");int deleted=JS_DeleteProperty(ctx,saved_receiver,atom,0);JS_FreeAtom(ctx,atom);
    int bad=deleted!=1||finalized!=1||!saw_undefined;
    printf("DELETE_REENTRY_%s deleted=%d finalized=%d saw_undefined=%d\n",bad?"FAIL":"PASS",deleted,finalized,saw_undefined);
    JS_FreeValue(ctx,saved_receiver);JS_FreeValue(ctx,global);JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);return bad;
}
