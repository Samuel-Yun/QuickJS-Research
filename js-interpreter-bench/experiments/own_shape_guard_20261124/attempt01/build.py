"""Three independent builds; Release changes only own-read guard/admission."""
import argparse,difflib,hashlib,importlib.util,json,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];PACKAGE=ROOT/'on_demand_ctor_cache'
LABELS=['SPARSE','RELAX_CLASS','SHAPE_ONLY']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):Path(p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def once(s,a,b):
 assert s.count(a)==1,(s.count(a),a[:100]);return s.replace(a,b)

def candidate(d,label):
 q,r=d['quickjs.c'],d['read_ic_opcodes.inc']
 if label=='RELAX_CLASS':
  q=once(q,'        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && ', '        if (!object->is_exotic && ')
  r=once(r,'if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic)', 'if ((!keep || p->class_id == JS_CLASS_OBJECT) && !p->is_exotic)')
  r=once(r,'else if (p->class_id != JS_CLASS_OBJECT || p->is_exotic)', 'else if ((keep && p->class_id != JS_CLASS_OBJECT) || p->is_exotic)')
 elif label=='SHAPE_ONLY':
  q=once(q,'        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && \\\n            site->shape == object->shape)', '        if (site->shape == object->shape)')
  r=once(r,'if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic)', 'if (!keep || (p->class_id == JS_CLASS_OBJECT && !p->is_exotic))')
  r=once(r,'else if (p->class_id != JS_CLASS_OBJECT || p->is_exotic)', 'else if (keep && (p->class_id != JS_CLASS_OBJECT || p->is_exotic))')
 else:raise ValueError(label)
 d.update({'quickjs.c':q,'read_ic_opcodes.inc':r})

def instrument(d):
 q,r,p,rt=(d[n] for n in ['quickjs.c','read_ic_opcodes.inc','read_ic_prepare.inc','read_ic_runtime.inc'])
 q=once(q,'static void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)', '#include "own_guard_diag.inc"\nstatic void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)')
 cont=' \\\n'
 # Inject before whichever guard this independent candidate selected.
 a='        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));'
 q=once(q,a,a+cont+'        OG_EVENT(fused_entries);')
 a='            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
 q=once(q,a,'            OG_EVENT(logical_named); OG_EVENT(rdi0_named); OG_EVENT(hits); OG_EVENT(fused_hits);'+cont+
  '            OG_CLASS(receiver, query); OG_CLASS(receiver, hit); OG_TRACE(receiver);'+cont+a)
 def before(s,a,line):return once(s,a,line.ljust(76)+'\\\n'+a)
 r=before(r,'        pc += 4;', '        OG_EVENT(logical_named); if(keep)OG_EVENT(rdi1_named);else { OG_EVENT(rdi0_named); OG_CLASS(obj, query); } OG_TRACE(obj);')
 r=before(r,'                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);', '                        OG_EVENT(hits); OG_EVENT(prototype_hits);')
 r=before(r,'                    RDI_COUNT(hits);','                    OG_EVENT(hits); OG_EVENT(field_hits); if(!keep) OG_CLASS(obj, hit);')
 r=before(r,'        RDI_COUNT(fallback);','        OG_EVENT(normal_lookups); if(!keep) OG_CLASS(obj, lookup);')
 r=before(r,'                prs = find_own_property(&pr, p, atom);','                OG_EVENT(own_searches);')
 r=before(r,'                        RDI_REASON(descriptor);','                        if(!keep) { if(p==origin) OG_CLASS(sp[-1], descriptor); else OG_CLASS(sp[-1], inherited); }')
 r=before(r,'                    val = JS_DupValue(ctx, pr->u.value);','                    if(!keep) { if(p==origin) OG_CLASS(sp[-1], own_data_miss); else OG_CLASS(sp[-1], inherited); }')
 r=before(r,'                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));','                        OG_EVENT(updates); if(!keep) OG_CLASS(sp[-1], fill);')
 r=before(r,'                    RDI_REASON(special);','                    if(!keep) OG_CLASS(sp[-1], exotic_dispatch);')
 # Count missing/primitive without changing the original fallback flow.
 r=once(r,'if (!p) { RDI_REASON(missing);','if (!p) { if(!keep) OG_CLASS(sp[-1], missing); RDI_REASON(missing);')
 r=before(r,'            RDI_REASON(primitive);','            if(!keep) OG_CLASS(sp[-1], primitive);')
 p=once(p,'            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));',
  '            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));\n            og_register(ctx,b,index-1,pos);')
 rt=once(rt,'    if (b->read_ic_sites) {','    og_detach(b);\n    if (b->read_ic_sites) {')
 # Actual runtime bytecode snapshots using only the frozen package's viewer.
 spec=importlib.util.spec_from_file_location('og_snapshot',PACKAGE/'tools/bytecode.py');tool=importlib.util.module_from_spec(spec);spec.loader.exec_module(tool)
 _,snap=tool.inspection_sources('method');sq=snap['quickjs.c'].decode()
 anchor='static JSValue __JS_EvalInternal(JSContext *ctx, JSValueConst this_obj,'
 q=once(q,anchor,'static int bc_after_script(JSContext *ctx, JSValueConst root);\n\n'+anchor)
 anchor='        ret_val = JS_EvalFunctionInternal(ctx, fun_obj, this_obj, var_refs, sf);';i=sq.index('        const char *bc_file = getenv("QJS_INSPECT_FILE");');j=sq.index('        JS_FreeValue(ctx, bc_root);',i)+len('        JS_FreeValue(ctx, bc_root);')
 q=once(q,anchor,sq[i:j]);q+='\n#define BC_METHOD 1\n#include "bytecode_snapshot.inc"\n'
 d.update({'quickjs.c':q,'read_ic_opcodes.inc':r,'read_ic_prepare.inc':p,'read_ic_runtime.inc':rt,
  'own_guard_diag.inc':(HERE/'own_guard_diag.inc').read_text(),'bytecode_snapshot.inc':(PACKAGE/'tools/bytecode_snapshot.inc').read_text()})

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--labels',nargs='+',default=LABELS);ap.add_argument('--modes',nargs='+',default=['release','counts']);a=ap.parse_args()
 m=json.loads((PACKAGE/'manifest.json').read_text());base={}
 for n,h in m['modified'].items():assert sha(PACKAGE/'modified'/n)==h,n;base[n]=(PACKAGE/'modified'/n).read_text()
 for label in LABELS[1:]:
  d=dict(base);candidate(d,label);(HERE/f'SPARSE-to-{label}.patch').write_text(''.join(''.join(difflib.unified_diff(base.get(n,'').splitlines(True),t.splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n,t in d.items() if t!=base.get(n)))
 for label in a.labels:
  for mode in a.modes:
   d=dict(base)
   if label!='SPARSE':candidate(d,label)
   if mode=='counts':instrument(d)
   stamp=HERE/f'{label}.{mode}.manifest.json'
   if stamp.exists():
    old=json.loads(stamp.read_text());assert sha(old['binary'])==old['binary_sha256'];dd=Path(old['binary']).parent
    if set(d)==set(old['sources']) and all((dd/n).read_text()==t for n,t in d.items()):print('BUILD_EXISTS',label,mode,flush=True);continue
    ar=HERE/'development_revisions'/dd.name;ar.mkdir(parents=True,exist_ok=False);stamp.rename(ar/stamp.name)
    log=HERE/f'{label}.{mode}.build.log'
    if log.exists():log.rename(ar/log.name)
   dest=HERE/'work'/f'{label}.{mode}';i=1
   while dest.exists():i+=1;dest=HERE/'work'/f'{label}.{mode}.rev{i:02d}'
   dest.mkdir(parents=True)
   for n,t in d.items():
    p=dest/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(t.replace('\n','\r\n' if m['modified_line_endings'].get(n)=='CRLF' else '\n').encode())
   cmd=['make','-j2','-o','repl.c']+(['CONFIG_ASAN=y','CONFIG_UBSAN=y'] if mode=='sanitize' else [])+['qjs','qjsc']
   with (HERE/f'{label}.{mode}.build.log').open('w') as log:subprocess.run(cmd,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
   save(stamp,dict(label=label,mode=mode,instrumented=mode=='counts',sanitized=mode=='sanitize',binary=str(dest/'qjs'),binary_sha256=sha(dest/'qjs'),command=cmd,sources={n:sha(dest/n) for n in d},parent='frozen 06aada4 SPARSE_CTOR_IC'))
   print('BUILD_PASS',label,mode,flush=True)
if __name__=='__main__':main()
