"""Loaded by GDB's embedded Python; no VM source/binary rebuild or timing.

Successful path is cold_entry_abi: compiled target in root's constant pool at
the exact JS_CallInternal machine entry, before script execution. No inferior
function calls. The other two methods below were attempted unsuccessfully;
their raw failures are retained and never substituted for successful dumps.
"""
import gdb
import json
import os
import re

DEST = os.environ['EXAMPLE_GDB_OUTPUT']
VARIANT = os.environ['EXAMPLE_VARIANT']
SOURCE = os.environ['EXAMPLE_SOURCE']
HEADER = os.environ['EXAMPLE_OPCODE_HEADER']

source = open(SOURCE).read()
lines = [i for i, s in enumerate(source.splitlines(), 1) if s.strip() == 'pc = b->byte_code_buf;']
assert len(lines) == 1, lines
widths = {m[0]: dict(size=int(m[1]), pop=int(m[2]), push=int(m[3]), fmt=m[4])
          for m in re.findall(r'^DEF\(\s*(\w+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(\w+)\)',
                              open(HEADER).read(), re.M)}
enum = {int(f.enumval): f.name[3:] for f in gdb.lookup_type('OPCodeEnum').fields()
        if f.name.startswith('OP_') and f.name[3:] in widths}
FINAL = os.environ.get('EXAMPLE_GDB_STAGE') == 'before_free'
ABI_ENTRY = os.environ.get('EXAMPLE_GDB_STAGE') == 'cold_entry_abi'
state = dict(variant=VARIANT, source=SOURCE, opcode_header=HEADER,
             breakpoint_source_line=lines[0], target='readPlusOne',
             interpretation=('before free_function_bytecode after twelve calls; actual final executable bytecode'
                             if FINAL else 'at bytecode frame entry, before executing its first opcode'),
             target_frame_entries=0, snapshots=[], errors=[], inferior_function_calls=False)


def atom_name(rt, atom):
    if atom & 0x80000000:
        return str(atom & 0x7fffffff)
    p = rt['atom_array'][atom]
    if not int(p):
        return '<null-atom>'
    st = p.cast(gdb.lookup_type('JSString').pointer()).dereference()
    n, wide = int(st['len']), int(st['is_wide_char'])
    assert 0 <= n <= 100000
    address = st['u']['str16' if wide else 'str8'].address
    raw = bytes(gdb.selected_inferior().read_memory(address, n * (2 if wide else 1)))
    return raw.decode('utf-16-le' if wide else 'utf-8', errors='replace')


def snapshot(b, rt, entry):
    n = int(b['byte_code_len'])
    raw = bytes(gdb.selected_inferior().read_memory(b['byte_code_buf'], n))
    instructions = []
    pc = 0
    while pc < n:
        op = enum[raw[pc]]
        info = widths[op]
        size = info['size']
        arg = raw[pc+1:pc+size]
        ins = dict(pc=pc, opcode=op, opcode_number=raw[pc], raw_hex=raw[pc:pc+size].hex(), **info)
        if info['fmt'] == 'atom':
            ins['atom'] = int.from_bytes(arg, 'little')
            ins['property'] = atom_name(rt, ins['atom'])
        elif arg:
            ins['operand_unsigned'] = int.from_bytes(arg, 'little')
        instructions.append(ins)
        pc += size
    assert pc == n
    result = dict(entry_number=entry, bytes=n, instruction_count=len(instructions),
                  raw_hex=raw.hex(), instructions=instructions,
                  arg_count=int(b['arg_count']), local_count=int(b['var_count']),
                  stack_size=int(b['stack_size']))
    if VARIANT == 'E':
        result['feedback_vector_present'] = bool(int(b['eic_sites']))
        result['heat'] = int(b['eic_heat'])
        result['metadata'] = []
        for i in range(int(b['eic_count'])):
            meta = b['eic_meta'][i]
            row = dict(site_index=i, pc=int(meta['pc']), atom=int(meta['atom']),
                       property=atom_name(rt, int(meta['atom'])))
            if result['feedback_vector_present']:
                s = b['eic_sites'][i]
                row.update(state=int(s['state']), count=int(s['count']),
                           offset=int(s['mono']['offset']), shape_nonnull=bool(int(s['mono']['shape'])))
            result['metadata'].append(row)
    return result


class Entry(gdb.Breakpoint):
    def stop(self):
        try:
            bp = gdb.selected_frame().read_var('b')
            if not int(bp):
                return False
            b = bp.dereference()
            rt = b['realm'].dereference()['rt'].dereference()
            name = atom_name(rt, int(b['func_name']))
            if name != 'readPlusOne':
                return False
            state['target_frame_entries'] += 1
            entry = state['target_frame_entries']
            if entry in [1, 12]:
                state['snapshots'].append(snapshot(b, rt, entry))
        except Exception as exc:
            if len(state['errors']) < 12:
                state['errors'].append(str(exc))
        return False


class Free(gdb.Breakpoint):
    def stop(self):
        try:
            # This is the exact first native instruction, before the prologue.
            # Actual x86_64 SysV ABI: rt in rdi, b in rsi. No optimized locals
            # or inferior helper calls are used. Function signature is checked.
            frame = gdb.selected_frame()
            b = frame.read_register('rsi').cast(gdb.lookup_type('JSFunctionBytecode').pointer()).dereference()
            rt = frame.read_register('rdi').cast(gdb.lookup_type('JSRuntime').pointer()).dereference()
            if atom_name(rt, int(b['func_name'])) != 'readPlusOne':
                return False
            state['target_frame_entries'] += 1  # here counts matching frees, not calls
            state['snapshots'].append(snapshot(b, rt, 12))
        except Exception as exc:
            if len(state['errors']) < 12:
                state['errors'].append(str(exc))
        return False


class RootEntry(gdb.Breakpoint):
    def stop(self):
        try:
            # JS_CallInternal(caller_ctx, func_obj, ...): one pointer followed
            # by a two-INTEGER-eightbyte JSValue, verified from this ELF's DWARF.
            # Use function entry registers so optimized C local tracking is irrelevant.
            frame = gdb.selected_frame()
            observations = state.setdefault('entry_register_observations', [])
            if len(observations) < 8:
                observations.append({r: str(frame.read_register(r)) for r in ['rdi', 'rsi', 'rdx']})
            if (int(frame.read_register('rdx')) & ((1 << 64) - 1)) != int(gdb.parse_and_eval('JS_TAG_OBJECT')) % (1 << 64):
                return False
            obj = frame.read_register('rsi').cast(gdb.lookup_type('JSObject').pointer()).dereference()
            if int(obj['class_id']) != int(gdb.parse_and_eval('JS_CLASS_BYTECODE_FUNCTION')):
                return False
            ctx = frame.read_register('rdi').cast(gdb.lookup_type('JSContext').pointer()).dereference()
            rt = ctx['rt'].dereference()

            def walk(bp):
                b = bp.dereference()
                if atom_name(rt, int(b['func_name'])) == 'readPlusOne':
                    state['target_frame_entries'] += 1
                    state['snapshots'].append(snapshot(b, rt, 0))
                    return
                for i in range(int(b['cpool_count'])):
                    v = b['cpool'][i]
                    if int(v['tag']) == int(gdb.parse_and_eval('JS_TAG_FUNCTION_BYTECODE')):
                        walk(v['u']['ptr'].cast(gdb.lookup_type('JSFunctionBytecode').pointer()))
            if not state['snapshots']:
                walk(obj['u']['func']['function_bytecode'])
        except Exception as exc:
            if len(state['errors']) < 12:
                state['errors'].append(str(exc))
        return False


gdb.execute('set pagination off')
gdb.execute('set confirm off')
gdb.execute('set disable-randomization off')
gdb.execute('set print thread-events off')
if ABI_ENTRY:
    state['interpretation'] = 'nested compiled target from root constant pool at exact first JS_CallInternal instruction; before script execution'
    state['counter_meaning'] = 'target bytecode snapshots found in compiled root, NOT a dynamic call counter'
    state['ABI'] = 'Linux x86_64 SysV: caller_ctx=rdi, func_obj.u=rsi, func_obj.tag=rdx'
    RootEntry('*JS_CallInternal', internal=True)
elif FINAL:
    state['counter_meaning'] = 'matching target bytecode frees; expected one; NOT an execution counter'
    state['ABI'] = 'Linux x86_64 SysV; first instruction free_function_bytecode(rt,b), rdi/rsi'
    Free('*free_function_bytecode', internal=True)
else:
    Entry(SOURCE + ':' + str(lines[0]), internal=True)
gdb.execute('run')
with open(DEST, 'x') as output:
    json.dump(state, output, indent=2)
    output.write('\n')
