"""Post-timing, bounded mechanism checks. Diagnostic records stay separate."""
import json
import os
from pathlib import Path
import re
import subprocess

import explore_20261106 as exploration
import search as s
import stages as st
import maintenance

H = s.HERE
lab = s.lab


def main():
    assert (H / 'exploration.followup.complete.json').exists()
    cohort = exploration.install_gate(exploration.current_protocol())
    assert cohort == lab.load(H / 'exploration.active_campaign.json')['boot_id']
    assert lab.load(H / 'exploration.audit.json')['record_integrity'] == 'PASS'
    raw_sha = lab.sha(H / 'runs.jsonl')
    records = H / 'selected_mechanism.jsonl'
    assert not records.exists()

    def append(value):
        with records.open('a', encoding='utf-8', newline='\n') as stream:
            stream.write(json.dumps(value, ensure_ascii=False) + '\n')

    lab.append = append
    os.sched_setaffinity(0, {2})
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm'], text=True)
    for line in inventory.splitlines()[1:]:
        fields = line.split()
        if len(fields) == 2:
            assert fields[1] not in ['qjs', 'd8', 'gcc', 'cc1', 'make'] and not fields[1].endswith('.qjs')
    sizes = []
    for cid in ['A', 'M', 's001', 'CTRL000', 'L030', 'P013', 'H015', 'Q005']:
        art = st.identity(cid)
        assert lab.sha(art['path']) == art['sha256']
        expressions = ['sizeof(JSShape)', 'sizeof(JSFunctionBytecode)']
        if cid != 'A':
            expressions.append('sizeof(ReadICSite)')
        command = ['gdb', '-nx', '-batch', '-ex', 'set auto-load off', '-ex', 'file ' + art['path']]
        for expression in expressions:
            command += ['-ex', 'p ' + expression]
        result = lab.capture(command, 'post_timing_DWARF', cid, 30,
                             dict(binary_sha256=art['sha256'], diagnostic=True, executes_VM=False))
        numbers = [int(value) for value in re.findall(r'\$\d+ = (\d+)', result['stdout'])]
        assert result['exit_code'] == 0 and len(numbers) == len(expressions)
        sizes.append(dict(candidate=cid, shape_bytes=numbers[0], function_bytes=numbers[1],
                          site_bytes=numbers[2] if cid != 'A' else 0,
                          source='Frozen ELF DWARF sizeof; RSS and indirect retention UNKNOWN'))
    saved = lab.load(H / 'identities/CTRL_INDEX.json')
    assert {name: lab.sha(H / 'active' / name) for name in saved['source_sha256_after_build']} == saved['source_sha256_after_build']
    config, parent = maintenance.restore_sources('L030')
    original_probe = (H / 'layout_probe.c').read_text()
    probe = original_probe.replace('{1, 2, 3, 4, 8, 17}', '{1, 2, 3, 4, 6, 8, 17}')
    assert probe != original_probe
    probe = probe.replace('int main(void)', 'int selected_layout_main(void)')
    delete_source = s.V2 / 'delete_reentry.c'
    probe += '\n#define main selected_delete_main\n#include "' + str(delete_source) + '"\n#undef main\n'
    probe += 'int main(void) { int result = selected_layout_main(); if (result) return result; return selected_delete_main(); }\n'
    source = H / 'L030.selected_mechanism.c'
    lab.save(source, probe)
    active = H / 'active'
    objects = [active / '.obj' / (name + '.o') for name in ['dtoa', 'libregexp', 'libunicode', 'cutils']]
    target = H / 'artifacts/L030.selected_mechanism'
    identity = dict(candidate='L030', diagnostic=True, performance_sample=False,
                    measured_binary_sha256=st.identity('L030')['sha256'], config=config,
                    source_sha256=lab.sha(source), core_sha256=lab.sha(active / 'quickjs.c'),
                    dependency_sha256={str(path): lab.sha(path) for path in [delete_source] + objects})
    command = ['gcc', '-g', '-O2', '-fwrapv', '-D_GNU_SOURCE', '-DHAVE_CLOSEFROM', '-DCONFIG_VERSION="2026-06-04"',
               '-I' + str(active), source, *objects, '-lm', '-lpthread', '-ldl', '-o', target]
    built = lab.capture(command, 'selected_mechanism_build', 'L030', 180, identity)
    assert built['exit_code'] == 0
    checked = lab.capture([target], 'selected_mechanism_check', 'L030', 30,
                          identity | dict(diagnostic_binary_sha256=lab.sha(target)))
    assert checked['exit_code'] == 0 and not checked['stderr']
    assert 'LAYOUT_PROBE_PASS' in checked['stdout'] and 'DELETE_REENTRY_PASS' in checked['stdout']
    maintenance.restore_sources('CTRL_INDEX')
    assert raw_sha == lab.sha(H / 'runs.jsonl'), 'Timing raw must remain immutable during this diagnostic'
    lab.save(H / 'selected_mechanism.json', dict(status='PASS_BOUNDED_MECHANISM_AND_LAYOUT',
             boot_id=cohort, layouts=sizes, candidate='L030', stdout=checked['stdout'],
             raw='selected_mechanism.jsonl', diagnostic_not_performance=True,
             timing_raw_unchanged_sha256=raw_sha, actual_RayTrace_hit_counts='UNKNOWN',
             actual_nbody_regression_cause='UNKNOWN', RSS='UNKNOWN',
             scope='6-slot occupancy with distinct shapes and native finalizer deletion; no full test262/ASan/UBSan claim'))
    print('SELECTED_MECHANISM_PASS', checked['stdout'], flush=True)


if __name__ == '__main__':
    main()
