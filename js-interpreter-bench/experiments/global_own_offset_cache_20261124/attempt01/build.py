"""GLOBAL_OWN_OFFSET_CACHE only; independent frozen SPARSE parent."""
import argparse
import difflib
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
PACKAGE=ROOT/'on_demand_ctor_cache'
LABELS=['SPARSE','GLOBAL_OWN_OFFSET_CACHE']
EVENTS=['logical_named','rdi0_named','rdi1_named','legacy_named','legacy_length',
        'fused_entries','primary_hits','fused_hits','field_primary_hits','prototype_primary_hits',
        'secondary_probes','secondary_hits','normal_lookups','rdi_normal_lookups','own_searches',
        'primary_updates','registrations','same_key_refreshes','conflict_replacements',
        'invalidations','cleared_entries','runtime_shutdowns','shutdown_entries']

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(p,x):Path(p).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def once(s,a,b):
    assert s.count(a)==1,(s.count(a),a[:100]);return s.replace(a,b)


def candidate(d):
    q,r=d['quickjs.c'],d['read_ic_opcodes.inc']
    q=once(q,'typedef struct ExEdge { JSShape *from,*to; JSAtom atom; int flags; } ExEdge;',
        '''typedef struct ExEdge { JSShape *from,*to; JSAtom atom; int flags; } ExEdge;
#define GLOBAL_OWN_CACHE 1
#define GO_CAPACITY 1024
typedef struct GlobalOwnEntry {
    JSShape *shape;
    JSAtom atom;
    uint32_t prop_offset;
    uint16_t next, prev;
} GlobalOwnEntry;''')
    q=once(q,'    uint8_t transition_edges_disabled;','''    uint8_t transition_edges_disabled;
    uint8_t global_own_disabled;
    GlobalOwnEntry global_own_offsets[GO_CAPACITY];''')
    q=once(q,'static void ex_edge_clear(JSRuntime *rt);',
        'static void ex_edge_clear(JSRuntime *rt);\nstatic void global_own_shutdown(JSRuntime *rt);')
    q=once(q,'    uint8_t is_hashed;','    uint8_t is_hashed;\n    uint16_t own_cache_head; /* bucket+1, in existing alignment padding */')
    q=once(q,'static void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)\n{',
        '#include "global_own_offset.inc"\n\nstatic void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)\n{\n    global_own_invalidate(rt, sh);')
    q=once(q,'    ex_edge_clear(rt);','    global_own_shutdown(rt);\n    ex_edge_clear(rt);')
    q=once(q,'    sh->is_hashed = FALSE;\n    return sh;',
        '    sh->is_hashed = FALSE;\n    sh->own_cache_head = 0;\n    return sh;')
    q=once(q,'    sh->is_hashed = FALSE;\n    if (sh->proto) {',
        '    sh->is_hashed = FALSE;\n    sh->own_cache_head = 0; /* cloned links belong only to the old shape */\n    if (sh->proto) {')
    q=once(q,'    if (sh->is_hashed)\n        js_shape_hash_unlink(rt, sh);\n    if (sh->proto != NULL)',
        '    if (sh->is_hashed)\n        js_shape_hash_unlink(rt, sh);\n    else\n        global_own_invalidate(rt, sh);\n    if (sh->proto != NULL)')
    anchor='    remove_gc_object(&old_sh->header);'
    assert q.count(anchor)==2
    q=q.replace(anchor,'    global_own_invalidate(ctx->rt, old_sh);\n'+anchor)
    anchor='''    memcpy(&sh->header + 1, &old_sh->header + 1,
           sizeof(JSShape) - sizeof(JSGCObjectHeader));'''
    assert q.count(anchor)==2
    q=q.replace(anchor,anchor+'\n    sh->own_cache_head = 0; /* a relocated shape starts with no weak links */')
    q=once(q,'                /* update the property flags if possible when\n                   declaring a global function */',
        '                global_own_invalidate(ctx->rt, p->shape);\n'
        '                /* update the property flags if possible when\n                   declaring a global function */')
    lines=[
        '                if (!keep && site->shape && !site->holder_shape &&',
        '                    site->shape != p->shape && p->shape->is_hashed) {',
        '                    offset = global_own_probe(ctx->rt, p->shape, site->atom);',
        '                    if (offset != UINT32_MAX) {',
        '                        val = JS_DupValue(ctx, p->prop[offset].u.value);',
        '                        goto name ## _done;',
        '                    }',
        '                }']
    anchor='                RDI_COUNT(shape_misses);                               \\\n'
    r=once(r,anchor,anchor+''.join(line.ljust(76)+'\\\n' for line in lines))
    anchor='                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));'
    new='''                        if (!keep)                                      \\
                            global_own_register(ctx->rt, p->shape, atom, pr - p->prop); \\
'''+anchor
    r=once(r,anchor,new)
    d.update({'quickjs.c':q,'read_ic_opcodes.inc':r,'global_own_offset.inc':(HERE/'global_own_offset.inc').read_text()})


def instrument(d,label):
    q,r,p,rt=(d[n] for n in ['quickjs.c','read_ic_opcodes.inc','read_ic_prepare.inc','read_ic_runtime.inc'])
    if label!='SPARSE':anchor='#include "global_own_offset.inc"'
    else:anchor='static void js_shape_hash_unlink(JSRuntime *rt, JSShape *sh)'
    q=once(q,anchor,'#include "global_own_diag.inc"\n'+anchor)
    cont=' \\\n'
    q=once(q,'        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && ',
        '        GO_EVENT(fused_entries);'+cont+'        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && ')
    q=once(q,'            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);',
        '            GO_EVENT(logical_named); GO_EVENT(rdi0_named);'+cont+
        '            GO_EVENT(primary_hits); GO_EVENT(fused_hits); GO_TRACE(receiver);'+cont+
        '            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);')
    start=q.index('#define GET_FIELD_INLINE(name, keep, is_length)')
    end=q.index('#include "read_ic_opcodes.inc"',start)
    tail=q[start:end]
    tail=once(tail,'                JSShapeProperty *prs;',
        '                GO_COUNT(logical_named); GO_COUNT(legacy_named);'+cont+
        '                GO_COUNT(normal_lookups); if(is_length)GO_COUNT(legacy_length);'+cont+
        '                JSShapeProperty *prs;')
    q=q[:start]+tail+q[end:]
    def before(s,a,b):return once(s,a,b.ljust(76)+'\\\n'+a)
    r=before(r,'        pc += 4;',
        '        GO_EVENT(logical_named); if(keep)GO_EVENT(rdi1_named);else GO_EVENT(rdi0_named); GO_TRACE(obj);')
    r=before(r,'                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);',
        '                        GO_EVENT(primary_hits); GO_EVENT(prototype_primary_hits);')
    r=before(r,'                    RDI_COUNT(hits);',
        '                    GO_EVENT(primary_hits); GO_EVENT(field_primary_hits);')
    if label!='SPARSE':
        r=before(r,'                    offset = global_own_probe(ctx->rt, p->shape, site->atom);','                    GO_EVENT(secondary_probes);')
        r=before(r,'                        val = JS_DupValue(ctx, p->prop[offset].u.value);','                        GO_EVENT(secondary_hits);')
        r=before(r,'                        if (!keep)',
            '                        if (!keep && !ctx->rt->global_own_disabled) GO_SITE(registrations);')
    r=before(r,'        RDI_COUNT(fallback);','        GO_EVENT(normal_lookups); GO_EVENT(rdi_normal_lookups);')
    r=before(r,'                prs = find_own_property(&pr, p, atom);','                GO_EVENT(own_searches);')
    r=before(r,'                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));','                        GO_EVENT(primary_updates);')
    p=once(p,'            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));',
        '            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));\n'
        '            go_diag_register(ctx,b,index-1,pos);')
    rt=once(rt,'    if (b->read_ic_sites) {','    go_diag_detach(b);\n    if (b->read_ic_sites) {')
    # Reuse only the frozen package's inspection hook, not another experiment.
    spec=importlib.util.spec_from_file_location('go_snapshot',PACKAGE/'tools/bytecode.py')
    tool=importlib.util.module_from_spec(spec);spec.loader.exec_module(tool)
    _,snap=tool.inspection_sources('method');sq=snap['quickjs.c'].decode()
    anchor='static JSValue __JS_EvalInternal(JSContext *ctx, JSValueConst this_obj,'
    q=once(q,anchor,'static int bc_after_script(JSContext *ctx, JSValueConst root);\n\n'+anchor)
    anchor='        ret_val = JS_EvalFunctionInternal(ctx, fun_obj, this_obj, var_refs, sf);'
    first=sq.index('        const char *bc_file = getenv("QJS_INSPECT_FILE");')
    last=sq.index('        JS_FreeValue(ctx, bc_root);',first)+len('        JS_FreeValue(ctx, bc_root);')
    q=once(q,anchor,sq[first:last]);q+='\n#define BC_METHOD 1\n#include "bytecode_snapshot.inc"\n'
    d.update({'quickjs.c':q,'read_ic_opcodes.inc':r,'read_ic_prepare.inc':p,'read_ic_runtime.inc':rt,
              'global_own_diag.inc':(HERE/'global_own_diag.inc').read_text(),
              'bytecode_snapshot.inc':(PACKAGE/'tools/bytecode_snapshot.inc').read_text()})


def main():
    ap=argparse.ArgumentParser();ap.add_argument('--labels',nargs='+',default=LABELS)
    ap.add_argument('--modes',nargs='+',default=['release','counts']);a=ap.parse_args()
    manifest=json.loads((PACKAGE/'manifest.json').read_text());base={}
    for n,h in manifest['modified'].items():
        assert sha(PACKAGE/'modified'/n)==h,n;base[n]=(PACKAGE/'modified'/n).read_text()
    new=dict(base);candidate(new)
    (HERE/'SPARSE-to-GLOBAL_OWN_OFFSET_CACHE.patch').write_text(''.join(
        ''.join(difflib.unified_diff(base.get(n,'').splitlines(True),text.splitlines(True),
            fromfile='a/'+n if n in base else '/dev/null',tofile='b/'+n))
        for n,text in new.items() if text!=base.get(n)))
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
            for n,text in d.items():
                p=dest/n;p.parent.mkdir(parents=True,exist_ok=True)
                crlf=manifest['modified_line_endings'].get(n)=='CRLF'
                p.write_bytes(text.replace('\n','\r\n' if crlf else '\n').encode())
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
