/* New research implementation. Only the shared-cache idea is inspired by V8;
 * see README.md for the fixed source reference. No V8 implementation copied. */
#ifndef GO_COUNT
#define GO_COUNT(k) ((void)0)
#define GO_ADD(k,n) ((void)0)
#endif
_Static_assert(GO_CAPACITY == 1024, "fixed first experiment capacity");
_Static_assert(sizeof(GlobalOwnEntry) == 24, "weak entry with two index links");
_Static_assert(sizeof(JSShape) == 56, "shape allocation size unchanged");
_Static_assert(offsetof(JSShape, is_hashed) == 16, "original field offset");
_Static_assert(offsetof(JSShape, own_cache_head) == 18, "use original padding");
_Static_assert(offsetof(JSShape, hash) == 20, "original field offset");
_Static_assert(offsetof(JSShape, hash_table) == 56, "descriptor base unchanged");
_Static_assert(offsetof(JSRuntime, global_own_offsets) ==
               ((offsetof(JSRuntime, transition_edges_disabled) + 8) & ~(size_t)7),
               "disabled bit fits the previous runtime tail padding");
_Static_assert(sizeof(JSRuntime) == offsetof(JSRuntime, global_own_offsets) +
               sizeof(((JSRuntime *)0)->global_own_offsets), "only table grows runtime");

static force_inline uint16_t global_own_bucket(JSShape *shape, JSAtom atom)
{
    uint64_t key = (uintptr_t)shape;
    uint64_t h = (key >> 3) ^ (key >> 17) ^ (key >> 32) ^
                 ((uint64_t)atom * UINT32_C(0x9e3779b1));
    h ^= h >> 16;
    return (uint16_t)(h & (GO_CAPACITY - 1));
}

/* Indices are bucket+1; zero is the list terminator. No references released. */
static void global_own_unlink(JSRuntime *rt, uint16_t index)
{
    GlobalOwnEntry *e = &rt->global_own_offsets[index - 1];
    JSShape *shape = e->shape;
    if (!shape) return;
    if (e->prev)
        rt->global_own_offsets[e->prev - 1].next = e->next;
    else
        shape->own_cache_head = e->next;
    if (e->next)
        rt->global_own_offsets[e->next - 1].prev = e->prev;
    e->shape = NULL;
    e->atom = JS_ATOM_NULL; /* borrowed from shape; never FreeAtom here */
    e->prev = e->next = 0;
}

static void global_own_invalidate(JSRuntime *rt, JSShape *shape)
{
    if (!shape->own_cache_head) return;
    GO_COUNT(invalidations);
    while (shape->own_cache_head) {
        global_own_unlink(rt, shape->own_cache_head);
        GO_COUNT(cleared_entries);
        if (rt->global_own_disabled) GO_COUNT(shutdown_entries);
    }
}

static force_inline uint32_t global_own_probe(JSRuntime *rt, JSShape *shape,
                                              JSAtom atom)
{
    GlobalOwnEntry *e = &rt->global_own_offsets[global_own_bucket(shape, atom)];
    if (!rt->global_own_disabled && e->shape == shape && e->atom == atom)
        return e->prop_offset;
    return UINT32_MAX;
}

/* Caller already found an own ordinary data property in a hashed shape.
 * Must run BEFORE rdi_update: that function can release old shape roots and
 * enter a native finalizer. This routine allocates/calls/frees no JS values. */
static void global_own_register(JSRuntime *rt, JSShape *shape, JSAtom atom,
                                 uint32_t offset)
{
    if (rt->global_own_disabled) return;
    uint16_t index = global_own_bucket(shape, atom) + 1;
    GlobalOwnEntry *e = &rt->global_own_offsets[index - 1];
    GO_COUNT(registrations);
    if (e->shape == shape && e->atom == atom) {
        e->prop_offset = offset;
        GO_COUNT(same_key_refreshes);
        return;
    }
    if (e->shape) {
        GO_COUNT(conflict_replacements);
        global_own_unlink(rt, index);
    }
    e->shape = shape;
    e->atom = atom;
    e->prop_offset = offset;
    e->prev = 0;
    e->next = shape->own_cache_head;
    if (e->next) rt->global_own_offsets[e->next - 1].prev = index;
    shape->own_cache_head = index;
}

static void global_own_shutdown(JSRuntime *rt)
{
    rt->global_own_disabled = 1;
    GO_COUNT(runtime_shutdowns);
    /* Only teardown scans the table. Probe and fill select exactly one bucket. */
    for (unsigned i = 0; i < GO_CAPACITY; i++)
        if (rt->global_own_offsets[i].shape)
            global_own_invalidate(rt, rt->global_own_offsets[i].shape);
}
