#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void){
 JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
 const char *s="function Wrap(){this.setup.apply(this,arguments);}Wrap.prototype.setup=function(a){this.x=a;};for(var i=0;i<16;i++)new Wrap(7,8,9);(new Wrap(7)).x;";
 JSValue fn=JS_Eval(ctx,s,strlen(s),"group.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
 JSValue warm=JS_EvalFunction(ctx,JS_DupValue(ctx,fn));if(JS_IsException(warm))return 2;JS_FreeValue(ctx,warm);
 size_t size;uint8_t *buf=JS_WriteObject(ctx,&size,fn,JS_WRITE_OBJ_BYTECODE);if(!buf)return 3;
 for(int rom=0;rom<2;rom++){
  JSValue f=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));if(JS_IsException(f))return 4;
  JSValue v=JS_EvalFunction(ctx,f);int32_t n=0;if(JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=7)return 5;JS_FreeValue(ctx,v);
 }
 JS_FreeValue(ctx,fn);JS_FreeContext(ctx);js_free_rt(rt,buf);JS_FreeRuntime(rt);puts("PREPARED_SERIALIZATION_ROM_PASS");return 0;
}
