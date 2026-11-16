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
