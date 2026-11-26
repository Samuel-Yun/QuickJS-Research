#include "quickjs.h"
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
static unsigned finalized;
static void finalizer(JSRuntime*rt,JSValue v){finalized++;}
#ifdef FIXTURE_DIAG
extern void four_begin(void);extern void four_end(void);
#endif
int main(void){
 JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);assert(ctx);
 JSClassID box;JS_NewClassID(&box);JSClassDef cl={.class_name="Box",.finalizer=finalizer};assert(JS_NewClass(rt,box,&cl)==0);
 const char*s="function Pair(a,b){this.a=a;this.b=b;}var empty=Object.create(Pair.prototype);function make(a,b){return new Pair(a,b);}for(var i=0;i<100;i++)make(1,2);";
 JSValue run=JS_Eval(ctx,s,strlen(s),"ownership.js",JS_EVAL_TYPE_GLOBAL);assert(!JS_IsException(run));JS_FreeValue(ctx,run);
 JSValue g=JS_GetGlobalObject(ctx),make=JS_GetPropertyStr(ctx,g,"make");assert(JS_IsFunction(ctx,make));JS_FreeValue(ctx,g);
#ifdef FIXTURE_DIAG
 four_begin();
#endif
 for(unsigned i=0;i<1000;i++){
  JSValue token=JS_NewObjectProtoClass(ctx,JS_NULL,box);assert(!JS_IsException(token));JSValue args[2]={token,token};
  JSValue p=JS_Call(ctx,make,JS_UNDEFINED,2,args);assert(!JS_IsException(p));JS_FreeValue(ctx,token);
  if(i%4==1||i%4==2){
   for(unsigned j=0;j<24;j++)assert(JS_SetPropertyUint32(ctx,p,j,JS_NewInt32(ctx,j))>=0);
   if(i%4==2)for(unsigned j=0;j<23;j++){JSAtom a=JS_NewAtomUInt32(ctx,j);assert(JS_DeleteProperty(ctx,p,a,0)>=0);JS_FreeAtom(ctx,a);}
  }
  if(i%4==3)assert(JS_SetPropertyStr(ctx,p,"self",JS_DupValue(ctx,p))>=0);
  JS_FreeValue(ctx,p);
 }
 JS_RunGC(rt);assert(finalized==1000);
 // Cached small allocations can succeed with limit=0. Grow until an actual
 // allocator request fails; do not assume the first migration must fail.
 JSValue ints[2]={JS_NewInt32(ctx,3),JS_NewInt32(ctx,4)};
 JSValue warm=JS_Call(ctx,make,JS_UNDEFINED,2,ints);assert(!JS_IsException(warm));assert(JS_SetPropertyStr(ctx,warm,"extra",JS_NewInt32(ctx,7))>=0);JS_FreeValue(ctx,warm);
 JSValue p=JS_Call(ctx,make,JS_UNDEFINED,2,ints);assert(!JS_IsException(p));JSAtom keys[4096];char key[32];
 for(unsigned i=0;i<4096;i++){snprintf(key,sizeof(key),"oom_field_%u",i);keys[i]=JS_NewAtom(ctx,key);assert(keys[i]!=JS_ATOM_NULL);}
 JS_SetMemoryLimit(rt,0);unsigned stop=0;int status=0;
 for(;stop<4096;stop++){status=JS_SetProperty(ctx,p,keys[stop],JS_NewInt32(ctx,stop));if(status<0)break;}
 JS_SetMemoryLimit(rt,SIZE_MAX);assert(status<0&&stop<4096);
 JSValue e=JS_GetException(ctx);JS_FreeValue(ctx,e);JSValue a=JS_GetPropertyStr(ctx,p,"a");int32_t n;assert(!JS_ToInt32(ctx,&n,a)&&n==3);JS_FreeValue(ctx,a);
 assert(!JS_HasProperty(ctx,p,keys[stop]));assert(JS_SetProperty(ctx,p,keys[stop],JS_NewInt32(ctx,11))>=0);
 for(unsigned i=0;i<4096;i++)JS_FreeAtom(ctx,keys[i]);JS_FreeValue(ctx,p);
#ifdef FIXTURE_DIAG
 four_end();
#endif
 JS_FreeValue(ctx,make);JS_FreeContext(ctx);JS_RunGC(rt);JS_FreeRuntime(rt);puts("OWNERSHIP_MIGRATION_COMPACT_GC_OOM_PASS");return 0;
}
