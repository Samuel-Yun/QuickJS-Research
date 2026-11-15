#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void){
 JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);
 const char*s="function C(x,y,z){this.x=x;this.y=y;this.z=z;}var empty=Object.create(C.prototype);function f(a,n){var s=0,k=0,o;for(var i=0;i<n;i++){o=new C(i,2,3);s+=a[i&1];k+=o.x;}return s+k;}var a=[1,2];for(var j=0;j<8;j++)f(a,64);f(a,64);";
 JSValue compiled=JS_Eval(ctx,s,strlen(s),"coexist.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
 JSValue warm=JS_EvalFunction(ctx,JS_DupValue(ctx,compiled));if(JS_IsException(warm))return 2;JS_FreeValue(ctx,warm);
 size_t size;uint8_t*buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);if(!buf)return 3;
 for(int rom=0;rom<2;rom++){
  JSValue read=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));if(JS_IsException(read))return 4;
  JSValue value=JS_EvalFunction(ctx,read);int32_t n=0;
  if(JS_IsException(value)||JS_ToInt32(ctx,&n,value)||n!=2112)return 5;JS_FreeValue(ctx,value);
 }
 JS_FreeValue(ctx,compiled);JS_FreeContext(ctx);js_free_rt(rt,buf);JS_FreeRuntime(rt);puts("COMBINED_PREPARED_ROM_SERIALIZATION_PASS");return 0;
}
