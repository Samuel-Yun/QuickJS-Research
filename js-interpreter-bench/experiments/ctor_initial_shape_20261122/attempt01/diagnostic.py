"""Instrument outcomes without changing VM layouts or retaining targets."""
from candidates import once


def instrument(d,here,label):
    f,q,s=(d[n] for n in ['four_runtime.inc','quickjs.c','sparse_runtime.inc'])
    free='reserved_initial' in f
    pos=f.index('\n};',f.index('struct FullPlan {'))+3
    f=f[:pos]+'\n#include "ctor_trace.h"\n'+f[pos:]
    start=f.index('static int plan_slow_eligible(');end=f.index('\nstatic void plan_learn',start)
    head=f[start:f.index('\n{',start)]
    body='''
{
    JSObject*f,*proto;FourRecipe r;
    if(!plan_base(ctx,callee,target,argc,&f) || !plan_recipe(f->u.func.function_bytecode,&r) ||
       !(proto=plan_proto(f))){trace_fail(T_pre_other);return 0;}
'''
    if not free:body+='    if(!find_hashed_shape_proto(ctx->rt,proto)){trace_fail(T_before_initial);return 0;}\n'
    body+='    if(!plan_chain(proto,&r)){trace_fail(T_pre_other);return 0;}\n    return 1;\n}'
    f=f[:start]+head+body+f[end:]
    start=f.index('static void plan_learn(');end=f.index('    FOUR_COUNT(slot,eligible);',start)
    head=f[start:f.index('\n{',start)]
    body='''
{
    if(JS_VALUE_GET_TAG(callee)!=JS_TAG_OBJECT){trace_fail(T_post_other);return;}
    if(JS_VALUE_GET_TAG(result)!=JS_TAG_OBJECT){trace_fail(T_result_layout);return;}
    JSObject*f=JS_VALUE_GET_OBJ(callee),*o=JS_VALUE_GET_OBJ(result),*proto;FourRecipe r;
    if(f->class_id!=JS_CLASS_BYTECODE_FUNCTION || !plan_recipe(f->u.func.function_bytecode,&r) ||
       !(proto=plan_proto(f)) || !plan_chain(proto,&r)){trace_fail(T_post_other);return;}
    if(o->class_id!=JS_CLASS_OBJECT || o->is_exotic || !o->shape->is_hashed || o->shape->proto!=proto ||
       o->shape->prop_count!=r.n || o->shape->deleted_prop_count){trace_fail(T_result_layout);return;}
    JSShapeProperty*d=get_shape_prop(o->shape);
    for(unsigned i=0;i<r.n;i++)if(d[i].atom!=r.atom[i] || d[i].flags!=JS_PROP_C_W_E){trace_fail(T_result_layout);return;}
'''
    if not free:body+='    JSShape*initial=find_hashed_shape_proto(ctx->rt,proto);if(!initial){trace_fail(T_after_initial);return;}\n'
    f=f[:start]+head+body+f[end:]
    f=f.replace('if(!s){FOLLOW(4);return;}','if(!s){trace_fail(T_allocation);FOLLOW(4);return;}')
    f=f.replace('    if(!destination)return;','    if(!destination){trace_fail(T_allocation);return;}')
    f=f.replace('    if(slot->plan && !s)return;','    if(slot->plan && !s){trace_fail(T_allocation);return;}')
    a='    JSValue old=s->callee;'
    f=once(f,a,'    trace_publish(slot,s,callee);\n'+a)
    assert f.count('FOUR_COUNT(s,h);')==2
    f=f.replace('FOUR_COUNT(s,h);','trace_hit(s);FOUR_COUNT(s,h);')
    if 'pair->primary=*p;' in f:
        f=once(f,'pair->primary=*p;','pair->primary=*p;trace_move(p,&pair->primary);')
    s=once(s,'if(sparse_same(s,c)){FOLLOW(2);return 0;}',
        'if(sparse_same(s,c)){trace_fail(T_negative);FOLLOW(2);return 0;}')
    a='                int fast=four_ctor_try('
    q=once(q,a,'''                TraceContext trace_frame;
                trace_enter(ctx,b,s,call_argv[-2],&trace_frame);
'''+a)
    a='''                if(unlikely(JS_IsException(ret_val))){
                    if(fast){'''
    q=once(q,a,'''                if(JS_IsException(ret_val))trace_fail(T_exceptions);
                trace_current=trace_frame.previous;
'''+a)
    q=once(q,'static void free_object(JSRuntime *rt, JSObject *p)\n{',
        'static void free_object(JSRuntime *rt, JSObject *p)\n{\n    trace_object_free(p);')
    q=once(q,'static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{',
        'static void free_function_bytecode(JSRuntime *rt, JSFunctionBytecode *b)\n{\n    trace_bytecode_free(b);')
    d.update({'four_runtime.inc':f,'quickjs.c':q,'sparse_runtime.inc':s,
              'ctor_trace.h':(here/'ctor_trace.h').read_text()})
