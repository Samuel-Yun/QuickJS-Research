"""A bounded fallback space of interactions between the small corrections."""
import itertools
import variants

CONFIGURATIONS = []
for values in itertools.product(['none', 'reuse', 'promote'], ['inline', 'outline'],
                                ['late', 'early'], [False, True], [False, True]):
    CONFIGURATIONS.append(dict(zip(['prediction', 'miss_body', 'shape_read', 'known_release', 'likely_hit'], values)))
assert len(CONFIGURATIONS) == 48
BASE_RENDER = variants.render


def descriptions():
    rows = []
    for index, config in enumerate(CONFIGURATIONS, 1):
        rows.append(dict(id='mx' + str(index).zfill(3), parent='s001', kind='INTERACTION_CONFIGURATION',
            title='Bounded interaction ' + str(config), config=config,
            before='The isolated corrections have not produced a clear complete-suite improvement.',
            change='Compose the listed guard order, miss organization, existing-offset prediction and cleanup choices on16B s001.',
            tradeoff='Interactions can alter native code and register pressure. No new ownership, capacity or benchmark specialization is introduced.'))
    return rows


def render(cid):
    config = CONFIGURATIONS[int(cid[2:]) - 1]
    parent = {'none': 'rf000', 'reuse': 'rf015', 'promote': 'rf016'}[config['prediction']]
    files = BASE_RENDER(parent)
    source = files['read_ic_opcodes.inc']
    if config['shape_read'] == 'early':
        source = variants.once(source, '            p = JS_VALUE_GET_OBJ(obj);',
            '            p = JS_VALUE_GET_OBJ(obj);                                  \\\n'
            '            uint32_t earlier_offset = (site->shape == p->shape) ? site->prop_offset : UINT32_MAX;')
        source = variants.once(source, 'offset = rdi_probe(site, p->shape RDI_DARG(d));',
                               'offset = earlier_offset; RDI_COUNT(comparisons);')
    if config['likely_hit']:
        source = variants.once(source, 'if (offset != UINT32_MAX)', 'if (likely(offset != UINT32_MAX))')
    if config['known_release']:
        old = '''                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    goto name ## _done;'''
        new = '''                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    if (!(keep)) {                                     \\
                        JS_FreeValue(ctx, JS_MKPTR(JS_TAG_OBJECT, p));   \\
                        sp[-1] = val;                                  \\
                        goto name ## _finished;                        \\
                    }                                                   \\
                    goto name ## _done;'''
        source = variants.once(source, old, new)
        tail = '        else { JS_FreeValue(ctx, sp[-1]); sp[-1] = val; }                \\\n    }'
        source = variants.once(source, tail, tail[:-5] + '    name ## _finished:;                                                \\\n    }')
    if config['miss_body'] == 'outline':
        runtime = BASE_RENDER('rf000')['read_ic_runtime.inc']
        helper_runtime = BASE_RENDER('rf014')['read_ic_runtime.inc']
        assert helper_runtime.startswith(runtime)
        files['read_ic_runtime.inc'] += helper_runtime[len(runtime):]
        start = source.index('        RDI_COUNT(fallback);')
        stop = source.index('    name ## _done:', start)
        source = source[:start] + '''        sf->cur_pc = pc;                                                \\
        val = rdi_read_miss(ctx, sp[-1], site RDI_DARG(d));              \\
        if (unlikely(JS_IsException(val))) goto exception;              \\
''' + source[stop:]
    files['read_ic_opcodes.inc'] = source
    return files
