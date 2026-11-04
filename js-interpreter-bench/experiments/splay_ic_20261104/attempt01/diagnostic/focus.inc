typedef struct SPLayout {
    uint64_t id,count;unsigned hashed,class_id,exotic,prop_count;
    int depth,offset,flags;unsigned copied;char *atoms[32];unsigned prop_flags[32];
} SPLayout;
typedef struct SPFocus { unsigned pc,instance_id,used,overflow,seq_count;uint64_t last,transitions,seq[128];SPLayout layouts[32]; } SPFocus;
static SPFocus sp_focus[3];
static uint64_t sp_shape_id(void *ptr){unsigned h=((uintptr_t)ptr>>4)&4095;for(SPBirth *e=sp_births[h];e;e=e->next)if(e->ptr==ptr)return e->id;return 0;}
static void sp_receiver(JSContext *ctx,JSValueConst obj,JSAtom atom) {
    if(sp_phase!=2||!audit_active||JS_VALUE_GET_TAG(obj)!=JS_TAG_OBJECT)return;
    unsigned pcs[3]={43,138,147};int target=-1;
    for(unsigned i=0;i<3;i++)if(audit_active->pc==pcs[i])target=i;
    if(target<0)return;
    AuditFunction *owner=NULL;
    for(AuditFunction *f=audit_functions;f;f=f->next)
        if(f->focus && f->phases[2] && audit_active==f->phases[2][pcs[target]]){owner=f;break;}
    if(!owner)return;
    JSObject *p=JS_VALUE_GET_OBJ(obj);JSShape *sh=p->shape;uint64_t id=sp_shape_id(&sh->header);
    if(!id)abort();SPFocus *f=&sp_focus[target];f->pc=pcs[target];
    if(f->instance_id && f->instance_id!=owner->id)abort();f->instance_id=owner->id;
    if(f->last!=id){if(f->last)f->transitions++;f->last=id;if(f->seq_count<128)f->seq[f->seq_count++]=id;}
    SPLayout *l=NULL;for(unsigned i=0;i<f->used;i++)if(f->layouts[i].id==id){l=&f->layouts[i];break;}
    if(!l){
        if(f->used==32){f->overflow++;return;}l=&f->layouts[f->used++];l->id=id;
        l->hashed=sh->is_hashed;l->class_id=p->class_id;l->exotic=p->is_exotic;l->prop_count=sh->prop_count;
        l->offset=-1;l->flags=-1;l->depth=-1;
        AuditSite *saved=audit_active;audit_active=NULL;
        for(unsigned i=0;i<sh->prop_count && i<32;i++){l->atoms[i]=audit_atom(ctx,get_shape_prop(sh)[i].atom);l->prop_flags[i]=get_shape_prop(sh)[i].flags;l->copied++;}
        JSObject *holder=p;
        for(unsigned depth=0;holder && depth<=8;depth++){
            JSShapeProperty *props=get_shape_prop(holder->shape);int found=0;
            for(unsigned k=0;k<holder->shape->prop_count;k++)if(props[k].atom==atom){l->offset=k;l->flags=props[k].flags;l->depth=depth;found=1;break;}
            if(found||holder->is_exotic)break;holder=holder->shape->proto;
        }
        audit_active=saved;
    }
    l->count++;
}
static void sp_focus_report(FILE *out){
    fprintf(out,"[ ");for(unsigned i=0;i<3;i++){
        SPFocus *f=&sp_focus[i];fprintf(out,"%s{\"pc\":%u,\"instance_id\":%u,\"distinct_shape_generations\":%u,\"overflow_events\":%u,\"transitions\":%llu,\"first_128_transitions\":[",i?",":"",f->pc,f->instance_id,f->used,f->overflow,(unsigned long long)f->transitions);
        for(unsigned j=0;j<f->seq_count;j++)fprintf(out,"%s%llu",j?",":"",(unsigned long long)f->seq[j]);fprintf(out,"],\"layouts\":[");
        for(unsigned j=0;j<f->used;j++){
            SPLayout *l=&f->layouts[j];fprintf(out,"%s{\"shape_generation\":%llu,\"count\":%llu,\"hashed\":%u,\"class_id\":%u,\"exotic\":%u,\"prop_count\":%u,\"holder_depth\":%d,\"property_index\":%d,\"property_byte_offset\":%lld,\"property_flags\":%d,\"own_layout\":[",j?",":"",(unsigned long long)l->id,(unsigned long long)l->count,l->hashed,l->class_id,l->exotic,l->prop_count,l->depth,l->offset,(long long)l->offset*sizeof(JSProperty),l->flags);
            for(unsigned k=0;k<l->copied;k++){fprintf(out,"%s{\"index\":%u,\"atom_hex\":\"",k?",":"",k);audit_hex(out,l->atoms[k],strlen(l->atoms[k]));fprintf(out,"\",\"flags\":%u}",l->prop_flags[k]);}fprintf(out,"]}");
        }fprintf(out,"]}");
    }fprintf(out,"]");
}
