/* Only the independent probe copy references these counters. */
static unsigned long combo_fused_hits, combo_proto_hits, combo_shared_hits;
#include "quickjs.c"

static int invoke(JSContext *ctx, JSValue f, JSValue o, int expected)
{
    JSValue args[2] = {o, JS_NewInt32(ctx, 7)};
    JSValue v = JS_Call(ctx, f, JS_UNDEFINED, 2, args);
    int32_t result = -1;
    int bad = JS_IsException(v) || JS_ToInt32(ctx, &result, v) || result != expected;
    JS_FreeValue(ctx, v);
    return bad;
}

static JSValue eval(JSContext *ctx, const char *source)
{
    return JS_Eval(ctx, source, strlen(source), "new_ic_probe.js", JS_EVAL_TYPE_GLOBAL);
}

static JSFunctionBytecode *body(JSValue function)
{
    return JS_VALUE_GET_OBJ(function)->u.func.function_bytecode;
}

static int roundtrip(JSContext *ctx, JSValue f, JSValue o, int expected)
{
    JSFunctionBytecode *b = body(f);
    JSValue bc = JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b);
    size_t length = 0;
    uint8_t *bytes = JS_WriteObject(ctx, &length, bc, JS_WRITE_OBJ_BYTECODE);
    if (!bytes) return 1;
    JSValue loaded = JS_ReadObject(ctx, bytes, length, JS_READ_OBJ_BYTECODE);
    js_free(ctx, bytes);
    if (JS_IsException(loaded)) return 2;
    JSFunctionBytecode *lb = JS_VALUE_GET_PTR(loaded);
#ifdef TEST_ENTRY1
    if (lb->read_ic_ready || lb->read_ic_sites || lb->read_ic_count) return 3;
#else
    if (lb->read_ic_count != b->read_ic_count) return 4;
    for (unsigned i = 0; i < lb->read_ic_count; i++)
        if (lb->read_ic_sites[i].shape || lb->read_ic_sites[i].holder_shape) return 5;
#endif
    JSValue callable = js_closure(ctx, loaded, NULL, NULL, FALSE);
    if (JS_IsException(callable)) return 6;
    int bad = invoke(ctx, callable, o, expected);
    if (!body(callable)->read_ic_ready || body(callable)->read_ic_count != b->read_ic_count) bad = 7;
    JS_FreeValue(ctx, callable);
    return bad;
}

int main(void)
{
    JSRuntime *rt = JS_NewRuntime();
    JSContext *ctx = JS_NewContext(rt);
    if (!ctx) return 1;
    if (sizeof(ReadICSite) != 24 || sizeof(JSFunctionBytecode) != 144) return 2;
    JSValue f = eval(ctx, "(function(o){return o.x;})");
    JSValue a = eval(ctx, "({alpha:1,x:7})");
    JSValue b = eval(ctx, "({beta:1,x:11})");
    if (JS_IsException(f) || JS_IsException(a) || JS_IsException(b)) return 3;
    JSFunctionBytecode *fb = body(f);
#ifdef TEST_ENTRY1
    if (fb->read_ic_ready || fb->read_ic_sites || fb->read_ic_count) return 4;
#endif
    if (invoke(ctx, f, a, 7)) return 5;
    if (!fb->read_ic_ready || fb->read_ic_count != 1 || !fb->read_ic_sites) return 6;
    if (fb->byte_code_buf[0] != OP_v6_get_arg0) return 7;
    for (int i = 0; i < 64; i++)
        if (invoke(ctx, f, i & 1 ? b : a, i & 1 ? 11 : 7)) return 8;
#ifdef TEST_OWN2
    ReadICSite *site = fb->read_ic_sites;
    JSShape *sa = JS_VALUE_GET_OBJ(a)->shape, *sb = JS_VALUE_GET_OBJ(b)->shape;
    if (sa == sb || site->shape != sa || site->holder_shape != sb || site->prop_offset != 1) return 9;
    JSValue c = eval(ctx, "({x:13})");
    if (invoke(ctx, f, c, 13)) return 10;
    if (site->shape != JS_VALUE_GET_OBJ(c)->shape || site->holder_shape || site->prop_offset != 0) return 11;
    JS_FreeValue(ctx, c);
    for (int i = 0; i < 32; i++)
        if (invoke(ctx, f, i & 1 ? b : a, i & 1 ? 11 : 7)) return 12;
    if (site->shape != sa || site->holder_shape != sb) return 13;
#endif
    JSValue method = eval(ctx, "(function(o){return o.step();})");
    JSValue store = eval(ctx, "(function(o,v){o.x;o.x=v;return o.x;})");
    JSValue keep_store = eval(ctx, "(function(o){o.x+=0;return o.x;})");
    JSValue object = eval(ctx, "(function(){var p={step:function(){return this.x+1;}};var o=Object.create(p);o.x=7;return o;})()");
    for (int i = 0; i < 32; i++) {
        if (invoke(ctx, method, object, 8) || invoke(ctx, store, object, 7) || invoke(ctx, keep_store, object, 7)) return 14;
    }
#ifdef TEST_OWN2
    for (int i = 0; i < 64; i++)
        if (invoke(ctx, store, i & 1 ? b : a, 7)) return 15;
    unsigned own_tags = 0, keep_tags = 0;
    JSValue functions[2] = {store, keep_store};
    for (int i = 0; i < 2; i++) {
        JSFunctionBytecode *code = body(functions[i]);
        for (int pos = 0; pos < code->byte_code_len;) {
            int op = code->byte_code_buf[pos];
            if (op == OP_put_field_shared) {
                uintptr_t pointer = (uintptr_t)(code->byte_code_buf + pos + 1 + get_u32(code->byte_code_buf + pos + 1));
                if (pointer & 1) keep_tags++; else own_tags++;
                ReadICSite *s = (ReadICSite *)(pointer & ~(uintptr_t)1);
                if (s < code->read_ic_sites || s >= code->read_ic_sites + code->read_ic_count) return 16;
            }
            pos += short_opcode_info(op).size;
        }
    }
    if (!own_tags || !keep_tags) return 17;
    printf("OWN2_SAME_OFFSET_AND_SHARED_ORIGINS_PASS own_tags=%u keep_tags=%u\n", own_tags, keep_tags);
#endif
    if (combo_fused_hits < 31 || combo_proto_hits < 31 || combo_shared_hits < 31) return 18;
    if (roundtrip(ctx, f, object, 7) || roundtrip(ctx, method, object, 8) ||
        roundtrip(ctx, store, object, 7) || roundtrip(ctx, keep_store, object, 7)) return 19;
#ifdef TEST_ENTRY1
    char source[16384];
    strcpy(source, "(function(o){return ");
    for (int i = 0; i < 300; i++) strcat(source, i ? "+o.x" : "o.x");
    strcat(source, ";})");
    JSValue many = eval(ctx, source);
    JSFunctionBytecode *mb = body(many);
    if (mb->read_ic_ready || mb->read_ic_sites) return 20;
    const uint8_t *old_image = mb->byte_code_buf;
    int old_tag = JS_VALUE_GET_TAG(rt->current_exception);
    JS_SetMemoryLimit(rt, 0);
    int bad = invoke(ctx, many, object, 2100);
    JS_SetMemoryLimit(rt, (size_t)-1);
    if (bad || mb->byte_code_buf != old_image || mb->read_ic_sites || !mb->read_ic_ready) return 21;
    if (JS_VALUE_GET_TAG(rt->current_exception) != old_tag || invoke(ctx, many, object, 2100)) return 22;
    JS_FreeValue(ctx, many);
    printf("ENTRY1_FIRST_ENTRY_NO_HEAD_GROWTH_OPTIONAL_OOM_PASS\n");
#endif
    printf("MECHANISM_PASS record=24 function_header=144 fused=%lu proto=%lu shared=%lu\n",
           combo_fused_hits, combo_proto_hits, combo_shared_hits);
    JS_FreeValue(ctx, f);JS_FreeValue(ctx, a);JS_FreeValue(ctx, b);
    JS_FreeValue(ctx, method);JS_FreeValue(ctx, store);JS_FreeValue(ctx, keep_store);JS_FreeValue(ctx, object);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    return 0;
}
