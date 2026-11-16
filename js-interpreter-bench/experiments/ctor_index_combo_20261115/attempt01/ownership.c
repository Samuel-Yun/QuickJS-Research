#include "quickjs.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#ifdef FOUR_NATIVE_COUNT
extern void four_begin(void);extern void four_end(void);
#endif
int main(void){
 JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);
 const char*cycle="(function(){function F(x,y){this.x=x;this.y=y;}function make(x){return new F(x,2);}F.prototype.owner=make;for(var i=0;i<32;i++)make(i);})();";
 for(int k=0;k<64;k++){JSValue v=JS_Eval(ctx,cycle,strlen(cycle),"cycle.js",JS_EVAL_TYPE_GLOBAL);if(JS_IsException(v))return 2;JS_FreeValue(ctx,v);JS_RunGC(rt);}
 const char*src="function F(x,y,next){this.x=x;this.y=y;this.next=next;}var empty=Object.create(F.prototype);var keep=new Array(10000);for(var i=0;i<10000;i++)keep[i]=null;function alloc(n){try{for(var i=0;i<n;i++)keep[i]=new F(i,2,null);}catch(e){return 'caught';}return 'none';}alloc(32);";
 JSValue v=JS_Eval(ctx,src,strlen(src),"oom.js",JS_EVAL_TYPE_GLOBAL);if(JS_IsException(v))return 3;JS_FreeValue(ctx,v);
 JSValue global=JS_GetGlobalObject(ctx),fn=JS_GetPropertyStr(ctx,global,"alloc"),arg=JS_NewInt32(ctx,10000);JS_FreeValue(ctx,global);
 JSMemoryUsage u;JS_ComputeMemoryUsage(rt,&u);JS_SetGCThreshold(rt,SIZE_MAX);JS_SetMemoryLimit(rt,u.malloc_size+100000);
#ifdef FOUR_NATIVE_COUNT
 four_begin();
#endif
 v=JS_Call(ctx,fn,JS_UNDEFINED,1,&arg);JS_SetMemoryLimit(rt,SIZE_MAX);
#ifdef FOUR_NATIVE_COUNT
 four_end();
#endif
 if(JS_IsException(v))return 4;
 const char*name=JS_ToCString(ctx,v);if(!name)return 5;
 printf("CYCLES_PASS OOM=%s\n",name);int error=!strcmp(name,"none");JS_FreeCString(ctx,name);JS_FreeValue(ctx,v);JS_FreeValue(ctx,fn);
 JS_FreeContext(ctx);JS_FreeRuntime(rt);return error;
}
