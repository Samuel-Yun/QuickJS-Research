/* Bounded strong references keep intermediate transition layouts available.
 * Shape RC forces the original COW paths on mutation; cached shapes therefore
 * stay immutable and hashed. Entries are external GC roots through their RC,
 * not GC objects, and are cleared before runtime's final cycle collection.
 */
_Static_assert(sizeof(JSShape)==56,"shape layout unchanged");
_Static_assert(sizeof(ExEdge)==24,"entry size");
static JSShape *ex_edge_lookup(JSRuntime *rt,JSShape *from,JSAtom atom,int flags)
{
    uint32_t i=(((uintptr_t)from>>4)^atom^((uint32_t)flags<<3))&31;
    ExEdge *e=&rt->transition_edges[i];
    EX_COUNT(edge_queries);
    if(!rt->transition_edges_disabled && e->from==from && e->atom==atom && e->flags==flags) {
        assert(from->is_hashed && e->to && e->to->is_hashed);
        EX_COUNT(edge_hits);return e->to;
    }
    return NULL;
}
static void ex_edge_fill(JSRuntime *rt,JSShape *from,JSAtom atom,int flags,JSShape *to)
{
    JSShape *old_from,*old_to;
    uint32_t i=(((uintptr_t)from>>4)^atom^((uint32_t)flags<<3))&31;
    ExEdge *e=&rt->transition_edges[i];
    if(rt->transition_edges_disabled) return;
    old_from=e->from;old_to=e->to;
    js_dup_shape(from);js_dup_shape(to);
    e->from=from;e->to=to;e->atom=atom;e->flags=flags;
    /* Publish before releasing any root that might run a native finalizer. */
    js_free_shape_null(rt,old_from);js_free_shape_null(rt,old_to);
}
static void ex_edge_clear(JSRuntime *rt)
{
    rt->transition_edges_disabled=1;
    for(int i=0;i<32;i++) {
        ExEdge *e=&rt->transition_edges[i];JSShape *a=e->from,*b=e->to;
        e->from=NULL;e->to=NULL;
        js_free_shape_null(rt,a);js_free_shape_null(rt,b);
    }
}
