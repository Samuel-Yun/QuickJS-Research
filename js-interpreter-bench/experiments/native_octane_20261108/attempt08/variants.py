"""Two independent changes to the exact frozen READ_STORE parent."""
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PARENT = HERE.parent / 'attempt04'
PARENTS = dict(ENTRY1='READ_STORE', OWN2='READ_STORE')


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:120])
    return text.replace(old, new, 1)


def parent(label=None):
    spec = importlib.util.spec_from_file_location('new_read_store_parent', PARENT / 'variants.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    files = module.render('READ_STORE')
    expected = json.loads((PARENT / 'source_manifest.json').read_text())['READ_STORE']['files']
    assert {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()} == expected
    return files


def entry1(files):
    files = files.copy()
    q = files['quickjs.c']
    anchor = '''    if (js_check_stack_overflow(rt, alloca_size))
        return JS_ThrowStackOverflow(caller_ctx);

    sf->js_mode = b->js_mode;'''
    q = once(q, anchor, '''    if (js_check_stack_overflow(rt, alloca_size))
        return JS_ThrowStackOverflow(caller_ctx);

    /* First ordinary entry: no previous frame of this b has an old PC.
       rdi_prepare publishes ready before its optional allocation, so any
       synchronous re-entry during allocation uses the ordinary image. */
    if (unlikely(!b->read_ic_ready))
        rdi_prepare(caller_ctx, b);

    sf->js_mode = b->js_mode;''')
    anchor = '''    if (rdi_prepare(ctx, b) < 0) {
        JS_FreeValue(ctx, JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b));
        return JS_EXCEPTION;
    }'''
    q = once(q, anchor, '''    /* Suspended generator/async images keep eager preparation. */
    if (b->func_kind != JS_FUNC_NORMAL && rdi_prepare(ctx, b) < 0) {
        JS_FreeValue(ctx, JS_MKPTR(JS_TAG_FUNCTION_BYTECODE, b));
        return JS_EXCEPTION;
    }''')
    q = once(q, '    if (rdi_prepare(ctx, b) < 0) goto fail;',
                '    if (b->func_kind != JS_FUNC_NORMAL && rdi_prepare(ctx, b) < 0) goto fail;')
    files['quickjs.c'] = q
    p = files['read_ic_prepare.inc']
    p = p.replace('        JS_ThrowOutOfMemory(ctx);\n        return -1;',
                  '        return 0; /* optional optimization, retain ordinary image */')
    p = once(p, '''    linked = js_mallocz(ctx, total);
    if (!linked) return -1;''', '''    linked = js_mallocz_rt(ctx->rt, total);
    if (!linked) return 0; /* no pending-exception mutation, no retry */''')
    assert 'JS_ThrowOutOfMemory' not in p
    files['read_ic_prepare.inc'] = p
    return files


def own2(files):
    files = files.copy()
    # A normal get_field does not need a prototype holder. Use that existing
    # strong edge as a second own shape only when the field offset is equal.
    r = files['read_ic_runtime.inc']
    anchor = 'static void v6_proto_update(JSContext *ctx, ReadICSite *s, JSShape *receiver,'
    helper = '''static force_inline uint32_t own2_probe(ReadICSite *s, JSShape *shape RDI_DPARAM)
{
    RDI_COUNT(comparisons);
    return s->shape == shape || s->holder_shape == shape ? s->prop_offset : UINT32_MAX;
}
static void own2_update(JSContext *ctx, ReadICSite *s, JSShape *shape, uint32_t offset RDI_DPARAM)
{
    if (s->shape && s->prop_offset == offset) {
        if (s->shape == shape || s->holder_shape == shape) return;
        RDI_COUNT(updates);
        JSShape *old = s->holder_shape;
        js_dup_shape(shape);
        s->holder_shape = shape; /* publish before releasing the old edge */
        js_free_shape_null(ctx->rt, old);
    } else {
        rdi_update(ctx, s, shape, offset RDI_DARG(d));
    }
}

'''
    r = once(r, anchor, helper + anchor)
    files['read_ic_runtime.inc'] = r
    op = files['read_ic_opcodes.inc']
    op = once(op, 'offset = rdi_probe(site, p->shape RDI_DARG(d));',
                  'offset = (keep) ? rdi_probe(site, p->shape RDI_DARG(d)) : own2_probe(site, p->shape RDI_DARG(d));')
    op = once(op, 'rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
                  'if (keep) rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d)); else own2_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));')
    files['read_ic_opcodes.inc'] = op
    q = files['quickjs.c']
    anchor = '            site->shape == object->shape) {'
    q = once(q, anchor, '            (site->shape == object->shape || site->holder_shape == object->shape)) {')
    # A shared write must distinguish a second own shape from a prototype
    # holder. Tag the aligned target address in this write operand only;
    # ordinary get_field records use tag 0, get_field2 records use tag 1.
    p = files['read_ic_prepare.inc']
    p = once(p, '    ReadICSite *last_read = NULL;',
                '    ReadICSite *last_read = NULL;\n    unsigned last_read_keep = 0;')
    p = once(p, '            last_read = &b->read_ic_sites[index];',
                '            last_read = &b->read_ic_sites[index];\n            last_read_keep = op == OP_get_field2;')
    p = once(p, '            put_u32(pc + 1, (uint8_t *)last_read - (pc + 1));',
                '            put_u32(pc + 1, (uint8_t *)last_read - (pc + 1) + last_read_keep);')
    files['read_ic_prepare.inc'] = p
    q = once(q, '                ReadICSite *site = (ReadICSite *)(pc + get_u32(pc));',
                '''                uintptr_t tagged_site = (uintptr_t)(pc + get_u32(pc));
                int from_own_read = !(tagged_site & 1);
                ReadICSite *site = (ReadICSite *)(tagged_site & ~(uintptr_t)1);''')
    q = once(q, '                        site->shape == p->shape && !site->holder_shape) {',
                '''                        (site->shape == p->shape || (from_own_read && site->holder_shape == p->shape)) &&
                        (from_own_read || !site->holder_shape)) {''')
    anchor = '            ReadICSite *site = (ReadICSite *)(b->byte_code_buf + pos + 1 + delta);'
    q = once(q, anchor, anchor + '''
            if (op == OP_put_field_shared)
                site = (ReadICSite *)((uintptr_t)site & ~(uintptr_t)1);''')
    files['quickjs.c'] = q
    # Existing mark/free already visit both strong edges. Keep records 24B,
    # function headers unchanged, and get_field2's prototype semantics intact.
    return files


def render(label):
    return {'ENTRY1': entry1, 'OWN2': own2}[label](parent())
