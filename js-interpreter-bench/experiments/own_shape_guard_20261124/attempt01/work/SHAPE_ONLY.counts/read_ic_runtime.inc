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
                                    JSShape *shape, uint32_t offset RDI_DPARAM)
{
    RDI_COUNT(updates);
    JSShape *old = s->shape, *old_holder = s->holder_shape;
    js_dup_shape(shape);
    s->shape = shape;
    s->holder_shape = NULL;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old_holder);
    js_free_shape_null(ctx->rt, old);
}
static void v6_proto_update(JSContext *ctx, ReadICSite *s, JSShape *receiver,
                            JSShape *holder, uint32_t offset)
{
    JSShape *old = s->shape, *old_holder = s->holder_shape;
    js_dup_shape(receiver);
    js_dup_shape(holder);
    /* Publish before releases that can enter native finalizers. */
    s->shape = receiver;
    s->holder_shape = holder;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old_holder);
    js_free_shape_null(ctx->rt, old);
}

static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)
{
    uint32_t i;
    for (i = 0; i < b->read_ic_count; i++) {
        ReadICSite *s = &b->read_ic_sites[i];
        JS_FreeAtomRT(rt, s->atom);
#if RDI_CAPACITY == 1
        js_free_shape_null(rt, s->holder_shape);
        js_free_shape_null(rt, s->shape);
#else
        for (unsigned j = 0; j < 4; j++)
            js_free_shape_null(rt, s->shape[j]);
#endif
    }
#ifdef READ_IC_DIAGNOSTIC
    rdi_diag_release(b);
#endif
    og_detach(b);
    if (b->read_ic_sites) {
        js_free_rt(rt, b->byte_code_buf);
        b->byte_code_buf = NULL;
    }
    b->read_ic_sites = NULL;
    b->read_ic_count = 0;
}
