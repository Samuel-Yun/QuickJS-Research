/* Diagnostic observation only: no allocation, refcount or shape mutation. */
static void admission_found(JSObject *receiver, JSObject *holder,
                            JSShapeProperty *property, unsigned depth)
{
    AuditSite *s = audit_active;
    unsigned mask, reason;
    if (!s) return;
    mask = (receiver->class_id == JS_CLASS_OBJECT && !receiver->is_exotic ? 1 : 0)
         | (holder->class_id == JS_CLASS_OBJECT && !holder->is_exotic ? 2 : 0)
         | (depth == 1 ? 4 : 0)
         | (!(property->flags & JS_PROP_TMASK) ? 8 : 0)
         | (receiver->shape->is_hashed ? 16 : 0)
         | (holder->shape->is_hashed ? 32 : 0);
    s->admission_found++;
    s->admission_mask[mask]++;
    s->admission_depth[depth < 3 ? depth : 3]++;
    if (!(mask & 1)) reason = 1;
    else if (!(mask & 4)) reason = 2;
    else if (!(mask & 2)) reason = 3;
    else if (!(mask & 8)) reason = 4;
    else if (!(mask & 16)) reason = 5;
    else if (!(mask & 32)) reason = 6;
    else { reason = 0; s->admission_eligible++; }
    s->admission_reason[reason]++;
}

static void admission_json(FILE *out, AuditSite *s)
{
    fprintf(out, ",\"admission\":{\"found\":%llu,\"eligible\":%llu,\"first_reason\":[",
            s->admission_found, s->admission_eligible);
    for (unsigned i = 0; i < 7; i++)
        fprintf(out, "%s%llu", i ? "," : "", s->admission_reason[i]);
    fprintf(out, "],\"mask_counts\":[");
    for (unsigned i = 0; i < 64; i++)
        fprintf(out, "%s%llu", i ? "," : "", s->admission_mask[i]);
    fprintf(out, "],\"depth_counts\":[");
    for (unsigned i = 0; i < 4; i++)
        fprintf(out, "%s%llu", i ? "," : "", s->admission_depth[i]);
    fprintf(out, "]}");
}
