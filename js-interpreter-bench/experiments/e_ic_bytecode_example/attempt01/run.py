"""Run a small correctness/bytecode diagnostic, never a performance measurement.

Inside the existing Ubuntu distro: python3 run.py
Frozen binaries/source are read, not built or replaced. Outputs are write-once.
"""
import hashlib
import json
import os
import platform
import re
import shutil
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
EXPERIMENT = ROOT / 'experiments/v8_inspired_ic/attempt03'


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    text = value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, indent=2) + '\n'
    with path.open('x', encoding='utf-8') as f:
        f.write(text)


def capture(label, command, env=None):
    path = HERE / 'raw' / (label + '.json')
    if path.exists():
        return json.loads(path.read_text())
    p = subprocess.run(command, capture_output=True, text=True, timeout=90, env=env, cwd=HERE)
    result = dict(command=list(map(str, command)), stdout=p.stdout, stderr=p.stderr, exit_code=p.returncode)
    save(path, result)
    return result


def main():
    assert shutil.which('gdb'), 'No GDB; preserve source result and do not invent a live dump'
    assert platform.machine() == 'x86_64'
    runtime = json.loads((EXPERIMENT / 'campaign_runtime.json').read_text())
    artifacts = runtime['artifacts']
    for a in artifacts.values():
        assert sha(a['path']) == a['sha256'], a['path']
    for a in runtime['v8']['dependencies']:
        assert sha(a['path']) == a['sha256'], a['path']
    for label in ['A', 'E']:
        src = Path(artifacts[label]['path']).parent
        for f in ['quickjs.c', 'quickjs-opcode.h']:
            expected = runtime['E_build']['base_files' if label == 'A' else 'modified_source_hashes'][f]
            assert sha(src / f) == expected, str(src / f)
    v8flags = ['--jitless', '--no-lazy', '--use-ic']
    example = HERE / 'example.js'
    if not (HERE / 'manifest.json').exists():
        save(HERE / 'manifest.json', dict(
            purpose='correctness and live bytecode inspection only; no timing or rebuild',
            source_commit='cd1674f0f12b40b3e110ee295507b7f4fa55edcd',
            artifacts=artifacts, v8_flags=v8flags, source_sha256=sha(example),
            platform=platform.platform(), host=platform.node(),
            gdb=shutil.which('gdb'), stages='compiled root constant pool at exact JS_CallInternal entry, before script execution',
            writes_to_VM_source=False, inferior_function_calls=False))
    for label in ['A', 'E', 'V8_ON']:
        command = [artifacts[label]['path']] + (v8flags if label == 'V8_ON' else []) + [str(example)]
        r = capture(label + '.correctness', command)
        assert r['exit_code'] == 0 and 'IC_EXAMPLE_CHECKSUM 48' in r['stdout'], r
    helprec = capture('V8_ON.help', [artifacts['V8_ON']['path'], '--help'])
    assert helprec['exit_code'] == 0
    assert '--print-bytecode' in helprec['stdout'] and '--print-bytecode-filter' in helprec['stdout']
    v8 = capture('V8_ON.dump', [artifacts['V8_ON']['path'], *v8flags,
                 '--print-bytecode', '--print-bytecode-filter=readPlusOne', str(example)])
    assert v8['exit_code'] == 0 and 'IC_EXAMPLE_CHECKSUM 48' in v8['stdout']
    if not (HERE / 'bytecode/V8_ON.full.txt').exists():
        save(HERE / 'bytecode/V8_ON.full.txt', v8['stdout'])
    snapshots = {}
    for label in ['A', 'E']:
        path = HERE / 'bytecode' / (label + '.entry2.live.json')
        path.parent.mkdir(exist_ok=True)
        env = dict(os.environ)
        src = Path(artifacts[label]['path']).parent
        env.update(EXAMPLE_GDB_OUTPUT=str(path), EXAMPLE_VARIANT=label, EXAMPLE_GDB_STAGE='cold_entry_abi',
                   EXAMPLE_SOURCE=str(src / 'quickjs.c'), EXAMPLE_OPCODE_HEADER=str(src / 'quickjs-opcode.h'))
        r = capture(label + '.gdb_entry_abi2', ['gdb', '-q', '-batch', '-ex', 'source ' + str(HERE / 'gdb_dump.py'),
                                    '--args', artifacts[label]['path'], str(example)], env)
        assert r['exit_code'] == 0 and 'IC_EXAMPLE_CHECKSUM 48' in r['stdout'], r
        data = json.loads(path.read_text())
        assert data['target_frame_entries'] == 1, data
        assert not data['errors'] and len(data['snapshots']) == 1, data
        cold = data['snapshots'][0]
        snapshots[label] = data
        lines = [f'function: readPlusOne(o)\n{label}: live frozen release binary; root compiled constant pool, before execution',
                 f'{cold["instruction_count"]} instructions, {cold["bytes"]} bytecode bytes']
        for ins in cold['instructions']:
            arg = (' ' + ins['property']) if 'property' in ins else (' ' + str(ins['operand_unsigned']) if 'operand_unsigned' in ins else '')
            lines.append(f'{ins["pc"]:3} {ins["opcode"]}{arg}')
        if label == 'E':
            lines += ['metadata: ' + json.dumps(cold['metadata']),
                      'before execution feedback vector: ' + str(cold['feedback_vector_present'])]
        out = HERE / 'bytecode' / (label + '.txt')
        if not out.exists():
            save(out, '\n'.join(lines) + '\n')
    a, e = snapshots['A']['snapshots'][0], snapshots['E']['snapshots'][0]
    assert a['bytes'] == e['bytes'] and a['instruction_count'] == e['instruction_count']
    assert [i['opcode'] for i in a['instructions']] == ['get_arg0','get_field','push_1','add','return']
    assert [i['opcode'] for i in e['instructions']] == ['get_arg0','get_field_eic','push_1','add','return']
    assert e['metadata'][0]['pc'] == 1 and e['metadata'][0]['property'] == 'x'
    assert not e['feedback_vector_present']
    for a in artifacts.values():
        assert sha(a['path']) == a['sha256']
    gate = HERE / 'audit.json'
    if not gate.exists():
        save(gate, dict(status='PASS', correctness='3/3 checksum 48', same_JS_sha256=sha(example),
                        A_E_live_from_frozen_ELF=True, target_calls_in_driver=12,
                        dump_stage='compiled root constant pool at exact JS_CallInternal entry, before script execution',
                        E_cold_vector_present=False, E_final_state='UNKNOWN: not captured in this example',
                        inference_limit='state is not per-query hit trace or performance evidence',
                        performance_measurement=False, runtime_hashes_unchanged=True))
    print('PASS: same source, correctness 3/3; live A/E dumps and native V8 bytecode dump saved')


if __name__ == '__main__':
    main()
