/* Independent diagnostic only. No second JS property read, getter invocation,
 * object/shape root, or cache decision here. Metadata owns only atom strings.
 * Per-site IDs distinguish live compiled instances; forget before b is freed.
 */
#pragma push_macro("free")
#undef free
typedef struct B3Site {
    ReadICSite *site;
    JSFunctionBytecode *bytecode;
    unsigned id,index;
    int keep;
    char *atom,*function;
    uint64_t q,h,f,lookups,own_lookups,direct_data,own_data,other;
    uint64_t rx_hashed,holder_hashed,promotion_possible;
    uint64_t receiver_changes,holder_changes;
    uintptr_t last_rx,last_holder;
    int first_offset,last_offset,first_holder_count,first_holder_deleted,first_holder_ref;
    unsigned first_flags;
    struct B3Site *next,*all;
} B3Site;
static B3Site *b3_buckets[4096],*b3_all;
static unsigned b3_next_id;
static int b3_active;
static uint64_t b3_promotions,b3_lifetime_promotions;
static char *b3_atom_text(JSContext *ctx,JSAtom atom)
{
    const char *p=JS_AtomToCString(ctx,atom);assert(p);
    char *s=strdup(p);JS_FreeCString(ctx,p);assert(s);return s;
}
static B3Site *b3_query(JSContext *ctx,JSFunctionBytecode *b,ReadICSite *site,JSValueConst value,int keep)
{
    if(!b3_active || JS_VALUE_GET_TAG(value)!=JS_TAG_OBJECT || JS_VALUE_GET_OBJ(value)->class_id!=JS_CLASS_REGEXP)return NULL;
    unsigned key=((uintptr_t)site>>3)&4095;
    B3Site *s;
    for(s=b3_buckets[key];s;s=s->next)if(s->site==site)break;
    if(!s){
        s=calloc(1,sizeof(*s));assert(s);s->site=site;s->bytecode=b;s->id=b3_next_id++;s->index=site-b->read_ic_sites;s->keep=keep;
        s->atom=b3_atom_text(ctx,site->atom);s->function=b3_atom_text(ctx,b->func_name);
        s->first_offset=s->last_offset=-1;
        s->next=b3_buckets[key];b3_buckets[key]=s;s->all=b3_all;b3_all=s;
    }
    JSObject *o=JS_VALUE_GET_OBJ(value),*holder=o->shape->proto;
    uintptr_t rx=(uintptr_t)o->shape,h=holder?(uintptr_t)holder->shape:0;
    if(s->q){s->receiver_changes+=rx!=s->last_rx;s->holder_changes+=h!=s->last_holder;}
    s->last_rx=rx;s->last_holder=h;s->q++;
    return s;
}
static void b3_fallback(B3Site *s){if(s)s->f++;}
static void b3_hit(B3Site *s){if(s)s->h++;}
static void b3_lookup(B3Site *s,int own){if(s){s->lookups++;s->own_lookups+=own;}}
static void b3_found(B3Site *s,JSObject *origin,JSObject *p,JSProperty *pr,JSShapeProperty *desc)
{
    if(!s)return;
    if(desc->flags&JS_PROP_TMASK){s->other++;return;}
    if(p==origin){s->own_data++;return;}
    if(p!=origin->shape->proto || p->class_id!=JS_CLASS_OBJECT || p->is_exotic || origin->is_exotic){s->other++;return;}
    s->direct_data++;
    s->rx_hashed+=origin->shape->is_hashed;
    s->holder_hashed+=p->shape->is_hashed;
    s->promotion_possible+=!p->shape->is_hashed && js_rc(p->shape)->ref_count==1 && !p->shape->deleted_prop_count;
    if(s->first_offset<0){
        s->first_offset=pr-p->prop;s->first_flags=desc->flags;
        s->first_holder_count=p->shape->prop_count;s->first_holder_deleted=p->shape->deleted_prop_count;s->first_holder_ref=js_rc(p->shape)->ref_count;
    }
    s->last_offset=pr-p->prop;
}
static void b3_forget(JSFunctionBytecode *b)
{
    for(uint32_t i=0;i<b->read_ic_count;i++){
        ReadICSite *site=&b->read_ic_sites[i];unsigned key=((uintptr_t)site>>3)&4095;B3Site **p=&b3_buckets[key];
        while(*p){if((*p)->site==site){*p=(*p)->next;break;}p=&(*p)->next;}
    }
}
static void b3_promote(void){b3_lifetime_promotions++;if(b3_active)b3_promotions++;}
static void b3_string(const char *s)
{
    fputc('"',stderr);for(const unsigned char *p=(const unsigned char *)s;*p;p++){
        if(*p=='"'||*p=='\\'){fputc('\\',stderr);fputc(*p,stderr);}
        else if(*p<32)fprintf(stderr,"\\u%04x",*p);else fputc(*p,stderr);
    }fputc('"',stderr);
}
void b3_begin(void)
{
    assert(!b3_all);b3_active=1;b3_promotions=0;
}
void b3_end(void)
{
    b3_active=0;
    uint64_t q=0,h=0,f=0,l=0,eq=0,eh=0;
    for(B3Site *s=b3_all;s;s=s->all){assert(s->q==s->h+s->f);q+=s->q;h+=s->h;f+=s->f;l+=s->lookups;if(!strcmp(s->atom,"exec")){eq+=s->q;eh+=s->h;}}
    fprintf(stderr,"B3_COUNTS:{\"regexp_named_queries\":%llu,\"new_hits\":%llu,\"fallbacks\":%llu,\"normal_lookup_calls\":%llu,"
        "\"normal_lookup_calls_skipped\":%llu,\"exec_queries\":%llu,\"exec_new_hits\":%llu,\"promotions\":%llu,\"lifetime_promotions\":%llu,\"sites\":[",
        (unsigned long long)q,(unsigned long long)h,(unsigned long long)f,(unsigned long long)l,(unsigned long long)(2*h),
        (unsigned long long)eq,(unsigned long long)eh,(unsigned long long)b3_promotions,(unsigned long long)b3_lifetime_promotions);
    unsigned n=0;
    for(B3Site *s=b3_all;s;s=s->all){
        fprintf(stderr,"%s{\"id\":%u,\"slot\":%u,\"keep\":%d,\"function\":",n++?",":"",s->id,s->index,s->keep);b3_string(s->function);
        fprintf(stderr,",\"atom\":");b3_string(s->atom);
        fprintf(stderr,",\"queries\":%llu,\"hits\":%llu,\"fallbacks\":%llu,\"lookups\":%llu,\"own_lookups\":%llu,"
            "\"direct_data\":%llu,\"own_data\":%llu,\"other_descriptor_or_chain\":%llu,\"rx_hashed\":%llu,\"holder_hashed\":%llu,"
            "\"promotion_possible\":%llu,\"receiver_shape_changes\":%llu,\"holder_shape_changes\":%llu,\"first_offset\":%d,\"last_offset\":%d,"
            "\"first_holder_count\":%d,\"first_holder_deleted\":%d,\"first_holder_ref\":%d,\"first_flags\":%u}",
            (unsigned long long)s->q,(unsigned long long)s->h,(unsigned long long)s->f,(unsigned long long)s->lookups,(unsigned long long)s->own_lookups,
            (unsigned long long)s->direct_data,(unsigned long long)s->own_data,(unsigned long long)s->other,(unsigned long long)s->rx_hashed,
            (unsigned long long)s->holder_hashed,(unsigned long long)s->promotion_possible,(unsigned long long)s->receiver_changes,(unsigned long long)s->holder_changes,
            s->first_offset,s->last_offset,s->first_holder_count,s->first_holder_deleted,s->first_holder_ref,s->first_flags);
    }
    fprintf(stderr,"]}\n");
    while(b3_all){B3Site *s=b3_all;b3_all=s->all;free(s->atom);free(s->function);free(s);}
    memset(b3_buckets,0,sizeof(b3_buckets));b3_next_id=0;
}
#pragma pop_macro("free")
