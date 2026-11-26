#include "quickjs.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static JSValue eval(JSContext*c,const char*s){JSValue v=JS_Eval(c,s,strlen(s),"life.js",JS_EVAL_TYPE_GLOBAL);if(JS_IsException(v)){JSValue e=JS_GetException(c);const char*t=JS_ToCString(c,e);fprintf(stderr,"%s\n",t);abort();}return v;}
static int interrupt(JSRuntime*rt,void*opaque){return ++*(int*)opaque>=3;}
int main(int argc,char**argv){
 JSRuntime*rt=JS_NewRuntime();JSContext*c=JS_NewContext(rt);assert(c);
 if(argc==3&&!strcmp(argv[1],"--read")){
  FILE*f=fopen(argv[2],"rb");assert(f);fseek(f,0,SEEK_END);long len=ftell(f);rewind(f);uint8_t*buf=malloc(len);assert(buf);assert(fread(buf,1,len,f)==len);fclose(f);
  for(int rom=0;rom<2;rom++){JSValue x=JS_ReadObject(c,buf,len,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));assert(!JS_IsException(x));JSValue r=JS_EvalFunction(c,x);int32_t n;assert(!JS_IsException(r)&&!JS_ToInt32(c,&n,r)&&n==350000);JS_FreeValue(c,r);JS_RunGC(rt);}free(buf);
  JS_FreeContext(c);JS_FreeRuntime(rt);puts("CROSS_ENGINE_READ_NORMAL_ROM_PASS");return 0;
 }
 const char*s="function code(s,i){var x=s.charCodeAt(i);return x;}var sum=0;for(var n=0;n<5000;n++)sum+=code('ABCDE',n%5)+code('\\ud83d\\ude00',n%2)*0;sum+15000;";
 JSValue f=JS_Eval(c,s,strlen(s),"serialize.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);assert(!JS_IsException(f));JSValue r=JS_EvalFunction(c,JS_DupValue(c,f));int32_t n;assert(!JS_IsException(r)&&!JS_ToInt32(c,&n,r)&&n==350000);JS_FreeValue(c,r);
 size_t len;uint8_t*buf=JS_WriteObject(c,&len,f,JS_WRITE_OBJ_BYTECODE);assert(buf);
 if(argc==3&&!strcmp(argv[1],"--write")){FILE*x=fopen(argv[2],"wb");assert(x);assert(fwrite(buf,1,len,x)==len);fclose(x);}
 for(int rom=0;rom<2;rom++){JSValue v=JS_ReadObject(c,buf,len,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));assert(!JS_IsException(v));r=JS_EvalFunction(c,v);assert(!JS_IsException(r)&&!JS_ToInt32(c,&n,r)&&n==350000);JS_FreeValue(c,r);JS_RunGC(rt);}js_free_rt(rt,buf);JS_FreeValue(c,f);
 int polls=0;JS_SetInterruptHandler(rt,interrupt,&polls);const char*loop="var steps=0;for(;;){code('abcd',steps%4);steps++;}";r=JS_Eval(c,loop,strlen(loop),"interrupt.js",JS_EVAL_TYPE_GLOBAL);assert(JS_IsException(r));r=JS_GetException(c);JS_FreeValue(c,r);JS_SetInterruptHandler(rt,NULL,NULL);r=eval(c,"steps");assert(!JS_ToInt32(c,&n,r));JS_FreeValue(c,r);printf("INTERRUPT_STEPS:%d\n",n);
 JSContext*d=JS_NewContext(rt);assert(d);JSValue foreign=eval(d,"String.prototype.charCodeAt");JSValue g=JS_GetGlobalObject(c);assert(JS_SetPropertyStr(c,g,"foreign",foreign)>=0);JS_FreeValue(c,g);r=eval(c,"var original=String.prototype.charCodeAt;String.prototype.charCodeAt=foreign;var a=code('abc',1);String.prototype.charCodeAt=original;a;");assert(!JS_ToInt32(c,&n,r)&&n==98);JS_FreeValue(c,r);
 r=eval(c,"function doomed(s,i){var x=s.charCodeAt(i);return x;}for(var j=0;j<100;j++)doomed('abc',1);String.prototype.charCodeAt.owner=doomed;String.prototype.charCodeAt=function(){return 7;};original=null;doomed=null;code=null;");JS_FreeValue(c,r);JS_RunGC(rt);
 JS_FreeContext(d);JS_FreeContext(c);JS_RunGC(rt);JS_FreeRuntime(rt);puts("PRIVATE_PATCH_SERIALIZATION_GC_REALM_INTERRUPT_PASS");return 0;
}
