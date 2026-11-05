#include <stdio.h>
#include <string.h>
#include "quickjs.h"
int main(void) {
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *s="for(let j=0;j<150;j++){let proto={},o=Object.create(proto),f=Function('o','return o.x;');proto.fn=f;o.x=j;for(let i=0;i<8;i++)if(f(o)!==j)throw Error('gc');}";
    for(int k=0;k<12;k++) {
        JSValue v=JS_Eval(ctx,s,strlen(s),"gc_cycles.js",0);
        if(JS_IsException(v))return 1;JS_FreeValue(ctx,v);JS_RunGC(rt);
    }
    JS_FreeContext(ctx);JS_FreeRuntime(rt);puts("GC_CYCLES_PASS rounds=12 cyclic_function_prototypes=1800");return 0;
}
