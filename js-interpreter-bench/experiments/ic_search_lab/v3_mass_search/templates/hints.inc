/* Predict an index, validate the current live ordinary data descriptor. */
static force_inline uint32_t search_hint_probe(SearchHints *h, JSObject *p, JSAtom atom)
{
    JSShape *sh = p->shape;
    if (!sh->is_hashed || atom == JS_ATOM_NULL || p->class_id != JS_CLASS_OBJECT || p->is_exotic)
        return UINT32_MAX;
    JSShapeProperty *prop = get_shape_prop(sh);
    for (unsigned i = 0; i < SEARCH_HINTS; i++) {
        uint32_t encoded = h->offsets[i];
        if (encoded && encoded - 1 < (uint32_t)sh->prop_count) {
            JSShapeProperty *pr = &prop[encoded - 1];
            if (pr->atom == atom && !(pr->flags & JS_PROP_TMASK)) return encoded - 1;
        }
    }
    return UINT32_MAX;
}
static force_inline void search_hint_update(SearchHints *h, uint32_t offset)
{
    uint32_t encoded = offset + 1;
    for (unsigned i = 0; i < SEARCH_HINTS; i++) if (h->offsets[i] == encoded) return;
#if SEARCH_HINT_UPDATE == 1
    if (h->pending != encoded) { h->pending = encoded; return; }
    h->pending = 0;
#endif
    for (unsigned i = 0; i < SEARCH_HINTS; i++)
        if (!h->offsets[i]) { h->offsets[i] = encoded; return; }
#if SEARCH_HINT_UPDATE != 2
    h->offsets[h->victim] = encoded;
    h->victim = (h->victim + 1) % SEARCH_HINTS;
#endif
}
