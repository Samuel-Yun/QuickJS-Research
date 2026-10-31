/* The miss body retains upstream GET_FIELD_INLINE's normal search. */
#define GET_READ_IC(name, keep)                                          \
    {                                                                   \
        uint32_t index = get_u32(pc), offset;                            \
        ReadICSite *site = &b->read_ic_sites[index];                     \
        JSValue obj = sp[-1], val;                                      \
        JSAtom atom;                                                    \
        JSObject *p, *origin;                                           \
        JSProperty *pr;                                                 \
        JSShapeProperty *prs;                                           \
        RDI_DLOCAL(index);                                              \
        pc += 4;                                                        \
        RDI_QUERY();                                                    \
        if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {            \
            p = JS_VALUE_GET_OBJ(obj);                                  \
            if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic) {        \
                offset = rdi_probe(site, p->shape RDI_DARG(d));           \
                if (offset != UINT32_MAX) {                             \
                    JSObject *holder = p;                              \
                    if (site->holder_shape) {                          \
                        holder = p->shape->proto;                       \
                        if (!holder || holder->class_id != JS_CLASS_OBJECT || holder->is_exotic || \
                            holder->shape != site->holder_shape)       \
                            goto name ## _miss;                        \
                    }                                                   \
                    RDI_COUNT(hits);                                   \
                    val = JS_DupValue(ctx, holder->prop[offset].u.value); \
                    goto name ## _done;                                \
                }                                                       \
                RDI_COUNT(shape_misses);                               \
            }                                                           \
        }                                                               \
    name ## _miss:                                                      \
        RDI_COUNT(fallback);                                            \
        atom = site->atom;                                              \
        if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {            \
            p = origin = JS_VALUE_GET_OBJ(obj);                         \
            for (;;) {                                                  \
                prs = find_own_property(&pr, p, atom);                   \
                if (prs) {                                              \
                    if (unlikely(prs->flags & JS_PROP_TMASK)) {          \
                        RDI_REASON(descriptor);                        \
                        goto name ## _slow;                            \
                    }                                                   \
                    val = JS_DupValue(ctx, pr->u.value);                \
                    if (p != origin) {                                 \
                        RDI_REASON(inherited);                         \
                        if (origin->class_id == JS_CLASS_OBJECT && !origin->is_exotic && \
                            origin->shape->proto == p &&               \
                            p->class_id == JS_CLASS_OBJECT && !p->is_exotic && \
                            origin->shape->is_hashed && p->shape->is_hashed) \
                            rdi_update(ctx, site, origin->shape, p->shape, pr - p->prop RDI_DARG(d)); \
                    }                                                   \
                    else if (p->class_id != JS_CLASS_OBJECT || p->is_exotic) { RDI_REASON(special); } \
                    else if (!p->shape->is_hashed) { RDI_REASON(unhashed); } \
                    else {                                              \
                        RDI_REASON(own_miss);                           \
                        rdi_update(ctx, site, p->shape, NULL, pr - p->prop RDI_DARG(d)); \
                    }                                                   \
                    break;                                              \
                }                                                       \
                if (unlikely(p->is_exotic)) {                           \
                    RDI_REASON(special);                               \
                    obj = JS_MKPTR(JS_TAG_OBJECT, p);                   \
                    goto name ## _slow;                                \
                }                                                       \
                p = p->shape->proto;                                    \
                if (!p) { RDI_REASON(missing); val = JS_UNDEFINED; break; } \
            }                                                           \
        } else {                                                        \
            RDI_REASON(primitive);                                     \
        name ## _slow:                                                  \
            sf->cur_pc = pc;                                            \
            val = JS_GetPropertyInternal(ctx, obj, atom, sp[-1], 0);     \
            if (unlikely(JS_IsException(val))) goto exception;          \
        }                                                               \
    name ## _done:                                                      \
        if (keep) { *sp++ = val; }                                      \
        else { JS_FreeValue(ctx, sp[-1]); sp[-1] = val; }                \
    }
        CASE(OP_get_field_rdi):
            GET_READ_IC(get_field_rdi, 0);
            BREAK;
        CASE(OP_get_field2_rdi):
            GET_READ_IC(get_field2_rdi, 1);
            BREAK;
#undef GET_READ_IC
