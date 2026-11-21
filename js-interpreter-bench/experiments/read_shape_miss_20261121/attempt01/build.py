"""Independent experiment from the frozen original SPARSE, not TWICE."""
import difflib
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
PACKAGE = HERE.parents[2] / 'on_demand_ctor_cache'
LABELS = ['SPARSE', 'SKIP_REPROBE']


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def save(p, value):
    p.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def once(s, a, b):
    assert s.count(a) == 1, (s.count(a), a[:100])
    return s.replace(a, b)


def candidate(q, r):
    q = once(q, '    const uint8_t *pc;\n    int opcode, arg_allocated_size',
             '    const uint8_t *pc;\n    ReadICSite *borrow_miss_site; /* assigned only on the arg0 shape miss */\n    int opcode, arg_allocated_size')
    q = once(q, '#define V6_PREPARED_BORROW(slot) do {',
             '#define V6_PREPARED_BORROW(slot, skip_shape_miss) do {')
    a = '''        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic && \\
            site->shape == object->shape) {                            \\
            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value); \\
            pc += 5;                                                   \\
            break;                                                     \\
        }                                                              \\
'''
    b = '''        if (object->class_id == JS_CLASS_OBJECT && !object->is_exotic) { \\
            if (site->shape == object->shape) {                         \\
                *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value); \\
                pc += 5;                                               \\
                break;                                                 \\
            }                                                          \\
            if (skip_shape_miss) {                                     \\
                *sp++ = JS_DupValue(ctx, receiver);                     \\
                borrow_miss_site = site;                               \\
                pc += 5; /* now past get_field_rdi and its operand */   \\
                goto get_field_rdi_borrow_miss;                         \\
            }                                                          \\
        }                                                              \\
'''
    q = once(q, a, b)
    q = once(q, 'V6_PREPARED_BORROW(var_buf[0]);', 'V6_PREPARED_BORROW(var_buf[0], 0);')
    q = once(q, 'V6_PREPARED_BORROW(arg_buf[0]);', 'V6_PREPARED_BORROW(arg_buf[0], 1);')
    prefix = '''/* Only arg0's proven ordinary-object shape miss enters here. */
#ifdef READ_IC_DIAGNOSTIC
#define RDI_BORROW_DIAG() do {                                         \\
    d = &b->read_ic_diag->sites[site - b->read_ic_sites];                 \\
    RDI_QUERY(); RDI_COUNT(shape_misses);                               \\
} while (0)
#else
#define RDI_BORROW_DIAG() ((void)0)
#endif
#define RDI_BORROW_MISS_ENTRY                                          \\
    get_field_rdi_borrow_miss:                                         \\
        site = borrow_miss_site;                                      \\
        obj = sp[-1];                                                 \\
        RDI_BORROW_DIAG();

'''
    r = once(r, '#define GET_READ_IC(name, keep)', prefix + '#define GET_READ_IC(name, keep, borrow_entry)')
    r = once(r, '        RDI_COUNT(fallback);',
             '''        goto name ## _lookup;                                          \\
        borrow_entry                                                   \\
    name ## _lookup:                                                    \\
        RDI_COUNT(fallback);''')
    r = once(r, 'GET_READ_IC(get_field_rdi, 0);', 'GET_READ_IC(get_field_rdi, 0, RDI_BORROW_MISS_ENTRY);')
    r = once(r, 'GET_READ_IC(get_field2_rdi, 1);', 'GET_READ_IC(get_field2_rdi, 1, );')
    r += '#undef RDI_BORROW_MISS_ENTRY\n#undef RDI_BORROW_DIAG\n'
    return q, r


COUNTERS = ['fused_entries', 'fused_shape_checks', 'fused_hits',
            'field_entries', 'field_cache_probes', 'field_hits',
            'direct_lookup_entries', 'lookups', 'own_searches', 'updates']


def instrument(q, r):
    """Count only readX's single static read site; no changes to Release."""
    code = '\n/* Independent counters for the selected readX site only. */\n'
    code += 'enum { ' + ', '.join('SM_' + k for k in COUNTERS) + ', SM_END };\n'
    code += 'static uint64_t sm_counts[SM_END];\n'
    code += '''static void sm_record(JSContext *ctx, JSFunctionBytecode *b,
                      ReadICSite *site, unsigned k)
{
    char buf[128];
    if (b->read_ic_count == 1 && site == b->read_ic_sites &&
        !strcmp(JS_AtomGetStr(ctx, buf, sizeof(buf), b->func_name), "readX"))
        sm_counts[k]++;
}
static void __attribute__((destructor)) sm_report(void)
{
    fprintf(stderr, "READ_SHAPE_COUNTS:{");
'''
    for i, k in enumerate(COUNTERS):
        code += f'    fprintf(stderr, "{"," if i else ""}\\"{k}\\":%" PRIu64, sm_counts[SM_{k}]);\n'
    code += '    fprintf(stderr, "}\\n");\n}\n#define SM(k) sm_record(ctx,b,site,SM_##k)\n'
    anchor = '/* argv[] is modified if (flags & JS_CALL_FLAG_COPY_ARGV) = 0. */\nstatic JSValue JS_CallInternal'
    q = once(q, anchor, code + '\n' + anchor)
    continuation = ' ' + chr(92) + chr(10)
    def before(s, anchor, extra):
        return once(s, anchor, extra + continuation + anchor)
    q = before(q, '        if (object->class_id == JS_CLASS_OBJECT',
               '        SM(fused_entries);')
    if 'skip_shape_miss' in q:
        q = before(q, '            if (site->shape == object->shape) {',
                   '            SM(fused_shape_checks);')
    else:
        q = once(q, '            site->shape == object->shape) {',
                 '            (SM(fused_shape_checks), site->shape == object->shape)) {')
    a = '*sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
    q = once(q, a, 'SM(fused_hits); ' + a)
    r = before(r, '        pc += 4;', '        SM(field_entries);')
    r = before(r, '                    offset = rdi_probe(site, p->shape RDI_DARG(d));',
               '                    SM(field_cache_probes);')
    r = before(r, '                    RDI_COUNT(hits);', '                    SM(field_hits);')
    if 'borrow_entry' in r:
        r = before(r, '        obj = sp[-1];', '        SM(direct_lookup_entries);')
    r = before(r, '        RDI_COUNT(fallback);', '        SM(lookups);')
    r = before(r, '                prs = find_own_property(&pr, p, atom);',
               '                SM(own_searches);')
    r = before(r, '                        rdi_update(ctx, site, p->shape, pr - p->prop RDI_DARG(d));',
               '                        SM(updates);')
    return q, r


def main():
    m = json.loads((PACKAGE / 'manifest.json').read_text())
    frozen = PACKAGE / 'modified'
    for n, digest in m['modified'].items():
        assert sha(frozen / n) == digest, n
    old = {n: (frozen / n).read_text() for n in ['quickjs.c', 'read_ic_opcodes.inc']}
    new = dict(zip(old, candidate(*old.values())))
    patch = ''.join(''.join(difflib.unified_diff(old[n].splitlines(True), new[n].splitlines(True),
                    fromfile='a/' + n, tofile='b/' + n)) for n in old)
    (HERE / 'SPARSE-to-SKIP_REPROBE.patch').write_text(patch)
    for label in LABELS:
        for mode in ['release', 'counts']:
            dest = HERE / 'work' / (label + '.' + mode)
            if dest.exists():
                manifest = HERE / (label + '.' + mode + '.manifest.json')
                if manifest.exists():
                    assert sha(dest / 'qjs') == json.loads(manifest.read_text())['binary_sha256']
                    print('BUILD_EXISTS', label, mode, flush=True)
                    continue
                shutil.rmtree(dest)
            shutil.copytree(frozen, dest)
            source = new if label == 'SKIP_REPROBE' else old
            q, r = source.values()
            if mode == 'counts':
                q, r = instrument(q, r)
            for n, s in zip(old, [q, r]):
                # Keep the frozen source's newline representation.
                crlf = b'\r\n' in (frozen / n).read_bytes()
                (dest / n).write_bytes(s.replace('\n', '\r\n' if crlf else '\n').encode())
            for n in m['modified']:
                if n not in old:
                    assert sha(dest / n) == m['modified'][n], n
            command = ['make', '-j2', '-o', 'repl.c', 'qjs']
            with (HERE / (label + '.' + mode + '.build.log')).open('w') as log:
                subprocess.run(command, cwd=dest, stdout=log, stderr=subprocess.STDOUT, check=True)
            save(HERE / (label + '.' + mode + '.manifest.json'), dict(
                parent='frozen original SPARSE_CTOR_IC / 06aada4',
                binary=str(dest / 'qjs'), binary_sha256=sha(dest / 'qjs'),
                command=command, sources={n: sha(dest / n) for n in m['modified']},
                constructor_sources_unchanged=True))
            print('BUILD_PASS', label, mode, flush=True)


if __name__ == '__main__':
    main()
