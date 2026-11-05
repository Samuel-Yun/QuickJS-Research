/* Included after find_own_property and upstream shape helpers.
 * No V8 C++ copied. GC edges are strong QuickJS shape references, not weak Maps.
 * Every admitted shape MUST be hashed on insertion: only then retention gives COW.
 * Value-only writes need no invalidation: the current prop array is always read. */
static void eic_account(int64_t n)
{
#ifdef EIC_DIAGNOSTIC
    if (n > 0) { eic_stats.requested_bytes += n; eic_stats.live_bytes += n; }
    else { eic_stats.released_bytes -= n; eic_stats.live_bytes -= -n; }
    if (eic_stats.live_bytes > eic_stats.peak_bytes)
        eic_stats.peak_bytes = eic_stats.live_bytes;
#endif
}
static void eic_shape_drop(JSRuntime *rt, JSShape *s)
{
    if (s) { EIC_COUNT(shape_frees); js_free_shape(rt, s); }
}
static void eic_entry_clear(JSRuntime *rt, EICEntry *e)
{
    EICChain *chain = e->chain;
    JSShape *shape = e->shape;
    memset(e, 0, sizeof(*e));
    if (chain) {
        for (unsigned i = 0; i < chain->depth; i++)
            eic_shape_drop(rt, chain->shapes[i]);
        js_free_rt(rt, chain); eic_account(-(int64_t)sizeof(*chain));
    }
    eic_shape_drop(rt, shape);
}
static void eic_generic(JSRuntime *rt, EICSite *s)
{
    EICEntry *poly = s->poly;
    uint8_t count = s->count;
    s->poly = NULL; s->count = 0; s->state = EIC_GENERIC;
    EIC_COUNT(generic);
    eic_entry_clear(rt, &s->mono);
    if (poly) {
        for (unsigned i = 1; i < count; i++) eic_entry_clear(rt, &poly[i-1]);
        js_free_rt(rt, poly); eic_account(-3 * (int64_t)sizeof(EICEntry));
    }
}
static force_inline int eic_ordinary(JSObject *p)
{
    return p->class_id == JS_CLASS_OBJECT && !p->is_exotic;
}
static force_inline JSObject *eic_holder(EICEntry *e, JSObject *p)
{
    EICChain *c = e->chain;
    if (!c) return p;
    /* Shape->proto identity is protected too. Walk CURRENT links, not stale prop ptrs. */
    for (unsigned i = 0; i < c->depth; i++) {
        p = p->shape->proto;
        if (!p || !eic_ordinary(p) || p->shape != c->shapes[i]) return NULL;
    }
    return p;
}
static force_inline EICEntry *eic_probe(EICSite *s, JSObject *p, JSObject **holder)
{
    EICEntry *e = &s->mono;
    if (e->shape == p->shape) {
        *holder = eic_holder(e, p);
        if (*holder) return e;
        return NULL;
    }
    if (s->poly) {
        for (unsigned i = 1; i < s->count; i++) {
            e = &s->poly[i-1];
            if (e->shape == p->shape) {
                *holder = eic_holder(e, p);
                return *holder ? e : NULL;
            }
        }
    }
    return NULL;
}
static EICSite *eic_feedback(JSContext *ctx, JSFunctionBytecode *b, unsigned index)
{
    if (!b->eic_sites) {
        /* Explicit experiment policy, NOT a claim about V8's invocation threshold.
         * A cold bytecode instance allocates metadata only, not handlers or shapes. */
        if (b->eic_heat == 255 || ++b->eic_heat < 8) return NULL;
        b->eic_sites = js_mallocz_rt(ctx->rt, (size_t)b->eic_count * sizeof(EICSite));
        if (!b->eic_sites) { b->eic_heat = 255; EIC_COUNT(alloc_fail); return NULL; }
        EIC_COUNT(vectors); eic_account((int64_t)b->eic_count * sizeof(EICSite));
    }
    return &b->eic_sites[index];
}
static void eic_ineligible(JSRuntime *rt, EICSite *s)
{
    if (!s || s->state == EIC_GENERIC) return;
    EIC_COUNT(ineligible);
    /* Bound repeated unsupported access overhead and retention, no shared mega cache. */
    if (++s->unsupported >= 8) eic_generic(rt, s);
}
static void eic_update(JSContext *ctx, EICSite *s, JSObject *origin,
                       JSObject *holder, uint32_t offset)
{
    JSObject *p = origin;
    JSShape *chain_shapes[3];
    unsigned depth = 0, target = 0;
    EICEntry fresh = {0}, *dest;
    if (!s || s->state == EIC_GENERIC) return;
    for (;;) {
        if (!eic_ordinary(p) || !p->shape->is_hashed) goto unsupported;
        if (p == holder) break;
        if (depth == 3 || !(p = p->shape->proto)) goto unsupported;
        chain_shapes[depth++] = p->shape;
    }
    fresh.offset = offset;
    if (depth) {
        fresh.chain = js_mallocz_rt(ctx->rt, sizeof(EICChain));
        if (!fresh.chain) { EIC_COUNT(alloc_fail); return; }
        EIC_COUNT(chains); eic_account(sizeof(EICChain));
        fresh.chain->depth = depth;
        for (unsigned i = 0; i < depth; i++) {
            fresh.chain->shapes[i] = js_dup_shape(chain_shapes[i]); EIC_COUNT(shape_refs);
        }
    }
    fresh.shape = js_dup_shape(origin->shape); EIC_COUNT(shape_refs);
    if (s->count) {
        for (target = 0; target < s->count; target++) {
            dest = target ? &s->poly[target-1] : &s->mono;
            if (dest->shape == fresh.shape) {
                EIC_COUNT(recompute); eic_entry_clear(ctx->rt, dest); *dest = fresh;
                s->unsupported = 0; return;
            }
        }
    }
    if (s->count == 4) {
        eic_entry_clear(ctx->rt, &fresh); eic_generic(ctx->rt, s); return;
    }
    if (s->count == 1) {
        s->poly = js_mallocz_rt(ctx->rt, 3 * sizeof(EICEntry));
        if (!s->poly) { EIC_COUNT(alloc_fail); eic_entry_clear(ctx->rt, &fresh); return; }
        EIC_COUNT(polys); eic_account(3 * sizeof(EICEntry));
        s->state = EIC_POLYMORPHIC; EIC_COUNT(poly);
    }
    dest = s->count ? &s->poly[s->count-1] : &s->mono;
    *dest = fresh;
    if (!s->count) { s->state = EIC_MONOMORPHIC; EIC_COUNT(mono); }
    s->count++; s->unsupported = 0;
    assert(s->count <= 4);
    return;
unsupported:
    eic_ineligible(ctx->rt, s);
}
static void eic_free(JSRuntime *rt, JSFunctionBytecode *b)
{
    for (unsigned i = 0; i < b->eic_count; i++) {
        if (b->eic_sites) {
            EICSite *s = &b->eic_sites[i];
            EICEntry *poly = s->poly;
            eic_entry_clear(rt, &s->mono);
            if (poly) {
                for (unsigned j = 1; j < s->count; j++) eic_entry_clear(rt, &poly[j-1]);
                js_free_rt(rt, poly); eic_account(-3 * (int64_t)sizeof(EICEntry));
            }
        }
        JS_FreeAtomRT(rt, b->eic_meta[i].atom);
    }
    if (b->eic_sites) {
        js_free_rt(rt, b->eic_sites); eic_account(-(int64_t)b->eic_count * sizeof(EICSite));
    }
    if (b->eic_meta) {
        js_free_rt(rt, b->eic_meta); eic_account(-(int64_t)b->eic_count * sizeof(EICMeta));
    }
    b->eic_sites = NULL; b->eic_meta = NULL; b->eic_count = 0;
}
static void eic_mark(JSRuntime *rt, JSFunctionBytecode *b, JS_MarkFunc *mark_func)
{
    if (!b->eic_sites) return;
    for (unsigned i = 0; i < b->eic_count; i++) {
        EICSite *s = &b->eic_sites[i];
        for (unsigned j = 0; j < s->count; j++) {
            EICEntry *e = j ? &s->poly[j-1] : &s->mono;
            if (e->shape) mark_func(rt, &e->shape->header);
            if (e->chain) for (unsigned k = 0; k < e->chain->depth; k++)
                mark_func(rt, &e->chain->shapes[k]->header);
        }
    }
}
