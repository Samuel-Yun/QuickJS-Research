from pathlib import Path
HERE=Path(__file__).resolve().parent
def apply(d,q,once,mode):
 if mode=='probe':
  d['four_runtime.inc']=once(d['four_runtime.inc'],'    const uint8_t*p=b->byte_code_buf,','    FOLLOW(0);\n    const uint8_t*p=b->byte_code_buf,')
  d['four_prepare.inc']=once(d['four_prepare.inc'],'s->pc=p;s->argc=get_u16(pc+1);','s->pc=p;s->argc=get_u16(pc+1);\n#ifdef FOUR_DIAG\n            follow_stats[8]++;follow_stats[11]+=sizeof(FourSite);\n#endif')
  return q
 s=d['four_runtime.inc'].replace('FourSite','FullPlan').replace('four_ctor_','plan_')
 # Keep allocation observer referring to small entries, so cold slow work can be counted.
 s=s.replace('static FullPlan *plan_observer;', 'static FourSite *four_ctor_observer;').replace('plan_observer','four_ctor_observer')
 s=s.replace('static void plan_alloc','static void four_ctor_alloc').replace('static void plan_resize','static void four_ctor_resize').replace('static void plan_search','static void four_ctor_search').replace('static void plan_switch','static void four_ctor_switch')
 s=once(s,'typedef struct FullPlan {','typedef struct FullPlan FullPlan;\nstruct FourSite {\n    FullPlan *plan;\n    JSValue negative;\n    uint32_t pc;\n    uint16_t argc;\n#ifdef FOUR_DIAG\n    FourDiag *diag;\n#endif\n};\nstruct FullPlan {')
 s=once(s,'} FullPlan;','};')
 s=once(s,'    const uint8_t*p=b->byte_code_buf,','    FOLLOW(0);\n    const uint8_t*p=b->byte_code_buf,')
 s=once(s,'static void plan_learn(JSContext*ctx,FullPlan*s,','static void plan_learn(JSContext*ctx,FourSite*slot,')
 s=once(s,'    FOUR_COUNT(s,eligible);','    FOUR_COUNT(slot,eligible);')
 s=once(s,'    JSValue old=s->callee;', '''    FullPlan*s=slot->plan;
    if(!s){
        s=js_mallocz_rt(ctx->rt,sizeof(*s));
        if(!s){FOLLOW(4);return;}
        s->pc=slot->pc;s->argc=slot->argc;
#ifdef FOUR_DIAG
        s->diag=slot->diag;follow_stats[9]++;follow_stats[10]+=sizeof(*s);
#endif
        slot->plan=s;FOLLOW(1);
    }
    JSValue old=s->callee;''')
 s=once(s,'    FOUR_COUNT(s,fill);','    JSValue negative=slot->negative;slot->negative=JS_UNDEFINED;\n    FOUR_COUNT(s,fill);\n    JS_FreeValue(ctx,negative);')
 s=once(s,'static size_t four_extra_size', '#include "sparse_runtime.inc"\nstatic size_t four_extra_size')
 d['four_runtime.inc']=s;d['sparse_runtime.inc']=(HERE/'sparse_runtime.inc').read_text()
 p=d['four_prepare.inc'];p=once(p,'s->pc=p;s->argc=get_u16(pc+1);','s->pc=p;s->argc=get_u16(pc+1);\n#ifdef FOUR_DIAG\n            follow_stats[8]++;follow_stats[11]+=sizeof(FourSite);\n#endif')
 d['four_prepare.inc']=p
 q=once(q,'int eligible=four_ctor_slow_eligible(ctx,call_argv[-2]', 'int eligible=four_ctor_slow_eligible(ctx,s,call_argv[-2]')
 q=once(q,'if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);','if(eligible && !JS_IsException(ret_val))four_ctor_learn(ctx,s,call_argv[-2],ret_val);\n                    else if(!JS_IsException(ret_val))sparse_remember(ctx,s,call_argv[-2]);')
 a='for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*fs=&b->four_sites[fi];JS_MarkValue(rt,fs->callee,mark_func);if(fs->initial)mark_func(rt,&fs->initial->header);if(fs->final)mark_func(rt,&fs->final->header);}'
 q=once(q,a,'for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_MarkValue(rt,ss->negative,mark_func);FullPlan*fs=ss->plan;if(fs){JS_MarkValue(rt,fs->callee,mark_func);if(fs->initial)mark_func(rt,&fs->initial->header);if(fs->final)mark_func(rt,&fs->final->header);}}')
 a='for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*fs=&b->four_sites[fi];JS_FreeValueRT(rt,fs->callee);js_free_shape_null(rt,fs->initial);js_free_shape_null(rt,fs->final);}'
 q=once(q,a,'for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_FreeValueRT(rt,ss->negative);FullPlan*fs=ss->plan;if(fs){JS_FreeValueRT(rt,fs->callee);js_free_shape_null(rt,fs->initial);js_free_shape_null(rt,fs->final);js_free_rt(rt,fs);}}')
 return q
