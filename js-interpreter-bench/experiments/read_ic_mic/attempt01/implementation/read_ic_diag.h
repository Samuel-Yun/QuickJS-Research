/* Diagnostic only, no field in formal ReadICSite. Counters identical for M/P. */
typedef struct RDICounters {
    unsigned long long queries,hits,fallback,comparisons,shape_misses;
    unsigned long long updates,update_comparisons,insertions,replacements;
    unsigned long long own_miss,descriptor,special,unhashed,inherited,missing,primitive;
    unsigned occupied,max_occupied,pc,op;
    char *atom;
} RDICounters;
typedef struct RDIAtomMap { unsigned pc; char *name; } RDIAtomMap;
typedef struct RDISource {
    struct RDISource *next,*hash_next;
    uint64_t hash,id;
    size_t length;
    char bytes[];
} RDISource;
struct RDIFunctionDiag {
    struct RDIFunctionDiag *next;
    unsigned long long id,source_id;
    unsigned site_count,bc_len,atom_count;
    unsigned freed;
    char *name,*filename;
    uint8_t *code;
    RDIAtomMap *atoms;
    RDICounters sites[];
};
static RDIFunctionDiag *rdi_diag_head;
static RDISource *rdi_sources,*rdi_source_hash[1024];
static uint64_t rdi_source_id;
static unsigned long long rdi_diag_functions,rdi_diag_functions_live,rdi_diag_sites,rdi_diag_used;
static unsigned long long rdi_diag_requested,rdi_diag_live,rdi_diag_peak;
static unsigned long long rdi_diag_shape_ref,rdi_diag_shape_unref,rdi_diag_shape_live,rdi_diag_shape_peak;
static void rdi_diag_add_bytes(size_t n) {
    rdi_diag_requested+=n;rdi_diag_live+=n;
    if(rdi_diag_live>rdi_diag_peak)rdi_diag_peak=rdi_diag_live;
}
static void rdi_diag_header_init(void) {
    rdi_diag_functions++;rdi_diag_functions_live++;
    rdi_diag_add_bytes(16); /* audited x64 formal added function header component */
}
static void rdi_diag_query(RDICounters *d) {
    if(!d->queries)rdi_diag_used++;
    d->queries++;
}
static void rdi_diag_occupy(RDICounters *d) {
    d->insertions++;d->occupied++;
    if(d->occupied>d->max_occupied)d->max_occupied=d->occupied;
    rdi_diag_shape_ref++;rdi_diag_shape_live++;
    if(rdi_diag_shape_live>rdi_diag_shape_peak)rdi_diag_shape_peak=rdi_diag_shape_live;
}
static void rdi_diag_release(JSFunctionBytecode *b) {
    if(!b->read_ic_ready)return;
    assert(rdi_diag_functions_live && rdi_diag_live>=16);
    rdi_diag_functions_live--;rdi_diag_live-=16;
    if(b->read_ic_diag) {
        RDIFunctionDiag *f=b->read_ic_diag;f->freed=1;
        for(unsigned i=0;i<f->site_count;i++) {
            unsigned n=f->sites[i].occupied;
            rdi_diag_shape_unref+=n;assert(rdi_diag_shape_live>=n);rdi_diag_shape_live-=n;
            f->sites[i].occupied=0;
        }
        size_t bytes=b->read_ic_count*sizeof(ReadICSite);
        assert(rdi_diag_live>=bytes);rdi_diag_live-=bytes;
    }
}
static char *rdi_diag_atom(JSContext *ctx,JSAtom atom) {
    const char *s=JS_AtomToCString(ctx,atom);if(!s)abort();
    char *copy=strdup(s);if(!copy)abort();JS_FreeCString(ctx,s);return copy;
}
static uint64_t rdi_diag_source(JSFunctionBytecode *b) {
    if(!b->has_debug || !b->debug.source || b->debug.source_len<=0)return 0;
    const unsigned char *p=(const unsigned char*)b->debug.source;size_t n=b->debug.source_len;
    uint64_t h=UINT64_C(14695981039346656037);
    for(size_t i=0;i<n;i++){h^=p[i];h*=UINT64_C(1099511628211);}
    unsigned bucket=h&1023;RDISource *s;
    for(s=rdi_source_hash[bucket];s;s=s->hash_next)
        if(s->hash==h && s->length==n && !memcmp(s->bytes,p,n))return s->id;
    s=calloc(1,sizeof(*s)+n);if(!s)abort();memcpy(s->bytes,p,n);
    s->length=n;s->hash=h;s->id=++rdi_source_id;s->hash_next=rdi_source_hash[bucket];rdi_source_hash[bucket]=s;
    s->next=rdi_sources;rdi_sources=s;return s->id;
}
static void rdi_hex(FILE *out,const void *data,size_t n) {
    const unsigned char *p=data;for(size_t i=0;i<n;i++)fprintf(out,"%02x",p[i]);
}
void read_ic_report(void) {
    const char *path=getenv("READ_IC_REPORT");if(!path)return;
    FILE *out=fopen(path,"wx");if(!out)abort();
    fprintf(out,"{\"capacity\":%u,\"site_bytes\":%zu,\"site_alignment\":%zu,\"formal_header_extra_bytes\":16,"
      "\"finalized_functions\":%llu,\"functions_live_after_free\":%llu,\"sites_created\":%llu,\"sites_used\":%llu,"
      "\"requested_direct_bytes\":%llu,\"peak_live_direct_bytes\":%llu,\"live_direct_after_free\":%llu,"
      "\"shape_ref_increments\":%llu,\"shape_ref_decrements\":%llu,\"shape_refs_peak\":%llu,\"shape_refs_after_free\":%llu,\"sources\":[",
      RDI_CAPACITY,sizeof(ReadICSite),_Alignof(ReadICSite),rdi_diag_functions,rdi_diag_functions_live,rdi_diag_sites,rdi_diag_used,
      rdi_diag_requested,rdi_diag_peak,rdi_diag_live,rdi_diag_shape_ref,rdi_diag_shape_unref,rdi_diag_shape_peak,rdi_diag_shape_live);
    for(RDISource *s=rdi_sources;s;s=s->next) {
        fprintf(out,"{\"source_id\":%llu,\"source_hex\":\"",(unsigned long long)s->id);rdi_hex(out,s->bytes,s->length);
        fprintf(out,"\"}%s",s->next?",":"");
    }
    fprintf(out,"],\"functions\":[");
    for(RDIFunctionDiag *f=rdi_diag_head;f;f=f->next) {
        fprintf(out,"{\"instance_id\":%llu,\"source_id\":%llu,\"freed\":%u,\"function_hex\":\"",f->id,f->source_id,f->freed);
        rdi_hex(out,f->name,strlen(f->name));fprintf(out,"\",\"filename_hex\":\"");rdi_hex(out,f->filename,strlen(f->filename));
        fprintf(out,"\",\"bytecode_zero_atoms_hex\":\"");rdi_hex(out,f->code,f->bc_len);
        fprintf(out,"\",\"atoms\":[");
        for(unsigned i=0;i<f->atom_count;i++) {
            fprintf(out,"{\"pc\":%u,\"atom_hex\":\"",f->atoms[i].pc);rdi_hex(out,f->atoms[i].name,strlen(f->atoms[i].name));
            fprintf(out,"\"}%s",i+1<f->atom_count?",":"");
        }
        fprintf(out,"],\"sites\":[");
        for(unsigned i=0;i<f->site_count;i++) {
            RDICounters *d=&f->sites[i];
            fprintf(out,"{\"index\":%u,\"pc\":%u,\"opcode\":\"%s\",\"atom_hex\":\"",i,d->pc,d->op==OP_get_field?"get_field":"get_field2");rdi_hex(out,d->atom,strlen(d->atom));
            fprintf(out,"\",\"queries\":%llu,\"hits\":%llu,\"fallback\":%llu,\"comparisons\":%llu,\"shape_misses\":%llu,"
              "\"updates\":%llu,\"update_comparisons\":%llu,\"insertions\":%llu,\"replacements\":%llu,\"max_occupied\":%u,"
              "\"own_miss\":%llu,\"descriptor\":%llu,\"special\":%llu,\"unhashed\":%llu,\"inherited\":%llu,\"missing\":%llu,\"primitive\":%llu}%s",
              d->queries,d->hits,d->fallback,d->comparisons,d->shape_misses,d->updates,d->update_comparisons,d->insertions,d->replacements,d->max_occupied,
              d->own_miss,d->descriptor,d->special,d->unhashed,d->inherited,d->missing,d->primitive,i+1<f->site_count?",":"");
        }
        fprintf(out,"]}%s",f->next?",":"");
    }
    fprintf(out,"]}\n");fclose(out);
}
