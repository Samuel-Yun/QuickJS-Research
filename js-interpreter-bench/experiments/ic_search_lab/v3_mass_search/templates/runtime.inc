/* Included after find_own_property. No counters in performance builds. */
#if SEARCH_LAYOUT == 1 || SEARCH_LAYOUT == 3
#define RDI_SHAPE(s, i) ((s)->shapes[i])
#define RDI_OFFSET(s, i) ((s)->offsets[i])
#else
#define RDI_SHAPE(s, i) ((s)->entries[i].shape)
#define RDI_OFFSET(s, i) ((s)->entries[i].offset)
#endif
static force_inline JSAtom rdi_atom(JSFunctionBytecode *b, ReadICSite *s)
{
#if SEARCH_LAYOUT == 2
    return b->read_ic_atoms[s - b->read_ic_sites];
#else
    return s->atom;
#endif
}
static force_inline void rdi_policy_result(ReadICSite *s, int hit)
{
#if SEARCH_POLICY == 1 || SEARCH_POLICY == 4
    if (hit) { if (s->streak) s->streak = 0; }
    else if (++s->streak >= SEARCH_WARM * 8) {
        s->cooldown = SEARCH_POLICY == 1 ? UINT32_MAX : SEARCH_WARM * 32;
        s->streak = 0;
        s->skip_update = 1;
    }
#elif SEARCH_POLICY == 2
    s->queries++;
    s->misses += !hit;
    if (s->queries == 64) {
        if (s->misses >= 48) { s->cooldown = 256; s->skip_update = 1; }
        s->queries = s->misses = 0;
    }
#elif SEARCH_POLICY == 3
    if (hit) { if (s->confidence < 31) s->confidence++; }
    else if (s->confidence > 2) s->confidence -= 2;
    else { s->confidence = 8; s->cooldown = SEARCH_WARM * 8; s->skip_update = 1; }
#endif
}
static force_inline void rdi_touch(ReadICSite *s, unsigned i)
{
#if SEARCH_MRU
    s->recent = i;
#endif
#if SEARCH_EVICTION == 1
    if (++s->tick == 0) {
        for (unsigned k = 0; k < SEARCH_SLOTS; k++) s->age[k] = 0;
        s->tick = 1;
    }
    s->age[i] = s->tick;
#elif SEARCH_EVICTION == 2
    s->referenced[i] = 1;
#endif
}
#if SEARCH_TABLE_ENTRIES
static force_inline unsigned rdi_table_base(JSShape *shape, JSAtom atom)
{
    return ((((uintptr_t)shape >> 4) ^ atom) % (SEARCH_TABLE_ENTRIES / SEARCH_TABLE_WAYS)) * SEARCH_TABLE_WAYS;
}
#endif
static force_inline uint32_t rdi_probe(JSFunctionBytecode *b, ReadICSite *s, JSShape *shape)
{
#if SEARCH_POLICY
    s->skip_update = 0;
    if (s->seen < SEARCH_WARM) {
        if (++s->seen < SEARCH_WARM) { s->skip_update = 1; return UINT32_MAX; }
        s->confidence = 8;
    }
    if (s->cooldown) {
        if (s->cooldown != UINT32_MAX) s->cooldown--;
        s->skip_update = 1;
        return UINT32_MAX;
    }
#endif
    for (unsigned k = 0; k < SEARCH_SLOTS; k++) {
#if SEARCH_MRU
        unsigned i = (s->recent + k) % SEARCH_SLOTS;
#else
        unsigned i = k;
#endif
        if (RDI_SHAPE(s, i) == shape) {
            rdi_touch(s, i);
            rdi_policy_result(s, 1);
            return RDI_OFFSET(s, i);
        }
    }
#if SEARCH_TABLE_ENTRIES
    JSAtom atom = rdi_atom(b, s);
    unsigned base = rdi_table_base(shape, atom);
    for (unsigned i = base; i < base + SEARCH_TABLE_WAYS; i++) {
        SearchEntry *entry = &b->read_ic_shared[i];
        if (entry->shape == shape && entry->atom == atom && entry->ready)
            return entry->offset;
    }
#endif
    rdi_policy_result(s, 0);
    return UINT32_MAX;
}
static force_inline void rdi_update(JSContext *ctx, JSFunctionBytecode *b,
                                    ReadICSite *s, JSShape *shape, uint32_t offset)
{
#if SEARCH_POLICY
    if (s->skip_update) return;
#endif
#if SEARCH_LAYOUT == 3
    if (offset >= UINT16_MAX) return;
#endif
    unsigned i, empty = SEARCH_SLOTS;
    for (i = 0; i < SEARCH_SLOTS; i++) {
        if (RDI_SHAPE(s, i) == shape) {
            RDI_OFFSET(s, i) = offset;
            rdi_touch(s, i);
            goto shared_update;
        }
        if (!RDI_SHAPE(s, i) && empty == SEARCH_SLOTS) empty = i;
    }
    if (empty < SEARCH_SLOTS) i = empty;
    else {
#if SEARCH_SLOTS == 1
        i = 0;
#elif SEARCH_EVICTION == 1
        i = 0;
        for (unsigned k = 1; k < SEARCH_SLOTS; k++) if (s->age[k] < s->age[i]) i = k;
#elif SEARCH_EVICTION == 2
        i = s->victim;
        while (s->referenced[i]) {
            s->referenced[i] = 0;
            i = (i + 1) % SEARCH_SLOTS;
        }
        s->victim = (i + 1) % SEARCH_SLOTS;
#else
        i = s->victim;
        s->victim = (i + 1) % SEARCH_SLOTS;
#endif
    }
    JSShape *old = RDI_SHAPE(s, i);
    js_dup_shape(shape);
    RDI_SHAPE(s, i) = shape;
    RDI_OFFSET(s, i) = offset;
    rdi_touch(s, i);
    /* Publish before releasing old shape: release may invoke finalizers. */
    js_free_shape_null(ctx->rt, old);
shared_update:
#if SEARCH_TABLE_ENTRIES
    JSAtom atom = rdi_atom(b, s);
    unsigned base = rdi_table_base(shape, atom), slot = SEARCH_TABLE_ENTRIES;
    for (unsigned k = base; k < base + SEARCH_TABLE_WAYS; k++) {
        SearchEntry *entry = &b->read_ic_shared[k];
        if (entry->shape == shape && entry->atom == atom) {
            entry->offset = offset;
            entry->ready = 1;
            return;
        }
        if (!entry->shape && slot == SEARCH_TABLE_ENTRIES) slot = k;
    }
    if (slot == SEARCH_TABLE_ENTRIES) slot = base + b->read_ic_shared_cursor++ % SEARCH_TABLE_WAYS;
    SearchEntry *entry = &b->read_ic_shared[slot];
    old = entry->shape;
    js_dup_shape(shape);
    entry->shape = shape; entry->atom = atom; entry->offset = offset;
    entry->ready = SEARCH_TABLE_ADMISSION == 1;
    js_free_shape_null(ctx->rt, old);
#else
    (void)b;
#endif
}
static void rdi_mark(JSRuntime *rt, JSFunctionBytecode *b, JS_MarkFunc *mark_func)
{
    for (uint32_t i = 0; i < b->read_ic_count; i++)
        for (unsigned k = 0; k < SEARCH_SLOTS; k++)
            if (RDI_SHAPE(&b->read_ic_sites[i], k)) mark_func(rt, &RDI_SHAPE(&b->read_ic_sites[i], k)->header);
#if SEARCH_TABLE_ENTRIES
    if (b->read_ic_shared)
        for (unsigned k = 0; k < SEARCH_TABLE_ENTRIES; k++)
            if (b->read_ic_shared[k].shape) mark_func(rt, &b->read_ic_shared[k].shape->header);
#endif
}
static void rdi_free(JSRuntime *rt, JSFunctionBytecode *b)
{
    for (uint32_t i = 0; i < b->read_ic_count; i++) {
        ReadICSite *s = &b->read_ic_sites[i];
        JS_FreeAtomRT(rt, rdi_atom(b, s));
        for (unsigned k = 0; k < SEARCH_SLOTS; k++) {
            JSShape *old = RDI_SHAPE(s, k); RDI_SHAPE(s, k) = NULL;
            js_free_shape_null(rt, old);
        }
    }
#if SEARCH_TABLE_ENTRIES
    if (b->read_ic_shared)
        for (unsigned k = 0; k < SEARCH_TABLE_ENTRIES; k++) {
            JSShape *old = b->read_ic_shared[k].shape; b->read_ic_shared[k].shape = NULL;
            js_free_shape_null(rt, old);
        }
#endif
#if SEARCH_PC_REL
    if (b->read_ic_sites) { js_free_rt(rt, b->byte_code_buf); b->byte_code_buf = NULL; }
#else
    js_free_rt(rt, b->read_ic_sites);
#endif
    b->read_ic_sites = NULL; b->read_ic_count = 0;
}
