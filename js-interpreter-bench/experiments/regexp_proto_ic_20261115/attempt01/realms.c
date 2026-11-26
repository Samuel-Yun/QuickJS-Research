#include "quickjs.h"
#include <stdio.h>
#include <string.h>
static int setup(JSContext *ctx,const char *label)
{
    char text[1024];
    snprintf(text,sizeof(text),"globalThis.re=/a/;RegExp.prototype.exec=function(s){return '%s:'+String(this===re)+':'+s;};globalThis.read=function(re,s){return re.exec(s);};",label);
    JSValue v=JS_Eval(ctx,text,strlen(text),"realm_setup.js",JS_EVAL_TYPE_GLOBAL);int fail=JS_IsException(v);JS_FreeValue(ctx,v);return fail;
}
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *a=JS_NewContext(rt),*b=JS_NewContext(rt);int fail=0,count=0;
    if(setup(a,"A")||setup(b,"B"))return 2;
    JSValue ga=JS_GetGlobalObject(a),gb=JS_GetGlobalObject(b),fn=JS_GetPropertyStr(a,ga,"read");
    JSValue ra=JS_GetPropertyStr(a,ga,"re"),rb=JS_GetPropertyStr(b,gb,"re");
    JSValue s=JS_NewString(a,"ok");
    for(int phase=0;phase<3;phase++)for(int i=0;i<32;i++){
        int which=phase==0?0:phase==1?1:i&1;
        JSValue args[2]={which?rb:ra,s};JSValue value=JS_Call(a,fn,JS_UNDEFINED,2,args);
        const char *actual=JS_ToCString(a,value);const char *expected=which?"B:true:ok":"A:true:ok";
        if(JS_IsException(value)||!actual||strcmp(actual,expected))fail=1;
        if(actual)JS_FreeCString(a,actual);JS_FreeValue(a,value);count++;
    }
    JS_FreeValue(a,s);JS_FreeValue(a,fn);JS_FreeValue(a,ra);JS_FreeValue(b,rb);JS_FreeValue(a,ga);JS_FreeValue(b,gb);
    JS_FreeContext(a);JS_FreeContext(b);JS_RunGC(rt);JS_FreeRuntime(rt);
    printf("REALMS_%s %d\n",fail?"FAIL":"PASS",count);return fail;
}
