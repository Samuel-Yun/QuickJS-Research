import argparse, tempfile, subprocess, importlib.util,sys
from common import *
OLDROOT=ROOT/'experiments/ic_execution_plans_20261125/attempt01'
def parent_numeric():
 m=json.loads((OLDROOT/'01_forward_numeric/NUMERIC_PLAN.release.manifest.json').read_text());d={}
 for n,h in m['sources'].items():
  p=Path(m['binary']).parent/n;assert sha(p)==h;d[n]=p.read_text()
 return d

def instance(d):
 with tempfile.TemporaryDirectory() as td:
  p=Path(td);(p/'quickjs.c').write_text(d['quickjs.c'])
  r=subprocess.run(['patch','-p1','-i',str(HERE/'bundle/instanceof-slot.patch')],cwd=p,capture_output=True,text=True);assert not r.returncode,r.stdout+r.stderr
  q=(p/'quickjs.c').read_text()
 q=once(q,'typedef struct InstancePrototypeSlot {','typedef struct R2Hook R2Hook;\ntypedef struct InstancePrototypeSlot {')
 q=once(q,'    uint8_t instance_mode;','    uint8_t instance_mode;\n    R2Hook *r2_hooks;uint64_t r2_epoch;')
 q=once(q,'static void ex_edge_clear(JSRuntime *rt);','static void ex_edge_clear(JSRuntime *rt);\nstatic void r2_hook_free(JSRuntime*);')
 q=once(q,'    uint8_t is_HTMLDDA : 1;', '    uint8_t r2_hook_watch : 1;\n    uint8_t is_HTMLDDA : 1;')
 q=once(q,'    p->is_HTMLDDA = 0;','    p->is_HTMLDDA = 0;\n    p->r2_hook_watch = 0;')
 q=once(q,'rt->instance_mode = instance_setting && !strcmp(instance_setting, "cached") ? 2 :','rt->instance_mode = instance_setting && !strcmp(instance_setting,"hook") ? 3 : instance_setting && !strcmp(instance_setting, "cached") ? 2 :')
 q=once(q,'    ex_edge_clear(rt);\n    JS_FreeValueRT(rt, rt->current_exception);','    r2_hook_free(rt);\n    ex_edge_clear(rt);\n    JS_FreeValueRT(rt, rt->current_exception);')
 q=once(q,'/* Always validate the current descriptor.','#include "instance_hook.inc"\n\n/* Always validate the current descriptor.')
 q=once(q,'if (ctx->rt->instance_mode == 2)', 'if (ctx->rt->instance_mode >= 2)')
 q=once(q,'                return &ctor->prop[entry->offset];','                {R2C(ctx,site,5);return &ctor->prop[entry->offset];}')
 q=once(q,'        entry->site = site;','        entry->site = site;R2C(ctx,site,6);')
 q=once(q,'    if (!JS_IsObject(val))\n        return FALSE;','    if (!JS_IsObject(val))\n        {R2C(ctx,site,7);return FALSE;}')
 q=once(q,'        return TRUE;\n    return -1;\n}\n\nstatic int js_instanceof_at','        {R2C(ctx,site,8);return TRUE;}\n    return -1;\n}\n\nstatic int js_instanceof_at')
 q=once(q,'    method = JS_GetProperty(ctx, obj, JS_ATOM_Symbol_hasInstance);','    if(site)R2C(ctx,site,0);\n    if(!(site && ctx->rt->instance_mode==3 && r2_hook_load(ctx,obj,site,&method))){\n        if(site)R2C(ctx,site,9);\n        method = JS_GetProperty(ctx, obj, JS_ATOM_Symbol_hasInstance);\n        if(site && ctx->rt->instance_mode==3 && !JS_IsException(method))r2_hook_learn(ctx,obj,site);\n    }')
 # Invalidate BEFORE structural changes. Same data-slot writes do not alter path.
 q=once(q,'    uint32_t idx = 0;    /* prevent warning */\n\n    sh = p->shape;\n    if (sh->is_hashed) {','    uint32_t idx = 0;    /* prevent warning */\n\n    if(unlikely(p->r2_hook_watch)){\n        if(++ctx->rt->r2_epoch==0){ctx->rt->r2_epoch=1;if(ctx->rt->r2_hooks)for(unsigned n=0;n<64;n++)ctx->rt->r2_hooks[n].epoch=0;}\n    }\n    sh = p->shape;\n    if (sh->is_hashed) {')
 anchor='JSObject *p, JSAtom prop, int prop_flags)\n{\n    JSShape *sh, *new_sh;'
 q=once(q,anchor,anchor+'\n    if(unlikely(p->r2_hook_watch)){if(++ctx->rt->r2_epoch==0){ctx->rt->r2_epoch=1;if(ctx->rt->r2_hooks)for(unsigned n=0;n<64;n++)ctx->rt->r2_hooks[n].epoch=0;}}')
 d['quickjs.c']=q;d['instance_hook.inc']=(HERE/'instance_hook.inc').read_text();return d

def shared(d):
 d['r2_counts.inc']=(HERE/('r2_counts.inc' if 'call_adapter.inc' in d else 'r2_counts_legacy.inc')).read_text();d['quickjs.c']=once(d['quickjs.c'],'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "r2_counts.inc"')
 return d

def diagnostics(d,label):
 if label=='NESTED':
  spec=importlib.util.spec_from_file_location('oldbuild',OLDROOT/'build.py');v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v);v.NUMDIR=OLDROOT/'01_forward_numeric';v.numeric_diagnostics(d,'NUMERIC_PLAN')
 d['four_diag.inc']=once(d['four_diag.inc'],'void four_end(void)','static void r2_report(void);\nvoid four_end(void)')
 d['four_diag.inc']=once(d['four_diag.inc'],'    four_active=0;','    r2_report();four_active=0;')
 instrument(d)

def main():
 ap=argparse.ArgumentParser();ap.add_argument('labels',nargs='*',default=['INSTANCE']);ap.add_argument('--modes',nargs='+',default=['release']);a=ap.parse_args()
 for label in a.labels:
  for mode in a.modes:
   d=parent_numeric() if label=='NESTED' else base()
   if label=='INSTANCE':instance(d)
   elif label=='CALL':
    from candidates import call;call(d)
   elif label=='NESTED':
    from candidates import nested;nested(d)
   elif label!='SPARSE':raise ValueError(label)
   shared(d);folder=HERE/({'INSTANCE':'01_instance_hook','CALL':'02_call_adapter','NESTED':'03_nested_plan','SPARSE':'01_instance_hook'}[label])
   if mode=='counts':diagnostics(d,label)
   else:
    patch(label,d,folder)
    if label=='NESTED':
     import difflib
     b=parent_numeric();(folder/'NUMERIC_PLAN-to-NESTED.patch').write_text(''.join(''.join(difflib.unified_diff(b.get(n,'').splitlines(True),t.splitlines(True),fromfile='a/'+n,tofile='b/'+n))for n,t in d.items()if t!=b.get(n)))
   build(label,d,mode,folder)
if __name__=='__main__':main()
