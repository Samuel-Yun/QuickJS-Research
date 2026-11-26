/* Included VM is a separate ASan/UBSan diagnostic, never the performance ELF. */
static unsigned long combo_fused_hits, combo_proto_hits, exp_a1_hits, exp_l1_hits;
static unsigned long exp_short_calls[3];
static int exp_fail_next_function;
#include "quickjs.c"
#ifdef TEST_COALLOC
#include "reference_prepare.inc"
static int equivalent(JSContext *ctx, JSFunctionBytecode *b)
{
    JSFunctionBytecode ref=*b;
    uint8_t *plain=js_malloc(ctx,b->byte_code_len);if(!plain)return 1;
    memcpy(plain,b->byte_code_buf,b->byte_code_len);
    for(int pos=0;pos<b->byte_code_len;) {
        int op=plain[pos];
        if(op==OP_v6_get_arg0)plain[pos]=OP_get_arg0;
        if(op==OP_v6_get_loc0)plain[pos]=OP_get_loc0;
        if(op==OP_get_field_rdi||op==OP_get_field2_rdi){
            ReadICSite *s=(ReadICSite *)(b->byte_code_buf+pos+1+get_u32(plain+pos+1));
            plain[pos]=op==OP_get_field_rdi?OP_get_field:OP_get_field2;
            put_u32(plain+pos+1,JS_DupAtom(ctx,s->atom));
        }
        pos+=short_opcode_info(op).size;
    }
    ref.byte_code_buf=plain;ref.read_ic_ready=0;ref.read_ic_sites=NULL;ref.read_ic_count=0;
    if(reference_prepare(ctx,&ref)<0){js_free(ctx,plain);return 2;}
    if(ref.read_ic_count!=b->read_ic_count)return 3;
    for(int pos=0;pos<b->byte_code_len;){
        int op=b->byte_code_buf[pos],size=short_opcode_info(op).size;
        if(op!=ref.byte_code_buf[pos])return 4;
        if(op==OP_get_field_rdi||op==OP_get_field2_rdi){
            ReadICSite *a=(ReadICSite *)(b->byte_code_buf+pos+1+get_u32(b->byte_code_buf+pos+1));
            ReadICSite *c=(ReadICSite *)(ref.byte_code_buf+pos+1+get_u32(ref.byte_code_buf+pos+1));
            if(a-b->read_ic_sites!=c-ref.read_ic_sites||a->atom!=c->atom)return 5;
        }else if(memcmp(b->byte_code_buf+pos,ref.byte_code_buf+pos,size))return 6;
        pos+=size;
    }
    rdi_free(ctx->rt,&ref);js_free(ctx,plain);return 0;
}
#endif
int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *sources[]={
      "(function(o){return o.x;})",
      "(function(o){return o.step();})",
      "(function(o){return o.a+o.b+o.c+o.d+o.step()+o.other();})",
      "(function(a,b){var x=a,y=b;return x.x+y.x;})",
      "(function(a,b){return b.x;})",
      "(function(){return 3;})",
      "(function(o){var p=o;return (o.a?o:p).b;})"};
    int expected[]={7,8,21,14,7,3,2};JSValue functions[7];
    for(int i=0;i<7;i++){
        functions[i]=JS_Eval(ctx,sources[i],strlen(sources[i]),"mechanism.js",0);
        if(JS_IsException(functions[i]))return 1;
        JSFunctionBytecode *b=JS_VALUE_GET_OBJ(functions[i])->u.func.function_bytecode;
        if(sizeof(ReadICSite)!=24||sizeof(JSFunctionBytecode)!=144)return 2;
#ifdef TEST_COALLOC
        if(b->read_ic_ready!=3||equivalent(ctx,b))return 3;
        if(b->read_ic_count){
            uintptr_t wanted=((uintptr_t)b->byte_code_buf+b->byte_code_len+7)&~(uintptr_t)7;
            if((uintptr_t)b->read_ic_sites!=wanted||(uint8_t *)b->byte_code_buf<(uint8_t *)b+offsetof(JSFunctionBytecode,debug))return 4;
        }
        JSValue bc=JS_MKPTR(JS_TAG_FUNCTION_BYTECODE,b);
        size_t len=0;uint8_t *bytes=JS_WriteObject(ctx,&len,bc,JS_WRITE_OBJ_BYTECODE);
        if(!bytes)return 5;
        JSValue loaded=JS_ReadObject(ctx,bytes,len,JS_READ_OBJ_BYTECODE);js_free(ctx,bytes);
        if(JS_IsException(loaded))return 6;
        JSFunctionBytecode *lb=JS_VALUE_GET_PTR(loaded);
        if(lb->read_ic_ready!=1)return 7;
        JS_FreeValue(ctx,loaded);
        printf("COALLOC fixture=%d count=%u copied_bytecode_bytes_avoided=%d external_IC_allocations_avoided=%d\n",i,b->read_ic_count,b->read_ic_count?b->byte_code_len:0,!!b->read_ic_count);
#endif
    }
    const char *source="(function(){var p={step:function(){return this.x+1;},other:function(){return 3;}};var o=Object.create(p);o.x=7;o.a=1;o.b=2;o.c=3;o.d=4;return o;})()";
    JSValue o=JS_Eval(ctx,source,strlen(source),"object.js",0);if(JS_IsException(o))return 8;
    JSValue args[2]={o,o};
    for(int n=0;n<32;n++)for(int i=0;i<7;i++){
        JSValue result=JS_Call(ctx,functions[i],JS_UNDEFINED,2,args);int32_t value=-1;
        if(JS_IsException(result)||JS_ToInt32(ctx,&value,result)||value!=expected[i])return 9;
        JS_FreeValue(ctx,result);
    }
    if(combo_fused_hits<31||combo_proto_hits<31)return 10;
#ifdef TEST_FUSE_A1L1
    if(exp_a1_hits<31||exp_l1_hits<31)return 11;
#endif
#ifdef TEST_CALL02
    const char *s="(function(){function f(a,b){return (a||0)+(b||0);}var o={f:f};return f()+f(1)+f(1,2)+o.f()+o.f(1)+o.f(1,2);})()";
    JSValue result=JS_Eval(ctx,s,strlen(s),"calls.js",0);int32_t value=-1;
    if(JS_IsException(result)||JS_ToInt32(ctx,&value,result)||value!=8)return 12;
    JS_FreeValue(ctx,result);
    for(int i=0;i<3;i++)if(!exp_short_calls[i])return 13;
#endif
#ifdef TEST_COALLOC
    for(int i=0;i<8;i++){
        exp_fail_next_function=1;
        const char *failure_source="(function(o){return o.x;})";
        JSValue value=JS_Eval(ctx,failure_source,strlen(failure_source),"oom.js",0);
        if(!JS_IsException(value)||exp_fail_next_function)return 14;
        JSValue error=JS_GetException(ctx);JS_FreeValue(ctx,error);
        value=JS_Eval(ctx,"1+2",3,"recovery.js",0);int32_t answer=-1;
        if(JS_IsException(value)||JS_ToInt32(ctx,&answer,value)||answer!=3)return 15;
        JS_FreeValue(ctx,value);JS_RunGC(rt);
    }
#endif
    printf("MECHANISM_PASS fused=%lu proto=%lu arg1=%lu loc1=%lu short_calls=%lu/%lu/%lu function_header=%zu\n",combo_fused_hits,combo_proto_hits,exp_a1_hits,exp_l1_hits,exp_short_calls[0],exp_short_calls[1],exp_short_calls[2],sizeof(JSFunctionBytecode));
    JS_FreeValue(ctx,o);for(int i=0;i<7;i++)JS_FreeValue(ctx,functions[i]);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);return 0;
}
