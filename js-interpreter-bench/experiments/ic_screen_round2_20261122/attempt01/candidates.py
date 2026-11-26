"""Round two: each transform receives frozen SPARSE or the permitted D16 layer."""


def once(s,a,b):
    assert s.count(a)==1,(s.count(a),a[:120])
    return s.replace(a,b)


def neg_direct(d):
    q=d['quickjs.c']
    start=q.index('                    int eligible=four_ctor_slow_eligible(')
    end=q.index('\n                }',start)
    old=q[start:end]
    replacement='''                    if(!s->plan && sparse_same(s,call_argv[-2])){
                        SCREEN(negative_direct);
#ifdef FOUR_DIAG
                        FourSite*oldscope=four_ctor_observer;four_ctor_observer=NULL;
#endif
                        ret_val=JS_CallConstructorInternal(ctx,call_argv[-2],call_argv[-1],call_argc,call_argv,0);
#ifdef FOUR_DIAG
                        four_ctor_observer=oldscope;
#endif
                    }else{
'''+''.join('    '+line+'\n' for line in old.splitlines())+'                    }'
    d['quickjs.c']=q[:start]+replacement+q[end:]


def p2_cold(d):
    f,s,q=(d[n] for n in ['four_runtime.inc','sparse_runtime.inc','quickjs.c'])
    # Consume the old FullPlan's tail padding, leaving all existing offsets.
    a=f.index('struct FullPlan {')
    before,body=f[:a],f[a:]
    body=once(body,'    uint16_t argc;\n#ifdef FOUR_DIAG',
        '    uint16_t argc;\n    uint8_t dual,next; /* old tail padding: offsets 90,91 */\n#ifdef FOUR_DIAG')
    f=before+body
    pos=f.index('static inline __exception int js_poll_interrupts')
    helpers='''typedef struct DualPlan {FullPlan primary,secondary;} DualPlan;
#ifndef FOUR_DIAG
_Static_assert(sizeof(FourSite)==32,"frozen FourSite size");
_Static_assert(sizeof(FullPlan)==96 && offsetof(FullPlan,callee)==0 &&
    offsetof(FullPlan,initial)==16 && offsetof(FullPlan,final)==24 &&
    offsetof(FullPlan,recipe)==32 && offsetof(FullPlan,pc)==84 &&
    offsetof(FullPlan,argc)==88 && offsetof(FullPlan,dual)==90,"frozen FullPlan layout");
_Static_assert(sizeof(DualPlan)==192,"two embedded plans");
#endif
static int cold_same(FullPlan*p,JSValueConst c)
{return p && JS_VALUE_GET_TAG(c)==JS_TAG_OBJECT && JS_VALUE_GET_TAG(p->callee)==JS_TAG_OBJECT &&
    JS_VALUE_GET_OBJ(c)==JS_VALUE_GET_OBJ(p->callee);}
static FullPlan*cold_destination(JSContext*ctx,FourSite*slot,JSValueConst callee)
{
    FullPlan*p=slot->plan;
    if(!p || cold_same(p,callee))return p;
    if(!p->dual){
        DualPlan*pair;
#ifdef SCREEN_DIAGNOSTIC
        if(getenv("SCREEN_FAIL_UPGRADE")){SCREEN(upgrade_failures);return NULL;}
#endif
        pair=js_mallocz_rt(ctx->rt,sizeof(*pair));
        if(!pair){SCREEN(upgrade_failures);return NULL;}
        pair->primary=*p; /* move its owned references, do not duplicate/free them */
        pair->primary.dual=1;pair->primary.next=0;
        pair->secondary.pc=slot->pc;pair->secondary.argc=slot->argc;
#ifdef FOUR_DIAG
        pair->secondary.diag=slot->diag;
#endif
        slot->plan=&pair->primary;js_free_rt(ctx->rt,p);p=slot->plan;
        SCREEN(upgrades);SCREEN_ADD(upgrade_bytes,sizeof(*pair));
    }
    FullPlan*second=&((DualPlan*)p)->secondary;
    if(!second->final || cold_same(second,callee))return second;
    unsigned victim=p->next;p->next^=1;SCREEN(replacements);
    return victim?second:p;
}
static void cold_mark(JSRuntime*rt,FourSite*s,JS_MarkFunc*mark_func)
{
    JS_MarkValue(rt,s->negative,mark_func);
    FullPlan*p=s->plan;if(!p)return;
    unsigned n=p->dual?2:1;
    for(unsigned i=0;i<n;i++){
        FullPlan*f=i?&((DualPlan*)p)->secondary:p;
        JS_MarkValue(rt,f->callee,mark_func);
        if(f->initial)mark_func(rt,&f->initial->header);
        if(f->final)mark_func(rt,&f->final->header);
    }
}
static void cold_free(JSRuntime*rt,FourSite*s)
{
    JS_FreeValueRT(rt,s->negative);
    FullPlan*p=s->plan;if(!p)return;
    unsigned n=p->dual?2:1;
    for(unsigned i=0;i<n;i++){
        FullPlan*f=i?&((DualPlan*)p)->secondary:p;
        JS_FreeValueRT(rt,f->callee);js_free_shape_null(rt,f->initial);js_free_shape_null(rt,f->final);
    }
    js_free_rt(rt,p); /* one allocation, including an embedded secondary */
}
'''
    f=f[:pos]+helpers+f[pos:]
    f=once(f,'    FullPlan*s=slot->plan;', '''    FullPlan*s=cold_destination(ctx,slot,callee);
    if(slot->plan && !s)return; /* upgrade failed: preserve the old plan */''')
    # The original allocation branch is retained for the first plan.
    s=once(s,'    return plan_try(ctx,s->plan,c,t,a,out);', '''    if(plan_try(ctx,s->plan,c,t,a,out))return 1;
    if(s->plan->dual){
        FullPlan*second=&((DualPlan*)s->plan)->secondary;
        SCREEN(second_tests);
        if(cold_same(second,c) && plan_try(ctx,second,c,t,a,out)){
            SCREEN(second_hits);return 1;
        }
    }
    return 0;''')
    a='            for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_MarkValue(rt,ss->negative,mark_func);FullPlan*fs=ss->plan;if(fs){JS_MarkValue(rt,fs->callee,mark_func);if(fs->initial)mark_func(rt,&fs->initial->header);if(fs->final)mark_func(rt,&fs->final->header);}}'
    q=once(q,a,'            for(uint32_t fi=0;fi<b->four_count;fi++)cold_mark(rt,&b->four_sites[fi],mark_func);')
    a='    for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_FreeValueRT(rt,ss->negative);FullPlan*fs=ss->plan;if(fs){JS_FreeValueRT(rt,fs->callee);js_free_shape_null(rt,fs->initial);js_free_shape_null(rt,fs->final);js_free_rt(rt,fs);}}'
    q=once(q,a,'    for(uint32_t fi=0;fi<b->four_count;fi++)cold_free(rt,&b->four_sites[fi]);')
    d.update({'four_runtime.inc':f,'sparse_runtime.inc':s,'quickjs.c':q})


def proto_small(d):
    f=d['four_runtime.inc']
    a=f.index('    for(unsigned i=0;i<r->n;i++){',f.index('static int plan_chain'))
    b=f.index('\n}\nstatic int plan_base',a)
    f=f[:a]+'''    unsigned pending=(1U<<r->n)-1,depth=0;
    for(JSObject*p=proto;p && pending;p=p->shape->proto){
        SCREEN(chain_layers);
        if(++depth>32 || p->class_id!=JS_CLASS_OBJECT || p->is_exotic)return 0;
        PROTO_HIST(p);
        unsigned count=p->shape->prop_count;
        if(count<=2){
            SCREEN(small_layers);
            JSShapeProperty*table=get_shape_prop(p->shape);
            for(unsigned j=0;j<count && pending;j++){
                JSShapeProperty*d=&table[j];
                if(d->atom==JS_ATOM_NULL)continue;
                SCREEN(small_desc_reads);
                for(unsigned i=0;i<r->n;i++)if(pending&(1U<<i)){
                    SCREEN(small_atom_compares);
                    if(d->atom==r->atom[i]){
                        if((d->flags&JS_PROP_TMASK) || !(d->flags&JS_PROP_WRITABLE))return 0;
                        SCREEN(small_matches);pending&=~(1U<<i);break;
                    }
                }
            }
        }else for(unsigned i=0;i<r->n;i++)if(pending&(1U<<i)){
            SCREEN(descriptor_queries);
            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);
            if(d){
                if((d->flags&JS_PROP_TMASK) || !(d->flags&JS_PROP_WRITABLE))return 0;
                pending&=~(1U<<i);
            }
        }
    }
    return 1;'''+f[b:]
    d['four_runtime.inc']=f


def d16_static(d):
    q=d['quickjs.c'];p=d['read_ic_prepare.inc'];r=d['d16_runtime.inc']
    d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'DEF(four_ctor,3,0,0,u16)',
        'DEF(four_ctor,3,0,0,u16)\nDEF(v6s_get_arg0,1,0,1,none)\nDEF(v6s_get_loc0,1,0,1,none)')
    q=once(q,'#define V6_PREPARED_BORROW(slot) do {',
        '#define V6_PREPARED_BORROW(slot, read_delta, field_size) do {')
    a=q.index('        unsigned field_size=*pc==OP_get_field_rdi16?3:5;')
    b=q.index('        if (object->class_id',a)
    q=q[:a]+'''        ReadICSite *site = (ReadICSite *)(pc + 1 + read_delta(pc+1));    \\
'''+q[b:]
    q=once(q,'V6_PREPARED_BORROW(var_buf[0]);','V6_PREPARED_BORROW(var_buf[0],get_u32,5);')
    q=once(q,'V6_PREPARED_BORROW(arg_buf[0]);','V6_PREPARED_BORROW(arg_buf[0],get_u32,5);')
    a='        CASE(OP_get_arg1):'
    q=once(q,a,'''        CASE(OP_v6s_get_arg0): V6_PREPARED_BORROW(arg_buf[0],get_u16,3); BREAK;
        CASE(OP_v6s_get_loc0): V6_PREPARED_BORROW(var_buf[0],get_u16,3); BREAK;
'''+a)
    q=once(q,'if (op == OP_get_field_rdi16 || op == OP_four_ctor ||',
        'if (op == OP_v6s_get_arg0 || op == OP_v6s_get_loc0 || op == OP_get_field_rdi16 || op == OP_four_ctor ||')
    a='''        if((op==OP_get_arg0 || op==OP_get_loc0) && p+1<old_len && old[p+1]==OP_get_field)
            *pc=op==OP_get_arg0?OP_v6_get_arg0:OP_v6_get_loc0;'''
    b='''        if((op==OP_get_arg0 || op==OP_get_loc0) && p+1<old_len && old[p+1]==OP_get_field){
            int short_next=shorts && wide_size+index*sizeof(ReadICSite)-(p+2)<=UINT16_MAX-7;
            *pc=op==OP_get_arg0?(short_next?OP_v6s_get_arg0:OP_v6_get_arg0):
                                  (short_next?OP_v6s_get_loc0:OP_v6_get_loc0);
        }'''
    p=once(p,a,b)
    r=once(r,'else if(op==OP_v6_get_arg0)out[pos]=OP_get_arg0;',
        'else if(op==OP_v6_get_arg0 || op==OP_v6s_get_arg0)out[pos]=OP_get_arg0;')
    r=once(r,'else if(op==OP_v6_get_loc0)out[pos]=OP_get_loc0;',
        'else if(op==OP_v6_get_loc0 || op==OP_v6s_get_loc0)out[pos]=OP_get_loc0;')
    q=once(q,'    static const void * const dispatch_table[256] = {',
        '    _Static_assert(OP_COUNT<=256,"runtime opcodes fit dispatch table");\n    static const void * const dispatch_table[256] = {')
    d.update({'quickjs.c':q,'read_ic_prepare.inc':p,'d16_runtime.inc':r})
