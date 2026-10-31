/* Independent aggregate diagnostic; never included in a formal runtime. */
typedef struct AuditSite {
    unsigned long long operations,ic_queries,hits,misses,cache_probes;
    unsigned long long updates,insertions,replacements,same_shape_updates;
    unsigned long long find_normal,find_with_offset,buckets,chain_probes,generic_get;
    unsigned long long value_int,value_object,value_other;
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
