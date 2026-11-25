/* Diagnostic build only. No reference to this file remains in Release. */
enum {
    VON_logical_reads, VON_fused_entries, VON_fused_hits, VON_field_entries,
    VON_shape_hits, VON_verify_attempts, VON_verify_successes, VON_normal_lookups,
    VON_own_searches, VON_updates, VON_END
};
typedef struct VonRecord {
    struct VonRecord *next, *all_next;
    ReadICSite *key;
    JSFunctionBytecode *owner;
    uint64_t counts[VON_END];
    char function[160], atom[96];
    unsigned index, pc, trace_count;
} VonRecord;
static VonRecord *von_hash[16384], *von_all;
static size_t von_bucket(ReadICSite *s) { return ((uintptr_t)s >> 3) & 16383; }
static void von_register(JSContext *ctx, JSFunctionBytecode *b, unsigned i, unsigned pc)
{
        ReadICSite *s=&b->read_ic_sites[i];
        VonRecord *r=calloc(1,sizeof(*r));
        if(!r) abort();
        r->key=s;r->owner=b;r->index=i;r->pc=pc;
        char text[256];
        snprintf(r->function,sizeof(r->function),"%s",JS_AtomGetStr(ctx,text,sizeof(text),b->func_name));
        snprintf(r->atom,sizeof(r->atom),"%s",JS_AtomGetStr(ctx,text,sizeof(text),s->atom));
        size_t k=von_bucket(s);r->next=von_hash[k];von_hash[k]=r;
        r->all_next=von_all;von_all=r;
}
static void von_event(JSContext *ctx, JSFunctionBytecode *b, ReadICSite *s, unsigned event, JSValueConst receiver)
{
    VonRecord *r=von_hash[von_bucket(s)];
    while(r && (r->key!=s || r->owner!=b))r=r->next;
    if(!r)abort();
    r->counts[event]++;
    if(event==VON_logical_reads && r->trace_count<8 &&
       (!strcmp(r->function,"readX") || !strcmp(r->function,"readPlain"))) {
        r->trace_count++;
        if(JS_VALUE_GET_TAG(receiver)==JS_TAG_OBJECT) {
            JSObject *o=JS_VALUE_GET_OBJ(receiver);JSShape *sh=o->shape;
            fprintf(stderr,"VON_LAYOUT function=%s read=%u object=%p shape=%p hashed=%u class=%u exotic=%u cached=%p holder=%p off=%u props=",
                r->function,r->trace_count,(void*)o,(void*)sh,sh->is_hashed,o->class_id,o->is_exotic,
                (void*)s->shape,(void*)s->holder_shape,s->prop_offset);
            for(unsigned i=0;i<sh->prop_count;i++) {
                char a[96];JSShapeProperty *d=&get_shape_prop(sh)[i];
                const char *atom=JS_AtomGetStr(ctx,a,sizeof(a),d->atom);
                fprintf(stderr,"%s%u:%s(flags=%u)",i?",":"",i,atom,d->flags);
            }
            fputc('\n',stderr);
        }
    }
}
static void von_detach(JSFunctionBytecode *b)
{
    for(unsigned i=0;i<b->read_ic_count;i++) {
        ReadICSite *s=&b->read_ic_sites[i];VonRecord **r=&von_hash[von_bucket(s)];
        while(*r && ((*r)->key!=s || (*r)->owner!=b))r=&(*r)->next;
        if(*r)*r=(*r)->next;
    }
}
static void von_json_string(FILE *out,const char *s)
{
    fputc('"',out);
    for(const unsigned char *p=(const unsigned char*)s;*p;p++) {
        if(*p=='"' || *p=='\\')fputc('\\',out);
        if(*p<32)fprintf(out,"\\u%04x",*p);else fputc(*p,out);
    }
    fputc('"',out);
}
static void __attribute__((destructor)) von_report(void)
{
    const char *path=getenv("VON_OUTPUT");
    FILE *out=path?fopen(path,"w"):NULL;
    if(!out)return;
    const char *keys[]={"logical_reads","fused_entries","fused_hits","field_entries","shape_hits",
        "verify_attempts","verify_successes","normal_lookups","own_searches","updates"};
    VonRecord *r=von_all;
    while(r) {
        fprintf(out,"{\"function\":");von_json_string(out,r->function);
        fprintf(out,",\"atom\":");von_json_string(out,r->atom);
        fprintf(out,",\"site\":%u,\"pc\":%u",r->index,r->pc);
        for(unsigned i=0;i<VON_END;i++)fprintf(out,",\"%s\":%" PRIu64,keys[i],r->counts[i]);
        fputs("}\n",out);VonRecord *old=r;r=r->all_next;(free)(old);
    }
    fclose(out);
}
