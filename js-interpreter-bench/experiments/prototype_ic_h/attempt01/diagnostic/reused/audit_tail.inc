static char *audit_atom(JSContext *ctx,JSAtom atom) {
    const char *s=JS_AtomToCString(ctx,atom);if(!s)abort();
    char *copy=strdup(s);if(!copy)abort();JS_FreeCString(ctx,s);return copy;
}
static AuditFunction *audit_function(JSFunctionBytecode *b) {
    for(AuditFunction *f=audit_functions;f;f=f->next)if(!f->freed && f->b==b)return f;
    return NULL;
}
static void audit_register(JSContext *ctx,JSFunctionBytecode *b) {
    if(audit_function(b))return;
    AuditSite *saved=audit_active;audit_active=NULL;
    AuditFunction *f=calloc(1,sizeof(*f));if(!f)abort();
    f->b=b;f->id=++audit_next_id;f->length=b->byte_code_len;f->name=audit_atom(ctx,b->func_name);
    f->before=calloc(1,f->length);f->after=calloc(1,f->length);f->sites=calloc(f->length,sizeof(*f->sites));
    if(!f->before||!f->after||!f->sites)abort();
    memcpy(f->before,b->byte_code_buf,f->length);
    if(b->has_debug && b->debug.source && b->debug.source_len>0){
        f->source_len=b->debug.source_len;f->source=calloc(1,f->source_len);if(!f->source)abort();memcpy(f->source,b->debug.source,f->source_len);
    }
    for(unsigned pc=0;pc<f->length;){
        unsigned op=f->before[pc],fmt=short_opcode_info(op).fmt;JSAtom atom=JS_ATOM_NULL;
        unsigned size=short_opcode_info(op).size;if(!size||pc+size>f->length)abort();
        f->sites[pc].pc=pc;
        if(fmt==OP_FMT_atom||fmt==OP_FMT_atom_u8||fmt==OP_FMT_atom_u16||fmt==OP_FMT_atom_label_u8||fmt==OP_FMT_atom_label_u16)atom=get_u32(f->before+pc+1);
#if AUDIT_VARIANT == 1
        if(op==OP_get_field_rdi||op==OP_get_field2_rdi)atom=b->read_ic_sites[get_u32(f->before+pc+1)].atom;
#elif AUDIT_VARIANT == 2
        if(op==OP_get_field_ic||op==OP_get_field2_ic||op==OP_put_field_ic)atom=get_ic_atom(b->ic,get_u32(f->before+pc+1));
#endif
        if(atom!=JS_ATOM_NULL)f->sites[pc].atom=audit_atom(ctx,atom);
        pc+=size;
    }
    f->next=audit_functions;audit_functions=f;audit_active=saved;
}
static void audit_free(JSFunctionBytecode *b) {
    AuditFunction *f=audit_function(b);if(!f)return;
    if(f->length!=b->byte_code_len)abort();
    memcpy(f->after,b->byte_code_buf,f->length);f->freed=1;
}
static AuditScope audit_begin(JSFunctionBytecode *b,const uint8_t *pc) {
    AuditScope saved={audit_active};AuditFunction *f=audit_function(b);
    if(!f || pc<b->byte_code_buf || (unsigned)(pc-b->byte_code_buf)>=f->length){audit_active=NULL;return saved;}
    unsigned offset=pc-b->byte_code_buf;AuditSite *s=&f->sites[offset];s->operations++;audit_active=s;
#if AUDIT_VARIANT == 1
    if(*pc==OP_get_field_rdi||*pc==OP_get_field2_rdi)s->ic_queries++;
#elif AUDIT_VARIANT == 2
    if(*pc==OP_get_field_ic||*pc==OP_get_field2_ic||*pc==OP_put_field_ic)s->ic_queries++;
#endif
    return saved;
}
static void audit_hex(FILE *out,const void *data,size_t n) {
    const unsigned char *p=data;for(size_t i=0;i<n;i++)fprintf(out,"%02x",p[i]);
}
void audit_report(void) {
    const char *path=getenv("IC_MECHANISM_REPORT");if(!path)return;
    FILE *out=fopen(path,"wx");if(!out)abort();
    fprintf(out,"{\"variant\":%u,\"scope\":\"whole diagnostic process, no performance inference\",\"functions\":[",AUDIT_VARIANT);
    for(AuditFunction *f=audit_functions;f;f=f->next){
        if(!f->freed){memcpy(f->after,f->b->byte_code_buf,f->length);}
        fprintf(out,"{\"instance_id\":%u,\"freed\":%u,\"function_hex\":\"",f->id,f->freed);audit_hex(out,f->name,strlen(f->name));
        fprintf(out,"\",\"source_hex\":\"");audit_hex(out,f->source,f->source_len);
        fprintf(out,"\",\"code_before_hex\":\"");audit_hex(out,f->before,f->length);
        fprintf(out,"\",\"code_after_hex\":\"");audit_hex(out,f->after,f->length);
        fprintf(out,"\",\"opcodes\":[");
        unsigned first=1;
        for(unsigned pc=0;pc<f->length;){
            unsigned op=f->before[pc],size=short_opcode_info(op).size,after=f->after[pc];AuditSite *s=&f->sites[pc];
            if(!first)fprintf(out,",");
            first=0;
            const char *opname=short_opcode_info(op).name;
            int tracked=(strstr(opname,"get_field")||strstr(opname,"put_field")||!strcmp(opname,"get_length"))!=0;
            int readstats=strstr(opname,"get_field")!=NULL;
            fprintf(out,"{\"pc\":%u,\"size\":%u,\"before_op\":\"%s\",\"after_op\":\"%s\",\"operations_instrumented\":%s,\"ic_read_stats_instrumented\":%s,\"before_id\":%u,\"after_id\":%u,\"operand_before\":%u,\"operand_after\":%u,\"atom_hex\":\"",pc,size,opname,short_opcode_info(after).name,tracked?"true":"false",readstats?"true":"false",op,after,size>=5?get_u32(f->before+pc+1):0,size>=5?get_u32(f->after+pc+1):0);
            if(s->atom)audit_hex(out,s->atom,strlen(s->atom));
            fprintf(out,"\",\"operations\":%llu,\"ic_queries\":%llu,\"hits\":%llu,\"misses\":%llu,\"cache_probes\":%llu,\"updates\":%llu,\"insertions\":%llu,\"replacements\":%llu,\"same_shape_updates\":%llu,\"find_normal\":%llu,\"find_with_offset\":%llu,\"bucket_loads\":%llu,\"chain_probes\":%llu,\"generic_get\":%llu,\"value_int\":%llu,\"value_object\":%llu,\"value_other\":%llu}",
                s->operations,s->ic_queries,s->hits,s->misses,s->cache_probes,s->updates,s->insertions,s->replacements,s->same_shape_updates,s->find_normal,s->find_with_offset,s->buckets,s->chain_probes,s->generic_get,s->value_int,s->value_object,s->value_other);
            pc+=size;
        }
        fprintf(out,"]}%s",f->next?",":"");
    }
    fprintf(out,"]}\n");fclose(out);
}
