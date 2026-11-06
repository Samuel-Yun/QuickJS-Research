/* Independent correctness gate for the checked u16 template, no timing. */
#include "quickjs.c"
#include <stdio.h>
int main(void)
{
    JSRuntime *rt = JS_NewRuntime();
    JSContext *ctx = JS_NewContext(rt);
    const char *source =
        "function readWide(o){return o.x;}var wide={};"
        "for(var i=0;i<66000;i++)wide['pad'+i]=i;wide.x=123;"
        "for(var k=0;k<32;k++)if(readWide(wide)!==123)throw Error('wide result');"
        "wide.x=999;if(readWide(wide)!==999)throw Error('stale wide value');999;";
    JSValue value = JS_Eval(ctx, source, strlen(source), "wide_offset_probe.js", 0);
    int32_t result = 0;
    if (JS_IsException(value) || JS_ToInt32(ctx, &result, value) || result != 999) return 1;
    JS_FreeValue(ctx, value);
    JSValue global = JS_GetGlobalObject(ctx);
    JSValue receiver = JS_GetPropertyStr(ctx, global, "wide");
    JSValue function = JS_GetPropertyStr(ctx, global, "readWide");
    JSObject *p = JS_VALUE_GET_OBJ(receiver);
    JSFunctionBytecode *b = JS_VALUE_GET_OBJ(function)->u.func.function_bytecode;
    JSAtom atom = JS_NewAtom(ctx, "x");
    JSProperty *pr;
    if (!find_own_property(&pr, p, atom)) return 2;
    uint32_t offset = pr - p->prop;
    unsigned occupied = 0;
    for (unsigned i = 0; i < SEARCH_SLOTS; i++) occupied += RDI_SHAPE(&b->read_ic_sites[0], i) != NULL;
    printf("WIDE_OFFSET offset=%u hashed=%u occupied=%u result=%d\n", offset, p->shape->is_hashed, occupied, result);
    if (offset != 66000 || !p->shape->is_hashed || occupied != 0) return 3;
    JS_FreeAtom(ctx, atom);
    JS_FreeValue(ctx, function); JS_FreeValue(ctx, receiver); JS_FreeValue(ctx, global);
    JS_RunGC(rt); JS_FreeContext(ctx); JS_FreeRuntime(rt);
    puts("WIDE_OFFSET_FALLBACK_PASS");
    return 0;
}
