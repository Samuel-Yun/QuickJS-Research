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

#ifdef TEST_COLD_ENTRY
static JSClassID cold_token_class;
static JSContext *cold_probe_ctx;
static unsigned cold_token_frees;
static int cold_token_reenter, cold_token_failed;

static void cold_token_finalizer(JSRuntime *rt, JSValue value)
{
    cold_token_frees++;
    if (cold_token_reenter) {
        const char *s = "coldEvents.push('finalized')";
        JSValue v = JS_Eval(cold_probe_ctx, s, strlen(s), "cold_finalizer.js", 0);
        if (JS_IsException(v)) cold_token_failed = 1;
        JS_FreeValue(cold_probe_ctx, v);
    }
}

static JSValue make_cold_token(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{
    return JS_NewObjectClass(ctx, cold_token_class);
}

static int cold_extra_checks(JSContext *ctx)
{
    JSRuntime *rt = ctx->rt;
    JSClassDef def = {.class_name = "ColdArgumentToken", .finalizer = cold_token_finalizer};
    JS_NewClassID(rt, &cold_token_class);
    if (JS_NewClass(rt, cold_token_class, &def) < 0) return 1;
    JSValue global = JS_GetGlobalObject(ctx);
    JS_SetPropertyStr(ctx, global, "__cold_token", JS_NewCFunction(ctx, make_cold_token, "__cold_token", 0));
    JS_FreeValue(ctx, global);
    cold_probe_ctx = ctx;
    cold_token_reenter = 1;
    JSValue v = eval(ctx, "var coldEvents=[];function consumeCold(v){v=null;coldEvents.push('after');}"
                         "consumeCold(__cold_token());coldEvents.join(',');");
    const char *events = JS_ToCString(ctx, v);
    int bad = !events || strcmp(events, "finalized,after") || cold_token_failed;
    JS_FreeCString(ctx, events);JS_FreeValue(ctx, v);
    cold_token_reenter = 0;
    if (bad) return 2;
    unsigned prior = cold_token_frees;
    v = eval(ctx, "(function(){var o={token:__cold_token()};o.fn=function never(){return o.x;};return o;})()");
    if (JS_IsException(v)) return 3;
    JS_FreeValue(ctx, v);JS_RunGC(rt);
    if (cold_token_frees != prior + 1) return 4;
    JSValue pair = eval(ctx, "(function(){function factory(k){return function(o){return o.x+k;};}return [factory(1),factory(2)];})()");
    JSValue first = JS_GetPropertyUint32(ctx, pair, 0), second = JS_GetPropertyUint32(ctx, pair, 1);
    JSValue o = eval(ctx, "({x:7})");
    if (body(first) != body(second) || body(first)->read_ic_ready ||
        JS_VALUE_GET_OBJ(first)->class_id != JS_CLASS_COLD_BYTECODE_FUNCTION ||
        JS_VALUE_GET_OBJ(second)->class_id != JS_CLASS_COLD_BYTECODE_FUNCTION) return 5;
    if (invoke(ctx, first, o, 8)) return 6;
    const uint8_t *image = body(first)->byte_code_buf;
    if (JS_VALUE_GET_OBJ(first)->class_id != JS_CLASS_BYTECODE_FUNCTION ||
        JS_VALUE_GET_OBJ(second)->class_id != JS_CLASS_COLD_BYTECODE_FUNCTION) return 7;
    if (invoke(ctx, second, o, 9) || body(second)->byte_code_buf != image ||
        JS_VALUE_GET_OBJ(second)->class_id != JS_CLASS_BYTECODE_FUNCTION) return 8;
    JS_FreeValue(ctx, first);JS_FreeValue(ctx, second);JS_FreeValue(ctx, pair);JS_FreeValue(ctx, o);
    JSContext *other = JS_NewContext(rt);
    JSValue foreign = eval(other, "(function Foreign(){})");
    JSValue constructor = eval(ctx, "(function Main(){this.x=7;})");
    if (JS_GetFunctionRealm(ctx, foreign) != other) return 9;
    JS_SetPropertyStr(other, foreign, "prototype", JS_NULL);
    JSValue obj = JS_CallConstructor2(ctx, constructor, foreign, 0, NULL);
    if (JS_IsException(obj)) return 10;
    JSValue proto = JS_GetPrototype(ctx, obj);
    if (JS_VALUE_GET_PTR(proto) != JS_VALUE_GET_PTR(other->class_proto[JS_CLASS_OBJECT])) return 11;
    JS_FreeValue(ctx, proto);JS_FreeValue(ctx, obj);JS_FreeValue(ctx, constructor);
    JS_FreeValue(other, foreign);JS_FreeContext(other);
    cold_probe_ctx = NULL;
    printf("COLD_ENTRY_ARGUMENT_RELEASE_CYCLE_SHARED_CODE_REALM_PASS\n");
    return 0;
}
#endif

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
#if defined(TEST_ENTRY1) || defined(TEST_COLD_ENTRY)
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
#ifdef TEST_COLD_ENTRY
    if (JS_VALUE_GET_OBJ(f)->class_id != JS_CLASS_COLD_BYTECODE_FUNCTION ||
        !JS_IsFunction(ctx, f) || !JS_IsConstructor(ctx, f) || JS_GetFunctionBytecode(f) != fb ||
        JS_GetFunctionRealm(ctx, f) != ctx) return 23;
    JSValue text = JS_Invoke(ctx, f, JS_ATOM_toString, 0, NULL);
    const char *printed = JS_ToCString(ctx, text);
    if (!printed || !strstr(printed, "o.x")) return 24;
    JS_FreeCString(ctx, printed);JS_FreeValue(ctx, text);
    if (JS_VALUE_GET_OBJ(f)->class_id != JS_CLASS_COLD_BYTECODE_FUNCTION || fb->read_ic_ready) return 25;
#endif
#if defined(TEST_ENTRY1) || defined(TEST_COLD_ENTRY)
    if (fb->read_ic_ready || fb->read_ic_sites || fb->read_ic_count) return 4;
#endif
    if (invoke(ctx, f, a, 7)) return 5;
#ifdef TEST_COLD_ENTRY
    if (JS_VALUE_GET_OBJ(f)->class_id != JS_CLASS_BYTECODE_FUNCTION) return 26;
#endif
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
#if defined(TEST_ENTRY1) || defined(TEST_COLD_ENTRY)
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
#ifdef TEST_COLD_ENTRY
    int cold_error = cold_extra_checks(ctx);
    if (cold_error) { printf("COLD_EXTRA_ERROR:%d\n", cold_error); return 30 + cold_error; }
#endif
    printf("MECHANISM_PASS record=24 function_header=144 fused=%lu proto=%lu shared=%lu\n",
           combo_fused_hits, combo_proto_hits, combo_shared_hits);
    JS_FreeValue(ctx, f);JS_FreeValue(ctx, a);JS_FreeValue(ctx, b);
    JS_FreeValue(ctx, method);JS_FreeValue(ctx, store);JS_FreeValue(ctx, keep_store);JS_FreeValue(ctx, object);
    JS_RunGC(rt);JS_FreeContext(ctx);JS_FreeRuntime(rt);
    return 0;
}
