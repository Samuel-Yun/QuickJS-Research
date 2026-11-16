static JSValue JS_GetPropertyInternalWithIC(JSContext *ctx, JSValue obj,
                                            JSAtom prop, JSValue this_obj,
                                            JSInlineCacheUpdate *icu,
                                            BOOL throw_ref_error)
{
    uint32_t tag, offset;
    JSObject *p;
    tag = JS_VALUE_GET_TAG(obj);
    if (unlikely(tag != JS_TAG_OBJECT))
        goto slow_path;
    p = JS_VALUE_GET_OBJ(obj);
    offset = get_ic_prop_offset(icu, p->shape);
    if (likely(offset != INLINE_CACHE_MISS))
        return JS_DupValue(ctx, p->prop[offset].u.value);
slow_path:
    return JS_GetPropertyInternalIC(ctx, obj, prop, this_obj, throw_ref_error, icu);
}

