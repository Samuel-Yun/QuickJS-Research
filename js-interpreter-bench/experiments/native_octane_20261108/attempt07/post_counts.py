"""After performance only: bounded N=1 Run coverage, never performance scores."""
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
LABEL = 'READ_STORE_S002'


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:100])
    return text.replace(old, new, 1)


def main():
    experiment.verify()
    assert experiment.b.load(HERE / 'audit.json')['status'] == 'PASS_COMPLETE'
    recorder = experiment.module('migration_post_recorder', experiment.OLD / 'run.py')
    recorder.H = HERE / 'post_counts'
    os.sched_setaffinity(0, {2})
    recorder.save('environment.json', recorder.environment())
    files = variants.render(LABEL)
    q = files['quickjs.c']
    start = q.index('static force_inline JSShapeProperty *find_own_property(JSProperty **ppr,')
    end = q.index('\n}', start) + 2
    lookup = q[start:end]
    lookup = once(lookup, '    sh = p->shape;\n',
                  '    sh = p->shape;\n    if (migration_active) migration_lookups++;\n')
    lookup = once(lookup, '        prop = get_shape_prop(sh);',
                  '        if (migration_active) migration_eligible++;\n        prop = get_shape_prop(sh);')
    lookup = once(lookup, '            if (pr->atom == atom) { *ppr = &p->prop[k]; return pr; }',
                  '            if (pr->atom == atom) { if (migration_active) migration_hits++; *ppr = &p->prop[k]; return pr; }')
    lookup = once(lookup, '        *ppr = NULL; return NULL;',
                  '        if (migration_active) migration_misses++;\n        *ppr = NULL; return NULL;')
    helpers = '''static int migration_active;
static unsigned long long migration_lookups, migration_eligible, migration_hits, migration_misses;
static unsigned long long migration_prepare_calls, migration_prepare_sites, migration_prepare_bytes;
void migration_begin(void) { migration_active = 1; }
void migration_end(void) {
    migration_active = 0;
    printf("MIGRATION_COUNTS:{\\"lookups\\":%llu,\\"eligible\\":%llu,\\"scan_hits\\":%llu,\\"scan_misses\\":%llu,\\"prepare_calls\\":%llu,\\"prepare_sites\\":%llu,\\"prepare_requested_bytes\\":%llu}\\n",
           migration_lookups, migration_eligible, migration_hits, migration_misses,
           migration_prepare_calls, migration_prepare_sites, migration_prepare_bytes);
}

'''
    files['quickjs.c'] = q[:start] + helpers + lookup + q[end:]
    p = files['read_ic_prepare.inc']
    p = once(p, '    assert(!b->read_ic_ready && !b->read_ic_sites);',
                '    if (migration_active) migration_prepare_calls++;\n    assert(!b->read_ic_ready && !b->read_ic_sites);')
    p = once(p, '    if (!count) return 0;',
                '    if (migration_active) migration_prepare_sites += count;\n    if (!count) return 0;')
    p = once(p, '    linked = js_mallocz(ctx, total);',
                '    if (migration_active) migration_prepare_bytes += total;\n    linked = js_mallocz(ctx, total);')
    files['read_ic_prepare.inc'] = p
    c = files['quickjs-libc.c']
    helpers = '''extern void migration_begin(void);
extern void migration_end(void);
static JSValue migration_js_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ migration_begin(); return JS_UNDEFINED; }
static JSValue migration_js_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ migration_end(); return JS_UNDEFINED; }

'''
    anchor = 'void js_std_add_helpers(JSContext *ctx, int argc, char **argv)'
    c = once(c, anchor, helpers + anchor)
    anchor = '    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
    c = once(c, anchor, anchor + '''
    JS_SetPropertyStr(ctx, global_obj, "__migration_begin", JS_NewCFunction(ctx, migration_js_begin, "__migration_begin", 0));
    JS_SetPropertyStr(ctx, global_obj, "__migration_end", JS_NewCFunction(ctx, migration_js_end, "__migration_end", 0));''')
    files['quickjs-libc.c'] = c
    dest = HERE / 'work/POST_COUNTS'
    dest.mkdir()
    for name, text in files.items():
        (dest / name).write_bytes(text.encode())
    (dest / 'compat').mkdir()
    with tarfile.open(experiment.LAB / 'v3_mass_search/build_support.tar.gz') as archive:
        (dest / 'compat/test-closefrom.c').write_bytes(archive.extractfile('compat/test-closefrom.c').read())
    result = recorder.capture(['make', '-j1', 'qjs'], 'build', LABEL, 300, cwd=dest)
    assert result['exit_code'] == 0 and not result['timeout'], result['stderr'][-3000:]
    summary = []
    protocol = recorder.load(HERE / 'protocol.json')
    for case in ['Richards.Richards', 'Splay.Splay', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery']:
        original = Path(protocol['scripts'][case]['correctness']['path'])
        script = once(original.read_text(), '  var started=now();', '  __migration_begin();\n  var started=now();')
        script = once(script, '  var stopped=now();', '  var stopped=now();\n  __migration_end();')
        recorder.save('scripts/' + case + '.js', script)
        path = recorder.H / 'scripts' / (case + '.js')
        result = recorder.capture([dest / 'qjs', path], 'counts', case, 180)
        assert result['exit_code'] == 0 and not result['timeout'] and not result['stderr']
        assert '"correctness":"PASS"' in result['stdout']
        prefix = 'MIGRATION_COUNTS:'
        counts = json.loads(next(line[len(prefix):] for line in result['stdout'].splitlines() if line.startswith(prefix)))
        assert counts['scan_hits'] + counts['scan_misses'] == counts['eligible'] <= counts['lookups']
        summary.append(dict(case=case, **counts))
        print('POST_COUNTS', case, json.dumps(counts), flush=True)
    recorder.save('summary.json', summary)
    recorder.save('manifest.json', dict(runtime_is_diagnostic=True, formal_performance_samples=0,
        scope='original N1 Run loop only; excludes Setup/post-validation; counts are not CPU time or formal-N totals',
        parent=LABEL, performance_collected_before_diagnostic=True,
        diagnostic_sources={n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()},
        diagnostic_binary_sha256=recorder.sha(dest / 'qjs'), script_sha256=recorder.sha(Path(__file__)),
        input_scripts={p.name: recorder.sha(p) for p in (recorder.H / 'scripts').glob('*.js')}))
    raw = (recorder.H / 'runs.jsonl').read_bytes()
    packed = gzip.compress(raw, mtime=0)
    recorder.save('raw/runs.jsonl.gz', packed)
    recorder.save('raw/archive.json', dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),
                                           uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    experiment.verify()
    print('POST_COUNTS_COMPLETE_NO_NEW_TIMING_SAMPLES', flush=True)


if __name__ == '__main__':
    main()
