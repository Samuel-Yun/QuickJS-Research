/* Only live-shape numeric identity is retained; deaths remove entries.
 * No JS reference is acquired, no dead function source/opcode history exists. */
/* VM code above forbids libc free via a macro. These diagnostic-only nodes
 * are allocated by libc calloc, not the VM allocator; pair them with libc free. */
#undef free
typedef struct SPBirth {void *ptr;uint64_t generation;struct SPBirth *next;} SPBirth;
static SPBirth *sp_live[4096];
static uint64_t sp_next_generation,sp_live_count,sp_peak_live,sp_birth_overflow;
static unsigned sp_hash(void *p){return ((uintptr_t)p>>4)&4095;}
static void sp_shape_death(void *p){unsigned h=sp_hash(p);SPBirth **e=&sp_live[h];while(*e){if((*e)->ptr==p){SPBirth *v=*e;*e=v->next;free(v);sp_live_count--;return;}e=&(*e)->next;}}
static void sp_shape_birth(void *p){
    unsigned h=sp_hash(p);sp_shape_death(p);
    if(sp_live_count>=65536){sp_birth_overflow++;return;}
    SPBirth *e=calloc(1,sizeof(*e));if(!e){sp_birth_overflow++;return;}
    *e=(SPBirth){p,++sp_next_generation,sp_live[h]};sp_live[h]=e;
    sp_live_count++;if(sp_live_count>sp_peak_live)sp_peak_live=sp_live_count;
}
static uint64_t sp_shape_id(void *p){for(SPBirth *e=sp_live[sp_hash(p)];e;e=e->next)if(e->ptr==p)return e->generation;return 0;}
typedef struct SPLayout {uint64_t id,count;unsigned hashed,class_id,exotic,prop_count,copied;int depth,index,flags;char names[32][40];unsigned flags_all[32];} SPLayout;
typedef struct SPFocus {unsigned used,seq_count;uint64_t unknown,overflow,last,transitions,seq[128];SPLayout layouts[128];} SPFocus;
static SPFocus sp_shapes[3];
static void sp_receiver(JSContext *ctx,JSValueConst v,JSAtom atom){
    if(sp_phase!=2||!audit_focus_active)return;
    unsigned k=0;while(k<3 && audit_focus_active!=&sp_sites[2][k])k++;if(k==3)abort();
    SPFocus *f=&sp_shapes[k];if(JS_VALUE_GET_TAG(v)!=JS_TAG_OBJECT){f->unknown++;return;}
    JSObject *p=JS_VALUE_GET_OBJ(v);JSShape *sh=p->shape;uint64_t id=sp_shape_id(&sh->header);
    if(!id){f->unknown++;return;}
    if(f->last!=id){if(f->last)f->transitions++;f->last=id;if(f->seq_count<128)f->seq[f->seq_count++]=id;}
    SPLayout *l=NULL;for(unsigned i=0;i<f->used;i++)if(f->layouts[i].id==id){l=&f->layouts[i];break;}
    if(!l){
        if(f->used==128){f->overflow++;return;}l=&f->layouts[f->used++];l->id=id;l->hashed=sh->is_hashed;l->class_id=p->class_id;l->exotic=p->is_exotic;l->prop_count=sh->prop_count;l->depth=l->index=l->flags=-1;
        AuditScope saved=audit_pause();
        for(unsigned i=0;i<sh->prop_count&&i<32;i++){
            JSShapeProperty *pr=&get_shape_prop(sh)[i];const char *name=JS_AtomToCString(ctx,pr->atom);
            if(!name)abort();snprintf(l->names[i],40,"%s",name);JS_FreeCString(ctx,name);l->flags_all[i]=pr->flags;l->copied++;
        }
        for(JSObject *o=p;o && l->depth<0;){
            unsigned depth=0;JSObject *a=p;while(a!=o && a){depth++;a=a->shape->proto;}
            for(unsigned i=0;i<o->shape->prop_count;i++)if(get_shape_prop(o->shape)[i].atom==atom){l->depth=depth;l->index=i;l->flags=get_shape_prop(o->shape)[i].flags;break;}
            if(o->is_exotic||depth>=8)break;o=o->shape->proto;
        }
        audit_end(&saved);
    }
    l->count++;
}
static void audit_register(JSContext *ctx,JSFunctionBytecode *b){
    if(!b->has_debug||b->debug.source_len!=sizeof(sp_target_source)-1||memcmp(b->debug.source,sp_target_source,sizeof(sp_target_source)-1))return;
    if(sp_focus_b==b)return;
    if(sp_focus_b||++sp_focus_instances>1)abort();sp_focus_b=b;
    for(unsigned k=0;k<3;k++){
        unsigned pos=0;while(pos<sp_pcs[k]){unsigned n=short_opcode_info(b->byte_code_buf[pos]).size;if(!n)abort();pos+=n;}
        if(pos!=sp_pcs[k]||pos+5>b->byte_code_len)abort();
        unsigned op=b->byte_code_buf[pos];JSAtom atom;
        if(op==OP_get_field||op==OP_get_field2)atom=get_u32(b->byte_code_buf+pos+1);
#if AUDIT_VARIANT == 1
        else if(op==OP_get_field_rdi||op==OP_get_field2_rdi){unsigned ix=get_u32(b->byte_code_buf+pos+1);if(ix>=b->read_ic_count)abort();atom=b->read_ic_sites[ix].atom;}
#endif
        else abort();
        const char *s=JS_AtomToCString(ctx,atom);if(!s||strcmp(s,k==2?"right":"key"))abort();JS_FreeCString(ctx,s);
    }
}
static void audit_free(JSFunctionBytecode *b){if(sp_focus_b==b)sp_focus_b=NULL;}
static AuditScope audit_begin(JSFunctionBytecode *b,const uint8_t *pc){
    AuditScope saved={audit_active,audit_focus_active};unsigned off=pc-b->byte_code_buf;unsigned op=*pc;
    audit_active=&sp_totals[sp_phase][op==OP_put_field];audit_focus_active=NULL;
    if(b==sp_focus_b)for(unsigned k=0;k<3;k++)if(off==sp_pcs[k])audit_focus_active=&sp_sites[sp_phase][k];
    SP_INC(operations);
#if AUDIT_VARIANT == 1
    if(op==OP_get_field_rdi||op==OP_get_field2_rdi)SP_INC(ic_queries);
#endif
    return saved;
}
static JSValue sp_stage(JSContext *ctx,JSValueConst self,int argc,JSValueConst *argv){int32_t n;if(argc!=1||JS_ToInt32(ctx,&n,argv[0])||n<0||n>5)return JS_ThrowTypeError(ctx,"stage");if(audit_active||audit_focus_active)abort();sp_phase=n;return JS_UNDEFINED;}
void sp_install(JSContext *ctx){JSValue g=JS_GetGlobalObject(ctx);if(JS_SetPropertyStr(ctx,g,"__spStage",JS_NewCFunction(ctx,sp_stage,"__spStage",1))<0)abort();JS_FreeValue(ctx,g);}
void sp_destroy(void){sp_phase=5;}
static void sp_counter_json(FILE *o,AuditSite *s){
    fprintf(o,"{");
#define F(name) fprintf(o,"\""#name"\":%llu,",(unsigned long long)s->name)
    F(operations);F(ic_queries);F(hits);F(misses);F(cache_probes);F(updates);F(insertions);F(replacements);F(same_shape_updates);F(find_normal);F(buckets);F(chain_probes);F(generic_get);F(value_int);F(value_object);F(value_other);F(retains);F(releases);
#undef F
    fprintf(o,"\"reasons\":[");for(unsigned i=0;i<8;i++)fprintf(o,"%s%llu",i?",":"",(unsigned long long)s->reasons[i]);fprintf(o,"]}");
}
void audit_report(void){
    const char *path=getenv("IC_MECHANISM_REPORT");if(!path)return;FILE *o=fopen(path,"wx");if(!o)abort();
    fprintf(o,"{\"schema\":\"bounded_splay_aggregate_v1\",\"variant\":%d,\"target_instances\":%u,\"live_shapes\":%llu,\"peak_live_shapes\":%llu,\"shape_birth_overflow\":%llu,\"phases\":[",AUDIT_VARIANT,sp_focus_instances,(unsigned long long)sp_live_count,(unsigned long long)sp_peak_live,(unsigned long long)sp_birth_overflow);
    for(unsigned p=0;p<6;p++){
        fprintf(o,"%s{\"phase\":%u,\"all_find\":%llu,\"outside_find\":%llu,\"reads\":",p?",":"",p,(unsigned long long)sp_all_find[p],(unsigned long long)sp_outside_find[p]);sp_counter_json(o,&sp_totals[p][0]);fprintf(o,",\"writes\":");sp_counter_json(o,&sp_totals[p][1]);fprintf(o,",\"sites\":[");
        for(unsigned k=0;k<3;k++){if(k)fprintf(o,",");sp_counter_json(o,&sp_sites[p][k]);}fprintf(o,"]}");
    }
    fprintf(o,"],\"shape_focus\":[");
    for(unsigned k=0;k<3;k++){
        SPFocus *f=&sp_shapes[k];fprintf(o,"%s{\"pc\":%u,\"unknown_events\":%llu,\"overflow_events\":%llu,\"transitions\":%llu,\"sequence_truncated\":%s,\"sequence\":[",k?",":"",sp_pcs[k],(unsigned long long)f->unknown,(unsigned long long)f->overflow,(unsigned long long)f->transitions,f->transitions+1>f->seq_count?"true":"false");
        for(unsigned i=0;i<f->seq_count;i++)fprintf(o,"%s%llu",i?",":"",(unsigned long long)f->seq[i]);fprintf(o,"],\"layouts\":[");
        for(unsigned i=0;i<f->used;i++){
            SPLayout *l=&f->layouts[i];fprintf(o,"%s{\"generation\":%llu,\"count\":%llu,\"hashed\":%u,\"class_id\":%u,\"exotic\":%u,\"prop_count\":%u,\"holder_depth\":%d,\"property_index\":%d,\"property_byte_offset\":%lld,\"property_flags\":%d,\"layout_truncated\":%s,\"layout\":[",i?",":"",(unsigned long long)l->id,(unsigned long long)l->count,l->hashed,l->class_id,l->exotic,l->prop_count,l->depth,l->index,(long long)l->index*sizeof(JSProperty),l->flags,l->copied<l->prop_count?"true":"false");
            for(unsigned j=0;j<l->copied;j++){fprintf(o,"%s{\"index\":%u,\"name_hex\":\"",j?",":"",j);for(unsigned c=0;c<strlen(l->names[j]);c++)fprintf(o,"%02x",(unsigned char)l->names[j][c]);fprintf(o,"\",\"flags\":%u}",l->flags_all[j]);}fprintf(o,"]}");
        }fprintf(o,"]}");
    }fprintf(o,"]}\n");if(fclose(o))abort();
}
