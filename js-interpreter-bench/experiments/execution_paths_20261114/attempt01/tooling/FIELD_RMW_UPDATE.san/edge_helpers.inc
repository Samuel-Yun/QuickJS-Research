/* Weak transition entries. Invalidate before either endpoint is unlinked,
 * mutated or freed; no extra shape roots, references or GC marking needed.
 * The edge flag fits in preexisting JSShape alignment padding on this target.
 */
_Static_assert(sizeof(JSShape)==56,"shape layout must remain unchanged");
static void ex_edge_invalidate(JSRuntime *rt,JSShape *shape)
{
    if(!shape->has_transition_edge) return;
    for(int i=0;i<32;i++) {
        ExEdge *e=&rt->transition_edges[i];
        if(e->from==shape || e->to==shape) { e->from=NULL;e->to=NULL; }
    }
    shape->has_transition_edge=FALSE;
}
static JSShape *ex_edge_lookup(JSRuntime *rt,JSShape *from,JSAtom atom,int flags)
{
    uint32_t index=(((uintptr_t)from>>4)^atom^((uint32_t)flags<<3))&31;
    ExEdge *e=&rt->transition_edges[index];
    EX_COUNT(edge_queries);
    if(e->from==from && e->atom==atom && e->flags==flags) {
        assert(from->is_hashed && e->to && e->to->is_hashed);
        EX_COUNT(edge_hits);return e->to;
    }
    return NULL;
}
static void ex_edge_fill(JSRuntime *rt,JSShape *from,JSAtom atom,int flags,JSShape *to)
{
    uint32_t index=(((uintptr_t)from>>4)^atom^((uint32_t)flags<<3))&31;
    ExEdge *e=&rt->transition_edges[index];
    e->from=from;e->to=to;e->atom=atom;e->flags=flags;
    from->has_transition_edge=TRUE;to->has_transition_edge=TRUE;
}
