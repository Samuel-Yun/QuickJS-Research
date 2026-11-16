/* Independent aggregate diagnostic; never included in a formal runtime. */
typedef struct AuditSite {
    unsigned long long operations,ic_queries,hits,misses,cache_probes;
    unsigned long long updates,insertions,replacements,same_shape_updates;
    unsigned long long find_normal,find_with_offset,buckets,chain_probes,generic_get;
    unsigned long long value_int,value_object,value_other;
    unsigned long long admission_found,admission_eligible;
    unsigned long long admission_reason[7],admission_mask[64],admission_depth[4];
    unsigned long long h_own_hits,h_proto_hits,h_receiver_misses,h_holder_misses,h_own_fills,h_proto_fills;
    char *atom;
    unsigned pc;
} AuditSite;
typedef struct AuditFunction {
    struct AuditFunction *next;
    JSFunctionBytecode *b;
    unsigned id,length,freed;
    char *name,*source;
    size_t source_len;
    uint8_t *before,*after;
    AuditSite *sites;
} AuditFunction;
typedef struct AuditScope { AuditSite *previous; } AuditScope;
static AuditFunction *audit_functions;
static _Thread_local AuditSite *audit_active;
static unsigned audit_next_id;
static void audit_register(JSContext *ctx,JSFunctionBytecode *b);
static void audit_free(JSFunctionBytecode *b);
static AuditScope audit_begin(JSFunctionBytecode *b,const uint8_t *pc);
static AuditScope audit_pause(void) { AuditScope s={audit_active};audit_active=NULL;return s; }
static void audit_end(AuditScope *s) { audit_active=s->previous; }
static void audit_lookup(int kind) { if(audit_active){if(kind)audit_active->find_with_offset++;else audit_active->find_normal++;} }
static void audit_bucket(void) { if(audit_active)audit_active->buckets++; }
static void audit_chain(void) { if(audit_active)audit_active->chain_probes++; }
static void audit_probe(void) { if(audit_active)audit_active->cache_probes++; }
static void audit_hit(void) { if(audit_active)audit_active->hits++; }
static void audit_miss(void) { if(audit_active)audit_active->misses++; }
static void audit_generic(void) { if(audit_active)audit_active->generic_get++; }
static void audit_change(int k) {
    if(!audit_active)return;
    if(k==0)audit_active->updates++;
    else if(k==1)audit_active->insertions++;
    else if(k==2)audit_active->replacements++;
    else audit_active->same_shape_updates++;
}
static void audit_value(JSValueConst v) {
    if(!audit_active)return;
    if(JS_VALUE_GET_TAG(v)==JS_TAG_INT)audit_active->value_int++;
    else if(JS_VALUE_GET_TAG(v)==JS_TAG_OBJECT)audit_active->value_object++;
    else audit_active->value_other++;
}
#define AUDIT_SCOPE(b,pc) AuditScope audit_local __attribute__((cleanup(audit_end)))=audit_begin((b),(pc))

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

/* Independent diagnostic counters, not present in H release. */
static unsigned long long h_created_functions,h_created_sites,h_used_sites;
static unsigned long long h_requested_bytes,h_live_bytes,h_peak_bytes;
static unsigned long long h_shape_retains,h_shape_releases;
static void hdiag_alloc(unsigned n) {
    if (!n) return;
    h_created_functions++;h_created_sites+=n;
    h_requested_bytes+=(unsigned long long)n*sizeof(ReadICSite);
    h_live_bytes+=(unsigned long long)n*sizeof(ReadICSite);
    if(h_live_bytes>h_peak_bytes)h_peak_bytes=h_live_bytes;
}
static void hdiag_free(unsigned n) {
    assert(h_live_bytes >= (unsigned long long)n*sizeof(ReadICSite));
    h_live_bytes-=(unsigned long long)n*sizeof(ReadICSite);
}
static void hdiag_retain(JSShape *s) {if(s)h_shape_retains++;}
static void hdiag_release(JSShape *s) {if(s)h_shape_releases++;}
static void hdiag_hit(int inherited) {
    if(!audit_active)return;
    if(inherited)audit_active->h_proto_hits++;else audit_active->h_own_hits++;
}
static void hdiag_receiver_miss(void) {if(audit_active)audit_active->h_receiver_misses++;}
static void hdiag_holder_miss(void) {if(audit_active)audit_active->h_holder_misses++;}
static void hdiag_fill(int inherited,int replacement) {
    if(!replacement)h_used_sites++;
    if(!audit_active)return;
    if(inherited)audit_active->h_proto_fills++;else audit_active->h_own_fills++;
}
static void hsite_json(FILE *out,AuditSite *s) {
    fprintf(out,",\"h_own_hits\":%llu,\"h_proto_hits\":%llu,\"h_receiver_misses\":%llu,\"h_holder_misses\":%llu,\"h_own_fills\":%llu,\"h_proto_fills\":%llu",
      s->h_own_hits,s->h_proto_hits,s->h_receiver_misses,s->h_holder_misses,s->h_own_fills,s->h_proto_fills);
}
static void hglobal_json(FILE *out) {
    fprintf(out,",\"cache_lifecycle\":{\"site_sizeof\":%zu,\"created_functions\":%llu,\"created_sites\":%llu,\"used_sites\":%llu,\"requested_bytes_total\":%llu,\"peak_requested_live_bytes\":%llu,\"final_requested_live_bytes\":%llu,\"shape_retains\":%llu,\"shape_releases\":%llu}",
      sizeof(ReadICSite),h_created_functions,h_created_sites,h_used_sites,h_requested_bytes,h_peak_bytes,h_live_bytes,h_shape_retains,h_shape_releases);
}
