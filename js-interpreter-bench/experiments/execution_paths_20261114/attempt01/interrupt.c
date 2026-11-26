#include "quickjs.h"
#include <stdio.h>
#include <string.h>
typedef struct { int calls,stop; } Interrupt;
static int interrupt(JSRuntime *rt,void *opaque) { Interrupt *p=opaque;p->calls++;return p->stop && p->calls>=p->stop; }
int main(int argc,char **argv)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);Interrupt state={0,0};
    const char *src="function f(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}f(100000);";
    if(argc>1)state.stop=2;
    JS_SetInterruptHandler(rt,interrupt,&state);
    JSValue value=JS_Eval(ctx,src,strlen(src),"interrupt.js",JS_EVAL_TYPE_GLOBAL);
    int exception=JS_IsException(value);const char *text;
    if(exception){JSValue error=JS_GetException(ctx);text=JS_ToCString(ctx,error);printf("exception=%d polls=%d value=%s\n",exception,state.calls,text);JS_FreeCString(ctx,text);JS_FreeValue(ctx,error);}
    else {text=JS_ToCString(ctx,value);printf("exception=0 polls=%d value=%s\n",state.calls,text);JS_FreeCString(ctx,text);}
    JS_FreeValue(ctx,value);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    return (argc>1)?!(exception&&state.calls==2):exception;
}
