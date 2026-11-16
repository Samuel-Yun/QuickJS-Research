/* Included after upstream find_own_property, with shape helpers available. */
#ifdef READ_IC_DIAGNOSTIC
#include "read_ic_diag.h"
#endif
static force_inline uint32_t rdi_probe(ReadICSite *s, JSShape *shape RDI_DPARAM)
{
#if RDI_CAPACITY == 1
    RDI_COUNT(comparisons);
    if (s->shape == shape)
        return s->prop_offset;
#else
    unsigned i, first = s->recent;
    RDI_COUNT(comparisons);
    if (s->shape[first] == shape)
        return s->prop_offset[first];
    for (unsigned k = 1; k < 4; k++) {
        i = (first + k) & 3;
        RDI_COUNT(comparisons);
        if (s->shape[i] == shape) {
            s->recent = i;
            return s->prop_offset[i];
        }
    }
#endif
    return UINT32_MAX;
}
static force_inline void rdi_update(JSContext *ctx, ReadICSite *s,
                                    JSShape *shape, JSShape *holder_shape,
                                    uint32_t offset RDI_DPARAM)
{
    RDI_COUNT(updates);
#if RDI_CAPACITY == 1
    if (s->shape == shape && s->holder_shape == holder_shape) {
        s->prop_offset = offset;
        return;
    }
    if (s->shape) { RDI_REPLACE(); } else { RDI_OCCUPY(); }
    js_dup_shape(shape);
    if (holder_shape)
        js_dup_shape(holder_shape);
    js_free_shape_null(ctx->rt, s->shape);
    js_free_shape_null(ctx->rt, s->holder_shape);
    s->shape = shape;
    s->holder_shape = holder_shape;
    s->prop_offset = offset;
#else
    unsigned i, empty = 4;
    for (i = 0; i < 4; i++) {
        RDI_COUNT(update_comparisons);
        if (s->shape[i] == shape) {
            s->prop_offset[i] = offset;
            s->recent = i;
            return;
        }
        if (!s->shape[i] && empty == 4)
            empty = i;
    }
    if (empty < 4) {
        i = empty;
        RDI_OCCUPY();
    } else {
        i = s->victim;
        s->victim = (i + 1) & 3;
        RDI_REPLACE();
    }
    js_dup_shape(shape);
    js_free_shape_null(ctx->rt, s->shape[i]);
    s->shape[i] = shape;
    s->prop_offset[i] = offset;
    s->recent = i;
#endif
}
static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)
{
    uint32_t i;
    for (i = 0; i < b->read_ic_count; i++) {
        ReadICSite *s = &b->read_ic_sites[i];
        JS_FreeAtomRT(rt, s->atom);
#if RDI_CAPACITY == 1
        js_free_shape_null(rt, s->shape);
        js_free_shape_null(rt, s->holder_shape);
#else
        for (unsigned j = 0; j < 4; j++)
            js_free_shape_null(rt, s->shape[j]);
#endif
    }
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_release(b);
#endif
    js_free_rt(rt, b->read_ic_sites);
    b->read_ic_sites = NULL;
    b->read_ic_count = 0;
}
