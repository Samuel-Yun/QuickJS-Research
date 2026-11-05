/* Miss body preserves upstream GET_FIELD_INLINE, including original receiver. */
#define GET_EIC(name, keep)                                              \
    {                                                                   \
        unsigned index = get_u32(pc);                                   \
        EICSite *site = b->eic_sites ? &b->eic_sites[index] : eic_feedback(ctx,b,index); \
        JSValue obj = sp[-1], val;                                      \
        JSAtom atom = b->eic_meta[index].atom;                           \
        JSObject *p, *origin, *holder;                                  \
        JSProperty *pr; JSShapeProperty *prs; EICEntry *entry;           \
        pc += 4; EIC_COUNT(queries); EIC_COUNT(named_read);              \
        if (site && JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT) {            \
            p = JS_VALUE_GET_OBJ(obj);                                  \
            if (eic_ordinary(p) && (entry = eic_probe(site,p,&holder))) { \
                EIC_COUNT(hits);                                       \
                if (entry->chain) EIC_COUNT(proto_hits); else EIC_COUNT(own_hits); \
                val = JS_DupValue(ctx, holder->prop[entry->offset].u.value); \
                goto name ## _done;                                    \
            }                                                           \
        }                                                               \
        EIC_COUNT(fallback);                                            \
        if (likely(JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT)) {            \
            p = origin = JS_VALUE_GET_OBJ(obj);                         \
            for (;;) {                                                  \
                prs = find_own_property(&pr,p,atom);                     \
                if (prs) {                                              \
                    if (unlikely(prs->flags & JS_PROP_TMASK)) goto name ## _slow; \
                    val = JS_DupValue(ctx,pr->u.value);                  \
                    eic_update(ctx,site,origin,p,pr-p->prop);            \
                    break;                                              \
                }                                                       \
                if (unlikely(p->is_exotic)) {                           \
                    obj = JS_MKPTR(JS_TAG_OBJECT,p); goto name ## _slow; \
                }                                                       \
                p = p->shape->proto;                                    \
                if (!p) { val=JS_UNDEFINED; eic_ineligible(ctx->rt,site); break; } \
            }                                                           \
        } else {                                                        \
        name ## _slow:                                                  \
            eic_ineligible(ctx->rt,site);                               \
            sf->cur_pc=pc;                                              \
            val=JS_GetPropertyInternal(ctx,obj,atom,sp[-1],0);           \
            if (unlikely(JS_IsException(val))) goto exception;          \
        }                                                               \
    name ## _done:                                                      \
        if (keep) *sp++=val;                                            \
        else { JS_FreeValue(ctx,sp[-1]); sp[-1]=val; }                   \
    }
        CASE(OP_get_field_eic):
            GET_EIC(get_field_eic,0);
            BREAK;
        CASE(OP_get_field2_eic):
            GET_EIC(get_field2_eic,1);
            BREAK;
#undef GET_EIC
        CASE(OP_put_field_eic):
            {
                unsigned index=get_u32(pc);
                EICSite *site=b->eic_sites ? &b->eic_sites[index] : eic_feedback(ctx,b,index);
                JSAtom atom=b->eic_meta[index].atom;
                JSValue obj=sp[-2];
                JSObject *p,*holder; EICEntry *entry;
                JSProperty *pr; JSShapeProperty *prs;
                pc+=4; EIC_COUNT(queries); EIC_COUNT(named_store);
                if (site && JS_VALUE_GET_TAG(obj)==JS_TAG_OBJECT) {
                    p=JS_VALUE_GET_OBJ(obj);
                    if (eic_ordinary(p) && (entry=eic_probe(site,p,&holder))) {
                        assert(!entry->chain && holder==p);
                        EIC_COUNT(hits); EIC_COUNT(store_hits);
                        set_value(ctx,&p->prop[entry->offset].u.value,sp[-1]);
                        JS_FreeValue(ctx,obj); sp-=2; BREAK;
                    }
                }
                EIC_COUNT(fallback);
                if (JS_VALUE_GET_TAG(obj)==JS_TAG_OBJECT) {
                    p=JS_VALUE_GET_OBJ(obj); prs=find_own_property(&pr,p,atom);
                    if (prs && (prs->flags & (JS_PROP_TMASK|JS_PROP_WRITABLE|JS_PROP_LENGTH))==JS_PROP_WRITABLE) {
                        set_value(ctx,&pr->u.value,sp[-1]);
                        /* set_value and cache-edge release can invoke native
                         * finalizers. Commit first; reacquire current storage,
                         * and never use pr after an IC update releases edges. */
                        prs=find_own_property(&pr,p,atom);
                        if (prs && (prs->flags & (JS_PROP_TMASK|JS_PROP_WRITABLE|JS_PROP_LENGTH))==JS_PROP_WRITABLE)
                            eic_update(ctx,site,p,p,pr-p->prop);
                        else
                            eic_ineligible(ctx->rt,site);
                        JS_FreeValue(ctx,obj); sp-=2; BREAK;
                    }
                }
                eic_ineligible(ctx->rt,site);
                sf->cur_pc=pc;
                int ret=JS_SetPropertyInternal(ctx,obj,atom,sp[-1],obj,JS_PROP_THROW_STRICT);
                JS_FreeValue(ctx,obj); sp-=2;
                if (unlikely(ret<0)) goto exception;
            }
            BREAK;
