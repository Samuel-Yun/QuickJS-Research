#include "quickjs.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
int main(void){
 const char*s="function W(){this.go.apply(this,arguments);}W.prototype.go=function(a,b,c){if(!a)a=0;if(!b)b=0;if(!c)c=0;this.x=a;this.y=b;this.z=c;};function make(a,b,c){return new W(a,b,c);}function cmp(a,o){if(a<o.x)return 1;else if(a>o.x)return 2;return 3;}for(var i=0;i<100;i++){make(1,2,3);cmp(1,{x:1});}make(1,2,3).z+cmp(1,{x:1});";
 JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);assert(ctx);
 JSValue f=JS_Eval(ctx,s,strlen(s),"serialized.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);assert(!JS_IsException(f));
 JSValue v=JS_EvalFunction(ctx,JS_DupValue(ctx,f));int32_t n;assert(!JS_IsException(v)&&!JS_ToInt32(ctx,&n,v)&&n==6);JS_FreeValue(ctx,v);
 size_t len;uint8_t*buf=JS_WriteObject(ctx,&len,f,JS_WRITE_OBJ_BYTECODE);assert(buf);
 for(int rom=0;rom<2;rom++){
  JSValue read=JS_ReadObject(ctx,buf,len,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));assert(!JS_IsException(read));
  JSValue r=JS_EvalFunction(ctx,read);assert(!JS_IsException(r)&&!JS_ToInt32(ctx,&n,r)&&n==6);JS_FreeValue(ctx,r);
 }
 JS_FreeValue(ctx,f);JS_FreeContext(ctx);js_free_rt(rt,buf);JS_RunGC(rt);JS_FreeRuntime(rt);puts("PREPARED_NORMAL_AND_ROM_PASS");return 0;
}
