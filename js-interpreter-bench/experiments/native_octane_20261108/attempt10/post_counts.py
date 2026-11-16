"""After performance: N=1 mechanism coverage on independent instrumented ELFs."""
import gzip
import hashlib
import json
import os
from pathlib import Path
import tarfile
import run as experiment
import variants

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:120])
    return text.replace(old, new, 1)


def diagnostic(label):
    files = variants.parent() if label == 'CONTROL' else variants.render(label)
    files = files.copy()
    q = files['quickjs.c']
    helpers = '''static int next_active;
static unsigned long long next_prepares, next_sites, next_bytes;
static unsigned long long next_probe_second, next_borrow_second, next_second_fills, next_offset_resets, next_store_second;
void next_begin(void) { next_active = 1; }
void next_end(void) {
    next_active = 0;
    printf("NEXT_COUNTS:{\\"prepare_calls\\":%llu,\\"prepared_sites\\":%llu,\\"prepare_requested_bytes\\":%llu,\\"own2_probe_second\\":%llu,\\"own2_borrow_second\\":%llu,\\"own2_second_fills\\":%llu,\\"own2_offset_resets\\":%llu,\\"own2_store_second\\":%llu}\\n",
           next_prepares, next_sites, next_bytes, next_probe_second, next_borrow_second,
           next_second_fills, next_offset_resets, next_store_second);
}

'''
    anchor = 'static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,'
    q = once(q, anchor, helpers + anchor)
    p = files['read_ic_prepare.inc']
    p = once(p, '    assert(!b->read_ic_ready && !b->read_ic_sites);',
                '    if (next_active) next_prepares++;\n    assert(!b->read_ic_ready && !b->read_ic_sites);')
    p = once(p, '    if (!count) return 0;',
                '    if (next_active) next_sites += count;\n    if (!count) return 0;')
    anchor = '    linked = js_mallocz_rt(ctx->rt, total);' if label == 'COLD_ENTRY' else '    linked = js_mallocz(ctx, total);'
    p = once(p, anchor, '    if (next_active) next_bytes += total;\n' + anchor)
    files['read_ic_prepare.inc'] = p
    if label == 'OWN2':
        r = files['read_ic_runtime.inc']
        r = once(r, '    return s->shape == shape || s->holder_shape == shape ? s->prop_offset : UINT32_MAX;',
                    '    if (next_active && s->shape != shape && s->holder_shape == shape) next_probe_second++;\n'
                    '    return s->shape == shape || s->holder_shape == shape ? s->prop_offset : UINT32_MAX;')
        r = once(r, '        JSShape *old = s->holder_shape;',
                    '        if (next_active) next_second_fills++;\n        JSShape *old = s->holder_shape;')
        anchor = '        rdi_update(ctx, s, shape, offset RDI_DARG(d));'
        r = once(r, anchor, '        if (next_active) next_offset_resets++;\n' + anchor)
        files['read_ic_runtime.inc'] = r
        anchor = '            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);'
        q = once(q, anchor, '            if (next_active && site->shape != object->shape) next_borrow_second++; \\\n' + anchor)
        anchor = '                        uint32_t offset = site->prop_offset;'
        q = once(q, anchor, '                        if (next_active && from_own_read && site->shape != p->shape) next_store_second++;\n' + anchor)
    files['quickjs.c'] = q
    c = files['quickjs-libc.c']
    functions = '''extern void next_begin(void);
extern void next_end(void);
static JSValue next_js_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ next_begin(); return JS_UNDEFINED; }
static JSValue next_js_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ next_end(); return JS_UNDEFINED; }

'''
    anchor = 'void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
    c = once(c, anchor, functions + anchor)
    anchor = '    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
    c = once(c, anchor, anchor + '''
    JS_SetPropertyStr(ctx, global_obj, "__next_begin", JS_NewCFunction(ctx, next_js_begin, "__next_begin", 0));
    JS_SetPropertyStr(ctx, global_obj, "__next_end", JS_NewCFunction(ctx, next_js_end, "__next_end", 0));''')
    files['quickjs-libc.c'] = c
    return files


def main():
    experiment.verify()
    assert experiment.b.load(HERE / 'audit.json')['status'] == 'PASS_COMPLETE'
    recorder = experiment.module('entry_own_post_recorder', experiment.OLD / 'run.py')
    recorder.H = HERE / 'post_counts'
    os.sched_setaffinity(0, {2})
    recorder.save('environment.json', recorder.environment())
    cases = ['Richards.Richards', 'RayTrace.RayTrace', 'EarleyBoyer.Boyer',
             'Splay.Splay', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Mandreel.Mandreel']
    protocol = recorder.load(HERE / 'protocol.json')
    for case in cases:
        original = Path(protocol['scripts'][case]['correctness']['path'])
        script = once(original.read_text(), '  var started=now();', '  __next_begin();\n  var started=now();')
        script = once(script, '  var stopped=now();', '  var stopped=now();\n  __next_end();')
        recorder.save('scripts/' + case + '.js', script)
    summary, identities = [], {}
    for label in ['COLD_ENTRY']:
        files = diagnostic(label)
        dest = HERE / 'work' / ('POST_' + label)
        dest.mkdir()
        for name, text in files.items():
            (dest / name).write_bytes(text.encode())
        (dest / 'compat').mkdir()
        with tarfile.open(experiment.LAB / 'v3_mass_search/build_support.tar.gz') as archive:
            (dest / 'compat/test-closefrom.c').write_bytes(archive.extractfile('compat/test-closefrom.c').read())
        result = recorder.capture(['make', '-j1', 'qjs'], 'build', label, 300, cwd=dest)
        assert result['exit_code'] == 0 and not result['timeout'], result['stderr'][-4000:]
        identities[label] = dict(sources={n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()},
                                 binary_sha256=recorder.sha(dest / 'qjs'))
        for case in cases:
            result = recorder.capture([dest / 'qjs', recorder.H / 'scripts' / (case + '.js')], 'counts', label + '/' + case, 180)
            assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr']
            assert '"correctness":"PASS"' in result['stdout']
            prefix = 'NEXT_COUNTS:'
            counts = json.loads(next(line[len(prefix):] for line in result['stdout'].splitlines() if line.startswith(prefix)))
            summary.append(dict(condition=label, case=case, **counts))
            print('POST_COUNTS', label, case, json.dumps(counts), flush=True)
    recorder.save('summary.json', summary)
    recorder.save('manifest.json', dict(runtime_is_diagnostic=True, performance_samples=0,
        scope='native markers enclosing original N1 Run only; excludes Setup/post-validation; counts are not CPU time or formal-N totals',
        identities=identities, script_sha256=recorder.sha(Path(__file__)),
        input_scripts={p.name: recorder.sha(p) for p in (recorder.H / 'scripts').glob('*.js')}))
    raw = (recorder.H / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    recorder.save('raw/runs.jsonl.gz', packed)
    recorder.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),
                                           uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    experiment.verify()
    print('POST_COUNTS_COMPLETE_NO_NEW_PERFORMANCE_SAMPLES', flush=True)


if __name__ == '__main__':
    main()
