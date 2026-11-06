/* Independent diagnostic compilation only. Never a performance executable. */
#include "quickjs.c"
#include <stdio.h>

static int evaluate(JSContext *ctx, const char *source)
{
    JSValue value = JS_Eval(ctx, source, strlen(source), "mass_layout_probe.js", JS_EVAL_TYPE_GLOBAL);
    int failed = JS_IsException(value);
    JS_FreeValue(ctx, value);
    return failed;
}

int selected_layout_main(void)
{
    JSRuntime *rt = JS_NewRuntime();
    JSContext *ctx = JS_NewContext(rt);
    int shapes[] = {1, 2, 3, 4, 6, 8, 17};
    for (unsigned test = 0; test < sizeof(shapes) / sizeof(shapes[0]); test++) {
        char source[1024];
        snprintf(source, sizeof(source),
                 "function read(o){return o.x;}var objects=[];"
                 "for(var k=0;k<%d;k++){var o={};for(var j=0;j<k;j++)o['prefix'+j]=j;o.x=k+1;objects.push(o);}"
                 "for(var i=0;i<4096;i++)if(read(objects[i%%%d])!==i%%%d+1)throw Error('result');",
                 shapes[test], shapes[test], shapes[test]);
        if (evaluate(ctx, source)) return 2;
        JSValue global = JS_GetGlobalObject(ctx);
        JSValue function = JS_GetPropertyStr(ctx, global, "read");
        JSValue array = JS_GetPropertyStr(ctx, global, "objects");
        JSFunctionBytecode *b = JS_VALUE_GET_OBJ(function)->u.func.function_bytecode;
        if (b->read_ic_count != 1) return 3;
        unsigned filled = 0;
        for (unsigned i = 0; i < SEARCH_SLOTS; i++) filled += RDI_SHAPE(&b->read_ic_sites[0], i) != NULL;
        if (filled > SEARCH_SLOTS) return 4;
#if !SEARCH_POLICY && !SEARCH_HINT_SCOPE && !SEARCH_TABLE_ENTRIES
        unsigned expected = shapes[test] < SEARCH_SLOTS ? shapes[test] : SEARCH_SLOTS;
        if (filled != expected) return 5;
#endif
        for (int i = 0; i < shapes[test]; i++) {
            JSValue left = JS_GetPropertyUint32(ctx, array, i);
            for (int j = 0; j < i; j++) {
                JSValue right = JS_GetPropertyUint32(ctx, array, j);
                if (JS_VALUE_GET_OBJ(left)->shape == JS_VALUE_GET_OBJ(right)->shape) return 6;
                JS_FreeValue(ctx, right);
            }
            JS_FreeValue(ctx, left);
        }
        unsigned shared = 0;
#if SEARCH_TABLE_ENTRIES
        for (unsigned i = 0; i < SEARCH_TABLE_ENTRIES; i++) shared += b->read_ic_shared[i].shape != NULL;
        if (shared > SEARCH_TABLE_ENTRIES) return 7;
#endif
        printf("OCCUPANCY shapes=%d distinct_verified=1 local=%u capacity=%u shared=%u\n", shapes[test], filled, SEARCH_SLOTS, shared);
        JS_FreeValue(ctx, array);
        JS_FreeValue(ctx, function);
        JS_FreeValue(ctx, global);
        JS_RunGC(rt);
    }
    JS_FreeContext(ctx);
    JS_FreeRuntime(rt);
    puts("LAYOUT_PROBE_PASS");
    return 0;
}

#define main selected_delete_main
#include "/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v2_20261105/delete_reentry.c"
#undef main
int main(void) { int result = selected_layout_main(); if (result) return result; return selected_delete_main(); }
