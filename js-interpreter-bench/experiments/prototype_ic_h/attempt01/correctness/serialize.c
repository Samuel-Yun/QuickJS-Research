#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "quickjs.h"
static int check(JSContext *ctx, JSValue v) {
    int32_t n=-1;
    int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=7;
    JS_FreeValue(ctx,v);return bad;
}
int main(int argc,char **argv) {
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    int bad=0;size_t size=0;uint8_t *buf=NULL;
    if(argc!=3)return 10;
    if(!strcmp(argv[1],"write")) {
        const char *s="function sr(o){return o.x;}var p={x:7},o=Object.create(p);"
          "for(var i=0;i<20;i++)if(sr(o)!==7)throw Error('sr');sr(o);";
        JSValue compiled=JS_Eval(ctx,s,strlen(s),"H_serialized.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
        if(JS_IsException(compiled))return 1;
        bad|=check(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,compiled)));
        buf=JS_WriteObject(ctx,&size,compiled,JS_WRITE_OBJ_BYTECODE);
        if(!buf)return 2;
        FILE *f=fopen(argv[2],"wb");if(!f)return 3;
        bad|=fwrite(buf,1,size,f)!=size;fclose(f);js_free(ctx,buf);JS_FreeValue(ctx,compiled);
    }else {
        FILE *f=fopen(argv[2],"rb");if(!f)return 4;
        fseek(f,0,SEEK_END);long n=ftell(f);rewind(f);if(n<=0)return 5;
        buf=malloc((size_t)n);if(!buf)return 6;size=(size_t)n;
        if(fread(buf,1,size,f)!=size)return 7;fclose(f);
        for(int rom=0;rom<2;rom++) {
            JSValue v=JS_ReadObject(ctx,buf,size,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));
            if(JS_IsException(v))return 8;
            bad|=check(ctx,JS_EvalFunction(ctx,v));JS_RunGC(rt);
        }
        free(buf);
    }
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    printf("H_SERIALIZE_%s_%s bytes=%zu\n",argv[1],bad?"FAIL":"PASS",size);return bad;
}
