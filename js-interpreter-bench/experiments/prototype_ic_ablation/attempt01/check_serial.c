/* Diagnostic C harness only. Private initializer is called by this host too. */
#include "quickjs.c"
static int empty(JSValueConst v) {
    if(JS_VALUE_GET_TAG(v)!=JS_TAG_FUNCTION_BYTECODE)return 1;
    JSFunctionBytecode *b=JS_VALUE_GET_PTR(v);
    for(unsigned i=0;i<b->read_ic_count;i++)if(b->read_ic_sites[i].shape||b->read_ic_sites[i].holder_shape)return 0;
    for(int i=0;i<b->cpool_count;i++)if(!empty(b->cpool[i]))return 0;
    return 1;
}
static void reg_loaded(JSContext *ctx,JSValueConst v) {
    if(JS_VALUE_GET_TAG(v)!=JS_TAG_FUNCTION_BYTECODE)return;
    JSFunctionBytecode *b=JS_VALUE_GET_PTR(v);audit_register(ctx,b);
    for(int i=0;i<b->cpool_count;i++)reg_loaded(ctx,b->cpool[i]);
}
static int result(JSContext *ctx,JSValue v) {
    int32_t n=-1;int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=7;JS_FreeValue(ctx,v);return bad;
}
static int cache(JSContext *ctx,int enabled) {
    JSValue g=JS_GetGlobalObject(ctx),fn=JS_GetPropertyStr(ctx,g,"abRead");
    JSFunctionBytecode *b=JS_VALUE_GET_OBJ(fn)->u.func.function_bytecode;
    int bad=b->read_ic_count!=1 || (!!b->read_ic_sites[0].holder_shape)!=enabled;
    AuditFunction *f=audit_function(b);unsigned long long hits=0,fills=0;
    if(!f)bad=1;
    else for(unsigned i=0;i<f->length;i++){hits+=f->sites[i].h_proto_hits;fills+=f->sites[i].h_proto_fills;}
    bad|=enabled?!(hits==8&&fills==1):(hits!=0||fills!=0);
    JS_FreeValue(ctx,fn);JS_FreeValue(ctx,g);return bad;
}
int main(int argc,char **argv) {
    if(argc!=3||qjs_experiment_proto_ic_init())return 1;
    int enabled=qjs_experiment_proto_ic_enabled;
    // Changing libc's environment and calling again cannot change this process.
    setenv("QJS_EXPERIMENT_PROTO_IC",enabled?"0":"1",1);
    if(qjs_experiment_proto_ic_init()||qjs_experiment_proto_ic_enabled!=enabled)return 2;
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);int bad=0;
    if(!strcmp(argv[1],"write")) {
        const char *source="function abRead(o){return o.x;}var ap={x:7},ao=Object.create(ap);"
          "for(var ai=0;ai<8;ai++)if(abRead(ao)!==7)throw Error('value');abRead(ao);";
        JSValue b=JS_Eval(ctx,source,strlen(source),"switch_hot.js",JS_EVAL_TYPE_GLOBAL|JS_EVAL_FLAG_COMPILE_ONLY);
        if(JS_IsException(b)||!empty(b))return 3;
        bad|=result(ctx,JS_EvalFunction(ctx,JS_DupValue(ctx,b)));bad|=cache(ctx,enabled);
        size_t size;uint8_t *buf=JS_WriteObject(ctx,&size,b,JS_WRITE_OBJ_BYTECODE);if(!buf)return 4;
        FILE *f=fopen(argv[2],"wb");if(!f)return 5;
        bad|=fwrite(buf,1,size,f)!=size;fclose(f);js_free(ctx,buf);JS_FreeValue(ctx,b);
    }else {
        FILE *f=fopen(argv[2],"rb");if(!f)return 6;fseek(f,0,SEEK_END);long size=ftell(f);rewind(f);
        uint8_t *buf=js_malloc_rt(rt,(size_t)size);if(!buf||fread(buf,1,(size_t)size,f)!=(size_t)size)return 7;fclose(f);
        for(int rom=0;rom<2;rom++) {
            JSValue b=JS_ReadObject(ctx,buf,(size_t)size,JS_READ_OBJ_BYTECODE|(rom?JS_READ_OBJ_ROM_DATA:0));
            if(JS_IsException(b)||!empty(b))return 8;reg_loaded(ctx,b);
            bad|=result(ctx,JS_EvalFunction(ctx,b));bad|=cache(ctx,enabled);JS_RunGC(rt);
        }
        js_free_rt(rt,buf);
    }
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    bad|=h_live_bytes!=0||h_shape_retains!=h_shape_releases;
    printf("SWITCH_SERIAL_%s option=%d immutable=1 cache_empty_before_load=1 retain=%llu release=%llu\n",bad?"FAIL":"PASS",enabled,h_shape_retains,h_shape_releases);
    return bad;
}
