"""Independent frozen SPARSE parent; no previous candidate imported."""
import argparse,difflib,hashlib,json,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PACKAGE=ROOT/'on_demand_ctor_cache'
LABELS=['SPARSE','STORE_TRANSITION_IC']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):Path(p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def once(s,a,b):
 assert s.count(a)==1,(s.count(a),a[:120]);return s.replace(a,b)

def transform(d,enabled=True,counts=False):
 q=d['quickjs.c']
 q=once(q,'#include "read_ic_types.h"','#include "read_ic_types.h"\n#define STORE_TRANSITION_ENABLED '+str(int(enabled))+'\n'+('#define STORE_DIAGNOSTIC 1\n' if counts else '')+'#include "store_transition_types.h"')
 if enabled:q=once(q,'    ReadICSite *read_ic_sites;','    StoreSite *store_sites;\n    uint32_t store_count;\n    ReadICSite *read_ic_sites;')
 # Prototype visible to observed JS setter and original add_property callers.
 anchor='static JSProperty *add_property(JSContext *ctx,'
 idx=q.index(anchor);q=q[:idx]+'''static JSProperty *add_property_observed(JSContext *ctx, JSObject *p,
    JSAtom prop, int prop_flags, StoreObservation *observation);
static void st_capture(JSContext *ctx, StoreObservation *o, JSObject *p,
    JSShape *from, JSShape *to, JSAtom atom, int flags);
'''+q[idx:]
 q=once(q,'#include "four_runtime.inc"','#include "four_runtime.inc"\n#include "store_transition_runtime.inc"')
 # Rename only definition, keep original API as a NULL-observation wrapper.
 anchor='''static JSProperty *add_property(JSContext *ctx,
                                JSObject *p, JSAtom prop, int prop_flags)
{'''
 q=once(q,anchor,'''static JSProperty *add_property(JSContext *ctx, JSObject *p, JSAtom prop, int flags)
{ return add_property_observed(ctx, p, prop, flags, NULL); }
static JSProperty *add_property_observed(JSContext *ctx,
    JSObject *p, JSAtom prop, int prop_flags, StoreObservation *observation)
{
    if (observation) ST_EVENT(observation->diag, add_calls);''')
 q=once(q,'            /* matching shape found: use it */','            st_capture(ctx, observation, p, sh, new_sh, prop, prop_flags);\n            /* matching shape found: use it */')
 anchor='''int JS_SetPropertyInternal(JSContext *ctx, JSValueConst obj,
                           JSAtom prop, JSValue val, JSValueConst this_obj, int flags)
{'''
 q=once(q,anchor,'''int JS_SetPropertyInternal(JSContext *ctx, JSValueConst obj,
    JSAtom prop, JSValue val, JSValueConst this_obj, int flags)
{ return js_set_property_observed(ctx, obj, prop, val, this_obj, flags, NULL); }
static int js_set_property_observed(JSContext *ctx, JSValueConst obj,
    JSAtom prop, JSValue val, JSValueConst this_obj, int flags, StoreObservation *observation)
{''')
 anchor=''' retry:
    prs = find_own_property(&pr, p1, prop);
    if (prs) {'''
 q=once(q,anchor,anchor+'\n        if (observation) ST_EVENT(observation->diag, own_existing_slow);')
 if counts:
  q=once(q,'int flags, StoreObservation *observation)\n{','int flags, StoreObservation *observation)\n{\n    int st_existing_seen = 0;')
  q=once(q,'if (observation) ST_EVENT(observation->diag, own_existing_slow);','if (observation && !st_existing_seen) { st_existing_seen = 1; ST_EVENT(observation->diag, own_existing_slow); }')
 anchor='''            pr = add_property(ctx, p, prop, JS_PROP_C_W_E);'''
 q=once(q,anchor,'''            if (observation) ST_EVENT(observation->diag, new_own);
            pr = add_property_observed(ctx, p, prop, JS_PROP_C_W_E, observation);''')
 if enabled:
  q=once(q,'#include "read_ic_prepare.inc"','#define rdi_prepare rdi_prepare_inner\n#include "read_ic_prepare.inc"\n#undef rdi_prepare\n#include "store_transition_prepare.inc"')
  q=once(q,'    rdi_free(rt, b);','    st_free(rt, b);\n    rdi_free(rt, b);')
  anchor='            for (uint32_t ri = 0; ri < b->read_ic_count; ri++) {'
  q=once(q,anchor,'''            for (uint32_t si = 0; si < b->store_count; si++) {
                StoreSite *s = &b->store_sites[si];
                if (s->from) mark_func(rt, &s->from->header);
                if (s->to) mark_func(rt, &s->to->header);
                for (int j = 0; j < s->depth; j++) mark_func(rt, &s->chain[j]->header);
            }
'''+anchor)
  handler='''        CASE(OP_put_field_sti):
            {
                StoreSite *site = &b->store_sites[get_u32(pc)];
                JSValue obj = sp[-2];
                pc += 4;
                StDiag *d = ST_POINT(b, site->pc, site->atom, 0);
                ST_EVENT(d, writes); ST_EVENT(d, ordinary_writes);
                if (st_try(ctx, site, obj, sp[-1], d)) {
                    JS_FreeValue(ctx, obj); sp -= 2; BREAK;
                }
                sf->cur_pc = pc;
                ST_EVENT(d, slow_calls);
                int ret = st_slow(ctx, site, d, obj, site->atom, sp[-1]);
                JS_FreeValue(ctx, obj); sp -= 2;
                if (unlikely(ret < 0)) goto exception;
            }
            BREAK;

'''
  q=once(q,'        CASE(OP_put_field):',handler+'        CASE(OP_put_field):')
  anchor='        if(op==OP_four_ctor){'
  idx=q.index(anchor,q.index('static int JS_WriteFunctionBytecode'))
  q=q[:idx]+'''        if (op == OP_put_field_sti) {
            StoreSite *site = &b->store_sites[get_u32(bc_buf+pos+1)];
            op = OP_put_field; bc_buf[pos] = op; put_u32(bc_buf+pos+1, site->atom);
        }
'''+q[idx:]
  q=once(q,'        if (op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||','        if (op == OP_put_field_sti || op == OP_four_ctor || op == OP_get_field_rdi || op == OP_get_field2_rdi ||')
  d['quickjs-opcode.h']=once(d['quickjs-opcode.h'],'DEF(four_ctor,3,0,0,u16)','DEF(four_ctor,3,0,0,u16)\nDEF(put_field_sti,5,2,0,u32)')
 if counts:
  anchor='int fast=four_ctor_try(ctx,s,call_argv[-2],call_argv[-1],call_argv,&ret_val);'
  q=once(q,anchor,anchor+'ST_CTOR(fast);')
  # Detach before b's address can be reused. Counters own only strings.
  q=once(q,'    rdi_free(rt, b);','    st_detach(b);\n    rdi_free(rt, b);')
  # Profile the two original handlers without changing their lookups/branches.
  start=q.index('        CASE(OP_put_field_shared):');end=q.index('        CASE(OP_private_symbol):',start)
  t=q[start:end]
  sti=''
  if enabled:
   i=t.index('        CASE(OP_put_field_sti):');j=t.index('        CASE(OP_put_field):',i)
   sti=t[i:j];t=t[:i]+t[j:]
  t=once(t,'                JSValue obj = sp[-2];','                JSValue obj = sp[-2];\n                StDiag *st_d = ST_POINT(b, pc-b->byte_code_buf-1, site->atom, 1);\n                ST_EVENT(st_d, writes); ST_EVENT(st_d, shared_writes);')
  t=once(t,'                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);','                            ST_EVENT(st_d, existing_fast);\n                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);')
  t=once(t,'                int ret = JS_SetPropertyInternal(ctx, obj, site->atom, sp[-1], obj,\n                                                JS_PROP_THROW_STRICT);','                ST_EVENT(st_d, slow_calls);\n                int ret = st_slow(ctx, NULL, st_d, obj, site->atom, sp[-1]);')
  # Ordinary original opcode remains executable after optional prepare OOM too.
  t=once(t,'                atom = get_u32(pc);','                atom = get_u32(pc);\n                StDiag *st_d = ST_POINT(b, pc-b->byte_code_buf-1, atom, 0);\n                ST_EVENT(st_d, writes); ST_EVENT(st_d, ordinary_writes);')
  t=once(t,'                        /* fast path */','                        ST_EVENT(st_d, existing_fast);\n                        /* fast path */')
  t=once(t,'                    ret = JS_SetPropertyInternal(ctx, obj, atom, sp[-1], obj,\n                                                 JS_PROP_THROW_STRICT);','                    ST_EVENT(st_d, slow_calls);\n                    ret = st_slow(ctx, NULL, st_d, obj, atom, sp[-1]);')
  if enabled:t=t.replace('        CASE(OP_put_field):',sti+'        CASE(OP_put_field):')
  q=q[:start]+t+q[end:]
 # Runtime contains st_free only when b contains store records.
 runtime=(HERE/'store_transition_runtime.inc').read_text()
 if not enabled:runtime=runtime[:runtime.index('static void st_free')]
 d.update({'quickjs.c':q,'store_transition_types.h':(HERE/'store_transition_types.h').read_text(),
           'store_transition_runtime.inc':runtime})
 if enabled:d['store_transition_prepare.inc']=(HERE/'store_transition_prepare.inc').read_text()
 if counts:d['store_transition_diag.h']=(HERE/'store_transition_diag.h').read_text()

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--labels',nargs='+',default=LABELS);ap.add_argument('--modes',nargs='+',default=['release','counts']);a=ap.parse_args()
 m=json.loads((PACKAGE/'manifest.json').read_text());base={}
 for n,h in m['modified'].items():
  assert sha(PACKAGE/'modified'/n)==h,n;base[n]=(PACKAGE/'modified'/n).read_text()
 candidate=dict(base);transform(candidate)
 (HERE/'SPARSE-to-STORE_TRANSITION_IC.patch').write_text(''.join(''.join(difflib.unified_diff(base.get(n,'').splitlines(True),t.splitlines(True),fromfile='a/'+n if n in base else '/dev/null',tofile='b/'+n)) for n,t in candidate.items() if t!=base.get(n)))
 for label in a.labels:
  for mode in a.modes:
   stamp=HERE/f'{label}.{mode}.manifest.json'
   d=dict(base)
   if label!='SPARSE' or mode=='counts':transform(d,label!='SPARSE',mode=='counts')
   if stamp.exists():
    old=json.loads(stamp.read_text());assert sha(old['binary'])==old['binary_sha256']
    olddir=Path(old['binary']).parent
    if set(d)==set(old['sources']) and all((olddir/n).read_text()==t for n,t in d.items()):
     print('BUILD_EXISTS',label,mode,flush=True);continue
    archive=HERE/'development_revisions'/olddir.name;archive.mkdir(parents=True,exist_ok=False)
    archived=archive/stamp.name;assert not archived.exists();stamp.rename(archived)
    logfile=HERE/f'{label}.{mode}.build.log'
    if logfile.exists():logfile.rename(archive/logfile.name)
   dest=HERE/'work'/f'{label}.{mode}';i=1
   while dest.exists():i+=1;dest=HERE/'work'/f'{label}.{mode}.rev{i:02d}'
   dest.mkdir(parents=True,exist_ok=False)
   for n,t in d.items():
    p=dest/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(t.replace('\n','\r\n' if m['modified_line_endings'].get(n)=='CRLF' else '\n').encode())
   cmd=['make','-j2','-o','repl.c']+(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if mode=='sanitize' else [])+['qjs','qjsc']
   with (HERE/f'{label}.{mode}.build.log').open('w') as log:subprocess.run(cmd,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
   save(stamp,dict(label=label,mode=mode,instrumented=mode=='counts',sanitized=mode=='sanitize',binary=str(dest/'qjs'),binary_sha256=sha(dest/'qjs'),command=cmd,sources={n:sha(dest/n) for n in d},parent='frozen 06aada4 SPARSE_CTOR_IC'))
   print('BUILD_PASS',label,mode,flush=True)
if __name__=='__main__':main()
