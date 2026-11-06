"""Serial one-pass corrections followed by bounded, independent rechecks."""
import argparse
import csv
from collections import Counter
import hashlib
import itertools
import json
import math
import os
from pathlib import Path
import random
import shutil
import statistics
import struct
import subprocess
import sys
import tarfile
import time
import traceback

H = Path(__file__).resolve().parent
LAB = H.parent
V3 = LAB / 'v3_mass_search'
sys.path.insert(0, str(LAB))
import lab
import measure
import variants

lab.HERE = H
measure.HERE = H
lab.candidate_metadata_path = lambda cid: H / 'identities' / (cid + '.json')
SEED = 2026110602
SOURCE = {path.name: lab.sha(path) for path in [Path(__file__), H / 'variants.py']}
ORIGINAL_CAPTURE = lab.capture


def gate():
    assert lab.boot() == lab.load(H / 'environment.json')['boot_id'], 'BOOT_CHANGED'
    if (H / 'STOP').exists():
        raise RuntimeError('Explicit stop, checkpoints preserved')


def capture(command, stage, label, timeout=30, identity=None, cwd=None):
    gate()
    identity = dict(identity or {}, controller_sha256=SOURCE)
    result = ORIGINAL_CAPTURE(command, stage, label, timeout, identity, cwd)
    assert result['boot_id'] == result['boot_id_after'], 'BOOT_CHANGED'
    return result


lab.capture = capture
lab.execution_gate = gate


def atomic(name, value):
    path = H / name
    pending = path.with_suffix(path.suffix + '.pending')
    pending.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    os.replace(pending, path)


def csvfile(name, values):
    if not values:
        return
    fields = list(dict.fromkeys(key for value in values for key in value))
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, fields, lineterminator='\n')
        writer.writeheader(); writer.writerows(values)


def update(cid, **changes):
    path = H / 'state.json'
    data = lab.load(path)
    row = next(row for row in data if row['id'] == cid)
    row.update(changes)
    lab.append(dict(event='candidate_state', timestamp=lab.stamp(), id=cid, changes=changes))
    atomic('state.json', data)
    csvfile('candidates.csv', [{key: json.dumps(value, sort_keys=True) if isinstance(value, (dict, list)) else value
                                for key, value in row.items()} for row in data])


def section_hash(path, section):
    data = Path(path).read_bytes()
    assert data[:6] == b'\x7fELF\x02\x01'
    start = struct.unpack_from('<Q', data, 40)[0]
    stride, count, names = struct.unpack_from('<HHH', data, 58)
    headers = [struct.unpack_from('<IIQQQQIIQQ', data, start + index * stride) for index in range(count)]
    string_header = headers[names]
    strings = data[string_header[4]:string_header[4] + string_header[5]]
    for header in headers:
        label = strings[header[0]:].split(b'\0', 1)[0].decode()
        if label == section:
            return hashlib.sha256(data[header[4]:header[4] + header[5]]).hexdigest()
    raise KeyError(section)


def prepare():
    if (H / 'environment.json').exists():
        gate()
        return
    os.sched_setaffinity(0, {2})
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    for line in inventory.splitlines()[1:]:
        parts = line.split(None, 2)
        if len(parts) > 1:
            assert parts[1] not in ['qjs', 'd8', 'gcc', 'cc1', 'make'] and not parts[1].endswith('.qjs'), line
    for name in ['active', 'artifacts', 'identities', 'patches', 'scripts', 'runners']:
        (H / name).mkdir(exist_ok=False)
    old = lab.load(V3 / 'workspace.json')
    artifacts = {label: old['artifacts'][label] for label in ['A', 'M', 's001']}
    for label, art in artifacts.items():
        assert lab.sha(art['path']) == art['sha256'], label
    lab.save(H / 'workspace.json', dict(active_source=str(H / 'active'), artifacts=artifacts,
             previous_archive_sha256=lab.sha(V3 / 'seed_M.tar.gz'),
             previous_generator_sha256=lab.sha(V3 / 'generate.py'),
             frozen_s001_patch_sha256=lab.sha(V3 / 'patches/seed_s001.patch'),
             no_old_times_as_denominator=True))
    lab.save(H / 'identities/s001.json', artifacts['s001'])
    environment = dict(timestamp=lab.stamp(), boot_id=lab.boot(), uname=os.uname(), affinity=[2],
                       os_release=Path('/etc/os-release').read_text(), cpuinfo=Path('/proc/cpuinfo').read_text(),
                       meminfo=Path('/proc/meminfo').read_text(), process_inventory=inventory,
                       compiler=subprocess.check_output(['gcc', '--version'], text=True),
                       free_bytes=os.statvfs(H).f_bavail * os.statvfs(H).f_frsize,
                       power_frequency_control='UNKNOWN', temperature='UNKNOWN', background_load_control='UNKNOWN')
    lab.save(H / 'environment.json', environment)
    lab.save(H / 'state.json', [dict(row, status='PLANNED') for row in variants.DESIGNS])
    ns = {}
    for kind in ['octane', 'sunspider']:
        info = measure.inputs(kind)
        lab.save(H / (kind + '.inputs.json'), info)
        for case in info['cases']:
            ns[kind + '/' + case] = info['N'][case] if case.startswith('Crypto.') else max(1, info['N'][case] // 4)
    lab.save(H / 'protocol.json', dict(status='FROZEN_BEFORE_CANDIDATES', tag=str(time.time_ns()), seed=SEED,
        first_ids=[row['id'] for row in variants.DESIGNS], candidates=6, controls=3, N=ns,
        source_parent='Exact s001; rf001 safety publish control; rf008 compact template control',
        screen='All17 Octane, one new candidate process per case, s001 before/after and one same-batch A',
        drift_limit=1.15, drift_repeat=1, drift_is_quality_label=True, no_global_drift_stop=True,
        promotion='At most2. Core/s001<=0.985; or local>=5% in2 cases and core<=1.005. Reserve at most1 best within1% if no such candidate.',
        recheck_rounds=5, bootstrap_draws=10000, bootstrap_seed=SEED,
        metric='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1', warmup_calls=0,
        build='GCC13.3 -O2 -g -fwrapv -DHAVE_CLOSEFROM; no LTO/PGO/NDEBUG/padding',
        sampling_serial=True, finite_budget_seconds=14400, formal30=False))
    for label, art in artifacts.items():
        result = capture([art['path'], '-e', 'print(123456)'], 'bounded_smoke', label, 15, art)
        assert result['exit_code'] == 0 and result['stdout'] == '123456\n' and not result['stderr']
    print('REFINE_PREPARED', lab.boot(), flush=True)


def snapshot():
    for name, digest in SOURCE.items():
        lab.save(H / 'runners' / (name[:-3] + '.' + digest + '.py'), (H / name).read_bytes())


def build(cid):
    gate()
    os.sched_setaffinity(0, {2})
    path = H / 'identities' / (cid + '.json')
    if path.exists():
        art = lab.load(path)
        assert lab.sha(art['path']) == art['sha256']
        state = next(row for row in lab.load(H / 'state.json') if row['id'] == cid)
        return art if state['status'] not in ['INVALID', 'BUILD_FAILED'] else None
    design = next(row for row in variants.DESIGNS if row['id'] == cid)
    lab.append(dict(event='design_before_build', timestamp=lab.stamp(), **design))
    print('TRY', cid, design['before'], design['change'], design['tradeoff'], flush=True)
    active = H / 'active'
    if (H / 'active_inventory.json').exists():
        for name, digest in lab.load(H / 'active_inventory.json').items():
            assert lab.sha(active / name) == digest, 'unrecorded source change ' + name
    files = variants.render(cid)
    before = {name: hashlib.sha256(content.encode()).hexdigest() for name, content in files.items()}
    for name, content in files.items():
        target = active / name
        if not target.exists() or target.read_bytes() != content.encode():
            target.write_bytes(content.encode())
    atomic('active_inventory.json', before)
    compat = active / 'compat'
    compat.mkdir(exist_ok=True)
    support = compat / 'test-closefrom.c'
    if not support.exists():
        with tarfile.open(V3 / 'build_support.tar.gz') as archive:
            support.write_bytes(archive.extractfile('compat/test-closefrom.c').read())
    patch = variants.patch(cid)
    lab.save(H / 'patches' / (cid + '.patch'), patch)
    update(cid, status='BUILDING')
    obj = active / '.obj/quickjs.o'
    if obj.exists():
        obj.unlink()
    result = capture(['make', '-j1', 'qjs', 'qjsc'], 'build', cid, 300,
                     dict(source_sha256=before, patch_sha256=lab.sha(H / 'patches' / (cid + '.patch'))), active)
    if result['exit_code'] != 0:
        update(cid, status='BUILD_FAILED', reason=result['token'])
        return None
    commands = [line.strip() for line in result['stdout'].splitlines() if line.startswith('gcc ')]
    compile_commands = [line for line in commands if ' -c -o .obj/quickjs.o ' in line]
    assert len(compile_commands) == 1 and all(flag in compile_commands[0] for flag in ['-O2', '-g', '-fwrapv', '-DHAVE_CLOSEFROM'])
    assert not any(flag in compile_commands[0] for flag in ['-O3', '-DNDEBUG', '-flto', '-fprofile'])
    after = {name: lab.sha(active / name) for name in files}
    assert before == after, 'source changed during build'
    target = H / 'artifacts' / (cid + '.qjs')
    assert not target.exists()
    shutil.copyfile(active / 'qjs', target); target.chmod(0o755)
    art = dict(id=cid, path=str(target), sha256=lab.sha(target), size=target.stat().st_size,
               design=design, source_sha256=before, compile_link_commands=commands,
               patch_sha256=lab.sha(H / 'patches' / (cid + '.patch')), controller_sha256=SOURCE,
               support_sha256=lab.sha(support), build_token=result['token'], boot_id=lab.boot(),
               text_sha256=section_hash(target, '.text'))
    lab.save(path, art)
    passed = []
    for test in [LAB / 'checks.js', V3 / 'semantic.js', H / 'targeted.js']:
        check = capture([target, test], 'correctness', cid + '/' + test.name, 30,
                        dict(binary_sha256=art['sha256'], test_sha256=lab.sha(test)))
        valid = check['exit_code'] == 0 and not check['stderr'] and 'PASS:' in check['stdout']
        passed.append(valid)
    if not all(passed):
        update(cid, status='INVALID', binary_sha256=art['sha256'], reason='Saved correctness failure')
        return None
    update(cid, status='CHECKED', binary_sha256=art['sha256'], correctness='7020 +9013 reused assertions and targeted JS; not full test262')
    if cid == 'rf000':
        baseline = lab.load(H / 'workspace.json')['artifacts']['s001']
        match = section_hash(baseline['path'], '.text') == art['text_sha256']
        lab.save(H / 'rebuild_control.json', dict(status='PASS_SAME_TEXT' if match else 'NATIVE_TEXT_DIFF_REVIEW',
                 source_matches_frozen_s001=True, native_text_equal=match,
                 frozen_text_sha256=section_hash(baseline['path'], '.text'), rebuilt_text_sha256=art['text_sha256']))
        assert match, 'Exact-source rebuilt .text differs; review before ranking'
    print('BUILD_CORRECT', cid, art['sha256'], flush=True)
    return art


def invoke(kind, case, label, stage, campaign, order, rep=0):
    gate()
    n = lab.load(H / 'protocol.json')['N'][kind + '/' + case]
    return measure.invoke(measure.inputs(kind), label, case, label, n, stage, order, rep, campaign)


def aggregate(kind, ratios, expanded=False):
    if kind == 'sunspider':
        assert len(ratios) == 26
        return math.exp(statistics.mean(math.log(value) for value in ratios.values()))
    suites = {}
    for case, value in ratios.items():
        if expanded or case != 'zlib.zlib':
            suites.setdefault(case.split('.')[0], []).append(math.log(value))
    assert len(suites) == (14 if expanded else 13)
    return math.exp(statistics.mean(statistics.mean(values) for values in suites.values()))


def screen(cid):
    completed = H / (cid + '.screen.json')
    if completed.exists():
        return lab.load(completed)
    art = build(cid)
    if art is None:
        return None
    protocol = lab.load(H / 'protocol.json')
    cases = measure.inputs('octane')['cases'].copy()
    random.Random(SEED).shuffle(cases)
    groups = []
    for index, case in enumerate(cases):
        attempts = []
        for trial in range(2):
            campaign = 'refine.' + protocol['tag'] + '.' + cid + '.case' + str(index) + '.trial' + str(trial)
            prior = [json.loads(line) for line in (H / 'runs.jsonl').read_text().splitlines()
                     if '"measurement"' in line]
            assert not any(row.get('campaign') == campaign for row in prior), 'Partial screen requires explicit recovery'
            middle = random.Random(SEED + index).sample([cid, 'A'], 2)
            labels = ['s001'] + middle + ['s001']
            values = [invoke('octane', case, label, 'single_screen', campaign, position) for position, label in enumerate(labels)]
            times = [row['elapsed_ms'] for row in values]
            drift = max(times[0], times[-1]) / min(times[0], times[-1])
            reference = math.sqrt(times[0] * times[-1])
            attempts.append(dict(trial=trial, drift=drift, tokens=[row['process_token'] for row in values],
                                 over_s001=values[labels.index(cid)]['elapsed_ms'] / reference,
                                 over_A=values[labels.index(cid)]['elapsed_ms'] / values[labels.index('A')]['elapsed_ms'],
                                 candidate_ms_per_Run=values[labels.index(cid)]['elapsed_per_Run_ms'],
                                 s001_reference_ms_per_Run=reference / values[0]['N']))
            if drift <= protocol['drift_limit']:
                break
        selected = attempts[-1]
        groups.append(dict(case=case, N=protocol['N']['octane/' + case], attempts=attempts,
                           quality='UNSTABLE' if selected['drift'] > 1.15 else 'RETRY_RECOVERED' if len(attempts) > 1 else 'OK',
                           **selected))
        print('SCREEN_CASE', cid, index + 1, case, round(selected['over_s001'], 5), groups[-1]['quality'], flush=True)
    ratios = {group['case']: group['over_s001'] for group in groups}
    result = dict(status='COMPLETE_SINGLE_PASS_NO_CI', candidate=cid, groups=groups,
                  core_over_s001=aggregate('octane', ratios), expanded_over_s001=aggregate('octane', ratios, True),
                  local5=[case for case, ratio in ratios.items() if ratio <= .95],
                  regressions10=[case for case, ratio in ratios.items() if ratio >= 1.10],
                  quality_counts=dict(Counter(row['quality'] for row in groups)),
                  boot_id=lab.boot(), source_sha256=art['sha256'])
    lab.save(completed, result)
    update(cid, status='SCREENED', screen_core=result['core_over_s001'], screen_expanded=result['expanded_over_s001'],
           screen_regressions10=result['regressions10'], screen_quality=result['quality_counts'])
    print('SCREEN_COMPLETE', cid, result['core_over_s001'], result['expanded_over_s001'], flush=True)
    return result


def first():
    prepare(); snapshot()
    started = time.monotonic()
    for design in variants.DESIGNS:
        assert time.monotonic() - started < 14400, 'Finite exploration budget exhausted'
        screen(design['id'])
        atomic('progress.json', dict(stage='correction_single_pass', last_candidate=design['id'], boot_id=lab.boot(),
                                    elapsed_s=time.monotonic() - started, timestamp=lab.stamp()))
    lab.save(H / 'first.complete.json', dict(status='FIRST_CORRECTIONS_SCREEN_COMPLETE', ids=[row['id'] for row in variants.DESIGNS],
             elapsed_s=time.monotonic() - started, boot_id=lab.boot()))
    print('FIRST_CORRECTIONS_COMPLETE', flush=True)
    # A bounded idle hand-off keeps this boot available for subsequent review.
    for unused in range(360):
        if (H / 'RELEASE_FIRST_HOLD').exists():
            break
        time.sleep(10)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['first'])
    args = parser.parse_args()
    try:
        first()
    except Exception as exc:
        if (H / 'environment.json').exists():
            lab.append(dict(event='controller_error', timestamp=lab.stamp(), error=repr(exc), traceback=traceback.format_exc()))
            atomic('controller_error.json', dict(error=repr(exc), traceback=traceback.format_exc(), boot_id=lab.boot()))
        raise
