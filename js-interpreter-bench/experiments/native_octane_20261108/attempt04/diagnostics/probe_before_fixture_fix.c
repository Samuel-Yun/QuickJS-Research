/* Independent instrumented VM. Production performance binaries have no counters. */
static unsigned long combo_fused_hits,combo_proto_hits,exp_chain_hits,exp_shared_hits;
#include "quickjs.c"
#define main exp_reentrant_main
#include "reentrant_store.c"
#undef main
int main(void)
{
    if(exp_reentrant_main())return 1;
#ifdef TEST_READ_STORE
    if(!exp_shared_hits)return 2;
#endif
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *sources[]={
      "(function(o){return o.x;})",
      "(function(o){return o.step();})",
      "(function(o){return o.a.b;})",
      "(function(arg){var o=arg;return o.a.b;})",
      "(function(o,v){o.x;o.x=v;return o.x;})"};
    JSValue functions[5];unsigned mapped=0,read_total=0;
    for(int i=0;i<5;i++){
        functions[i]=JS_Eval(ctx,sources[i],strlen(sources[i]),"new_mechanism.js",0);
        if(JS_IsException(functions[i]))return 3;
        JSFunctionBytecode *b=JS_VALUE_GET_OBJ(functions[i])->u.func.function_bytecode;
        if(sizeof(ReadICSite)!=24||sizeof(JSFunctionBytecode)!=144)return 4;
        unsigned reads=0,writes=0;
        for(int pos=0;pos<b->byte_code_len;){
            int op=b->byte_code_buf[pos];
            if(op==OP_get_field_rdi||op==OP_get_field2_rdi)reads++;
#ifdef TEST_CHAIN2
            if(op==OP_chain_get_arg0||op==OP_chain_get_loc0)mapped++;
#endif
#ifdef TEST_READ_STORE
            if(op==OP_put_field_shared){
                ReadICSite *s=(ReadICSite *)(b->byte_code_buf+pos+1+get_u32(b->byte_code_buf+pos+1));
                if(s<b->read_ic_sites||s>=b->read_ic_sites+b->read_ic_count)return 5;
                writes++;mapped++;
            }
#endif
            pos+=short_opcode_info(op).size;
        }
        if(reads!=b->read_ic_count)return 6;
        read_total+=reads;
        printf("STATIC fixture=%d read_sites=%u extra_write_records=0 shared_writes=%u\n",i,reads,writes);
    }
    if(mapped<1)return 7;
    const char *source="(function(){var p={step:function(){return this.x+1;}};var o=Object.create(p);o.x=7;o.a={b:11};return o;})()";
    JSValue o=JS_Eval(ctx,source,strlen(source),"object.js",0);if(JS_IsException(o))return 8;
    for(int n=0;n<32;n++)for(int i=0;i<5;i++){
        JSValue args[2]={o,JS_NewInt32(ctx,7)};
        JSValue value=JS_Call(ctx,functions[i],JS_UNDEFINED,2,args);int32_t result=-1;
        int expected=i==1?8:(i==2||i==3)?11:7;
        if(JS_IsException(value)||JS_ToInt32(ctx,&result,value)||result!=expected)return 9;
        JS_FreeValue(ctx,value);
    }
    if(combo_fused_hits<31||combo_proto_hits<31)return 10;
#ifdef TEST_CHAIN2
    if(exp_chain_hits<62)return 11;
#endif
#ifdef TEST_READ_STORE
    if(exp_shared_hits<31)return 12;
#endif
    /* Serialize after the sites have been warmed and after shared writes. */
    for(int i=0;i<5;i++){
        JSFunctionBytecode *b=JS_VALUE_GET_OBJ(functions[i])->u.func.function_bytecode;
        JSValue bc=JS_MKPTR(JS_TAG_FUNCTION_BYTECODE,b);size_t length=0;
        uint8_t *bytes=JS_WriteObject(ctx,&length,bc,JS_WRITE_OBJ_BYTECODE);if(!bytes)return 13;
        JSValue loaded=JS_ReadObject(ctx,bytes,length,JS_READ_OBJ_BYTECODE);js_free(ctx,bytes);
        if(JS_IsException(loaded))return 14;
        JSFunctionBytecode *lb=JS_VALUE_GET_PTR(loaded);
        if(lb->read_ic_count!=b->read_ic_count)return 15;
        for(unsigned j=0;j<lb->read_ic_count;j++)if(lb->read_ic_sites[j].shape)return 16;
        JS_FreeValue(ctx,loaded);
    }
    printf("MECHANISM_PASS fused=%lu proto=%lu chain=%lu shared_store=%lu read_sites=%u mapped=%u record_bytes=%zu function_header=%zu\n",combo_fused_hits,combo_proto_hits,exp_chain_hits,exp_shared_hits,read_total,mapped,sizeof(ReadICSite),sizeof(JSFunctionBytecode));
    JS_FreeValue(ctx,o);for(int i=0;i<5;i++)JS_FreeValue(ctx,functions[i]);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);return 0;
}
