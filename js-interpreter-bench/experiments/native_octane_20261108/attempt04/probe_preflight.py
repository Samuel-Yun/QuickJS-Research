from pathlib import Path
import importlib.util
import variants

H = Path(__file__).resolve().parent


def main():
    spec = importlib.util.spec_from_file_location('probe_recorder', H.parents[2] / 'experiments/native_octane_20261107/attempt01/run.py')
    b = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(b)
    b.H = H / 'diagnostics'
    for label in ['CHAIN2', 'READ_STORE']:
        dest = H / 'work' / ('PROBE_PREFLIGHT2_' + label)
        dest.mkdir()
        files = variants.render(label)
        q = files['quickjs.c']
        q = variants.once(q, '            *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);',
            '            combo_fused_hits++; *sp++ = JS_DupValue(ctx, object->prop[site->prop_offset].u.value);')
        if label == 'CHAIN2':
            q = variants.once(q, '                    *sp++ = JS_DupValue(ctx, inner->prop[next->prop_offset].u.value);',
                '                    exp_chain_hits++; *sp++ = JS_DupValue(ctx, inner->prop[next->prop_offset].u.value);')
        else:
            q = variants.once(q, '                            set_value(ctx, &p->prop[offset].u.value, sp[-1]);',
                '                            exp_shared_hits++; set_value(ctx, &p->prop[offset].u.value, sp[-1]);')
        files['quickjs.c'] = q
        files['read_ic_opcodes.inc'] = variants.once(files['read_ic_opcodes.inc'],
            '                        val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);',
            '                        combo_proto_hits++; val = JS_DupValue(ctx, holder->prop[site->prop_offset].u.value);')
        for name, text in files.items():
            (dest / name).write_bytes(text.encode())
        objects = [H / 'work' / ('PREFLIGHT_' + label) / '.obj' / (name + '.o')
                   for name in ['dtoa', 'libregexp', 'libunicode', 'cutils']]
        target = dest / 'probe'
        r = b.capture(['gcc', '-O2', '-g', '-fwrapv', '-D_GNU_SOURCE', '-DHAVE_CLOSEFROM', '-DCONFIG_VERSION="2026-06-04"',
                       '-DTEST_' + label, '-I' + str(dest), H / 'probe.c', *objects, '-lm', '-lpthread', '-ldl', '-o', target],
                      'probe_preflight2_build', label, 180)
        assert r['exit_code'] == 0, r['stderr']
        r = b.capture([target], 'probe_preflight2', label, 60)
        assert r['exit_code'] == 0, r
        print(label, r['stdout'].strip(), flush=True)


if __name__ == '__main__':
    main()
