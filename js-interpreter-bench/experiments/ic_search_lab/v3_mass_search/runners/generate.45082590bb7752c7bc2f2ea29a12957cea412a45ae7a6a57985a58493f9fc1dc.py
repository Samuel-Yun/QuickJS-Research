"""Deterministic source generation. Every effective configuration is explicit."""
import difflib
import hashlib
import json
import re
import tarfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT = dict(slots=1, mru=0, eviction=0, layout=0, pc_rel=1, table_entries=0,
               table_ways=1, table_admission=1, policy=0, warm=2,
               hint_scope=0, hints=1, hint_update=0, scan_max=0, scan_reverse=0,
               scan_all=0, fuse_drop=0, shared_fallback=0)


def resolve(row):
    config = DEFAULT.copy()
    family = row['family']
    parent = row.get('parent', 's001')
    if family == 'P':
        config.update(slots=row['slots'], mru=int(row['probe'] == 'mru'), eviction=['rr', 'lru', 'clock'].index(row['eviction']))
    elif family == 'L':
        config.update(slots=row['slots'], pc_rel=int(row['locate'] == 'pc_rel'), layout=['aos', 'soa', 'hot_cold', 'u16_checked'].index(row['layout']))
        parent = 's001' if config['pc_rel'] else 'M'
    elif family == 'T':
        if row['scope'] == 'runtime':
            return None, parent, 'runtime table has no proven context-independent GC root / release-reentry protocol; function scope is implemented separately'
        config.update(table_entries=row['entries'], table_ways=row['ways'], table_admission=row['admission'])
    elif family == 'Q':
        config.update(slots=row['slots'], warm=row['warm'], policy=1 + ['miss_streak', 'sampled_rate', 'confidence', 'cooldown'].index(row['policy']))
    elif family == 'H':
        config.update(hint_scope=1 + ['site', 'shape', 'function_atom'].index(row['scope']), hints=row['hints'],
                      hint_update=['rr', 'second_observation', 'fill_only'].index(row['update']))
    elif family == 'F':
        if row['pattern'] != 'read_drop':
            return None, parent, 'Producer/receiver/call fusion has no completed operand, exception-entry and serialization proof; original bytecodes remain untouched'
        config.update(pc_rel=int(parent == 's001'), fuse_drop=1, shared_fallback=int(row['fallback'] == 'shared'))
    elif family == 'S':
        config.update(scan_max=row['max_props'], scan_reverse=int(row['scan'] == 'reverse'), scan_all=int(row['coverage'] == 'all_own_descriptors'))
    elif family == 'CONTROL':
        config.update(row.get('config', {}))
    elif family == 'COMBINATION':
        config.update(row['config'])
    else:
        raise ValueError(family)
    return config, parent, None


def seed(parent):
    if parent == 'A':
        archive_path = HERE / 'seed_A.tar.gz'
        with tarfile.open(archive_path) as archive:
            return {m.name: archive.extractfile(m).read().decode().replace('\r\n', '\n') for m in archive.getmembers() if m.isfile()}
    with tarfile.open(HERE / 'seed_M.tar.gz') as archive:
        files = {m.name: archive.extractfile(m).read().decode() for m in archive.getmembers() if m.isfile()}
    if parent == 'M':
        return files
    assert parent == 's001'
    lines = (HERE / 'patches/seed_s001.patch').read_text().splitlines(True)
    i = 0
    while i < len(lines):
        assert lines[i].startswith('--- a/')
        name = lines[i][6:].strip(); i += 2
        original = files[name].splitlines(True); out = []; cursor = 0
        while i < len(lines) and lines[i].startswith('@@ '):
            match = re.match(r'@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@', lines[i])
            start = int(match[1]) - 1
            out.extend(original[cursor:start]); cursor = start; i += 1
            while i < len(lines) and lines[i][:1] in [' ', '+', '-'] and not lines[i].startswith('--- a/'):
                line = lines[i]
                if line[0] in [' ', '-']:
                    assert original[cursor] == line[1:]
                    cursor += 1
                if line[0] in [' ', '+']: out.append(line[1:])
                i += 1
        out.extend(original[cursor:]); files[name] = ''.join(out)
    return files


def replace_once(text, old, new):
    assert text.count(old) == 1, ('source anchor', old[:100], text.count(old))
    return text.replace(old, new)


def scan_function(text):
    start = text.index('static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,')
    stop = text.index('\n}', start) + 2
    return start, stop, text[start:stop]


def render(row):
    cfg, parent, reason = resolve(row)
    if reason:
        return None, cfg, parent, reason
    files = seed(parent)
    definitions = ''.join(f'#define SEARCH_{key.upper()} {value}\n' for key, value in cfg.items())
    definitions += '#define RDI_CAPACITY SEARCH_SLOTS\n'
    files['read_ic_config.h'] = definitions
    src = files['quickjs.c']
    if parent == 'A':
        src = '#include "read_ic_config.h"\n' + src
    else:
        files['read_ic_types.h'] = (HERE / 'templates/types.h').read_text()
        files['read_ic_runtime.inc'] = (HERE / 'templates/runtime.inc').read_text()
        files['read_ic_prepare.inc'] = (HERE / 'templates/prepare.inc').read_text()
        source_fields = '    ReadICSite *read_ic_sites;\n'
        new_fields = source_fields + '#if SEARCH_LAYOUT == 2\n    JSAtom *read_ic_atoms;\n#endif\n'
        new_fields += '#if SEARCH_TABLE_ENTRIES\n    SearchEntry *read_ic_shared;\n    uint32_t read_ic_shared_cursor;\n#endif\n'
        src = replace_once(src, source_fields, new_fields)
        mark_start = src.index('            for (uint32_t ri = 0; ri < b->read_ic_count; ri++) {')
        mark_end = src.index('            if (b->realm)', mark_start)
        src = src[:mark_start] + '            rdi_mark(rt, b, mark_func);\n' + src[mark_end:]
        if parent == 'M' and cfg['pc_rel']:
            raise AssertionError('M parent must use index addressing')
        if cfg['pc_rel']:
            src = src.replace('put_u32(bc_buf + pos + 1, site->atom);', 'put_u32(bc_buf + pos + 1, rdi_atom(b, site));')
        else:
            src = src.replace('put_u32(bc_buf + pos + 1, b->read_ic_sites[ri].atom);', 'put_u32(bc_buf + pos + 1, rdi_atom(b, &b->read_ic_sites[ri]));')
        op = files['read_ic_opcodes.inc']
        start = op.index('        uint32_t ')
        end = op.index('        JSValue obj', start)
        op = op[:start] + '        uint32_t offset;                                                \\\n        ReadICSite *site = SEARCH_SITE(b, pc);                            \\\n' + op[end:]
        op = '#if SEARCH_PC_REL\n#define SEARCH_SITE(b, pc) ((ReadICSite *)((pc) + get_u32(pc)))\n#else\n#define SEARCH_SITE(b, pc) (&(b)->read_ic_sites[get_u32(pc)])\n#endif\n' + op
        op = op.replace('rdi_probe(site, p->shape', 'rdi_probe(b, site, p->shape')
        op = op.replace('rdi_update(ctx, site,', 'rdi_update(ctx, b, site,')
        op = op.replace('atom = site->atom;', 'atom = rdi_atom(b, site);')
        if cfg['hint_scope'] in [1, 3]:
            owner = '&site->hints' if cfg['hint_scope'] == 1 else '&site->hint_owner->hints'
            hint_read = f'''                offset = search_hint_probe({owner}, p, rdi_atom(b, site)); \\
                if (offset != UINT32_MAX) {{                             \\
                    val = JS_DupValue(ctx, p->prop[offset].u.value);     \\
                    goto name ## _done;                                \\
                }}                                                      \\
'''
            op = replace_once(op, '                RDI_COUNT(shape_misses);', hint_read + '                RDI_COUNT(shape_misses);')
            op = op.replace('                        RDI_REASON(own_miss);', f'                        search_hint_update({owner}, pr - p->prop); \\\n                        RDI_REASON(own_miss);')
        if cfg['shared_fallback']:
            miss_start = op.index('        atom = rdi_atom(b, site);')
            miss_stop = op.index('    name ## _done:', miss_start)
            op = op[:miss_start] + '''        atom = rdi_atom(b, site);                                      \\
        sf->cur_pc = pc;                                                \\
        val = JS_GetPropertyInternal(ctx, obj, atom, obj, 0);            \\
        if (unlikely(JS_IsException(val))) goto exception;              \\
        if (JS_VALUE_GET_TAG(obj) == JS_TAG_OBJECT) {                    \\
            p = JS_VALUE_GET_OBJ(obj);                                  \\
            if (p->class_id == JS_CLASS_OBJECT && !p->is_exotic && p->shape->is_hashed) { \\
                prs = find_own_property(&pr, p, atom);                   \\
                if (prs && !(prs->flags & JS_PROP_TMASK))                \\
                    rdi_update(ctx, b, site, p->shape, pr - p->prop);     \\
            }                                                           \\
        }                                                               \\
''' + op[miss_stop:]
        if cfg['fuse_drop']:
            op = replace_once(op, '            GET_READ_IC(get_field_rdi, 0);\n',
                              '            GET_READ_IC(get_field_rdi, 0);\n            if (*pc == OP_drop) { pc++; JS_FreeValue(ctx, sp[-1]); sp--; }\n')
        files['read_ic_opcodes.inc'] = op
    if cfg['hint_scope']:
        files['search_hints.inc'] = (HERE / 'templates/hints.inc').read_text()
        anchor = 'static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,'
        src = replace_once(src, anchor, '#include "search_hints.inc"\n\n' + anchor)
        if cfg['hint_scope'] == 2:
            src = replace_once(src, '    int deleted_prop_count;\n', '    int deleted_prop_count;\n    SearchHints read_hints;\n')
            assert src.count('    sh->deleted_prop_count = 0;\n') == 2
            src = src.replace('    sh->deleted_prop_count = 0;\n', '    sh->deleted_prop_count = 0;\n    memset(&sh->read_hints, 0, sizeof(sh->read_hints));\n')
            start, stop, lookup = scan_function(src)
            lookup = replace_once(lookup, '    sh = p->shape;\n', '''    sh = p->shape;
    uint32_t predicted = search_hint_probe(&sh->read_hints, p, atom);
    if (predicted != UINT32_MAX) {
        *ppr = &p->prop[predicted];
        return &get_shape_prop(sh)[predicted];
    }
''')
            lookup = replace_once(lookup, '            *ppr = &p->prop[h - 1];',
                                  '            if (sh->is_hashed && !(pr->flags & JS_PROP_TMASK)) search_hint_update(&sh->read_hints, h - 1);\n            *ppr = &p->prop[h - 1];')
            src = src[:start] + lookup + src[stop:]
    if cfg['scan_max']:
        start, stop, lookup = scan_function(src)
        lookup = replace_once(lookup, '    sh = p->shape;\n', '''    sh = p->shape;
    if (sh->is_hashed && sh->deleted_prop_count == 0 && atom != JS_ATOM_NULL &&
        sh->prop_count <= SEARCH_SCAN_MAX && p->class_id == JS_CLASS_OBJECT && !p->is_exotic) {
        prop = get_shape_prop(sh);
        for (uint32_t k = 0; k < (uint32_t)sh->prop_count; k++) {
            uint32_t index = SEARCH_SCAN_REVERSE ? sh->prop_count - 1 - k : k;
            pr = &prop[index];
#if !SEARCH_SCAN_ALL
            if (pr->flags & JS_PROP_TMASK) goto search_original_hash;
#endif
            if (pr->atom == atom) { *ppr = &p->prop[index]; return pr; }
        }
        *ppr = NULL; return NULL;
    }
#if !SEARCH_SCAN_ALL
search_original_hash:
#endif
''')
        src = src[:start] + lookup + src[stop:]
    files['quickjs.c'] = src
    return files, cfg, parent, None


def patch_text(files, parent):
    original = seed(parent)
    patch = []
    for name in sorted(set(files) | set(original)):
        before = original.get(name, '')
        after = files.get(name, '')
        if before != after:
            patch.extend(difflib.unified_diff(before.splitlines(True), after.splitlines(True), fromfile='a/' + name, tofile='b/' + name))
    return ''.join(patch)
