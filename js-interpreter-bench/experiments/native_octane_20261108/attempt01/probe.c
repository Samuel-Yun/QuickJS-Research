/* Independent mechanism/layout and preparation-equivalence probe. */
static unsigned long combo_fused_hits, combo_proto_hits;
#include "quickjs.c"
#ifdef TEST_PREP2
#include "reference_prepare.inc"
#endif

static int call_int(JSContext *ctx, JSValue f, JSValue o, int expected)
{
    JSValue v=JS_Call(ctx,f,JS_UNDEFINED,1,&o);int32_t n=-1;
    int bad=JS_IsException(v)||JS_ToInt32(ctx,&n,v)||n!=expected;
    JS_FreeValue(ctx,v);return bad;
}

#ifdef TEST_PREP2
static int equivalent(JSContext *ctx, JSFunctionBytecode *b)
{
    JSFunctionBytecode ref=*b;
    uint8_t *plain=js_malloc(ctx,b->byte_code_len);if(!plain)return 1;
    memcpy(plain,b->byte_code_buf,b->byte_code_len);
    for(int pos=0;pos<b->byte_code_len;) {
        int op=plain[pos];
        if(op==OP_v6_get_arg0) plain[pos]=OP_get_arg0;
        if(op==OP_v6_get_loc0) plain[pos]=OP_get_loc0;
        if(op==OP_get_field_rdi||op==OP_get_field2_rdi) {
            ReadICSite *s=(ReadICSite *)(b->byte_code_buf+pos+1+get_u32(plain+pos+1));
            plain[pos]=(op==OP_get_field_rdi)?OP_get_field:OP_get_field2;
            put_u32(plain+pos+1,JS_DupAtom(ctx,s->atom));
        }
        pos+=short_opcode_info(op).size;
    }
    ref.byte_code_buf=plain;ref.read_ic_ready=0;ref.read_ic_sites=NULL;ref.read_ic_count=0;
    if(reference_prepare(ctx,&ref)<0){js_free(ctx,plain);return 2;}
    size_t total=((b->byte_code_len+7)&~(size_t)7)+b->read_ic_count*sizeof(ReadICSite);
    int bad=ref.read_ic_count!=b->read_ic_count||memcmp(ref.byte_code_buf,b->byte_code_buf,total);
    rdi_free(ctx->rt,&ref);js_free(ctx,plain);return bad;
}
#endif

int main(void)
{
    JSRuntime *rt=JS_NewRuntime();JSContext *ctx=JS_NewContext(rt);
    const char *sources[]={
      "(function(o){return o.x;})",
      "(function(o){return o.step();})",
      "(function(o){return o.a+o.b+o.c+o.d+o.step()+o.other();})",
      "(function(o){var p=o;return p.a+p.b+p.c+p.d;})",
      "(function(o){var p=o;return (o.a?o:p).b;})"};
    JSValue functions[5];
    for(int i=0;i<5;i++) {
        functions[i]=JS_Eval(ctx,sources[i],strlen(sources[i]),"layout_probe.js",0);
        if(JS_IsException(functions[i]))return 1;
        JSFunctionBytecode *b=JS_VALUE_GET_OBJ(functions[i])->u.func.function_bytecode;
#ifdef TEST_PREP2
        if(equivalent(ctx,b))return 2;
#endif
#ifdef TEST_SPLIT
        uint32_t own=rdi_own_count(b),keep=rdi_keep_count(b);
        size_t bytes=sizeof(RDILayoutHeader)+own*sizeof(ReadICSite)+keep*sizeof(ReadICMethodSite);
        if(own+keep!=b->read_ic_count||sizeof(ReadICSite)!=16||sizeof(ReadICMethodSite)!=24)return 3;
        printf("LAYOUT fixture=%d own=%u keep=%u bytes=%zu parent_bytes=%zu function_header=%zu\n",i,own,keep,bytes,(size_t)b->read_ic_count*24,sizeof(JSFunctionBytecode));
#endif
    }
    const char *s="(function(){var p={step:function(){return this.x+1;},other:function(){return 3;}};var o=Object.create(p);o.x=7;o.a=1;o.b=2;o.c=3;o.d=4;return o;})()";
    JSValue o=JS_Eval(ctx,s,strlen(s),"object.js",0);if(JS_IsException(o))return 4;
    int expected[]={7,8,21,10,2};
    for(int n=0;n<32;n++)for(int i=0;i<5;i++)if(call_int(ctx,functions[i],o,expected[i]))return 5;
    if(combo_fused_hits<31||combo_proto_hits<31)return 6;
    printf("MECHANISM_PASS fused_hits=%lu proto_hits=%lu function_header=%zu\n",combo_fused_hits,combo_proto_hits,sizeof(JSFunctionBytecode));
    JS_FreeValue(ctx,o);for(int i=0;i<5;i++)JS_FreeValue(ctx,functions[i]);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);return 0;
}
