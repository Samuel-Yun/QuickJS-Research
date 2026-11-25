/* Optional local dependency record; never created for an unhashed shape. */
#ifndef LSG_COUNT
#define LSG_COUNT(k) ((void)0)
#define LSG_ADD(k,n) ((void)0)
#define LSG_FULL_BEGIN() ((void)0)
#define LSG_FULL_END(ok) ((void)0)
#endif

static void local_shape_guard_free(JSRuntime *rt, LocalShapeGuard *g)
{
    if (!g) return;
    LSG_COUNT(records_freed);
    LSG_ADD(shape_refs_released, 1 + g->depth);
    js_free_shape_null(rt, g->callee_shape);
    for (unsigned i = 0; i < g->depth; i++)
        js_free_shape_null(rt, g->chain[i]);
    js_free_rt(rt, g);
}

static LocalShapeGuard *local_shape_guard_build(JSContext *ctx,
                                               JSObject *f, JSObject *proto)
{
    JSShape *chain[4];
    JSObject *p = proto;
    JSProperty *pr;
    JSShapeProperty *desc;
    unsigned depth = 0;
    LSG_COUNT(build_attempts);
    if (!f->shape->is_hashed) {
        LSG_COUNT(build_callee_unhashed);
        return NULL;
    }
    LSG_COUNT(build_proto_lookups);
    desc = find_own_property(&pr, f, JS_ATOM_prototype);
    if (!desc || (desc->flags & JS_PROP_TMASK) ||
        JS_VALUE_GET_TAG(pr->u.value) != JS_TAG_OBJECT ||
        JS_VALUE_GET_OBJ(pr->u.value) != proto) {
        LSG_COUNT(build_prototype_descriptor);
        return NULL;
    }
    while (p) {
        if (depth == 4) {
            LSG_COUNT(build_deep);
            return NULL;
        }
        if (p->class_id != JS_CLASS_OBJECT || p->is_exotic) {
            LSG_COUNT(build_special);
            return NULL;
        }
        if (!p->shape->is_hashed) {
            LSG_COUNT(build_chain_unhashed);
            return NULL;
        }
        chain[depth++] = p->shape;
        p = p->shape->proto;
    }
#ifdef CTOR_LOCAL_DIAG
    /* Fault injection is diagnostic-only and never enters the Release build. */
    if (getenv("LSG_FAIL_RECORD_ALLOC")) {
        LSG_COUNT(record_allocation_failures);
        return NULL;
    }
#endif
    LocalShapeGuard *g = js_mallocz_rt(ctx->rt, sizeof(*g));
    if (!g) {
        LSG_COUNT(record_allocation_failures);
        return NULL;
    }
    g->prototype_offset = pr - f->prop;
    g->depth = depth;
    g->callee_shape = js_dup_shape(f->shape);
    for (unsigned i = 0; i < depth; i++)
        g->chain[i] = js_dup_shape(chain[i]);
    LSG_COUNT(records_built);
    LSG_ADD(record_requested_bytes, sizeof(*g));
    LSG_ADD(record_usable_bytes, js_malloc_usable_size_rt(ctx->rt, g));
    LSG_ADD(shape_refs_held, 1 + depth);
    return g;
}

static force_inline int local_shape_guard_matches(JSObject *f, FullPlan *s)
{
    LocalShapeGuard *g = s->local;
    if (f->shape != g->callee_shape || !f->shape->is_hashed) return 0;
    JSValueConst value = f->prop[g->prototype_offset].u.value;
    if (JS_VALUE_GET_TAG(value) != JS_TAG_OBJECT ||
        JS_VALUE_GET_OBJ(value) != s->final->proto) return 0;
    JSObject *p = JS_VALUE_GET_OBJ(value);
    for (unsigned i = 0; i < g->depth; i++) {
        if (!p || p->class_id != JS_CLASS_OBJECT || p->is_exotic ||
            p->shape != g->chain[i] || !p->shape->is_hashed) return 0;
        p = p->shape->proto;
    }
    return p == NULL;
}
