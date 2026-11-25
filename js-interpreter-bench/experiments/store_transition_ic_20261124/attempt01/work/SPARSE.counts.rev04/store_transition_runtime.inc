#ifdef STORE_DIAGNOSTIC
#include "store_transition_diag.h"
#else
#define ST_EVENT(d, event) ((void)0)
#define ST_POINT(b, pc, atom, shared) NULL
#define ST_PREPARE(n) ((void)0)
#define ST_RELEASE(n) ((void)0)
#define ST_CODE_COPY(n) ((void)0)
#define ST_SKIP_CTOR() ((void)0)
#endif

/* Strong hashed shape references imply COW on descriptor/prototype mutation.
 * JS_CLASS_OBJECT excludes the global object's direct descriptor flag updates.
 * No value is cached; the RHS belongs to this invocation. */
static void st_drop(JSRuntime *rt, StoreSite *s)
{
    JSShape *from = s->from, *to = s->to, *chain[ST_CHAIN_MAX];
    int depth = s->depth;
    memcpy(chain, s->chain, sizeof(chain));
    s->from = s->to = NULL; s->depth = 0;
    memset(s->chain, 0, sizeof(s->chain));
    js_free_shape_null(rt, from); js_free_shape_null(rt, to);
    for (int i = 0; i < depth; i++) js_free_shape(rt, chain[i]);
}

/* Validate the nearest inherited descriptor exactly once, without JS reads.
 * Keep the entire short chain, even after a writable descriptor is found:
 * the guard then also certifies object conditions and the null endpoint. */
static int st_chain(StoreSite *s, JSShape *from, JSAtom atom, StDiag *d)
{
    JSObject *p = from->proto;
    int found = 0;
    while (p) {
        JSProperty *pr;
        JSShapeProperty *desc;
        if (s->depth == ST_CHAIN_MAX) { ST_EVENT(d, reject_deep); return 0; }
        if (p->class_id != JS_CLASS_OBJECT || p->is_exotic) {
            ST_EVENT(d, reject_proto_class); return 0;
        }
        if (!p->shape->is_hashed) { ST_EVENT(d, reject_proto_unhashed); return 0; }
        s->chain[s->depth++] = p->shape;
        if (!found && (desc = find_own_property(&pr, p, atom))) {
            if ((desc->flags & (JS_PROP_TMASK | JS_PROP_WRITABLE | JS_PROP_LENGTH)) != JS_PROP_WRITABLE) {
                ST_EVENT(d, reject_descriptor); return 0;
            }
            found = 1;
        }
        p = p->shape->proto;
    }
    return 1;
}

/* Called ONLY inside add_property's already selected reuse/no-resize arm,
 * immediately before that arm changes the object's shape. No reference to the
 * old shape was retained before the original path made this decision. */
static void st_capture(JSContext *ctx, StoreObservation *o, JSObject *p,
                       JSShape *from, JSShape *to, JSAtom atom, int flags)
{
    StoreSite s = {0};
    uint32_t array_index;
    if (!o) return;
    ST_EVENT(o->diag, reuse_shape);
    if (from->prop_size != to->prop_size) { ST_EVENT(o->diag, needs_resize); return; }
    ST_EVENT(o->diag, reuse_no_resize);
    if (p->class_id != JS_CLASS_OBJECT || p->is_exotic || !p->extensible ||
        JS_AtomIsArrayIndex(ctx, &array_index, atom) || !from->is_hashed || !to->is_hashed ||
        flags != JS_PROP_C_W_E || from->deleted_prop_count || to->deleted_prop_count ||
        to->proto != from->proto || to->prop_count != from->prop_count + 1 ||
        to->prop_count > from->prop_size) {
        ST_EVENT(o->diag, reject_transition); return;
    }
    JSShapeProperty *a = get_shape_prop(from), *b = get_shape_prop(to);
    for (uint32_t i = 0; i < from->prop_count; i++) {
        if (a[i].atom == atom || a[i].atom != b[i].atom || a[i].flags != b[i].flags) {
            ST_EVENT(o->diag, reject_transition); return;
        }
    }
    if (b[from->prop_count].atom != atom || b[from->prop_count].flags != JS_PROP_C_W_E) {
        ST_EVENT(o->diag, reject_transition); return;
    }
    if (!st_chain(&s, from, atom, o->diag)) return;
    ST_EVENT(o->diag, learn_candidates);
#if STORE_TRANSITION_ENABLED
    if (!o->target) return;
    s.from = js_dup_shape(from); s.to = js_dup_shape(to);
    s.atom = atom; s.offset = from->prop_count; s.pc = o->target->pc;
    for (int i = 0; i < s.depth; i++) js_dup_shape(s.chain[i]);
    assert(!o->learned.from);
    o->learned = s;
#endif
}

static int st_try(JSContext *ctx, StoreSite *s, JSValueConst obj, JSValue val, StDiag *d)
{
    JSObject *p, *proto;
    if (JS_VALUE_GET_TAG(obj) != JS_TAG_OBJECT) { ST_EVENT(d, miss_not_object); return 0; }
    p = JS_VALUE_GET_OBJ(obj);
    if (p->class_id != JS_CLASS_OBJECT || p->is_exotic || !p->extensible) {
        ST_EVENT(d, miss_receiver); return 0;
    }
    if (!s->from) { ST_EVENT(d, miss_empty); return 0; }
    if (p->shape != s->from) { ST_EVENT(d, miss_shape); return 0; }
    if (s->offset >= p->shape->prop_size) { ST_EVENT(d, miss_capacity); return 0; }
    proto = p->shape->proto;
    for (int i = 0; i < s->depth; i++) {
        if (!proto || proto->class_id != JS_CLASS_OBJECT || proto->is_exotic ||
            proto->shape != s->chain[i]) { ST_EVENT(d, miss_proto); return 0; }
        proto = proto->shape->proto;
    }
    if (proto) { ST_EVENT(d, miss_proto); return 0; }
    JSShape *old = p->shape;
    /* Both layout and the newly visible value are consistent before any free. */
    p->shape = js_dup_shape(s->to);
    p->prop[s->offset].u.value = val; /* transfer, not duplicate */
    ST_EVENT(d, transition_hits);
    js_free_shape(ctx->rt, old);
    return 1;
}

static int js_set_property_observed(JSContext *ctx, JSValueConst obj, JSAtom prop,
    JSValue val, JSValueConst this_obj, int flags, StoreObservation *observation);

/* Large temporary is on the cold helper's C frame, never in the hit handler. */
static int st_slow(JSContext *ctx, StoreSite *site, StDiag *d,
                   JSValueConst obj, JSAtom atom, JSValue val)
{
    StoreObservation o = {0};
    o.target = site; o.diag = d;
    int ret = js_set_property_observed(ctx, obj, atom, val, obj, JS_PROP_THROW_STRICT, &o);
#if STORE_TRANSITION_ENABLED
    if (o.learned.from) {
        if (ret > 0) {
            StoreSite old = *site;
            *site = o.learned;
            ST_EVENT(d, publications);
            if (old.from) ST_EVENT(d, replacements);
            /* Publish complete plan before releasing previous references. */
            st_drop(ctx->rt, &old);
        } else st_drop(ctx->rt, &o.learned);
    }
#endif
    return ret;
}

