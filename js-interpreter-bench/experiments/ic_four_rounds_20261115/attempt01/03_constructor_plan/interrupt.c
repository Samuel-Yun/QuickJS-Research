#include "quickjs.h"
#include <stdio.h>
#include <string.h>
static int hook(JSRuntime*rt,void*opaque){return ++*(int*)opaque>=3;}
int main(void){JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);int n=0;
 const char*s="function C(x,y){this.x=x;this.y=y;}for(var i=0;i<10000000;i++)new C(i,7);";
 JS_SetInterruptHandler(rt,hook,&n);JSValue v=JS_Eval(ctx,s,strlen(s),"interrupt.js",JS_EVAL_TYPE_GLOBAL);int exception=JS_IsException(v);
 JS_SetInterruptHandler(rt,NULL,NULL);if(exception){JSValue e=JS_GetException(ctx);JS_FreeValue(ctx,e);}JS_FreeValue(ctx,v);
 printf("interrupt=%d exception=%d\n",n,exception);JS_FreeContext(ctx);JS_FreeRuntime(rt);return n!=3||!exception;}
