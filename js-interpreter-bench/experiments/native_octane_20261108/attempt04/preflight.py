"""Before freezing performance: build instrumented candidates and validate coverage."""
from pathlib import Path
import hashlib
import importlib.util
import json
import os
import tarfile
import variants

H = Path(__file__).resolve().parent
ROOT = H.parents[2]
LAB = ROOT / 'experiments/ic_search_lab'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    obj = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(obj)
    return obj


def main():
    b = module('preflight_recorder', ROOT / 'experiments/native_octane_20261107/attempt01/run.py')
    b.H = H / 'diagnostics'
    os.sched_setaffinity(0, {2})
    if (b.H / 'environment.json').exists():
        assert b.boot() == b.load(b.H / 'environment.json')['boot_id']
    else:
        b.save('environment.json', b.environment())
    d = module('base_diagnostic', H.parent / 'attempt02/diagnose.py')
    cases = ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'RayTrace.RayTrace', 'EarleyBoyer.Boyer', 'Splay.Splay', 'CodeLoad.CodeLoadClosure']
    manifests = {}
    for label in ['CHAIN2', 'READ_STORE']:
        files = variants.render(label)
        template = d.material(False)
        diag = template['quickjs.c']
        start = diag.index('static int exp_active;')
        end = diag.index('static JSValue JS_CallInternal(JSContext *caller_ctx', start)
        anchor = '''static JSValue JS_CallInternal(JSContext *caller_ctx, JSValueConst func_obj,
                               JSValueConst this_obj, JSValueConst new_target,
                               int argc, JSValue *argv, int flags)
{'''
        q = variants.once(files['quickjs.c'], anchor, diag[start:end] + anchor)
        files['quickjs-libc.c'] = template['quickjs-libc.c']
        q = variants.once(q, 'static int exp_active;', 'static unsigned long long exp_target_queries, exp_target_hits;\nstatic int exp_active;')
        anchor = '}\nstatic void exp_pair('
        q = variants.once(q, anchor, '''    printf("TARGET_COUNTS:{\\"queries\\":%llu,\\"hits\\":%llu}\\n",exp_target_queries,exp_target_hits);
}\nstatic void exp_pair(''')
        if label == 'CHAIN2':
            start = q.index('#define EXP_BORROWED_CHAIN')
            end = q.index('#if !DIRECT_DISPATCH', start)
            block = q[start:end]
            block = variants.once(block, '    JSValueConst receiver = (slot);', '    if (exp_active) exp_target_queries++;                               \\\n    JSValueConst receiver = (slot);')
            block = variants.once(block, '                    *sp++ = JS_DupValue(ctx, inner->prop[next->prop_offset].u.value);',
                '                    if (exp_active) exp_target_hits++;                \\\n                    *sp++ = JS_DupValue(ctx, inner->prop[next->prop_offset].u.value);')
            q = q[:start] + block + q[end:]
        else:
            q = variants.once(q, '                ReadICSite *site = (ReadICSite *)(pc + get_u32(pc));',
                '                if (exp_active) exp_target_queries++;\n                ReadICSite *site = (ReadICSite *)(pc + get_u32(pc));')
            q = variants.once(q, '                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);',
                '                            if (exp_active) exp_target_hits++;\n                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);')
        files['quickjs.c'] = q
        dest = H / 'work' / ('PREFLIGHT_' + label)
        dest.mkdir(parents=True)
        for name, source in files.items():
            (dest / name).write_bytes(source.encode())
        (dest / 'compat').mkdir()
        with tarfile.open(LAB / 'v3_mass_search/build_support.tar.gz') as archive:
            (dest / 'compat/test-closefrom.c').write_bytes(archive.extractfile('compat/test-closefrom.c').read())
        manifests[label] = {n: hashlib.sha256(t.encode()).hexdigest() for n, t in files.items()}
        result = b.capture(['make', '-j1', 'qjs', 'qjsc'], 'build', label, 300, cwd=dest)
        assert result['exit_code'] == 0, result['stderr'][-4000:]
        result = b.capture([dest / 'qjs', '--std', H / 'extra.js'], 'semantic', label, 60)
        assert result['exit_code'] == 0 and 'CHAIN_SHARED_STORE_SEMANTICS_PASS' in result['stdout'], result
        print('PREFLIGHT_SEMANTICS_PASS', label, flush=True)
        for case in cases:
            script = H.parent / 'attempt02/diagnostics/scripts' / (case + '.js')
            result = b.capture([dest / 'qjs', script], 'counts', label + '/' + case, 120)
            assert result['exit_code'] == 0 and '"correctness":"PASS"' in result['stdout'], result
            counts = json.loads(next(line[14:] for line in result['stdout'].splitlines() if line.startswith('TARGET_COUNTS:')))
            b.save('counts/' + label + '.' + case + '.json', counts)
            print('TARGET_COUNTS', label, case, counts, flush=True)
    b.save('manifest.json', dict(formal_performance_samples=0, sources=manifests,
        scope='independent N1 Run between original-loop markers; only coverage, not native timing'))


if __name__ == '__main__':
    main()
