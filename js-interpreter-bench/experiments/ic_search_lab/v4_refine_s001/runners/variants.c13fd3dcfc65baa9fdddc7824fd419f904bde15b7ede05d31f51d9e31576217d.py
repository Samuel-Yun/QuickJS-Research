"""Small source changes on exact s001; no general parameter expansion."""
import difflib
import hashlib
import importlib.util
from pathlib import Path

HERE = Path(__file__).resolve().parent
V3 = HERE.parent / 'v3_mass_search'
spec = importlib.util.spec_from_file_location('previous_generator', V3 / 'generate.py')
previous = importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)

DESIGNS = [
    dict(id='rf000', parent='s001', kind='CONTROL', title='Exact-source rebuild',
         before='Frozen s001 is built in an earlier directory.', change='Rebuild exact source and matched flags in this workspace.',
         tradeoff='Check loaded native sections and measurement reproducibility; no optimization claim.'),
    dict(id='rf001', parent='s001', kind='CONTROL', title='Publish new shape before releasing old',
         before='The update releases the old shape before publishing the replacement.',
         change='Preserve16B record and publish the new strong reference before release.',
         tradeoff='Safety adaptation and compiler decisions may change miss work; hit logic stays in the original source form.'),
    dict(id='rf008', parent='CTRL000', kind='CONTROL', title='Common template with flat16B single slot',
         before='The common AoS inner entry is padded and the outer atom makes a24B record.',
         change='Flatten the single shape/offset/atom fields while retaining the common functions.',
         tradeoff='Tests the template implementation with a compact record; compiler and preparation differences remain.'),
    dict(id='rf005', parent='rf001', kind='EXPLORATORY', title='Reuse cached offset after a shape mismatch',
         before='An alternating shape triggers ordinary lookup and shape replacement even if the field stays at the cached offset.',
         change='On mismatch verify current hashed shape, range, atom and ordinary descriptor at the existing offset; read current value without promotion.',
         tradeoff='Adds descriptor guards on misses and can retain the initial shape; successful stable shape hits use the original path.'),
    dict(id='rf006', parent='rf001', kind='EXPLORATORY', title='Promote a verified offset prediction',
         before='A verified offset prediction may repeatedly miss the primary shape.',
         change='Use the same prediction as rf005 and promote the verified current shape after preserving the returned value.',
         tradeoff='Can improve a later stable phase while adding replacement/refcount work to alternating shapes.'),
    dict(id='rf002', parent='rf001', kind='EXPLORATORY', title='Likely annotation for the existing hit',
         before='The final hit condition has no explicit likely hint.',
         change='Annotate only that condition; keep guards and storage identical.',
         tradeoff='May change emitted branch layout or do nothing; it is a compiler-guidance experiment.'),
    dict(id='rf003', parent='rf001', kind='EXPLORATORY', title='Defer site decode until receiver guard',
         before='The site is decoded before receiver class is known.',
         change='Decode it inside the eligible ordinary-object branch or the fallback that needs its atom.',
         tradeoff='Can move loads or duplicate cold decoding; compiler hoisting may erase the intended difference.'),
    dict(id='rf004', parent='rf001', kind='EXPLORATORY', title='Out-of-line unchanged miss body',
         before='The full miss/property-chain body is embedded in both read handlers.',
         change='Move it to one noinline helper and set cur_pc before invoking it.',
         tradeoff='Reduces caller code and live values but adds a native call and a PC store on misses.'),
    dict(id='rf007', parent='rf001', kind='EXPLORATORY', title='Compare shape before class guards',
         before='The class guards precede the cached shape comparison.',
         change='Test the same shape and ordinary/exotic guards in a different source order.',
         tradeoff='All guards remain; special objects do a shape comparison and generated branch layout may change.'),
]

EXACT = dict(rf012='rf002', rf013='rf003', rf014='rf004',
             rf015='rf005', rf016='rf006', rf017='rf007')
for new_id, original_id in EXACT.items():
    original = next(row for row in DESIGNS if row['id'] == original_id)
    DESIGNS.append(dict(original, id=new_id, parent='s001',
                       title=original['title'] + ' on exact s001',
                       tradeoff=original['tradeoff'] + ' Original replacement order is retained; rf001 is not bundled.'))
DESIGNS += [
    dict(id='rf018', parent='s001', kind='EXPLORATORY', title='Known-object release on an exact hit',
         before='The shared result join also accepts primitives, so object release may recheck the receiver tag.',
         change='On an exact ordinary-object hit release the same receiver through a known object-tag value and join after normal cleanup.',
         tradeoff='Preserves the decrement/finalizer order, may remove tag discrimination, and duplicates a small cleanup path.'),
    dict(id='rf019', parent='rf001', kind='EXPLORATORY', title='Update specialized for a proved shape miss',
         before='The update checks for a same shape although this caller has just failed its exact-shape probe.',
         change='Use a separate update helper at this caller; preserve the generic updater and all eligibility guards.',
         tradeoff='The no-callback interval and non-sentinel stored offsets establish the precondition; code generation may already remove the check.'),
]


def once(text, old, new):
    assert text.count(old) == 1, ('anchor', old[:90], text.count(old))
    return text.replace(old, new)


def safe_publish(files):
    source = files['read_ic_runtime.inc']
    old = '''    js_dup_shape(shape);
    js_free_shape_null(ctx->rt, s->shape);
    s->shape = shape;
    s->prop_offset = offset;'''
    new = '''    JSShape *old_shape = s->shape;
    js_dup_shape(shape);
    s->shape = shape;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old_shape);'''
    files['read_ic_runtime.inc'] = once(source, old, new)


def render(cid):
    assert cid in {row['id'] for row in DESIGNS}
    if cid in EXACT:
        files = render(EXACT[cid])
        reference = previous.seed('s001')['read_ic_runtime.inc']
        copied = {'read_ic_runtime.inc': reference}
        safe_publish(copied)
        prefix = copied['read_ic_runtime.inc']
        runtime = files['read_ic_runtime.inc']
        assert runtime.startswith(prefix)
        files['read_ic_runtime.inc'] = reference + runtime[len(prefix):]
        return files
    if cid == 'rf018':
        files = previous.seed('s001')
        source = files['read_ic_opcodes.inc']
        old = '''                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    goto name ## _done;'''
        new = '''                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    if (!(keep)) {                                     \\
                        JS_FreeValue(ctx, JS_MKPTR(JS_TAG_OBJECT, p));   \\
                        sp[-1] = val;                                  \\
                        goto name ## _finished;                        \\
                    }                                                   \\
                    goto name ## _done;'''
        source = once(source, old, new)
        tail = '        else { JS_FreeValue(ctx, sp[-1]); sp[-1] = val; }                \\\n    }'
        source = once(source, tail, tail[:-5] + '    name ## _finished:;                                                \\\n    }')
        files['read_ic_opcodes.inc'] = source
        return files
    if cid == 'rf019':
        files = render('rf001')
        files['read_ic_runtime.inc'] += '''
/* Only the exact-shape miss caller uses this helper.
   No callback occurs between probe and this own normal-data update.
   Stored offsets are within a nonnegative int prop_count and cannot be UINT32_MAX. */
static force_inline void rdi_update_miss(JSContext *ctx, ReadICSite *s,
                                       JSShape *shape, uint32_t offset RDI_DPARAM)
{
    RDI_COUNT(updates);
    if (s->shape) { RDI_REPLACE(); } else { RDI_OCCUPY(); }
    JSShape *old_shape = s->shape;
    js_dup_shape(shape);
    s->shape = shape;
    s->prop_offset = offset;
    js_free_shape_null(ctx->rt, old_shape);
}
'''
        files['read_ic_opcodes.inc'] = once(files['read_ic_opcodes.inc'], 'rdi_update(ctx, site,', 'rdi_update_miss(ctx, site,')
        return files
    if cid == 'rf008':
        files, config, parent, reason = previous.render(dict(id=cid, family='CONTROL', parent='s001', config={}))
        assert reason is None and config['slots'] == 1 and config['pc_rel'] == 1
        files['read_ic_types.h'] = once(files['read_ic_types.h'],
            '    struct { JSShape *shape; uint32_t offset; } entries[SEARCH_SLOTS];',
            '    JSShape *shape;\n    uint32_t prop_offset;')
        files['read_ic_runtime.inc'] = files['read_ic_runtime.inc'].replace(
            '#define RDI_SHAPE(s, i) ((s)->entries[i].shape)', '#define RDI_SHAPE(s, i) ((s)->shape)').replace(
            '#define RDI_OFFSET(s, i) ((s)->entries[i].offset)', '#define RDI_OFFSET(s, i) ((s)->prop_offset)')
        return files
    files = previous.seed('s001')
    if cid == 'rf000':
        return files
    safe_publish(files)
    source = files['read_ic_opcodes.inc']
    if cid == 'rf002':
        source = once(source, 'if (offset != UINT32_MAX)', 'if (likely(offset != UINT32_MAX))')
    elif cid == 'rf003':
        source = once(source,
            '        uint32_t delta = get_u32(pc), offset;',
            '        uint32_t offset; const uint8_t *operand_pc = pc;')
        source = once(source,
            '        ReadICSite *site = (ReadICSite *)(pc + delta);',
            '        ReadICSite *site = NULL; RDI_EARLY_DIAG_SITE(site, operand_pc);')
        source = once(source, '                offset = rdi_probe(site, p->shape',
            '                site = (ReadICSite *)(operand_pc + get_u32(operand_pc)); \\\n                offset = rdi_probe(site, p->shape')
        source = once(source, '        atom = site->atom;',
            '        site = (ReadICSite *)(operand_pc + get_u32(operand_pc)); \\\n        atom = site->atom;')
        source = '''#ifdef READ_IC_DIAGNOSTIC
#define RDI_EARLY_DIAG_SITE(site, pc) ((site) = (ReadICSite *)((pc) + get_u32(pc)))
#else
#define RDI_EARLY_DIAG_SITE(site, pc) ((void)0)
#endif
''' + source + '\n#undef RDI_EARLY_DIAG_SITE\n'
    elif cid in ['rf005', 'rf006']:
        promotion = '                        rdi_update(ctx, site, p->shape, predicted RDI_DARG(d)); \\\n' if cid == 'rf006' else ''
        hint = '''                if (site->shape && p->shape->is_hashed && site->atom != JS_ATOM_NULL) { \\
                    uint32_t predicted = site->prop_offset;              \\
                    if (predicted < (uint32_t)p->shape->prop_count) {     \\
                        JSShapeProperty *entry = &get_shape_prop(p->shape)[predicted]; \\
                        if (entry->atom == site->atom && !(entry->flags & JS_PROP_TMASK)) { \\
                            val = JS_DupValue(ctx, p->prop[predicted].u.value); \\
''' + promotion + '''                            RDI_COUNT(hits);                            \\
                            goto name ## _done;                         \\
                        }                                               \\
                    }                                                   \\
                }                                                       \\
'''
        source = once(source, '                RDI_COUNT(shape_misses);', hint + '                RDI_COUNT(shape_misses);')
    elif cid == 'rf007':
        start = source.index('            if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic)')
        end = source.index('        RDI_COUNT(fallback);', start)
        original = source[start:end]
        assert original.endswith('        }                                                               \\\n')
        replacement = '''            RDI_COUNT(comparisons);                                    \\
            if (p->shape == site->shape && p->class_id == JS_CLASS_OBJECT && !p->is_exotic) { \\
                RDI_COUNT(hits);                                       \\
                val = JS_DupValue(ctx, p->prop[site->prop_offset].u.value); \\
                goto name ## _done;                                    \\
            }                                                          \\
            if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic)         \\
                RDI_COUNT(shape_misses);                               \\
        }                                                               \\
'''
        source = source[:start] + replacement + source[end:]
    elif cid == 'rf004':
        start = source.index('        RDI_COUNT(fallback);')
        stop = source.index('    name ## _done:', start)
        body = source[start:stop]
        plain = ''.join(line.rstrip().removesuffix('\\').rstrip() + '\n' for line in body.splitlines())
        plain = plain.replace('name ## _slow', 'read_slow').replace('sp[-1]', 'receiver')
        plain = plain.replace('            sf->cur_pc = pc;\n', '')
        plain = plain.replace('if (unlikely(JS_IsException(val))) goto exception;', 'if (unlikely(JS_IsException(val))) return val;')
        helper = '''static __attribute__((noinline)) JSValue rdi_read_miss(JSContext *ctx,
                                         JSValueConst receiver, ReadICSite *site RDI_DPARAM)
{
    JSValue obj = receiver, val;
    JSAtom atom;
    JSObject *p, *origin;
    JSProperty *pr;
    JSShapeProperty *prs;
''' + plain + '    return val;\n}\n'
        files['read_ic_runtime.inc'] += '\n' + helper
        source = source[:start] + '''        sf->cur_pc = pc;                                                \\
        val = rdi_read_miss(ctx, sp[-1], site RDI_DARG(d));              \\
        if (unlikely(JS_IsException(val))) goto exception;              \\
''' + source[stop:]
    files['read_ic_opcodes.inc'] = source
    return files


def patch(cid):
    files = render(cid)
    parent = next(row['parent'] for row in DESIGNS if row['id'] == cid)
    if parent == 'CTRL000':
        before = previous.render(dict(id='CTRL000', family='CONTROL', parent='s001', config={}))[0]
    else:
        before = render(parent) if parent.startswith('rf') else previous.seed(parent)
    output = []
    for name in sorted(set(before) | set(files)):
        if before.get(name, '') != files.get(name, ''):
            output.extend(difflib.unified_diff(before.get(name, '').splitlines(True), files.get(name, '').splitlines(True),
                                             fromfile='a/' + name, tofile='b/' + name))
    return ''.join(output)
