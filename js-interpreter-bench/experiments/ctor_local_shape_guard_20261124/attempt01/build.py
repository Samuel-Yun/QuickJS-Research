"""Independent CTOR_LOCAL_SHAPE_GUARD from the frozen 06aada4 SPARSE."""
import argparse
import difflib
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PACKAGE=ROOT/'on_demand_ctor_cache'
LABELS=['SPARSE','CTOR_LOCAL_SHAPE_GUARD']


def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):Path(p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def once(s,a,b):
    assert s.count(a)==1,(s.count(a),a[:100]);return s.replace(a,b)


def candidate(d):
    f,q=d['four_runtime.inc'],d['quickjs.c']
    f=once(f,'typedef struct FullPlan FullPlan;', '''typedef struct FullPlan FullPlan;
typedef struct LocalShapeGuard {
    JSShape *callee_shape;
    JSShape *chain[4];
    uint32_t prototype_offset;
    uint8_t depth;
} LocalShapeGuard;''')
    f=once(f,'struct FullPlan {','struct FullPlan {')
    start=f.index('struct FullPlan {');pos=f.index('#ifdef FOUR_DIAG',start)
    f=f[:pos]+'    LocalShapeGuard *local;\n'+f[pos:]
    anchor='static inline __exception int js_poll_interrupts(JSContext*ctx);'
    f=once(f,anchor,'#include "local_shape_guard.inc"\n'+anchor)
    anchor='static int plan_base('
    wrapper='''/* A failed optional guard falls back to the complete old check. */
static force_inline int plan_validate_proto(JSObject *f, FullPlan *s)
{
    if (s->local) {
        LSG_COUNT(local_attempts);
        if (local_shape_guard_matches(f, s)) {
            LSG_COUNT(local_successes);
#ifdef CTOR_LOCAL_DIAG
            lsg_this_local = 1;
#endif
            return 1;
        }
        LSG_COUNT(local_failures);
    } else {
        LSG_COUNT(no_local_record);
    }
    LSG_FULL_BEGIN();
    int ok = plan_proto(f) == s->final->proto && plan_chain(s->final->proto, &s->recipe);
    LSG_FULL_END(ok);
    return ok;
}
'''
    f=once(f,anchor,wrapper+anchor)
    f=once(f,'       plan_proto(f)==s->final->proto && plan_chain(s->final->proto,&s->recipe)){',
             '       plan_validate_proto(f,s)){')
    f=once(f,'    JSValue old=s->callee;JSShape*oldinitial=s->initial,*oldfinal=s->final;',
             '    LocalShapeGuard *local=local_shape_guard_build(ctx,f,proto), *oldlocal=s->local;\n'
             '    JSValue old=s->callee;JSShape*oldinitial=s->initial,*oldfinal=s->final;')
    f=once(f,'    JSValue negative=slot->negative;slot->negative=JS_UNDEFINED;',
             '    s->local=local;\n    JSValue negative=slot->negative;slot->negative=JS_UNDEFINED;')
    f=once(f,'    JS_FreeValue(ctx,old);js_free_shape_null(ctx->rt,oldinitial);js_free_shape_null(ctx->rt,oldfinal);',
             '    JS_FreeValue(ctx,old);js_free_shape_null(ctx->rt,oldinitial);js_free_shape_null(ctx->rt,oldfinal);\n'
             '    local_shape_guard_free(ctx->rt,oldlocal);')
    q=once(q,'if(fs->final)mark_func(rt,&fs->final->header);}}',
             'if(fs->final)mark_func(rt,&fs->final->header);'
             'if(fs->local){mark_func(rt,&fs->local->callee_shape->header);'
             'for(unsigned li=0;li<fs->local->depth;li++)mark_func(rt,&fs->local->chain[li]->header);}}}')
    q=once(q,'js_free_shape_null(rt,fs->final);js_free_rt(rt,fs);',
             'js_free_shape_null(rt,fs->final);local_shape_guard_free(rt,fs->local);js_free_rt(rt,fs);')
    d.update({'four_runtime.inc':f,'quickjs.c':q,'local_shape_guard.inc':(HERE/'local_shape_guard.inc').read_text()})


def instrument(d,label):
    f,q,s=d['four_runtime.inc'],d['quickjs.c'],d['sparse_runtime.inc']
    anchor='static inline __exception int js_poll_interrupts(JSContext*ctx);'
    # The diagnostic include must precede local_shape_guard.inc to define macros.
    if label!='SPARSE':anchor='#include "local_shape_guard.inc"'
    f=once(f,anchor,('#define LSG_HAS_LOCAL 1\n' if label!='SPARSE' else '')+
           '#include "ctor_local_diag.inc"\n'+anchor)
    q='#define CTOR_LOCAL_DIAG 1\n'+q
    f=once(f,'    JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,f,JS_ATOM_prototype);',
           '    LSG_COUNT(proto_lookups_all);if(lsg_full_depth)LSG_COUNT(proto_lookups_hot);\n'
           '    JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,f,JS_ATOM_prototype);')
    f=once(f,'            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);',
           '            LSG_COUNT(chain_lookups_all);if(lsg_full_depth)LSG_COUNT(chain_lookups_hot);\n'
           '            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);')
    if label=='SPARSE':
        anchor='static int plan_base('
        wrapper='''static int diagnostic_original_check(JSObject *f,FullPlan *s)
{
    LSG_COUNT(no_local_record);LSG_FULL_BEGIN();
    int ok=plan_proto(f)==s->final->proto && plan_chain(s->final->proto,&s->recipe);
    LSG_FULL_END(ok);return ok;
}
'''
        f=once(f,anchor,wrapper+anchor)
        f=once(f,'       plan_proto(f)==s->final->proto && plan_chain(s->final->proto,&s->recipe)){',
               '       diagnostic_original_check(f,s)){')
    # Split diagnostic qualifications to distinguish the original initial gate.
    a='''    if(!plan_base(ctx,callee,target,argc,&f) || !plan_recipe(f->u.func.function_bytecode,&r) ||
       !(proto=plan_proto(f)) || !find_hashed_shape_proto(ctx->rt,proto))return 0;'''
    b='''    if(!plan_base(ctx,callee,target,argc,&f) || !plan_recipe(f->u.func.function_bytecode,&r) ||
       !(proto=plan_proto(f))){LSG_COUNT(other_pre_failure);return 0;}
    if(!find_hashed_shape_proto(ctx->rt,proto)){LSG_COUNT(before_initial_missing);return 0;}'''
    f=once(f,a,b)
    f=once(f,'JSShape*initial=find_hashed_shape_proto(ctx->rt,proto);if(!initial)return;',
           'JSShape*initial=find_hashed_shape_proto(ctx->rt,proto);if(!initial){LSG_COUNT(after_initial_missing);return;}')
    f=once(f,'        if(!s){FOLLOW(4);return;}',
           '        if(!s){LSG_COUNT(plan_allocation_failures);FOLLOW(4);return;}\n        LSG_COUNT(plan_allocations);')
    f=once(f,'    JSValue negative=slot->negative;',
           '    LSG_COUNT(plan_publications);\n    JSValue negative=slot->negative;')
    f=once(f,'    FOUR_COUNT(s,q);','    lsg_this_local=0;\n    FOUR_COUNT(s,q);')
    hit='''        LSG_COUNT(positive_hits);
'''+('''        if(s->local)LSG_COUNT(positive_hits_with_record);
        if(lsg_this_local)LSG_COUNT(positive_hits_local);
''' if label!='SPARSE' else '')
    f=once(f,'        JSObject*o=JS_VALUE_GET_OBJ(*out);',hit+'        JSObject*o=JS_VALUE_GET_OBJ(*out);')
    s=once(s,'    if(!s->plan){FOUR_COUNT(s,q);',
           '    LSG_COUNT(calls);\n    if(!s->plan){FOUR_COUNT(s,q);')
    d.update({'four_runtime.inc':f,'quickjs.c':q,'sparse_runtime.inc':s,'ctor_local_diag.inc':(HERE/'ctor_local_diag.inc').read_text()})


def main():
    ap=argparse.ArgumentParser();ap.add_argument('--labels',nargs='+',default=LABELS)
    ap.add_argument('--modes',nargs='+',default=['release','counts']);a=ap.parse_args()
    manifest=json.loads((PACKAGE/'manifest.json').read_text());base={}
    for n,h in manifest['modified'].items():
        p=PACKAGE/'modified'/n;assert sha(p)==h,n;base[n]=p.read_text()
    new=dict(base);candidate(new)
    patch=''.join(''.join(difflib.unified_diff(base.get(n,'').splitlines(True),t.splitlines(True),
        fromfile='a/'+n if n in base else '/dev/null',tofile='b/'+n)) for n,t in new.items() if t!=base.get(n))
    (HERE/'SPARSE-to-CTOR_LOCAL_SHAPE_GUARD.patch').write_text(patch)
    for label in a.labels:
        for mode in a.modes:
            stamp=HERE/f'{label}.{mode}.manifest.json'
            if stamp.exists():
                m=json.loads(stamp.read_text());assert sha(m['binary'])==m['binary_sha256']
                for n,h in m['sources'].items():assert sha(Path(m['binary']).parent/n)==h,n
                print('BUILD_EXISTS',label,mode,flush=True);continue
            d=dict(base if label=='SPARSE' else new)
            if mode=='counts':instrument(d,label)
            dest=HERE/'work'/f'{label}.{mode}';dest.mkdir(parents=True,exist_ok=False)
            for n,t in d.items():
                p=dest/n;p.parent.mkdir(parents=True,exist_ok=True)
                crlf=manifest['modified_line_endings'].get(n)=='CRLF'
                p.write_bytes(t.replace('\n','\r\n' if crlf else '\n').encode())
            command=['make','-j2','-o','repl.c']
            if mode=='sanitize':command+=['CONFIG_ASAN=y','CONFIG_UBSAN=y']
            command+=['qjs','qjsc']
            with (HERE/f'{label}.{mode}.build.log').open('w') as log:
                subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
            save(stamp,dict(label=label,mode=mode,instrumented=mode=='counts',sanitized=mode=='sanitize',
                binary=str(dest/'qjs'),binary_sha256=sha(dest/'qjs'),command=command,
                sources={n:sha(dest/n) for n in d},parent='frozen 06aada4 SPARSE_CTOR_IC'))
            print('BUILD_PASS',label,mode,flush=True)


if __name__=='__main__':main()
