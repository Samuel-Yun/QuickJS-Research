#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quickjs.h"
extern void read_ic_report(void);
int main(void) {
    JSRuntime *a=JS_NewRuntime();if(!a)return 2;
    setenv("QJS_READ_IC_MODE","invalid_after_initialization",1);
    JSRuntime *b=JS_NewRuntime();if(!b)return 3;
    const char *code="function latchRead(o){return o.x;}var x={x:3},z=0;for(var i=0;i<64;i++)z+=latchRead(x);if(z!==192)throw Error('latch');";
    JSRuntime *rts[2]={a,b};
    for(int i=0;i<2;i++) {
        JSContext *ctx=JS_NewContext(rts[i]);if(!ctx)return 4;
        JSValue v=JS_Eval(ctx,code,strlen(code),"native_latch",JS_EVAL_TYPE_GLOBAL);
        if(JS_IsException(v))return 5;
        JS_FreeValue(ctx,v);JS_FreeContext(ctx);JS_FreeRuntime(rts[i]);
    }
    puts("PASS native configuration latched across environment change and runtimes");read_ic_report();return 0;
}
