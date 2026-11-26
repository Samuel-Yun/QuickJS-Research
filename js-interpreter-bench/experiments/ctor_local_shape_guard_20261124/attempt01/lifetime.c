#include "quickjs.h"
#include <stdio.h>
#include <string.h>
int main(void){
    JSRuntime*rt=JS_NewRuntime();JSContext*ctx=JS_NewContext(rt);
    const char*s="var held=[];function site(c){return new c(3,4);}"
        "for(var round=0;round<30;round++){var list=[];var p={};var keep=Object.create(p);"
        "for(var i=0;i<5;i++){var c=eval('(function(x,y){this.x=x;this.y=y;})');c.prototype=p;list.push(c);}"
        "for(var j=0;j<100;j++){var o=site(list[j%5]);if(o.x!==3||o.y!==4)throw Error('value');}"
        "held.push(list);if(held.length>2)held.shift();}";
    for(int i=0;i<8;i++){
        JSValue v=JS_Eval(ctx,s,strlen(s),"lifetime.js",JS_EVAL_TYPE_GLOBAL);
        if(JS_IsException(v)){JSValue e=JS_GetException(ctx);const char*t=JS_ToCString(ctx,e);fprintf(stderr,"%s\n",t);return 2;}
        JS_FreeValue(ctx,v);JS_RunGC(rt);
    }
    JS_FreeContext(ctx);JS_RunGC(rt);JS_FreeRuntime(rt);puts("LIFETIME_PASS");return 0;
}
