/* Independent counters only. No JS/shape references and no VM field changes. */
enum GoEvent {
    GO_logical_named,GO_rdi0_named,GO_rdi1_named,GO_legacy_named,GO_legacy_length,
    GO_fused_entries,GO_primary_hits,GO_fused_hits,GO_field_primary_hits,GO_prototype_primary_hits,
    GO_secondary_probes,GO_secondary_hits,GO_normal_lookups,GO_rdi_normal_lookups,GO_own_searches,
    GO_primary_updates,GO_registrations,GO_same_key_refreshes,GO_conflict_replacements,
    GO_invalidations,GO_cleared_entries,GO_runtime_shutdowns,GO_shutdown_entries,GO_EVENT_END
};
static const char *go_event_names[]={
    "logical_named","rdi0_named","rdi1_named","legacy_named","legacy_length",
    "fused_entries","primary_hits","fused_hits","field_primary_hits","prototype_primary_hits",
    "secondary_probes","secondary_hits","normal_lookups","rdi_normal_lookups","own_searches",
    "primary_updates","registrations","same_key_refreshes","conflict_replacements",
    "invalidations","cleared_entries","runtime_shutdowns","shutdown_entries"
};
static uint64_t go_shared_writes[3];
static uint64_t go_totals[GO_EVENT_END];
#define GO_COUNT(k) (++go_totals[GO_##k])
#define GO_ADD(k,n) (go_totals[GO_##k]+=(n))
typedef struct GoDiagSite {
    struct GoDiagSite *next,*all_next;
    JSFunctionBytecode *owner;
    ReadICSite *key;
    uint64_t counts[GO_EVENT_END];
    unsigned id,index,pc,trace_count;
    char function[160],filename[200],atom[96];
} GoDiagSite;
static GoDiagSite *go_diag_hash[16384],*go_diag_all;
static unsigned go_diag_serial;
static unsigned go_diag_bucket(ReadICSite *site){return ((uintptr_t)site>>3)&16383;}
static void go_diag_register(JSContext *ctx,JSFunctionBytecode *b,unsigned index,unsigned pc)
{
    GoDiagSite *r=calloc(1,sizeof(*r));if(!r)abort();
    r->owner=b;r->key=&b->read_ic_sites[index];r->index=index;r->pc=pc;r->id=++go_diag_serial;
    char tmp[256];
    snprintf(r->function,sizeof(r->function),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->func_name));
    snprintf(r->atom,sizeof(r->atom),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),r->key->atom));
    if(b->has_debug)snprintf(r->filename,sizeof(r->filename),"%s",JS_AtomGetStr(ctx,tmp,sizeof(tmp),b->debug.filename));
    unsigned h=go_diag_bucket(r->key);r->next=go_diag_hash[h];go_diag_hash[h]=r;
    r->all_next=go_diag_all;go_diag_all=r;
}
static GoDiagSite *go_diag_find(JSFunctionBytecode *b,ReadICSite *site)
{
    GoDiagSite *r=go_diag_hash[go_diag_bucket(site)];
    while(r && (r->owner!=b || r->key!=site))r=r->next;
    if(!r)abort();return r;
}
static void go_diag_event(JSFunctionBytecode *b,ReadICSite *site,unsigned event,int total)
{
    go_diag_find(b,site)->counts[event]++;if(total)go_totals[event]++;
}
#define GO_EVENT(k) go_diag_event(b,site,GO_##k,1)
#define GO_SITE(k) go_diag_event(b,site,GO_##k,0)
static void go_diag_trace(JSContext *ctx,JSFunctionBytecode *b,ReadICSite *site,JSValueConst receiver)
{
    GoDiagSite *r=go_diag_find(b,site);
    if(r->trace_count>=8 || strcmp(r->function,"readX") || JS_VALUE_GET_TAG(receiver)!=JS_TAG_OBJECT)return;
    JSObject *p=JS_VALUE_GET_OBJ(receiver);JSShape *sh=p->shape;r->trace_count++;
    fprintf(stderr,"GO_LAYOUT id=%u read=%u shape=%p hashed=%u class=%u exotic=%u cached=%p off=%u props=",
        r->id,r->trace_count,(void*)sh,sh->is_hashed,p->class_id,p->is_exotic,(void*)site->shape,site->prop_offset);
    for(unsigned i=0;i<sh->prop_count;i++){
        JSShapeProperty *d=&get_shape_prop(sh)[i];char tmp[96];
        fprintf(stderr,"%s%u:%s(flags=%u)",i?",":"",i,JS_AtomGetStr(ctx,tmp,sizeof(tmp),d->atom),d->flags);
    }
    fputc('\n',stderr);
}
#define GO_TRACE(value) go_diag_trace(ctx,b,site,value)
static void go_diag_detach(JSFunctionBytecode *b)
{
    for(unsigned i=0;i<b->read_ic_count;i++){
        ReadICSite *site=&b->read_ic_sites[i];GoDiagSite **p=&go_diag_hash[go_diag_bucket(site)];
        while(*p && ((*p)->owner!=b || (*p)->key!=site))p=&(*p)->next;
        if(*p)*p=(*p)->next;
    }
}
static void go_diag_string(FILE *out,const char *s)
{
    fputc('"',out);
    for(const unsigned char *p=(const unsigned char*)s;*p;p++){
        if(*p=='"' || *p=='\\')fputc('\\',out);
        if(*p<32)fprintf(out,"\\u%04x",*p);else fputc(*p,out);
    }
    fputc('"',out);
}
static void go_diag_numbers(FILE *out,uint64_t *counts)
{
    fputc('{',out);
    for(unsigned i=0;i<GO_EVENT_END;i++)fprintf(out,"%s\"%s\":%" PRIu64,i?",":"",go_event_names[i],counts[i]);
    fputc('}',out);
}
static void __attribute__((destructor)) go_diag_report(void)
{
    const char *path=getenv("GO_OUTPUT");if(!path)return;
    FILE *out=fopen(path,"w");if(!out)return;
    fputs("{\"totals\":",out);go_diag_numbers(out,go_totals);
    fprintf(out,",\"shared_write\":{\"attempts\":%" PRIu64 ",\"hits\":%" PRIu64 ",\"fallbacks\":%" PRIu64 "}",
        go_shared_writes[0],go_shared_writes[1],go_shared_writes[2]);
    fprintf(out,",\"layout\":{\"JSRuntime\":%zu,\"JSShape\":%zu,\"JSObject\":%zu,\"ReadICSite\":%zu",
        sizeof(JSRuntime),sizeof(JSShape),sizeof(JSObject),sizeof(ReadICSite));
#ifdef GLOBAL_OWN_CACHE
    fprintf(out,",\"entry\":%zu,\"table\":%zu,\"head_offset\":%zu,\"hash_offset\":%zu,\"runtime_table_offset\":%zu",
        sizeof(GlobalOwnEntry),sizeof(((JSRuntime*)0)->global_own_offsets),offsetof(JSShape,own_cache_head),
        offsetof(JSShape,hash),offsetof(JSRuntime,global_own_offsets));
#endif
    fputs("},\"sites\":[",out);unsigned printed=0;
    for(GoDiagSite *r=go_diag_all;r;){
        if(printed++)fputc(',',out);
        fprintf(out,"{\"id\":%u,\"index\":%u,\"pc\":%u,\"function\":",r->id,r->index,r->pc);
        go_diag_string(out,r->function);fputs(",\"filename\":",out);go_diag_string(out,r->filename);
        fputs(",\"atom\":",out);go_diag_string(out,r->atom);fputs(",\"counts\":",out);go_diag_numbers(out,r->counts);fputc('}',out);
        GoDiagSite *old=r;r=r->all_next;(free)(old);
    }
    fputs("]}\n",out);fclose(out);
}
