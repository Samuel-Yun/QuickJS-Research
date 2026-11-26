#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void){
 JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
 const char *src="(function(){var keep=[];for(var i=0;i<200;i++){var o={};o.a=1;o.b=2;o.c=3;if(i%3===0){delete o.b;o.b=4;}keep.push(o);}return keep.length;})()";
 for(int i=0;i<100;i++){
  JSValue v=JS_Eval(ctx,src,strlen(src),"edge_gc.js",JS_EVAL_TYPE_GLOBAL);int32_t n=0;
  if(JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=200)return 2;JS_FreeValue(ctx,v);JS_RunGC(rt);
 }
 JS_FreeContext(ctx);JS_FreeRuntime(rt);puts("EDGE_GC_PASS");return 0;
}
