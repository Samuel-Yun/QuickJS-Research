"""Build independent frozen SPARSE and VERIFY_OFFSET_NO_UPDATE binaries."""
import difflib
import hashlib
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PACKAGE = ROOT / 'on_demand_ctor_cache'
LABELS = ['SPARSE', 'VERIFY_OFFSET_NO_UPDATE']
EVENTS = ['logical_reads', 'fused_entries', 'fused_hits', 'field_entries',
          'shape_hits', 'verify_attempts', 'verify_successes', 'normal_lookups',
          'own_searches', 'updates']


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def save(p, x):
    Path(p).write_text(json.dumps(x, ensure_ascii=False, indent=2) + '\n')


def once(s, old, new):
    assert s.count(old) == 1, (s.count(old), old[:100])
    return s.replace(old, new)


def candidate(s):
    lines = [
        '                if (!keep && site->shape && !site->holder_shape &&',
        '                    site->shape != p->shape && p->shape->is_hashed) {',
        '                    JSShape *sh = p->shape;',
        '                    uint32_t off = site->prop_offset;',
        '                    if (off < sh->prop_count) {',
        '                        JSShapeProperty *desc = &get_shape_prop(sh)[off];',
        '                        if (desc->atom == site->atom &&',
        '                            !(desc->flags & JS_PROP_TMASK)) {',
        '                            val = JS_DupValue(ctx, p->prop[off].u.value);',
        '                            goto name ## _done;',
        '                        }',
        '                    }',
        '                }',
    ]
    anchor = '                RDI_COUNT(shape_misses);                               \\\n'
    return once(s, anchor, anchor + ''.join(line.ljust(72) + '\\\n' for line in lines))


def instrument(q, r, prep, runtime):
    # Diagnostic only: detached C-allocator records, no added IC/JS object fields.
    q = once(q, '#define V6_PREPARED_BORROW(slot) do {',
             '#define V6_PREPARED_BORROW(slot) do {')
    anchor = '        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && '
    q = once(q, anchor, '        von_event(ctx, b, site, VON_fused_entries, receiver);          \\\n' + anchor)
    anchor = '            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
    q = once(q, anchor, '            von_event(ctx,b,site,VON_fused_hits,receiver);             \\\n'
             '            von_event(ctx,b,site,VON_logical_reads,receiver);          \\\n' + anchor)
    def before(s, anchor, line):
        return once(s, anchor, line.ljust(72) + '\\\n' + anchor)
    r = before(r, '        pc += 4;',
               '        if (!keep) { von_event(ctx,b,site,VON_field_entries,obj); von_event(ctx,b,site,VON_logical_reads,obj); }')
    r = before(r, '                    RDI_COUNT(hits);',
               '                    if (!keep) von_event(ctx,b,site,VON_shape_hits,obj);')
    if 'JSShape *sh = p->shape;' in r:
        r = before(r, '                    JSShape *sh = p->shape;',
                   '                    von_event(ctx,b,site,VON_verify_attempts,obj);')
        r = before(r, '                            val = JS_DupValue(ctx, p->prop[off].u.value);',
                   '                            von_event(ctx,b,site,VON_verify_successes,obj);')
    r = before(r, '        RDI_COUNT(fallback);',
               '        if (!keep) von_event(ctx,b,site,VON_normal_lookups,obj);')
    r = before(r, '                prs = find_own_property(&pr, p, atom);',
               '                if (!keep) von_event(ctx,b,site,VON_own_searches,obj);')
    r = before(r, '                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
               '                        if (!keep) von_event(ctx,b,site,VON_updates,obj);')
    runtime = once(runtime, '/* Included after upstream find_own_property, with shape helpers available. */',
                   '/* Independent diagnostic instrumentation, not a timed build. */\n#include "verify_diag.inc"\n'
                   '/* Included after upstream find_own_property, with shape helpers available. */')
    runtime = once(runtime, '    if (b->read_ic_sites) {',
                   '    von_detach(b);\n    if (b->read_ic_sites) {')
    prep = once(prep, '            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));',
                '            put_u32(pc + 1, (uint8_t *)&b->read_ic_sites[index++] - (pc + 1));\n'
                '            von_register(ctx,b,index-1,pos);')
    # Snapshot the real post-preparation image. This hook is diagnostic only.
    spec = importlib.util.spec_from_file_location('snapshot_tool', PACKAGE/'tools/bytecode.py')
    tool = importlib.util.module_from_spec(spec); spec.loader.exec_module(tool)
    original, inspected = tool.inspection_sources('method')
    q0 = original['quickjs.c'].decode(); qi = inspected['quickjs.c'].decode()
    a = 'static JSValue __JS_EvalInternal(JSContext *ctx, JSValueConst this_obj,'
    q = once(q, a, 'static int bc_after_script(JSContext *ctx, JSValueConst root);\n\n' + a)
    a = '        ret_val = JS_EvalFunctionInternal(ctx, fun_obj, this_obj, var_refs, sf);'
    start = qi.index('        const char *bc_file = getenv("QJS_INSPECT_FILE");')
    end = qi.index('        JS_FreeValue(ctx, bc_root);', start) + len('        JS_FreeValue(ctx, bc_root);')
    q = once(q, a, qi[start:end])
    q += '\n#define BC_METHOD 1\n#include "bytecode_snapshot.inc"\n'
    return q, r, prep, runtime


def main():
    frozen = PACKAGE/'modified'
    manifest = json.loads((PACKAGE/'manifest.json').read_text())
    for n,h in manifest['modified'].items():
        assert sha(frozen/n) == h, n
    old = (frozen/'read_ic_opcodes.inc').read_text()
    new = candidate(old)
    (HERE/'SPARSE-to-VERIFY_OFFSET_NO_UPDATE.patch').write_text(''.join(difflib.unified_diff(
        old.splitlines(True), new.splitlines(True), fromfile='a/read_ic_opcodes.inc', tofile='b/read_ic_opcodes.inc')))
    for label in LABELS:
        for mode in ['release', 'counts']:
            dest = HERE/'work'/f'{label}.{mode}'
            stamp = HERE/f'{label}.{mode}.manifest.json'
            if stamp.exists():
                m = json.loads(stamp.read_text())
                assert sha(dest/'qjs') == m['binary_sha256']
                for n,h in m['sources'].items(): assert sha(dest/n)==h,n
                print('BUILD_EXISTS',label,mode,flush=True)
                continue
            assert not dest.exists(), dest
            shutil.copytree(frozen,dest)
            r = new if label != 'SPARSE' else old
            (dest/'read_ic_opcodes.inc').write_text(r)
            if mode == 'counts':
                names = ['quickjs.c','read_ic_opcodes.inc','read_ic_prepare.inc','read_ic_runtime.inc']
                sources = [(dest/n).read_text() for n in names]
                for n,s in zip(names,instrument(*sources)): (dest/n).write_text(s)
                shutil.copy2(HERE/'verify_diag.inc',dest/'verify_diag.inc')
                shutil.copy2(PACKAGE/'tools/bytecode_snapshot.inc',dest/'bytecode_snapshot.inc')
            command = ['make','-j2','-o','repl.c','qjs']
            with (HERE/f'{label}.{mode}.build.log').open('w') as log:
                subprocess.run(command,cwd=dest,stdout=log,stderr=subprocess.STDOUT,check=True)
            names = list(manifest['modified']) + (['verify_diag.inc','bytecode_snapshot.inc'] if mode=='counts' else [])
            save(stamp,dict(label=label,mode=mode,instrumented=mode=='counts',binary=str(dest/'qjs'),
                binary_sha256=sha(dest/'qjs'),command=command,sources={n:sha(dest/n) for n in names},
                parent='06aada4 frozen SPARSE_CTOR_IC; on_demand_ctor_cache/modified'))
            print('BUILD_PASS',label,mode,flush=True)


if __name__=='__main__': main()
