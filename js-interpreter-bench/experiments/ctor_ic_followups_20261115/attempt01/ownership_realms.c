#include "quickjs.h"
#include <stdio.h>
#include <string.h>
static int evalcheck(JSContext*c,const char*s,int expected){
 JSValue v=JS_Eval(c,s,strlen(s),"ownership-realms.js",JS_EVAL_TYPE_GLOBAL);int32_t n=0;
 if(JS_IsException(v)||JS_ToInt32(c,&n,v)||n!=expected){JS_FreeValue(c,v);return 1;}JS_FreeValue(c,v);return 0;
}
int main(void){
 JSRuntime*r=JS_NewRuntime();JSContext*a=JS_NewContext(r),*b=JS_NewContext(r);
 const char*s="(function(){function C(a,b){this.x=a;this.y=b;}function Bad(a,b){this.x=a+1;this.y=b;}function Wrap(){this.init.apply(this,arguments);}Wrap.prototype.init=function(a,b){this.x=a;this.y=b;};function make(c,a,b){return new c(a,b);}var sum=0;for(var i=0;i<300;i++){sum+=make(Bad,i,2).x;sum+=make(C,i,2).x;sum+=(new Wrap(i,2,3)).x;}C.self=C;C.prototype.owner=C;Wrap.self=Wrap;Wrap.prototype.owner=Wrap;return sum;})()";
 for(int i=0;i<3;i++){if(evalcheck(a,s,134850)||evalcheck(b,s,134850))return 2;JS_RunGC(r);}
 /* A function/constructor crossing two realms of one runtime, with prototype
    changes in its defining realm and another native apply identity. */
 const char *foreign="(function(){function C(x){this.x=x;}return C;})()";JSValue f=JS_Eval(b,foreign,strlen(foreign),"foreign.js",JS_EVAL_TYPE_GLOBAL);
 if(JS_IsException(f))return 3;
 JSValue global=JS_GetGlobalObject(a);JS_SetPropertyStr(a,global,"foreign",JS_DupValue(a,f));JS_FreeValue(a,global);
 if(evalcheck(a,"var sum=0;for(var i=0;i<100;i++)sum+=(new foreign(i)).x;sum;",4950))return 4;
 JSValue args[1]={JS_NewInt32(a,77)};JSValue o=JS_CallConstructor(a,f,1,args);JSValue x=JS_GetPropertyStr(a,o,"x");int32_t n=0;if(JS_ToInt32(a,&n,x)||n!=77)return 5;JS_FreeValue(a,x);JS_FreeValue(a,o);JS_FreeValue(a,f);
 JSValue g=JS_GetGlobalObject(a);JS_SetPropertyStr(a,g,"foreign",JS_UNDEFINED);JS_FreeValue(a,g);
 JS_RunGC(r);JS_FreeContext(a);JS_RunGC(r);JS_FreeContext(b);JS_RunGC(r);JS_FreeRuntime(r);puts("OWNERSHIP_GC_TWO_REALMS_PASS");return 0;
}
