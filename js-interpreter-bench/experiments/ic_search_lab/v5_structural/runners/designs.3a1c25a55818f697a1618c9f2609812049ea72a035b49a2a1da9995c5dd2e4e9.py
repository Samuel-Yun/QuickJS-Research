"""Structural prototypes on the exact 16-byte s001 source, without private code."""
import difflib
import importlib.util
from pathlib import Path

H = Path(__file__).resolve().parent
V3 = H.parent / 'v3_mass_search'
spec = importlib.util.spec_from_file_location('frozen_generator', V3 / 'generate.py')
seed_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(seed_module)

DESIGNS = [
    dict(id='a01', route='A', parent='s001', title='16B primary plus one lazy secondary',
         before='A shape miss replaces the primary strong shape.',
         change='Keep the primary, consult one secondary only after primary miss; allocate the per-function secondary array on real polymorphism.',
         cost='One function pointer, lazy secondary storage, comparisons and additional strong shapes.'),
    dict(id='a02', route='A', parent='s001', title='16B primary plus three lazy secondaries',
         before='Monomorphic primary cannot retain four alternating shapes.',
         change='Same separated path with three secondary entries and first-empty then round-robin replacement.',
         cost='More secondary probes and retained shapes; primary remains16B.'),
    dict(id='c01', route='C', parent='s001', title='One-layer prototype cache with global structural epoch',
         before='Inherited normal-data reads repeat a receiver and holder lookup.',
         change='On primary miss guard receiver shape and a global structural epoch, then load the current holder value.',
         cost='Conservative invalidation on all add_property and shape_prepare_update calls, lazy24B side records.'),
    dict(id='c02', route='C', parent='s001', title='One-layer cache with watched-holder invalidation',
         before='Global structural invalidation discards unrelated inherited-read records.',
         change='Mark a holder when cached; bump the shared epoch only for structural operations on marked holders.',
         cost='One object bit and mutation-side condition, conservative shared epoch among watched holders.'),
    dict(id='d01', route='D', parent='s001', title='Borrowed arg/local read with dynamic lookahead',
         before='A short arg/local load duplicates the receiver, dispatches again, then frees that temporary on an own IC hit.',
         change='In eight existing short-load handlers recognize an immediately following get_field_rdi and execute an exact hit without temporary receiver ownership.',
         cost='Every such short load tests the next opcode, even when no fusion applies.'),
    dict(id='d02', route='D', parent='s001', title='Prepared borrowed-load fused opcodes',
         before='Dynamic lookahead adds a condition to all eight ordinary short-load handlers.',
         change='Prepare eight same-size fused-load opcodes only at final short-load/get_field_rdi pairs; preserve the following opcode and all offsets.',
         cost='Eight static C handlers and preparation/serialization work, no generated native code.'),
]

for fixed_id, original_id in [('d03', 'd01'), ('d04', 'd02')]:
    original = next(row for row in DESIGNS if row['id'] == original_id)
    DESIGNS.append(dict(original, id=fixed_id, parent='s001',
                        title=original['title'] + ', macro declaration order corrected',
                        supersedes_build_failure=original_id))
import extra_designs
DESIGNS.extend(extra_designs.DESIGNS)


def once(text, old, new):
    assert text.count(old) == 1, (old[:100], text.count(old))
    return text.replace(old, new)


def side_storage(f, declaration, mark, release):
    f['read_ic_types.h'] += '\n' + declaration + '\n'
    f['quickjs.c'] = once(f['quickjs.c'], '    ReadICSite *read_ic_sites;',
                          '    ReadICSide *read_ic_side;\n    ReadICSite *read_ic_sites;')
    f['quickjs.c'] = once(f['quickjs.c'], '            if (b->realm)\n                mark_func(rt, &b->realm->header);',
                         mark + '\n            if (b->realm)\n                mark_func(rt, &b->realm->header);')
    f['read_ic_runtime.inc'] = once(f['read_ic_runtime.inc'], '    b->read_ic_sites = NULL;',
                                   release + '\n    b->read_ic_sites = NULL;')


def auxiliary(f, count, grouped=False):
    # Every secondary shape is strongly owned, marked and released. No cached value or prop pointer.
    field = 'uint32_t offset[%d];' % count if not grouped else 'uint32_t common_offset;'
    side_storage(f, 'typedef struct ReadICSide { JSShape *shape[%d]; %s uint8_t victim; } ReadICSide;' % (count, field),
        '''            if (b->read_ic_side) {
                for (uint32_t i = 0; i < b->read_ic_count; i++)
                    for (unsigned j = 0; j < SIDE_COUNT; j++)
                        if (b->read_ic_side[i].shape[j])
                            mark_func(rt, &b->read_ic_side[i].shape[j]->header);
            }''',
        '''    if (b->read_ic_side) {
        for (uint32_t i = 0; i < b->read_ic_count; i++)
            for (unsigned j = 0; j < SIDE_COUNT; j++)
                js_free_shape_null(rt, b->read_ic_side[i].shape[j]);
        js_free_rt(rt, b->read_ic_side);
        b->read_ic_side = NULL;
    }''')
    f['read_ic_config.h'] += '\n#define SIDE_COUNT %d\n' % count
    read_offset = 'side->common_offset' if grouped else 'side->offset[j]'
    store_offset = 'side->common_offset = offset;' if grouped else 'side->offset[j] = offset;'
    qualification = 'if (offset != s->prop_offset) { rdi_update(ctx, s, shape, offset); return; }' if grouped else ''
    f['read_ic_runtime.inc'] += '''
static force_inline uint32_t rdi_side_probe(JSFunctionBytecode *b, ReadICSite *s, JSShape *shape)
{
    if (b->read_ic_side) {
        ReadICSide *side = &b->read_ic_side[s - b->read_ic_sites];
        for (unsigned j = 0; j < SIDE_COUNT; j++)
            if (side->shape[j] == shape) return READ_OFFSET;
    }
    return UINT32_MAX;
}
static void rdi_side_update(JSContext *ctx, JSFunctionBytecode *b, ReadICSite *s,
                            JSShape *shape, uint32_t offset)
{
    if (!s->shape || s->shape == shape) { rdi_update(ctx, s, shape, offset); return; }
    QUALIFICATION
    if (!b->read_ic_side) {
        /* Optional optimization allocation cannot introduce a JS exception. */
        b->read_ic_side = js_mallocz_rt(ctx->rt, sizeof(ReadICSide) * b->read_ic_count);
        if (!b->read_ic_side) { rdi_update(ctx, s, shape, offset); return; }
    }
    ReadICSide *side = &b->read_ic_side[s - b->read_ic_sites];
    unsigned empty = SIDE_COUNT, j;
    for (j = 0; j < SIDE_COUNT; j++) {
        if (side->shape[j] == shape) { STORE_OFFSET return; }
        if (!side->shape[j] && empty == SIDE_COUNT) empty = j;
    }
    if (empty == SIDE_COUNT) { j = side->victim; side->victim = (j + 1) % SIDE_COUNT; }
    else j = empty;
    JSShape *old = side->shape[j];
    js_dup_shape(shape);
    side->shape[j] = shape;
    STORE_OFFSET
    js_free_shape_null(ctx->rt, old);
}
'''.replace('READ_OFFSET', read_offset).replace('STORE_OFFSET', store_offset).replace('QUALIFICATION', qualification)
    ops = f['read_ic_opcodes.inc']
    ops = once(ops, '                RDI_COUNT(shape_misses);',
        '''                offset = rdi_side_probe(b, site, p->shape);            \\
                if (offset != UINT32_MAX) {                            \\
                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    goto name ## _done;                                \\
                }                                                       \\
                RDI_COUNT(shape_misses);''')
    ops = once(ops, 'rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
                       'rdi_side_update(ctx, b, site, p->shape, pr - p->prop);')
    f['read_ic_opcodes.inc'] = ops


def prototype_epoch(f, watched):
    q = f['quickjs.c']
    q = once(q, 'struct JSRuntime {', 'struct JSRuntime {\n    uint64_t rdi_proto_epoch;')
    # A saturated epoch permanently disables prototype caching, so no stale record can match after wrap.
    macro = '#define RDI_EPOCH_BUMP(rt) do { if ((rt)->rdi_proto_epoch != UINT64_MAX) ++(rt)->rdi_proto_epoch; } while (0)\n'
    q = once(q, '/* ensure that the shape can be safely modified */',
                     '/* ensure that the shape can be safely modified */')
    if watched:
        q = once(q, '    uint8_t is_exotic : 1;', '    uint8_t rdi_proto_watched : 1;\n    uint8_t is_exotic : 1;')
        q = once(q, '    p->is_exotic = 0;', '    p->rdi_proto_watched = 0;\n    p->is_exotic = 0;')
    condition = 'if (p->rdi_proto_watched) ' if watched else ''
    anchor = '    sh = p->shape;\n    if (sh->is_hashed) {\n        /* try to find an existing shape */'
    q = once(q, anchor, '    ' + condition + 'RDI_EPOCH_BUMP(ctx->rt);\n' + anchor)
    anchor = '    sh = p->shape;\n    if (sh->is_hashed) {\n        if (js_rc(sh)->ref_count != 1) {'
    q = once(q, anchor, '    ' + condition + 'RDI_EPOCH_BUMP(ctx->rt);\n' + anchor)
    # The macro must precede read_ic_runtime.inc, which installs prototype records.
    q = once(q, '#include "read_ic_runtime.inc"', macro + '#include "read_ic_runtime.inc"')
    f['quickjs.c'] = q
    side_storage(f, 'typedef struct ReadICSide { JSShape *shape; uint64_t epoch; uint32_t offset; } ReadICSide;',
        '''            if (b->read_ic_side)
                for (uint32_t i = 0; i < b->read_ic_count; i++)
                    if (b->read_ic_side[i].shape)
                        mark_func(rt, &b->read_ic_side[i].shape->header);''',
        '''    if (b->read_ic_side) {
        for (uint32_t i = 0; i < b->read_ic_count; i++)
            js_free_shape_null(rt, b->read_ic_side[i].shape);
        js_free_rt(rt, b->read_ic_side);
        b->read_ic_side = NULL;
    }''')
    watch = 'holder->rdi_proto_watched = 1;' if watched else ''
    f['read_ic_runtime.inc'] += '''
/* Only a single ordinary, non-exotic prototype with an own normal data field.
   The retained receiver shape owns its prototype object. Values are always loaded afresh. */
static void rdi_proto_update(JSContext *ctx, JSFunctionBytecode *b, ReadICSite *site,
                             JSObject *receiver, JSObject *holder, uint32_t offset)
{
    if (ctx->rt->rdi_proto_epoch == UINT64_MAX || receiver->class_id != JS_CLASS_OBJECT ||
        receiver->is_exotic || !receiver->shape->is_hashed || receiver->shape->proto != holder ||
        holder->class_id != JS_CLASS_OBJECT || holder->is_exotic || !holder->shape->is_hashed) return;
    if (!b->read_ic_side) {
        b->read_ic_side = js_mallocz_rt(ctx->rt, sizeof(ReadICSide) * b->read_ic_count);
        if (!b->read_ic_side) return;
    }
    ReadICSide *side = &b->read_ic_side[site - b->read_ic_sites];
    JSShape *old = side->shape;
    js_dup_shape(receiver->shape);
    WATCH
    side->shape = receiver->shape;
    side->epoch = ctx->rt->rdi_proto_epoch;
    side->offset = offset;
    js_free_shape_null(ctx->rt, old);
}
'''.replace('WATCH', watch)
    ops = f['read_ic_opcodes.inc']
    ops = once(ops, '                RDI_COUNT(shape_misses);', '''                if (b->read_ic_side && ctx->rt->rdi_proto_epoch != UINT64_MAX) { \\
                    ReadICSide *side = &b->read_ic_side[site - b->read_ic_sites]; \\
                    if (side->shape == p->shape && side->epoch == ctx->rt->rdi_proto_epoch) { \\
                        JSObject *holder = p->shape->proto;             \\
                        val = JS_DupValue(ctx, holder->prop[side->offset].u.value); \\
                        goto name ## _done;                            \\
                    }                                                   \\
                }                                                       \\
                RDI_COUNT(shape_misses);''')
    ops = once(ops, 'if (p != origin) { RDI_REASON(inherited); }',
        'if (p != origin) { RDI_REASON(inherited); rdi_proto_update(ctx, b, site, origin, p, pr - p->prop); }')
    f['read_ic_opcodes.inc'] = ops


def borrowed_loads(f, prepared, fix_declaration=False):
    macro = '''
/* The slot still owns receiver. No callback/allocation or release is permitted
   between the borrowed read and the completed normal-data exact-shape hit. */
#define RDI_BORROW_LOAD(slot) do {                                       \\
    JSValueConst receiver = (slot);                                     \\
    if (*pc == OP_get_field_rdi && JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) { \\
        JSObject *object = JS_VALUE_GET_OBJ(receiver);                   \\
        ReadICSite *site = (ReadICSite *)(pc + 1 + get_u32(pc + 1));      \\
        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && \\
            site->shape == object->shape) {                             \\
            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value); \\
            pc += 5;                                                    \\
            break;                                                      \\
        }                                                               \\
    }                                                                   \\
    *sp++ = JS_DupValue(ctx, receiver);                                  \\
} while (0)
'''
    if fix_declaration:
        q = once(f['quickjs.c'], '    size_t alloca_size;\n\n#if !DIRECT_DISPATCH',
                 '    size_t alloca_size;\n' + macro + '\n#if !DIRECT_DISPATCH')
    else:
        q = once(f['quickjs.c'], '#include "read_ic_opcodes.inc"', '#include "read_ic_opcodes.inc"\n' + macro)
    names = ['get_loc%d' % i for i in range(4)] + ['get_arg%d' % i for i in range(4)]
    extra = []
    for name in names:
        slot = ('var_buf' if 'loc' in name else 'arg_buf') + '[' + name[-1] + ']'
        original = 'CASE(OP_%s): *sp++ = JS_DupValue(ctx, %s); BREAK;' % (name, slot)
        new_case = 'CASE(OP_rdi_%s): RDI_BORROW_LOAD(%s); BREAK;' % (name, slot)
        q = once(q, original, original + '\n        ' + new_case if prepared else
                 'CASE(OP_%s): RDI_BORROW_LOAD(%s); BREAK;' % (name, slot))
        extra.append('DEF(rdi_%s, 1, 0, 1, none)' % name)
    if prepared:
        f['quickjs-opcode.h'] = once(f['quickjs-opcode.h'], '\n#undef DEF', '\n' + '\n'.join(extra) + '\n#undef DEF')
        f['read_ic_prepare.inc'] = once(f['read_ic_prepare.inc'], '    assert(index == count);', '''    for (pos = 0; pos < b->byte_code_len; ) {
        uint8_t *pc = b->byte_code_buf + pos;
        op = *pc;
        int size = short_opcode_info(op).size;
        if (size == 1 && pos + 1 < b->byte_code_len && pc[1] == OP_get_field_rdi) {
            switch (op) {
SWITCH_PREPARE
            default: break;
            }
        }
        pos += size;
    }
    assert(index == count);'''.replace('SWITCH_PREPARE', '\n'.join('            case OP_%s: *pc = OP_rdi_%s; break;' % (name, name) for name in names)))
        anchor = '        op = bc_buf[pos];\n        if (op == OP_get_field_rdi'
        assert q.count(anchor) == 2  # writer then reader, distinct responsibilities
        q = q.replace(anchor,
                 '        op = bc_buf[pos];\n        switch (op) {\n' +
                 '\n'.join('        case OP_rdi_%s: op = OP_%s; bc_buf[pos] = op; break;' % (name, name) for name in names) +
                 '\n        default: break;\n        }\n        if (op == OP_get_field_rdi', 1)
        q = once(q, 'if (op == OP_get_field_rdi || op == OP_get_field2_rdi) {\n            b->byte_code_len = pos;',
                 'if (op == OP_get_field_rdi || op == OP_get_field2_rdi ||\n            ' +
                 ' || '.join('op == OP_rdi_' + name for name in names) + ') {\n            b->byte_code_len = pos;')
    f['quickjs.c'] = q


def render(cid):
    f = seed_module.seed('s001')
    if cid in ['a01', 'a02']:
        auxiliary(f, 1 if cid == 'a01' else 3)
    elif cid in ['c01', 'c02']:
        prototype_epoch(f, cid == 'c02')
    elif cid in ['d01', 'd02', 'd03', 'd04']:
        borrowed_loads(f, cid in ['d02', 'd04'], cid in ['d03', 'd04'])
    elif cid in {row['id'] for row in extra_designs.DESIGNS}:
        return extra_designs.render(cid, __import__(__name__))
    else:
        raise KeyError(cid)
    return f


def patch(cid):
    old, new = seed_module.seed('s001'), render(cid)
    return ''.join(''.join(difflib.unified_diff(old.get(name, '').splitlines(True), content.splitlines(True),
                                              'a/' + name, 'b/' + name))
                   for name, content in new.items() if content != old.get(name))
