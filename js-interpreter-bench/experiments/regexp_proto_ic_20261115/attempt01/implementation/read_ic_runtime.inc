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
    if (b->read_ic_sites) {
        js_free_rt(rt, b->byte_code_buf);
        b->byte_code_buf = NULL;
    }
    b->read_ic_sites = NULL;
    b->read_ic_count = 0;
}

/* Admission-only normalization for a RegExp receiver's direct ordinary
 * prototype. Native prototype construction deliberately starts with an
 * unhashed/private shape. Merely holding that pointer would NOT freeze it.
 *
 * Rebuild its exact existing layout hash and link it into the original shape
 * table BEFORE rdi_proto_update takes references. From that point the existing
 * hashed-shape COW rules protect both cached pointers and the property index.
 * No property value, descriptor, prototype link or regular-expression code is
 * changed. This is not an atom/descriptor recheck on every cache hit.
 */
_Static_assert(sizeof(ReadICSite)==24,"3B reuses the original IC record");
static BOOL rdi_regexp_holder_admit(JSContext *ctx,JSObject *holder)
{
    JSShape *shape=holder->shape;
    JSShapeProperty *properties;
    uint32_t hash;
    if(shape->is_hashed) return TRUE;
    /* Stay with the original lookup for layouts that do not satisfy the
     * original append-only hashed-shape construction invariants. */
    if(js_rc(shape)->ref_count!=1 || shape->deleted_prop_count || !shape->prop_count)
        return FALSE;
    properties=get_shape_prop(shape);
    hash=shape_initial_hash(shape->proto);
    for(int i=0;i<shape->prop_count;i++) {
        if(properties[i].atom==JS_ATOM_NULL) return FALSE;
        hash=shape_hash(shape_hash(hash,properties[i].atom),properties[i].flags);
    }
    if(ctx->rt->shape_hash_count>=ctx->rt->shape_hash_size/2) {
        /* RT allocation has no pending JS exception. Optional admission may
         * fail without changing this successful property read's result. */
        if(ctx->rt->shape_hash_bits>=30 || resize_shape_hash(ctx->rt,ctx->rt->shape_hash_bits+1)<0)
            return FALSE;
    }
    shape->hash=hash;
    shape->is_hashed=TRUE;
    js_shape_hash_link(ctx->rt,shape);
    /* B3_PROMOTED */
    return TRUE;
}
