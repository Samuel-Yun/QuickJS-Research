def once(s,a,b):
    assert s.count(a)==1,(s.count(a),a[:100]);return s.replace(a,b)


def init_free(d):
    f=d['four_runtime.inc'];q=d['quickjs.c']
    f=once(f,'    JSShape *initial,*final;','    JSShape *reserved_initial,*final; /* reserved: no reference owned */')
    f=once(f,'       !(proto=plan_proto(f)) || !find_hashed_shape_proto(ctx->rt,proto))return 0;',
        '       !(proto=plan_proto(f)))return 0;')
    f=once(f,'    JSShape*initial=find_hashed_shape_proto(ctx->rt,proto);if(!initial)return;','')
    f=once(f,'JSShape*oldinitial=s->initial,*oldfinal=s->final;','JSShape*oldfinal=s->final;')
    f=once(f,'s->initial=js_dup_shape(initial);','')
    f=once(f,'js_free_shape_null(ctx->rt,oldinitial);','')
    # Remove holding/marking/freeing from the parent variant, not just its gate.
    if 'cold_mark' in f:
        f=once(f,'offsetof(FullPlan,initial)==16','offsetof(FullPlan,reserved_initial)==16')
        f=once(f,'        if(f->initial)mark_func(rt,&f->initial->header);','')
        f=once(f,'js_free_shape_null(rt,f->initial);','')
    else:
        q=once(q,'if(fs->initial)mark_func(rt,&fs->initial->header);','')
        q=once(q,'js_free_shape_null(rt,fs->initial);','')
    f=once(f,'static inline __exception int js_poll_interrupts',
        '''#ifndef FOUR_DIAG
_Static_assert(sizeof(FullPlan)==96 && offsetof(FullPlan,reserved_initial)==16 &&
               offsetof(FullPlan,final)==24 && offsetof(FullPlan,recipe)==32,"original hot layout");
#endif
static inline __exception int js_poll_interrupts''')
    d.update({'four_runtime.inc':f,'quickjs.c':q})


def keep_primary(d):
    f=d['four_runtime.inc']
    a='''    unsigned victim=s->extra->next;
    s->extra->next=(victim+1)%CTOR_CAPACITY;
    SCREEN(replacements);
    return victim==0?&s->plan:&s->extra->plan[victim-1];'''
    f=once(f,a,'''    SCREEN(replacements);
    return &s->extra->plan[0]; /* primary is retained, own-target updates stay above */''')
    d['four_runtime.inc']=f
