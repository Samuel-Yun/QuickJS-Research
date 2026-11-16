/* Compile only as a separate diagnostic with -I active and matched supporting objects.
   This translation unit sees the private structures. It is never a performance binary. */
static unsigned long long fused_hits;
static unsigned long long proto_hits;
#include "quickjs.c"
#include <stdio.h>

int main(void)
{
    JSRuntime *rt = JS_NewRuntime();
    JSContext *ctx = JS_NewContext(rt);
    const char *source =
        "function site(o){return o.value;}"
        "var objects=[];"
        "for(var i=0;i<8;i++){var o={value:i};for(var j=0;j<i;j++)o['pad'+j]=j;objects.push(o);}"
        "var checksum=0;for(var k=0;k<4000;k++)checksum+=site(objects[k%4]);"
        "if(checksum!==6000)throw Error('shape checksum');"
        "for(var steady=0;steady<1000;steady++)if(site(objects[0])!==0)throw Error('steady');";
    JSValue result = JS_Eval(ctx, source, strlen(source), "mechanism_probe.js", JS_EVAL_TYPE_GLOBAL);
    if (JS_IsException(result)) return 2;
    JS_FreeValue(ctx, result);
    JSValue global = JS_GetGlobalObject(ctx);
    JSValue function = JS_GetPropertyStr(ctx, global, "site");
    JSFunctionBytecode *b = JS_VALUE_GET_OBJ(function)->u.func.function_bytecode;
    printf("LAYOUT site=%zu function=%zu object=%zu runtime=%zu\n", sizeof(ReadICSite), sizeof(JSFunctionBytecode), sizeof(JSObject), sizeof(JSRuntime));
    printf("OPCODES get_arg0=%d get_loc0=%d get_field_rdi=%d\n", OP_get_arg0, OP_get_loc0, OP_get_field_rdi);
#ifdef PROBE_PREPARED
    printf("PREPARED_OPCODES get_arg0=%d get_loc0=%d\n", OP_rdi_get_arg0, OP_rdi_get_loc0);
#endif
    printf("FUNCTION bytecode_len=%d sites=%u\n", b->byte_code_len, b->read_ic_count);
    printf("FUSED_HITS %llu\n", fused_hits);
    for (int i = 0; i < b->byte_code_len; i++) printf("%02x%s", b->byte_code_buf[i], i+1==b->byte_code_len?"\n":" ");
#ifdef SIDE_COUNT
    printf("SIDE_BYTES %zu\n", sizeof(ReadICSide));
    unsigned occupied = 0;
    for (uint32_t i = 0; i < b->read_ic_count; i++) {
        occupied += b->read_ic_sites[i].shape != NULL;
        if (b->read_ic_side)
            for (unsigned j = 0; j < SIDE_COUNT; j++) occupied += b->read_ic_side[i].shape[j] != NULL;
    }
    printf("OCCUPIED %u SIDE_COUNT %d\n", occupied, SIDE_COUNT);
#endif
#ifdef PROBE_RESULT
    printf("RESULT_SPECIALIZED %d\n", b->byte_code_buf[1] == PROBE_RESULT);
#endif
#ifdef PROBE_FRAME
    printf("FRAME_PREDECODE_MATCH %d\n", b->rdi_call_frame_bytes ==
           sizeof(JSValue) * ((size_t)b->var_count+b->stack_size) + sizeof(JSVarRef*)*b->var_ref_count);
#endif
#ifdef PROBE_PROTO
    const char *proto = "var holder={value:41};var receiver=Object.create(holder);"
        "for(var i=0;i<4;i++)if(site(receiver)!==41)throw Error('inherited');";
    result = JS_Eval(ctx, proto, strlen(proto), "proto_probe.js", JS_EVAL_TYPE_GLOBAL);
    if (JS_IsException(result)) return 3;
    JS_FreeValue(ctx, result);
    printf("PROTO installed=%d epoch=%llu valid=%d\n", b->read_ic_side && b->read_ic_side[0].shape != NULL,
           (unsigned long long)rt->rdi_proto_epoch,
           b->read_ic_side && b->read_ic_side[0].epoch == rt->rdi_proto_epoch);
    printf("PROTO_HITS %llu\n", proto_hits);
    uint64_t before = rt->rdi_proto_epoch;
    result = JS_Eval(ctx, "Object.defineProperty(holder,'value',{get:function(){return 42;}});if(site(receiver)!==42)throw Error('invalidate');",
                     strlen("Object.defineProperty(holder,'value',{get:function(){return 42;}});if(site(receiver)!==42)throw Error('invalidate');"),
                     "invalidate_probe.js", JS_EVAL_TYPE_GLOBAL);
    if (JS_IsException(result)) return 4;
    JS_FreeValue(ctx, result);
    printf("PROTO invalidation_epoch_changed=%d\n", before != rt->rdi_proto_epoch);
#endif
    JS_FreeValue(ctx, function);
    JS_FreeValue(ctx, global);
    JS_FreeContext(ctx);
    JS_FreeRuntime(rt);
    puts("MECHANISM_PASS");
    return 0;
}
