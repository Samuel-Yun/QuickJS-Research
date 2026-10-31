static int JS_SetPropertyInternalWithIC(JSContext *ctx, JSValueConst obj,
                                      JSAtom prop, JSValue val, int flags,
                                      JSInlineCacheUpdate *icu)
{
    if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {
        JSObject *p = JS_VALUE_GET_OBJ(obj);
        uint32_t offset = get_ic_prop_offset(icu, p->shape);
        if (likely(offset != INLINE_CACHE_MISS)) {
            /* Minimal semantic fix: shared read/write atoms can insert a
               readonly data shape via a read. Do not bypass its descriptor. */
            JSShapeProperty *prs = &get_shape_prop(p->shape)[offset];
            if (likely((prs->flags & (JS_PROP_TMASK | JS_PROP_WRITABLE |
                                      JS_PROP_LENGTH)) == JS_PROP_WRITABLE)) {
                set_value(ctx, &p->prop[offset].u.value, val);
                return TRUE;
            }
        }
    }
    return JS_SetPropertyInternalIC(ctx, obj, prop, val, obj, flags, icu);
}

