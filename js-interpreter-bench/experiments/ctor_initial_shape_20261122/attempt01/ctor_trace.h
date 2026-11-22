/* Diagnostics only. No VM fields, allocations, or JS/shape references added. */
enum TraceCounter {T_calls,T_primary,T_secondary,T_published,T_replacements,
 T_evicted,T_unused_evicted,T_same_target_updates,T_before_initial,T_after_initial,
 T_pre_other,T_post_other,T_result_layout,T_allocation,T_negative,T_exceptions,T_COUNT};
static const char*trace_counter_names[]={"calls","primary_hits","secondary_hits","published","replacements",
 "evicted","unused_evicted","same_target_updates","before_initial_missing","after_initial_missing",
 "other_pre_qualification","other_post_qualification","result_layout","allocation_failure","negative_reject","exceptions"};
#define TR_IDENT 8192
#define TR_SITES 2048
#define TR_ROWS 8192
#define TR_PLANS 8192
typedef struct TraceIdentity {const void*ptr;unsigned serial;int live;} TraceIdentity;
typedef struct TraceSite {unsigned bytecode,pc;char name[96],filename[160];} TraceSite;
typedef struct TraceRow {unsigned site,ctor;uintptr_t address;char name[96];uint64_t c[T_COUNT];} TraceRow;
typedef struct TracePlan {const FullPlan*ptr;unsigned row;uint64_t hits;int live;} TracePlan;
typedef struct TraceContext {FourSite*site;unsigned row;struct TraceContext*previous;} TraceContext;
static TraceIdentity trace_objects[TR_IDENT],trace_bytecodes[TR_IDENT];
static unsigned trace_object_serial,trace_bytecode_serial;
static TraceSite trace_sites[TR_SITES];static unsigned trace_site_count;
static TraceRow trace_rows[TR_ROWS];static unsigned trace_row_count,trace_overflow;
static TracePlan trace_plans[TR_PLANS];static TraceContext*trace_current;
static unsigned trace_hash(uintptr_t v){return (unsigned)((v>>4)^(v>>19)^(v>>32));}
static unsigned trace_id(TraceIdentity*table,unsigned*serial,const void*ptr)
{
    unsigned h=trace_hash((uintptr_t)ptr)&(TR_IDENT-1);
    for(unsigned i=0;i<TR_IDENT;i++,h=(h+1)&(TR_IDENT-1)){
        TraceIdentity*t=&table[h];
        if(t->ptr==ptr){if(!t->live){t->live=1;t->serial=++*serial;}return t->serial;}
        if(!t->ptr){t->ptr=ptr;t->live=1;t->serial=++*serial;return t->serial;}
    }trace_overflow++;return 0;
}
static void trace_dead(TraceIdentity*table,const void*ptr)
{
    unsigned h=trace_hash((uintptr_t)ptr)&(TR_IDENT-1);
    for(unsigned i=0;i<TR_IDENT;i++,h=(h+1)&(TR_IDENT-1)){
        if(table[h].ptr==ptr){table[h].live=0;return;}
        if(!table[h].ptr)return;
    }
}
static void trace_object_free(JSObject*p){trace_dead(trace_objects,p);}
static void trace_bytecode_free(JSFunctionBytecode*b){trace_dead(trace_bytecodes,b);}
static TracePlan*trace_plan(const FullPlan*p)
{
    unsigned h=trace_hash((uintptr_t)p)&(TR_PLANS-1);
    for(unsigned i=0;i<TR_PLANS;i++,h=(h+1)&(TR_PLANS-1)){
        if(trace_plans[h].ptr==p)return &trace_plans[h];
        if(!trace_plans[h].ptr){trace_plans[h].ptr=p;return &trace_plans[h];}
    }trace_overflow++;return &trace_plans[0];
}
static void trace_move(FullPlan*old,FullPlan*now)
{
    TracePlan*from=trace_plan(old),*to=trace_plan(now);
    unsigned row=from->row;uint64_t hits=from->hits;int live=from->live;
    from->live=0;to->row=row;to->hits=hits;to->live=live;
}
static void trace_enter(JSContext*ctx,JSFunctionBytecode*b,FourSite*s,JSValueConst callee,TraceContext*frame)
{
    unsigned bid=trace_id(trace_bytecodes,&trace_bytecode_serial,b),sid=0;
    for(unsigned i=1;i<=trace_site_count;i++)if(trace_sites[i].bytecode==bid && trace_sites[i].pc==s->pc){sid=i;break;}
    if(!sid && trace_site_count+1<TR_SITES){
        sid=++trace_site_count;TraceSite*t=&trace_sites[sid];t->bytecode=bid;t->pc=s->pc;
        char buf[256];snprintf(t->name,sizeof(t->name),"%s",JS_AtomGetStr(ctx,buf,sizeof(buf),b->func_name));
        if(b->has_debug)snprintf(t->filename,sizeof(t->filename),"%s",JS_AtomGetStr(ctx,buf,sizeof(buf),b->debug.filename));
    }
    unsigned cid=0;JSObject*f=NULL;
    if(JS_VALUE_GET_TAG(callee)==JS_TAG_OBJECT){f=JS_VALUE_GET_OBJ(callee);cid=trace_id(trace_objects,&trace_object_serial,f);}
    unsigned row=0;
    /* The number of constructors is small; a fixed hash avoids per-call allocation. */
    unsigned h=(sid*2654435761U+cid*40503U)&(TR_ROWS-1);
    for(unsigned i=0;i<TR_ROWS;i++,h=(h+1)&(TR_ROWS-1)){
        TraceRow*r=&trace_rows[h];
        if(r->site==sid && r->ctor==cid && r->site){row=h;break;}
        if(!r->site){
            r->site=sid;r->ctor=cid;r->address=(uintptr_t)f;row=h;trace_row_count++;
            if(f && (f->class_id==JS_CLASS_BYTECODE_FUNCTION || f->class_id==JS_CLASS_COLD_BYTECODE_FUNCTION)){
                char buf[256];snprintf(r->name,sizeof(r->name),"%s",JS_AtomGetStr(ctx,buf,sizeof(buf),f->u.func.function_bytecode->func_name));
            }else snprintf(r->name,sizeof(r->name),"class:%d",f?f->class_id:-1);
            break;
        }
        if(i+1==TR_ROWS)trace_overflow++;
    }
    frame->site=s;frame->row=row;frame->previous=trace_current;trace_current=frame;
    trace_rows[row].c[T_calls]++;
}
static void trace_fail(unsigned reason){if(trace_current)trace_rows[trace_current->row].c[reason]++;}
static void trace_hit(FullPlan*p)
{
    if(!trace_current)return;
    unsigned row=trace_current->row;
    trace_rows[row].c[p==trace_current->site->plan?T_primary:T_secondary]++;
    TracePlan*t=trace_plan(p);if(t->live)t->hits++;
}
static void trace_publish(FourSite*site,FullPlan*p,JSValueConst callee)
{
    if(!trace_current)return;
    unsigned row=trace_current->row;TracePlan*t=trace_plan(p);
    if(p->final && t->live){
        if(trace_rows[t->row].ctor!=trace_rows[row].ctor){
            trace_rows[row].c[T_replacements]++;trace_rows[t->row].c[T_evicted]++;
            if(!t->hits)trace_rows[t->row].c[T_unused_evicted]++;
        }else trace_rows[row].c[T_same_target_updates]++;
    }
    trace_rows[row].c[T_published]++;t->row=row;t->hits=0;t->live=1;
}
static void trace_json(const char*s)
{
    fputc('"',stderr);
    for(const unsigned char*p=(const unsigned char*)s;*p;p++){
        if(*p=='"'||*p=='\\'){fputc('\\',stderr);fputc(*p,stderr);}
        else if(*p<32)fprintf(stderr,"\\u%04x",*p);else fputc(*p,stderr);
    }fputc('"',stderr);
}
static void __attribute__((destructor)) trace_report(void)
{
    fprintf(stderr,"CTOR_TRACE:{\"overflow\":%u,\"rows\":[",trace_overflow);
    unsigned emitted=0;
    for(unsigned i=0;i<TR_ROWS;i++)if(trace_rows[i].site){
        TraceRow*r=&trace_rows[i];TraceSite*s=&trace_sites[r->site];
        fprintf(stderr,"%s{\"site_id\":%u,\"bytecode_id\":%u,\"pc\":%u,\"function\":",emitted++?",":"",r->site,s->bytecode,s->pc);
        trace_json(s->name);fprintf(stderr,",\"filename\":");trace_json(s->filename);
        fprintf(stderr,",\"ctor_id\":%u,\"ctor_address\":\"0x%" PRIxPTR "\",\"constructor\":",r->ctor,r->address);trace_json(r->name);
        for(unsigned j=0;j<T_COUNT;j++)fprintf(stderr,",\"%s\":%" PRIu64,trace_counter_names[j],r->c[j]);
        fputc('}',stderr);
    }fprintf(stderr,"]}\n");
}
