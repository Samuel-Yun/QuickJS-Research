from common import *
def call(d):
 q=d['quickjs.c']
 q=once(q,'typedef struct FourSite FourSite;','typedef struct FourSite FourSite;\ntypedef struct R2CallSite R2CallSite;')
 q=once(q,'    FourSite *four_sites;','    FourSite *four_sites;\n    R2CallSite *r2_calls;')
 q=once(q,'    void *user_opaque;\n    ExEdge','    void *user_opaque;\n    uint8_t r2_call_mode;\n    ExEdge')
 q=once(q,'    rt->malloc_gc_threshold = 256 * 1024;','    const char*cm=getenv("QJS_CALL_MODE");rt->r2_call_mode=cm&&!strcmp(cm,"field")?3:cm&&!strcmp(cm,"ic")?2:cm&&!strcmp(cm,"direct")?1:0;\n    rt->malloc_gc_threshold = 256 * 1024;')
 # shared() inserts counter definitions BEFORE candidate helpers.
 q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "call_adapter.inc"')
 marker='            for(uint32_t fi=0;fi<b->four_count;fi++){FourSite*ss=&b->four_sites[fi];JS_MarkValue'
 q=once(q,marker,'            r2_call_mark(rt,b->r2_calls,mark_func);\n'+marker)
 q=once(q,'    rdi_free(rt, b);','    r2_call_free(rt,b->r2_calls);\n    rdi_free(rt, b);')
 anchor='                ret_val = JS_CallInternal(ctx, call_argv[-1], call_argv[-2],\n                                          JS_UNDEFINED, call_argc, call_argv, 0);'
 q=once(q,anchor,'                if(!r2_call_adapter(ctx,b,pc-3,call_argv[-1],call_argv[-2],call_argc,call_argv,&ret_val))\n'+anchor)
 d['quickjs.c']=q;d['call_adapter.inc']=(HERE/'call_adapter.inc').read_text()

def nested(d):
 d['nested_runtime.inc']=(HERE/'nested_runtime.inc').read_text()
 q=d['quickjs.c'];q=once(q,'#include "numeric_runtime.inc"','#include "numeric_runtime.inc"\n#include "nested_runtime.inc"')
 d['four_runtime.inc']=once(d['four_runtime.inc'],'    NumericPlan *numeric;','    NumericPlan *numeric;').replace('struct FourSite {','typedef struct NestedPlan NestedPlan;\nstruct FourSite {').replace('    uint16_t argc;\n#ifdef FOUR_DIAG','    uint16_t argc;\n    NestedPlan *nested;\n#ifdef FOUR_DIAG',1)
 q=once(q,'                if(!fast)fast=four_ctor_try','                if(!fast)fast=nest_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);\n                if(!fast)fast=four_ctor_try')
 q=once(q,'                    NumericSeed seed={0};','                    NestedSeed nz={0};\n                    if(!s->nested)nest_seed(ctx,s,call_argv[-2],call_argv[-1],&nz);\n                    NumericSeed seed={0};')
 q=once(q,'                    np_seed_free(ctx,&seed);','                    np_seed_free(ctx,&seed);\n                    if(!JS_IsException(ret_val))nest_learn(ctx,s,call_argv[-2],ret_val,&nz);\n                    nest_seed_free(ctx,&nz);')
 q=once(q,'    for(uint32_t fi=0;fi<b->four_count;fi++)np_release','    for(uint32_t fi=0;fi<b->four_count;fi++)nest_release(rt,b->four_sites[fi].nested);\n    for(uint32_t fi=0;fi<b->four_count;fi++)np_release')
 anchor='            for(uint32_t fi=0;fi<b->four_count;fi++){NumericPlan*n='
 q=once(q,anchor,'            for(uint32_t fi=0;fi<b->four_count;fi++)nest_mark(rt,b->four_sites[fi].nested,mark_func);\n'+anchor)
 q=once(q,'    void *user_opaque;\n    ExEdge','    void *user_opaque;\n    uint8_t r2_nested_mode;\n    ExEdge')
 q=once(q,'    rt->malloc_gc_threshold = 256 * 1024;','    const char*nm=getenv("QJS_NEST_MODE");rt->r2_nested_mode=nm&&!strcmp(nm,"parent")?1:2;\n    rt->malloc_gc_threshold = 256 * 1024;')
 d['quickjs.c']=q
