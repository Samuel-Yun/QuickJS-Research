"""Observe delayed vector creation in existing release and diagnostic binaries.

No inferior function calls, engine edits, builds, performance measurements.
Uses native entry registers, avoiding optimized-out interpreter C locals.
"""
import gdb
import json
import os

variant = os.environ['FEEDBACK_VARIANT']
out = os.environ['FEEDBACK_OUTPUT']
state = dict(variant=variant, target='readPlusOne', before=None, after=[], errors=[],
             method='compiled root constant pool at JS_CallInternal entry; target state at native js_print entry after each call',
             inferior_function_calls=False, performance_measurement=False)
target_pointer = None


def atom_name(rt, atom):
    p = rt['atom_array'][atom].cast(gdb.lookup_type('JSString').pointer()).dereference()
    wide, n = int(p['is_wide_char']), int(p['len'])
    assert n < 1000
    address = p['u']['str16' if wide else 'str8'].address
    raw = bytes(gdb.selected_inferior().read_memory(address, n * (2 if wide else 1)))
    return raw.decode('utf-16-le' if wide else 'utf-8')


def snapshot(b, completed_calls):
    n = int(b['byte_code_len'])
    result = dict(completed_calls=completed_calls, heat=int(b['eic_heat']),
                  vector_present=bool(int(b['eic_sites'])), site_count=int(b['eic_count']),
                  bytecode_hex=bytes(gdb.selected_inferior().read_memory(b['byte_code_buf'], n)).hex())
    if result['vector_present']:
        s = b['eic_sites'][0]
        result.update(cache_state=int(s['state']), occupied_entries=int(s['count']),
                      shape_present=bool(int(s['mono']['shape'])), offset=int(s['mono']['offset']))
    else:
        result.update(cache_state=None, occupied_entries=0, shape_present=False, offset=None)
    if variant == 'diagnostic':
        stats = gdb.parse_and_eval('eic_stats')
        result['whole_process_counters'] = {k:int(stats[k]) for k in
            ['queries', 'hits', 'fallback', 'own_hits', 'proto_hits', 'store_hits', 'vectors', 'mono', 'alloc_fail']}
    return result


class RootEntry(gdb.Breakpoint):
    def stop(self):
        global target_pointer
        try:
            if target_pointer is not None:
                return False
            f = gdb.selected_frame()
            if (int(f.read_register('rdx')) & ((1 << 64) - 1)) != (1 << 64) - 1:
                return False  # JS_TAG_OBJECT == -1, verified in frozen quickjs.h
            obj = f.read_register('rsi').cast(gdb.lookup_type('JSObject').pointer()).dereference()
            if int(obj['class_id']) != int(gdb.parse_and_eval('JS_CLASS_BYTECODE_FUNCTION')):
                return False
            ctx = f.read_register('rdi').cast(gdb.lookup_type('JSContext').pointer()).dereference()
            rt = ctx['rt'].dereference()

            def walk(bp):
                global target_pointer
                b = bp.dereference()
                if atom_name(rt, int(b['func_name'])) == 'readPlusOne':
                    assert int(b['eic_count']) == 1
                    meta = b['eic_meta'][0]
                    assert int(meta['pc']) == 1 and atom_name(rt, int(meta['atom'])) == 'x'
                    target_pointer = int(bp)
                    state['site'] = dict(pc=1, index=0, property='x')
                    state['before'] = snapshot(b, 0)
                    return
                for i in range(int(b['cpool_count'])):
                    v = b['cpool'][i]
                    if int(v['tag']) == int(gdb.parse_and_eval('JS_TAG_FUNCTION_BYTECODE')):
                        walk(v['u']['ptr'].cast(gdb.lookup_type('JSFunctionBytecode').pointer()))
            walk(obj['u']['func']['function_bytecode'])
        except Exception as exc:
            state['errors'].append('root: ' + str(exc))
        return False


class AfterPrint(gdb.Breakpoint):
    def stop(self):
        try:
            assert target_pointer is not None, 'target bytecode not found'
            b = gdb.Value(target_pointer).cast(gdb.lookup_type('JSFunctionBytecode').pointer()).dereference()
            i = len(state['after']) + 1
            state['after'].append(snapshot(b, i))
        except Exception as exc:
            state['errors'].append('print: ' + str(exc))
        return False


gdb.execute('set pagination off')
gdb.execute('set confirm off')
gdb.execute('set disable-randomization off')
gdb.execute('set print thread-events off')
RootEntry('*JS_CallInternal', internal=True)
AfterPrint('*js_print', internal=True)
gdb.execute('run')
with open(out, 'x') as f:
    json.dump(state, f, indent=2)
    f.write('\n')
