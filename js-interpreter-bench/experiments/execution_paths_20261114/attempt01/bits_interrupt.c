#include "quickjs.h"
#include <stdio.h>
#include <string.h>
typedef struct {int calls,stop;} State;
static int poll(JSRuntime *rt,void *p){State *s=p;s->calls++;return s->stop&&s->calls>=s->stop;}
int main(int argc,char **argv){
 const char *src="function bits(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}var s=0;for(var i=0;i<10000;i++)s+=bits(i&255);s;";
 JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);State s={0,argc>1?2:0};JS_SetInterruptHandler(rt,poll,&s);
 JSValue v=JS_Eval(ctx,src,strlen(src),"bits_interrupt.js",JS_EVAL_TYPE_GLOBAL);int e=JS_IsException(v);JSValue out=e?JS_GetException(ctx):JS_DupValue(ctx,v);
 const char *t=JS_ToCString(ctx,out);printf("exception=%d polls=%d value=%s\n",e,s.calls,t);JS_FreeCString(ctx,t);JS_FreeValue(ctx,out);JS_FreeValue(ctx,v);JS_FreeContext(ctx);JS_FreeRuntime(rt);return argc>1?!(e&&s.calls==2):e;
}
