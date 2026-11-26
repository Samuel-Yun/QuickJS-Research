#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void){
    JSRuntime *rt=JS_NewRuntime();JSContext *a=JS_NewContext(rt),*b=JS_NewContext(rt);
    const char *s="(function(){function site(c){return new c(3,4);}var kept=[];"
      "for(var round=0;round<30;round++){var C=class{constructor(x,y){this.x=x;this.y=y;}};"
      "var empty=Object.create(C.prototype);for(var i=0;i<100;i++){var o=site(C);if(o.x!==3||o.y!==4)throw Error('value');}"
      "C.owner=C;C.prototype.owner=C;for(var j=0;j<10;j++){if(site(C).x!==3)throw Error('fallback');}"
      "kept.push(C);if(kept.length>2)kept.shift();}return 1;})()";
    for(int k=0;k<6;k++)for(int realm=0;realm<2;realm++){
        JSContext *ctx=realm?b:a;JSValue v=JS_Eval(ctx,s,strlen(s),"class-lifetime.js",JS_EVAL_TYPE_GLOBAL);
        if(JS_IsException(v)){
            JSValue ex=JS_GetException(ctx);const char *msg=JS_ToCString(ctx,ex);fprintf(stderr,"%s\n",msg?msg:"exception");return 2;
        }
        JS_FreeValue(ctx,v);JS_RunGC(rt);
    }
    JS_FreeContext(a);JS_RunGC(rt);JS_FreeContext(b);JS_RunGC(rt);JS_FreeRuntime(rt);
    puts("CLASS_GUARD_GC_TWO_REALMS_PASS");return 0;
}
