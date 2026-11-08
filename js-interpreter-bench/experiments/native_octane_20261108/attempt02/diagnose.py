"""Bounded N=1 diagnostics on a copy of frozen PREP2; no performance samples."""
from pathlib import Path
import hashlib
import importlib.util
import json
import os
import shutil
import tarfile

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
PREVIOUS = H.parent / 'attempt01'
OLD = ROOT / 'experiments/native_octane_20261107/attempt01'
LAB = ROOT / 'experiments/ic_search_lab'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


b = module('diagnostic_recorder', OLD / 'run.py')
b.H = H / 'diagnostics'


def once(text, old, new):
    assert text.count(old) == 1, (text.count(old), old[:100])
    return text.replace(old, new, 1)


def material(profile=False):
    v = module('prior_variants', PREVIOUS / 'variants.py')
    files = v.render('PREP2')
    header = '#include <valgrind/callgrind.h>\n' if profile else ''
    if profile:
        functions = '''static void exp_diag_begin(void) { CALLGRIND_ZERO_STATS; CALLGRIND_START_INSTRUMENTATION; }
static void exp_diag_end(void) { CALLGRIND_STOP_INSTRUMENTATION; CALLGRIND_DUMP_STATS; }
'''
    else:
        functions = 'extern void exp_diag_begin(void);\nextern void exp_diag_end(void);\n'
    functions += '''static JSValue exp_begin(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ exp_diag_begin(); return JS_UNDEFINED; }
static JSValue exp_end(JSContext *ctx, JSValueConst t, int n, JSValueConst *v)
{ exp_diag_end(); return JS_UNDEFINED; }
'''
    libc = files['quickjs-libc.c']
    libc = once(libc, 'void js_std_add_helpers(JSContext *ctx, int argc, char **argv)',
                header + functions + '\nvoid js_std_add_helpers(JSContext *ctx, int argc, char **argv)')
    anchor = '    JS_SetPropertyStr(ctx, global_obj, "performance", performance);'
    libc = once(libc, anchor, anchor + '''
    JS_SetPropertyStr(ctx, global_obj, "__diag_begin", JS_NewCFunction(ctx, exp_begin, "__diag_begin", 0));
    JS_SetPropertyStr(ctx, global_obj, "__diag_end", JS_NewCFunction(ctx, exp_end, "__diag_end", 0));''')
    files['quickjs-libc.c'] = libc
    if profile:
        return files
    q = files['quickjs.c']
    helpers = '''static int exp_active;
static unsigned long long exp_pairs[8], exp_hits[8], exp_calls[2][9], exp_entries, exp_bytecode;
void exp_diag_begin(void) { exp_active = 1; }
void exp_diag_end(void) {
    exp_active = 0;
    printf("DIAG_COUNTS:{\\"pairs\\":[");
    for (int i=0;i<8;i++) printf("%s%llu",i?",":"",exp_pairs[i]);
    printf("],\\"hits\\":[");
    for (int i=0;i<8;i++) printf("%s%llu",i?",":"",exp_hits[i]);
    printf("],\\"calls\\":[");
    for (int j=0;j<2;j++) { printf("%s[",j?",":""); for(int i=0;i<9;i++)printf("%s%llu",i?",":"",exp_calls[j][i]); printf("]"); }
    printf("],\\"entries\\":%llu,\\"bytecode_entries\\":%llu}\\n",exp_entries,exp_bytecode);
}
static void exp_pair(const uint8_t *pc, JSValueConst receiver, int which) {
    if (!exp_active || pc[0] != OP_get_field_rdi) return;
    exp_pairs[which]++;
    if (JS_VALUE_GET_TAG(receiver) == JS_TAG_OBJECT) {
        JSObject *o=JS_VALUE_GET_OBJ(receiver);
        ReadICSite *s=(ReadICSite *)(pc+1+get_u32(pc+1));
        if(o->class_id==JS_CLASS_OBJECT && !o->is_exotic && o->shape==s->shape) exp_hits[which]++;
    }
}
'''
    anchor = '''static JSValue JS_CallInternal(JSContext *caller_ctx, JSValueConst func_obj,
                               JSValueConst this_obj, JSValueConst new_target,
                               int argc, JSValue *argv, int flags)
{'''
    q = once(q, anchor, helpers + '\n' + anchor)
    for kind, buf, start in [('arg', 'arg_buf', 0), ('loc', 'var_buf', 4)]:
        for i in range(1, 4):
            old = f'CASE(OP_get_{kind}{i}): *sp++ = JS_DupValue(ctx, {buf}[{i}]); BREAK;'
            q = once(q, old, f'CASE(OP_get_{kind}{i}): exp_pair(pc,{buf}[{i}],{start+i}); *sp++ = JS_DupValue(ctx, {buf}[{i}]); BREAK;')
        old = f'CASE(OP_v6_get_{kind}0): V6_PREPARED_BORROW({buf}[0]); BREAK;'
        q = once(q, old, f'CASE(OP_v6_get_{kind}0): exp_pair(pc,{buf}[0],{start}); V6_PREPARED_BORROW({buf}[0]); BREAK;')
    q = once(q, '    if (js_poll_interrupts(caller_ctx))\n', '    if (exp_active) exp_entries++;\n    if (js_poll_interrupts(caller_ctx))\n')
    anchor = '    b = p->u.func.function_bytecode;\n\n    if (unlikely(argc < b->arg_count'
    q = once(q, anchor, '    b = p->u.func.function_bytecode;\n    if (exp_active) exp_bytecode++;\n\n    if (unlikely(argc < b->arg_count')
    for kind, tail, low in [(0, 'OP_tail_call', -1), (1, 'OP_tail_call_method', -2)]:
        anchor = f'''                if (opcode == {tail})
                    goto done;
                for(i = {low}; i < call_argc; i++)'''
        q = once(q, anchor, f'''                if (opcode == {tail})
                    goto done;
                if (exp_active) exp_calls[{kind}][call_argc < 8 ? call_argc : 8]++;
                for(i = {low}; i < call_argc; i++)''')
    files['quickjs.c'] = q
    return files


def main():
    os.sched_setaffinity(0, {2})
    if (b.H / 'environment.before.json').exists():
        assert b.boot() == b.load(b.H / 'environment.before.json')['boot_id']
    else:
        b.save('environment.before.json', b.environment())
    protocol = b.load(PREVIOUS / 'protocol.json')
    cases = ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'RayTrace.RayTrace',
             'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'Splay.Splay', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery']
    manifests = {}
    for label, profile in [('COUNTS', False), ('PROFILE', True)]:
        files = material(profile)
        dest = H / 'work' / label
        dest.mkdir(parents=True)
        for name, source in files.items():
            (dest / name).write_bytes(source.encode())
        (dest / 'compat').mkdir()
        with tarfile.open(LAB / 'v3_mass_search/build_support.tar.gz') as archive:
            (dest / 'compat/test-closefrom.c').write_bytes(archive.extractfile('compat/test-closefrom.c').read())
        manifests[label] = dict(files={n: hashlib.sha256(s.encode()).hexdigest() for n, s in files.items()})
        b.save('source_manifest.json', manifests) if label == 'PROFILE' else None
        r = b.capture(['make', '-j1', 'qjs'], 'build', label, 300, cwd=dest)
        assert r['exit_code'] == 0, r['stderr'][-3000:]
        print('DIAGNOSTIC_BUILT', label, flush=True)
        for case in cases:
            if profile and case not in ['Richards.Richards', 'RayTrace.RayTrace', 'EarleyBoyer.Boyer', 'CodeLoad.CodeLoadClosure']:
                continue
            original = Path(protocol['scripts'][case]['correctness']['path'])
            script = original.read_text()
            script = once(script, '  var started=now();', '  __diag_begin();\n  var started=now();')
            script = once(script, '  var stopped=now();', '  var stopped=now();\n  __diag_end();')
            script_path = H / 'diagnostics' / 'scripts' / (case + '.js')
            if not script_path.exists():
                script_path.parent.mkdir(parents=True, exist_ok=True)
                script_path.write_text(script)
            else:
                assert script_path.read_text() == script
            command = [dest / 'qjs', script_path]
            if profile:
                command = ['valgrind', '--tool=callgrind', '--instr-atstart=no', '--cache-sim=no', '--branch-sim=no',
                           '--callgrind-out-file=' + str(H / 'diagnostics' / (case + '.callgrind')), *command]
            r = b.capture(command, 'profile' if profile else 'counts', case, 180)
            assert r['exit_code'] == 0 and '"correctness":"PASS"' in r['stdout'], r
            if not profile:
                counts = json.loads(next(s[12:] for s in r['stdout'].splitlines() if s.startswith('DIAG_COUNTS:')))
                b.save('counts/' + case + '.json', counts)
                print('COUNTS', case, json.dumps(counts), flush=True)
            else:
                path = H / 'diagnostics' / (case + '.callgrind.1')
                assert path.exists()
                annotation = b.capture(['callgrind_annotate', '--show=Ir', '--auto=yes', '--context=0', '--threshold=99', path], 'annotate', case, 60)
                assert annotation['exit_code'] == 0
                b.save('profiles/' + case + '.txt', annotation['stdout'])
                print('PROFILE_COMPLETE', case, flush=True)
    b.save('manifest.json', dict(runtime_is_diagnostic=True, formal_performance_samples=0,
        count_scope='between markers enclosing the original N1 Run loop; Setup and post-validation excluded',
        profile_scope='Callgrind Ir between same markers; not native CPU time; pristine VM source, helper hooks only',
        sources=manifests, scripts={p.name:b.sha(p) for p in (H/'diagnostics/scripts').glob('*.js')}))


if __name__ == '__main__':
    main()
