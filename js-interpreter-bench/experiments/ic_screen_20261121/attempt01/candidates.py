"""Every transform receives a fresh copy of the frozen SPARSE source."""


def once(s, a, b):
    assert s.count(a) == 1, (s.count(a), a[:140])
    return s.replace(a, b)


def m1(d):
    f, s, q = (d[n] for n in ['four_runtime.inc', 'sparse_runtime.inc', 'quickjs.c'])
    f = once(f, 'typedef struct FullPlan FullPlan;', '''typedef struct RecipeMemo {
    FourRecipe recipe;
    JSFunctionBytecode *bytecode;
    const uint8_t *image;
    int length;
} RecipeMemo;
typedef struct FullPlan FullPlan;''')
    f = once(f, 'JSValueConst target,unsigned argc)\n{\n    JSObject*f,*proto;FourRecipe r;',
        'JSValueConst target,unsigned argc,RecipeMemo*m)\n{\n    JSObject*f,*proto;FourRecipe r;')
    f = once(f, '    return plan_chain(proto,&r);', '''    if(!plan_chain(proto,&r))return 0;
    JSFunctionBytecode*b=f->u.func.function_bytecode;
    if(m && b->read_ic_ready){
        m->recipe=r;m->bytecode=b;m->image=b->byte_code_buf;m->length=b->byte_code_len;
    }
    return 1;''')
    f = once(f, 'JSValueConst callee,JSValueConst result)\n{',
             'JSValueConst callee,JSValueConst result,const RecipeMemo*m)\n{')
    f = once(f, '    if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION || !plan_recipe(f->u.func.function_bytecode,&r) ||', '''    if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION)return;
    JSFunctionBytecode*b=f->u.func.function_bytecode;
    if(m && m->bytecode==b && b->read_ic_ready && m->image==b->byte_code_buf && m->length==b->byte_code_len){
        r=m->recipe;SCREEN(recipe_reused);
    }else if(!plan_recipe(b,&r))return;
    if(''')
    s = once(s, 'JSValueConst t,unsigned n)', 'JSValueConst t,unsigned n,RecipeMemo*m)')
    s = once(s, 'return plan_slow_eligible(ctx,c,t,n);', 'return plan_slow_eligible(ctx,c,t,n,m);')
    s = once(s, 'JSValueConst c,JSValueConst result)', 'JSValueConst c,JSValueConst result,const RecipeMemo*m)')
    s = once(s, 'plan_learn(ctx,s,c,result);', 'plan_learn(ctx,s,c,result,m);')
    # Keep the recipe/proof frame out of the ordinary hit handler.
    s += '''
static JSValue __attribute__((noinline)) recipe_slow_construct(JSContext*ctx,FourSite*s,
    JSValueConst callee,JSValueConst target,int argc,JSValue*argv)
{
    RecipeMemo memo={0};
    int eligible=four_ctor_slow_eligible(ctx,s,callee,target,argc,&memo);
#ifdef FOUR_DIAG
    FourSite*oldscope=four_ctor_observer;four_ctor_observer=eligible?s:NULL;
#endif
    JSValue value=JS_CallConstructorInternal(ctx,callee,target,argc,argv,0);
#ifdef FOUR_DIAG
    four_ctor_observer=oldscope;
#endif
    if(eligible && !JS_IsException(value))four_ctor_learn(ctx,s,callee,value,&memo);
    else if(!JS_IsException(value))sparse_remember(ctx,s,callee);
    return value;
}
'''
    start = q.index('                    int eligible=four_ctor_slow_eligible(')
    end = q.index('\n                }', start)
    q = q[:start] + '                    ret_val=recipe_slow_construct(ctx,s,call_argv[-2],call_argv[-1],call_argc,call_argv);' + q[end:]
    d.update({'four_runtime.inc': f, 'sparse_runtime.inc': s, 'quickjs.c': q})


def d16(d, here):
    q, r = d['quickjs.c'], d['read_ic_opcodes.inc']
    d['quickjs-opcode.h'] = once(d['quickjs-opcode.h'], 'DEF(get_field_rdi, 5, 1, 1, u32)',
        'DEF(get_field_rdi, 5, 1, 1, u32)\nDEF(get_field_rdi16, 3, 1, 1, u16)')
    q = once(q, '#include "four_runtime.inc"', '#include "four_runtime.inc"\n#include "d16_runtime.inc"')
    d['d16_runtime.inc'] = (here / 'd16_runtime.inc').read_text()
    d['runtime_opcode_info.h'] = (here / 'runtime_opcode_info.h').read_text()
    d['read_ic_prepare.inc'] = (here / 'd16_prepare.inc').read_text()
    a = '        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));'
    q = once(q, a, '''        unsigned field_size=*pc==OP_get_field_rdi16?3:5;                \\
        ReadICSite *site = (ReadICSite *)(pc + 1 +                      \\
            (field_size==3?get_u16(pc+1):get_u32(pc+1)));''')
    a = '            pc += 5;                                                   ' + chr(92)
    q = once(q, a, '            pc += field_size;                                          ' + chr(92))
    q = once(q, '    if (!b->has_debug || !b->debug.pc2line_buf)',
        '    pc_value=d16_debug_pc(b,pc_value);\n    if (!b->has_debug || !b->debug.pc2line_buf)')
    r = once(r, '#define GET_READ_IC(name, keep)', '#define GET_READ_IC(name, keep, operand_size)')
    r = once(r, 'uint32_t delta = get_u32(pc), offset;', 'uint32_t delta = operand_size==2?get_u16(pc):get_u32(pc), offset;')
    r = once(r, '        pc += 4;', '        pc += operand_size;')
    r = once(r, 'GET_READ_IC(get_field_rdi, 0);', 'GET_READ_IC(get_field_rdi, 0, 4);')
    r = once(r, 'GET_READ_IC(get_field2_rdi, 1);', 'GET_READ_IC(get_field2_rdi, 1, 4);')
    r = once(r, '#undef GET_READ_IC', '''        CASE(OP_get_field_rdi16):
            SCREEN(short_dispatches);
            GET_READ_IC(get_field_rdi16, 0, 2);
            BREAK;
#undef GET_READ_IC''')
    q = once(q, '    bc_buf = js_malloc(s->ctx, bc_len);',
        '    bc_len=d16_wide_len(b);\n    bc_buf = js_malloc(s->ctx, bc_len);')
    q = once(q, '    memcpy(bc_buf, bc_buf1, bc_len);', '    d16_export(b,bc_buf);')
    q = once(q, '    bc_put_leb128(s, b->byte_code_len);', '    bc_put_leb128(s, d16_wide_len(b));')
    q = once(q, 'if (op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||',
        'if (op == OP_get_field_rdi16 || op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||')
    d.update({'quickjs.c': q, 'read_ic_opcodes.inc': r})


def m2(d):
    f = d['four_runtime.inc']
    a = f.index('    for(unsigned i=0;i<r->n;i++){', f.index('static int plan_chain'))
    b = f.index('\n}\nstatic int plan_base', a)
    f = f[:a] + '''    unsigned pending=(1U<<r->n)-1,depth=0;
    for(JSObject*p=proto;p && pending;p=p->shape->proto){
        SCREEN(chain_layers);
        if(++depth>32 || p->class_id!=JS_CLASS_OBJECT || p->is_exotic)return 0;
        for(unsigned i=0;i<r->n;i++)if(pending&(1U<<i)){
            SCREEN(descriptor_queries);
            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);
            if(d){
                if((d->flags&JS_PROP_TMASK) || !(d->flags&JS_PROP_WRITABLE))return 0;
                pending&=~(1U<<i);
            }
        }
    }
    return 1;''' + f[b:]
    d['four_runtime.inc'] = f


def multi(d, capacity):
    f, s, q = (d[n] for n in ['four_runtime.inc', 'sparse_runtime.inc', 'quickjs.c'])
    f = once(f, 'struct FourSite {', '''#define CTOR_CAPACITY %d
typedef struct ExtraPlans {
    FullPlan *plan[CTOR_CAPACITY-1];
    uint8_t next;
} ExtraPlans;
struct FourSite {''' % capacity)
    f = once(f, '    uint16_t argc;\n#ifdef FOUR_DIAG', '    uint16_t argc;\n    ExtraPlans *extra;\n#ifdef FOUR_DIAG') if f.count('    uint16_t argc;\n#ifdef FOUR_DIAG') == 1 else f.replace('    uint16_t argc;\n#ifdef FOUR_DIAG', '    uint16_t argc;\n    ExtraPlans *extra;\n#ifdef FOUR_DIAG', 1)
    pos = f.index('static inline __exception int js_poll_interrupts')
    helpers = '''static FullPlan*multi_at(FourSite*s,unsigned i)
{return i==0?s->plan:(s->extra?s->extra->plan[i-1]:NULL);}
static int multi_same(FullPlan*p,JSValueConst c)
{return p && JS_VALUE_GET_TAG(c)==JS_TAG_OBJECT && JS_VALUE_GET_TAG(p->callee)==JS_TAG_OBJECT &&
    JS_VALUE_GET_OBJ(c)==JS_VALUE_GET_OBJ(p->callee);}
static FullPlan**multi_destination(JSContext*ctx,FourSite*s,JSValueConst c)
{
    if(!s->plan || multi_same(s->plan,c))return &s->plan;
    if(!s->extra){
        s->extra=js_mallocz_rt(ctx->rt,sizeof(*s->extra));
        if(!s->extra)return NULL;
        SCREEN(extra_allocations);SCREEN_ADD(extra_bytes,sizeof(*s->extra));
    }
    for(unsigned i=0;i<CTOR_CAPACITY-1;i++)if(multi_same(s->extra->plan[i],c))return &s->extra->plan[i];
    for(unsigned i=0;i<CTOR_CAPACITY-1;i++)if(!s->extra->plan[i])return &s->extra->plan[i];
    unsigned victim=s->extra->next;
    s->extra->next=(victim+1)%CTOR_CAPACITY;
    SCREEN(replacements);
    return victim==0?&s->plan:&s->extra->plan[victim-1];
}
static void multi_mark(JSRuntime*rt,FourSite*s,JS_MarkFunc*mark_func)
{
    JS_MarkValue(rt,s->negative,mark_func);
    for(unsigned i=0;i<CTOR_CAPACITY;i++){
        FullPlan*p=multi_at(s,i);if(!p)continue;
        JS_MarkValue(rt,p->callee,mark_func);
        if(p->initial)mark_func(rt,&p->initial->header);
        if(p->final)mark_func(rt,&p->final->header);
    }
}
static void multi_free(JSRuntime*rt,FourSite*s)
{
    JS_FreeValueRT(rt,s->negative);
    for(unsigned i=0;i<CTOR_CAPACITY;i++){
        FullPlan*p=multi_at(s,i);if(!p)continue;
        JS_FreeValueRT(rt,p->callee);js_free_shape_null(rt,p->initial);js_free_shape_null(rt,p->final);js_free_rt(rt,p);
    }
    js_free_rt(rt,s->extra);
}
'''
    f = f[:pos] + helpers + f[pos:]
    f = once(f, '    FullPlan*s=slot->plan;', '''    FullPlan**destination=multi_destination(ctx,slot,callee);
    if(!destination)return;
    FullPlan*s=*destination;''')
    f = once(f, '        slot->plan=s;FOLLOW(1);', '        *destination=s;FOLLOW(1);')
    s = once(s, '    return plan_try(ctx,s->plan,c,t,a,out);', '''    if(plan_try(ctx,s->plan,c,t,a,out))return 1;
    if(s->extra)for(unsigned i=0;i<CTOR_CAPACITY-1;i++){
        FullPlan*p=s->extra->plan[i];
        if(multi_same(p,c) && plan_try(ctx,p,c,t,a,out))return 1;
    }
    return 0;''')
    a = '            for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_MarkValue(rt,ss->negative,mark_func);FullPlan*fs=ss->plan;if(fs){JS_MarkValue(rt,fs->callee,mark_func);if(fs->initial)mark_func(rt,&fs->initial->header);if(fs->final)mark_func(rt,&fs->final->header);}}'
    q = once(q, a, '            for(uint32_t fi=0;fi<b->four_count;fi++)multi_mark(rt,&b->four_sites[fi],mark_func);')
    a = '    for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_FreeValueRT(rt,ss->negative);FullPlan*fs=ss->plan;if(fs){JS_FreeValueRT(rt,fs->callee);js_free_shape_null(rt,fs->initial);js_free_shape_null(rt,fs->final);js_free_rt(rt,fs);}}'
    q = once(q, a, '    for(uint32_t fi=0;fi<b->four_count;fi++)multi_free(rt,&b->four_sites[fi]);')
    d.update({'four_runtime.inc': f, 'sparse_runtime.inc': s, 'quickjs.c': q})
