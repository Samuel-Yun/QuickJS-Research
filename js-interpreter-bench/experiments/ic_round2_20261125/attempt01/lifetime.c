#include "quickjs.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
static JSValue eval(JSContext*c,const char*s){JSValue r=JS_Eval(c,s,strlen(s),"lifetime.js",JS_EVAL_TYPE_GLOBAL);if(JS_IsException(r)){JSValue e=JS_GetException(c);const char*x=JS_ToCString(c,e);fprintf(stderr,"EXC:%s\n",x);abort();}return r;}
static int intr(JSRuntime*rt,void*p){int*n=p;return --*n<=0;}
int main(void){
 JSRuntime*rt=JS_NewRuntime();JSContext*c=JS_NewContext(rt),*d=JS_NewContext(rt);assert(c&&d);
 const char*s="function C(){};function instance(x){return x instanceof C;}var a=new C();for(var i=0;i<1000;i++)instance(a);function set(x){this.x=x;}function invoke(t,x){set.call(t,x);}for(var i=0;i<1000;i++){var o={x:0};invoke(o,i);}function W(){this.go.apply(this,arguments);}W.prototype.go=function(a,b,c){this.x=a?a:0;this.y=b?b:0;this.z=c?c:0;};var ns={G:W};function O(){this.go.apply(this,arguments);}O.prototype.go=function(){this.field=new ns.G(0,0,0);};function outer(){return new O();}for(var i=0;i<1000;i++)outer();42;";
 for(int n=0;n<5;n++){JSValue a=eval(c,s),b=eval(d,s);JS_FreeValue(c,a);JS_FreeValue(d,b);JS_RunGC(rt);}
 /* A function from another realm remains the actual RHS; native hook identity
    differs, so the short circuit must not assume this context's hook. */
 JSValue foreign=eval(d,"C");JSValue g=JS_GetGlobalObject(c);assert(JS_SetPropertyStr(c,g,"foreign",foreign)>=0);JS_FreeValue(c,g);JSValue v=eval(c,"new foreign() instanceof foreign");assert(JS_ToBool(c,v)==1);JS_FreeValue(c,v);
 int count=3;JS_SetInterruptHandler(rt,intr,&count);v=JS_Eval(c,"while(true) new C() instanceof C",strlen("while(true) new C() instanceof C"),"interrupt.js",JS_EVAL_TYPE_GLOBAL);assert(JS_IsException(v));JSValue e=JS_GetException(c);JS_FreeValue(c,e);JS_SetInterruptHandler(rt,NULL,NULL);
 JS_FreeContext(d);JS_FreeContext(c);JS_RunGC(rt);JS_FreeRuntime(rt);puts("LIFETIME_REALMS_INTERRUPT_PASS");return 0;
}
