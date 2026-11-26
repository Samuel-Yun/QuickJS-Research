from common import *
def compare(d,label):
 folder=HERE/'02_compare_branch';q=d['quickjs.c']
 q=once(q,'typedef struct FourSite FourSite;','typedef struct FourSite FourSite;\ntypedef struct CompareSite CompareSite;')
 q=once(q,'    uint32_t four_count;','    uint32_t four_count;\n    CompareSite *compare_sites;\n    uint16_t *compare_map;\n    uint32_t compare_count;')
 prefix='#define COMPARE_REUSE '+('1' if label=='COMPARE_FULL' else '0')+'\n'+('#define COMPARE_OBSERVE 1\n' if label=='COMPARE_PROFILE' else '')
 q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n'+prefix+'#include "compare_runtime.inc"')
 q=once(q,'#include "four_prepare.inc"','#include "four_prepare.inc"\n#include "compare_prepare.inc"')
 handler='''        CASE(OP_compare1):
        CASE(OP_compare2):
        CASE(OP_compare3):
            {
                const uint8_t *start=pc-1;
                CompareSite *cs=&b->compare_sites[b->compare_map[start-b->byte_code_buf]-1];
                JSValueConst aa=cs->a_arg?arg_buf[cs->a]:var_buf[cs->a];
                JSValueConst oo=(cs->b_arg&1)?arg_buf[cs->b]:var_buf[cs->b];
                uint32_t next;
                int result=compare_try(ctx,cs,aa,oo,&next);
                if(result<0)goto exception;
                if(result)pc=b->byte_code_buf+next;
                else{
                    /* Original first load, same DupValue and next PC. */
                    *sp++=JS_DupValue(ctx,aa);
                    pc=start+cs->size;
                }
            }
            BREAK;
'''
 q=once(q,'        CASE(OP_four_ctor):',handler+'        CASE(OP_four_ctor):')
 anchor='        if (op == OP_v6_get_loc0) { op = OP_get_loc0; bc_buf[pos] = op; }'
 q=once(q,anchor,'        if(op==OP_compare1||op==OP_compare2||op==OP_compare3){op=b->compare_sites[b->compare_map[pos]-1].original;bc_buf[pos]=op;}\n'+anchor)
 q=once(q,'if (op == OP_four_ctor || op == OP_get_field_rdi','if (op==OP_compare1 || op==OP_compare2 || op==OP_compare3 || op == OP_four_ctor || op == OP_get_field_rdi')
 d['quickjs.c']=q
 d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'DEF(four_ctor,3,0,0,u16)','DEF(four_ctor,3,0,0,u16)\nDEF(compare1,1,0,0,none)\nDEF(compare2,2,0,0,u8)\nDEF(compare3,3,0,0,u16)')
 d['compare_runtime.inc']=(folder/'compare_runtime.inc').read_text();d['compare_prepare.inc']=(folder/'compare_prepare.inc').read_text()
 d['read_ic_prepare.inc']=once(d['read_ic_prepare.inc'],'+ four_extra_size(b);','+ four_extra_size(b) + compare_extra_size(b);').replace('    four_prepare(ctx,b);','    four_prepare(ctx,b);\n    compare_prepare(ctx,b);')

def transform(d,label):
 if label.startswith('COMPARE_'):compare(d,label)
 else:coalloc(d,label)
def coalloc(d,label):
 folder=HERE/'03_ctor_coalloc';q=d['quickjs.c']
 # Both flags fit in the second pre-existing flag byte; no object grows.
 q=once(q,'    uint8_t is_HTMLDDA : 1; /* specific annex B IsHtmlDDA behavior */',
  '    uint8_t is_HTMLDDA : 1; /* specific annex B IsHtmlDDA behavior */\n    uint8_t co_props : 1;\n    uint8_t co_capacity : 4;\n#ifdef FOUR_DIAG\n    uint8_t ep_plan : 1;\n#endif')
 q=once(q,'    p->is_HTMLDDA = 0;','    p->is_HTMLDDA = 0;\n    p->co_props=0;p->co_capacity=0;\n#ifdef FOUR_DIAG\n    p->ep_plan=0;\n#endif')
 if label=='COALLOC_PROFILE':d['quickjs.c']=q;return
 selection=json.loads((folder/'capacity_selection.json').read_text());limit=selection['limit'];assert 0<limit<=15
 q=once(q,'#include "edge_strong_helpers.inc"','#include "edge_strong_helpers.inc"\n#include "coalloc_storage.inc"')
 q=once(q,'#include "four_runtime.inc"','#include "coalloc_runtime.inc"\n#include "four_runtime.inc"')
 q=once(q,'        new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);','        new_prop = co_realloc(ctx, p, sizeof(new_prop[0]) * new_size);')
 q=once(q,'    new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);','    new_prop = co_realloc(ctx, p, sizeof(new_prop[0]) * new_size);')
 q=once(q,'new_prop = js_realloc(ctx, p->prop, sizeof(p->prop[0]) *\n                                      new_sh->prop_size);','new_prop = co_realloc(ctx, p, sizeof(p->prop[0]) *\n                                      new_sh->prop_size);')
 q=once(q,'    js_free_rt(rt, p->prop);','    if(!p->co_props)js_free_rt(rt, p->prop);')
 q=once(q,'            s->memory_used_count++;\n            s->prop_size += sh->prop_size * sizeof(*p->prop);','            if(!p->co_props)s->memory_used_count++;\n            /* A migrated combined object still owns its unused tail. */\n            if(p->co_capacity&&!p->co_props)s->obj_size+=(size_t)p->co_capacity*sizeof(*p->prop);\n            s->prop_size += sh->prop_size * sizeof(*p->prop);')
 f=d['four_runtime.inc'];a='*out=JS_NewObjectFromShape(ctx,js_dup_shape(s->final),JS_CLASS_OBJECT,NULL);'
 f=once(f,a,f'*out=co_enabled&&s->final->prop_size<={limit}?co_new(ctx,js_dup_shape(s->final)):JS_NewObjectFromShape(ctx,js_dup_shape(s->final),JS_CLASS_OBJECT,NULL);')
 d['four_runtime.inc']=f;d['quickjs.c']=q;d['coalloc_runtime.inc']=(folder/'coalloc_runtime.inc').read_text();d['coalloc_storage.inc']=(folder/'coalloc_storage.inc').read_text()
 d['qjs.c']=once(d['qjs.c'],'#include "quickjs-libc.h"','#include "quickjs-libc.h"\nextern void coalloc_entry_mode(int);')
 d['qjs.c']=once(d['qjs.c'],'    js_std_add_helpers(ctx, argc - optind, argv + optind);','    coalloc_entry_mode(getenv("QJS_CTOR_COALLOC_OFF")!=NULL);\n    js_std_add_helpers(ctx, argc - optind, argv + optind);')
def co_diagnostics(d,label):
 q=d['quickjs.c'];folder=HERE/'03_ctor_coalloc'
 q=once(q,'#include "edge_strong_helpers.inc"','#include "coalloc_diag.inc"\n#include "edge_strong_helpers.inc"')
 q=once(q,'void JS_RunGC(JSRuntime *rt)\n{','void JS_RunGC(JSRuntime *rt)\n{\n    if(four_active)co_gc++;')
 # Three existing realloc sites, count only arrays belonging to plan hits.
 if label=='COALLOC_PROFILE':
  q=once(q,'        new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);','        co_resize_event(p,sizeof(new_prop[0])*new_size);\n        new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);')
  q=once(q,'\n    new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);','\n    co_resize_event(p,sizeof(new_prop[0])*new_size);\n    new_prop = js_realloc(ctx, p->prop, sizeof(new_prop[0]) * new_size);')
  q=once(q,'                new_prop = js_realloc(ctx, p->prop, sizeof(p->prop[0]) *','                co_resize_event(p,sizeof(p->prop[0])*new_sh->prop_size);\n                new_prop = js_realloc(ctx, p->prop, sizeof(p->prop[0]) *')
 else:
  s=d['coalloc_storage.inc'];s=once(s,' if(!p->co_props)return js_realloc(ctx,p->prop,bytes);',' co_resize_event(p,bytes);\n if(!p->co_props)return js_realloc(ctx,p->prop,bytes);');s=once(s,' p->prop=n;p->co_props=0;',' co_moved(bytes);\n p->prop=n;p->co_props=0;');d['coalloc_storage.inc']=s
 d['quickjs.c']=q;d['coalloc_diag.inc']=(folder/'coalloc_diag.inc').read_text()
 d['four_runtime.inc']=once(d['four_runtime.inc'],'        JSObject*o=JS_VALUE_GET_OBJ(*out);','        JSObject*o=JS_VALUE_GET_OBJ(*out);co_plan(o);')
 d['four_diag.inc']=once(d['four_diag.inc'],'    four_active=0;uint64_t','    four_active=0;co_report();uint64_t')
def diagnostics(d,label):
 if label.startswith('COMPARE_'):
  q=d['quickjs.c']
  for op,size in [('if_false',4),('if_false8',1)]:
   a=q.index(f'        CASE(OP_{op}):');z=q.index('            BREAK;',a)
   chunk=q[a:z];chunk=once(chunk,'                sp--;',f'                compare_false(b,(unsigned)(pc-b->byte_code_buf-{size+1}),res);\n                sp--;');q=q[:a]+chunk+q[z:]
  # Count ordinary/fused second logical reads exactly once.
  a='        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));'
  q=once(q,'            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);','            compare_read(b,(unsigned)(pc-b->byte_code_buf)); \\\n            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);')
  r=d['read_ic_opcodes.inc'];r=once(r,'        pc += 4;', '        if(!keep)compare_read(b,(unsigned)(pc-b->byte_code_buf-1)); \\\n        pc += 4;')
  d['read_ic_opcodes.inc']=r;d['quickjs.c']=q
 else:co_diagnostics(d,label)
