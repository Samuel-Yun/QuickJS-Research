"""Build, calibrate and collect serial layers with append-only process evidence."""
import csv
import hashlib
import itertools
import json
import math
import os
import random
import shutil
import statistics
import sys
import time
from collections import defaultdict
from pathlib import Path

import search as s
import generate

H = s.HERE
lab = s.lab
measure = s.measure
REPS = ['P001', 'P012', 'L001', 'L005', 'L006', 'T001', 'T011', 'Q001', 'Q003', 'H001', 'H014', 'H025', 'S005', 'F016']


def atomic_json(path, data):
    path = Path(path)
    tmp = path.with_suffix(path.suffix + '.pending')
    tmp.write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n', encoding='utf-8', newline='\n')
    os.replace(tmp, path)


def all_rows():
    return lab.load(H / 'state.json')


def row_for(cid):
    return next(r for r in all_rows() if r['id'] == cid)


def records():
    if not (H / 'runs.jsonl').exists(): return []
    with (H / 'runs.jsonl').open(encoding='utf-8') as f:
        return [json.loads(line) for line in f]


def identity(cid):
    return measure.artifact(cid)


def build(cid, lifecycle=False):
    s.gate()
    os.sched_setaffinity(0, {2})
    path = H / 'identities' / (cid + '.json')
    if path.exists():
        art = lab.load(path)
        assert lab.sha(art['path']) == art['sha256']
        return art
    row = row_for(cid)
    start = time.monotonic()
    files, config, parent, unsupported = generate.render(row)
    if unsupported:
        s.update(cid, status='UNSUPPORTED', reason=unsupported, parent=parent)
        return None
    canonical = json.dumps(dict(parent=parent, config=config), sort_keys=True)
    others = [r for r in all_rows() if r['id'] != cid and r.get('effective_key') == canonical and r.get('status') not in ['PLANNED', 'UNSUPPORTED', 'BUILD_FAILED', 'INVALID']]
    if others:
        s.update(cid, status='DUPLICATE', reason='identical normalized effective configuration: ' + others[0]['id'], duplicate_of=others[0]['id'], effective_config=config, parent=parent)
        return None
    active = H / 'active'
    previous = H / 'active_inventory.json'
    if previous.exists():
        for name, value in lab.load(previous).items():
            assert lab.sha(active / name) == value, 'unrecorded user/source change ' + name
    source_hashes = {}
    for name, text in files.items():
        data = text.encode()
        target = active / name
        if not target.exists() or target.read_bytes() != data: target.write_bytes(data)
        source_hashes[name] = hashlib.sha256(data).hexdigest()
    atomic_json(previous, source_hashes)
    patch = generate.patch_text(files, parent)
    lab.save(H / 'patches' / (cid + '.patch'), patch)
    s.update(cid, status='BUILDING', parent=parent, effective_config=config, effective_key=canonical,
             classification='CONTROL_VARIANT' if row['family'] == 'Q' and row['policy'] == 'miss_streak' else 'EXPLORATORY_CONFIGURATION')
    # Unlink only this lab's own object, so changed C and transitive includes
    # cannot accidentally reuse a prior quickjs.o. Other frozen source objects
    # are reused only through make dependency tracking.
    obj = active / '.obj/quickjs.o'
    if obj.exists(): obj.unlink()
    built = lab.capture(['make', '-j1', 'qjs', 'qjsc'], 'build', cid, 300,
                        dict(config=config, source_sha256=source_hashes, patch_sha256=lab.sha(H / 'patches' / (cid + '.patch'))), active)
    if built['exit_code'] != 0 or built['boot_id'] != built['boot_id_after']:
        s.update(cid, status='BUILD_FAILED', reason='saved build output: ' + built['token'])
        return None
    commands = [line.strip() for line in built['stdout'].splitlines() if line.startswith('gcc ')]
    compiler = [line for line in commands if ' -c -o .obj/quickjs.o ' in line]
    assert len(compiler) == 1 and '-O2' in compiler[0] and '-g' in compiler[0] and '-DHAVE_CLOSEFROM' in compiler[0]
    assert not any(flag in compiler[0] for flag in ['-DNDEBUG', '-flto', '-fprofile', '-O3'])
    target = H / 'artifacts' / (cid + '.qjs')
    assert not target.exists()
    shutil.copyfile(active / 'qjs', target); target.chmod(0o755)
    assert target.open('rb').read(4) == b'\x7fELF'
    art = dict(id=cid, parent=parent, path=str(target), sha256=lab.sha(target), size=target.stat().st_size,
               effective_config=config, source_sha256_before_build=source_hashes,
               source_sha256_after_build={name: lab.sha(active / name) for name in files},
               generator_sha256=lab.sha(H / 'generate.py'), templates_sha256={p.name: lab.sha(p) for p in (H / 'templates').iterdir()},
               patch_sha256=lab.sha(H / 'patches' / (cid + '.patch')), build_token=built['token'], compile_link_commands=commands,
               build_ms=built['wall_time_ms'], boot_id=lab.boot(), build_profile='matched',
               build_support_files={'compat/test-closefrom.c': lab.sha(active / 'compat/test-closefrom.c')})
    assert art['source_sha256_before_build'] == art['source_sha256_after_build']
    lab.save(path, art)
    outputs = []
    for script in ['checks.js', 'semantic.js']:
        checked = lab.capture([target, H / script], 'minimal_correctness', cid + '/' + script, 20,
                              dict(binary_sha256=art['sha256'], script_sha256=lab.sha(H / script), configuration=config))
        valid = checked['exit_code'] == 0 and not checked['stderr'] and ('CHECKS_PASS:7020\n' == checked['stdout'] if script == 'checks.js' else checked['stdout'].startswith('MASS_SEMANTIC_PASS:'))
        outputs.append(valid)
    if not all(outputs):
        s.update(cid, status='INVALID', binary_sha256=art['sha256'], correctness='FAIL saved minimal_correctness output')
        return None
    s.update(cid, status='CHECKED', binary_sha256=art['sha256'], correctness='7020 reused assertions + 9014 targeted assertions; counts are not independent scenarios',
             build_seconds=time.monotonic() - start)
    if lifecycle:
        lifecycle_check(cid)
    print('BUILD_CHECKED', cid, round(time.monotonic() - start, 2), art['sha256'], flush=True)
    return art


def lifecycle_check(cid):
    output = H / 'identities' / (cid + '.lifecycle.json')
    if output.exists(): return lab.load(output)
    art = identity(cid); active = H / 'active'
    assert {n: lab.sha(active / n) for n in art['source_sha256_after_build']} == art['source_sha256_after_build']
    objects = [active / '.obj' / (name + '.o') for name in ['quickjs', 'dtoa', 'libregexp', 'libunicode', 'cutils']]
    results = []
    for name in ['read_roundtrip', 'roundtrip_slots', 'gc_cycles']:
        source = lab.ROOT / 'experiments/read_ic_mic/attempt01/correctness' / (name + '.c')
        target = H / 'artifacts' / (cid + '.' + name)
        built = lab.capture(['gcc', '-g', '-O2', '-I' + str(active), source, *objects, '-lm', '-lpthread', '-ldl', '-o', target],
                            'template_lifecycle_build', cid + '/' + name, 40, dict(source_sha256=lab.sha(source)))
        assert built['exit_code'] == 0, built['stderr']
        checked = lab.capture([target], 'template_lifecycle', cid + '/' + name, 30, dict(binary_sha256=lab.sha(target)))
        valid = checked['exit_code'] == 0 and not checked['stderr'] and 'PASS' in checked['stdout']
        results.append(dict(name=name, valid=valid, token=checked['token'], stdout=checked['stdout']))
    generated = active / 'mass_embedded.c'
    compiled = lab.capture([active / 'qjsc', '-e', '-o', generated, H / 'semantic.js'], 'template_embedding_compile', cid, 30)
    assert compiled['exit_code'] == 0, compiled['stderr']
    target = H / 'artifacts' / (cid + '.embedded')
    linked = lab.capture(['gcc', '-g', '-O2', '-I' + str(active), generated, *objects, active / '.obj/quickjs-libc.o', '-lm', '-lpthread', '-ldl', '-o', target],
                         'template_embedding_build', cid, 40)
    assert linked['exit_code'] == 0, linked['stderr']
    checked = lab.capture([target], 'template_embedding', cid, 30, dict(binary_sha256=lab.sha(target)))
    results.append(dict(name='qjsc', valid=checked['exit_code'] == 0 and not checked['stderr'] and checked['stdout'].startswith('MASS_SEMANTIC_PASS:'), token=checked['token']))
    status = 'PASS_NARROW_LIFECYCLE' if all(r['valid'] for r in results) else 'FAIL'
    data = dict(status=status, candidate=cid, results=results, full_test262=False, sanitizer=False)
    lab.save(output, data)
    if status == 'FAIL':
        s.update(cid, status='INVALID', reason='template lifecycle failed')
        raise RuntimeError('saved lifecycle failure ' + cid)
    return data


def invoke(kind, case, label, n, phase, campaign, position, rep=0):
    s.gate()
    return measure.invoke(measure.inputs(kind), label, case, label, n, phase, position, rep, campaign)


def calibrate():
    path = H / 'short_n.json'
    if path.exists(): return lab.load(path)
    selected = {}
    for kind, case in s.SHORT:
        n = 1
        while True:
            samples = [invoke(kind, case, label, n, 'short_calibration', 'v3.short.calibration', pos) for pos, label in enumerate(['A', 's001'])]
            if min(r['elapsed_ms'] for r in samples) >= 200: break
            n *= 2
            assert n <= 1048576, 'calibration cap'
        selected[kind + '/' + case] = n
    lab.save(path, dict(status='FROZEN_BEFORE_REPRESENTATIVE_TIMING', N=selected, cases=s.SHORT, target_ms=200, seed=s.SEED))
    return lab.load(path)


def quick_block(ids, block_id, phase='screen1'):
    output = H / (block_id + '.json')
    if output.exists(): return lab.load(output)
    nmap = lab.load(H / 'short_n.json')['N']
    campaign = 'v3.' + block_id
    prior = [r for r in records() if r.get('event') == 'measurement' and r.get('campaign') == campaign]
    # A partial cannot be silently resumed into a fresh endpoint block.
    assert not prior, 'partial block exists: preserve it, explicit recovery needed'
    positions = list(s.SHORT); random.Random(s.SEED + sum(map(ord, block_id))).shuffle(positions)
    first = {}; last = {}; sampled = {}
    for kind, case in positions:
        n = nmap[kind + '/' + case]
        for pos, label in enumerate(['A', 's001']):
            first[kind + '/' + case + '/' + label] = invoke(kind, case, label, n, phase, campaign, pos)
    jobs = list(itertools.product(ids, positions)); random.Random(s.SEED + 11 + sum(map(ord, block_id))).shuffle(jobs)
    for cid, (kind, case) in jobs:
        sampled[cid + '/' + kind + '/' + case] = invoke(kind, case, cid, nmap[kind + '/' + case], phase, campaign, 2)
    for kind, case in positions:
        n = nmap[kind + '/' + case]
        for pos, label in enumerate(['s001', 'A']):
            last[kind + '/' + case + '/' + label] = invoke(kind, case, label, n, phase, campaign, 3 + pos)
    results = []; drift = []
    for kind, case in positions:
        for label in ['A', 's001']:
            key = kind + '/' + case + '/' + label
            value = max(first[key]['elapsed_ms'], last[key]['elapsed_ms']) / min(first[key]['elapsed_ms'], last[key]['elapsed_ms'])
            if value > 1.15: drift.append(dict(kind=kind, case=case, label=label, max_over_min=value))
    for cid in ids:
        ratios = {}
        for kind in ['sunspider', 'octane']:
            values = []
            cases = [case for k, case in positions if k == kind]
            for denominator in ['A', 's001']:
                per_case = []
                for case in cases:
                    key = kind + '/' + case + '/' + denominator
                    r = sampled[cid + '/' + kind + '/' + case]['elapsed_ms'] / math.sqrt(first[key]['elapsed_ms'] * last[key]['elapsed_ms'])
                    per_case.append(dict(case=case, ratio=r))
                ratios[kind + '/' + denominator] = dict(gm=math.exp(statistics.mean(math.log(x['ratio']) for x in per_case)), cases=per_case)
        results.append(dict(candidate=cid, ratios=ratios))
    data = dict(status='UNSTABLE' if drift else 'COMPLETE_SHORT_SCREEN_NO_CI', block=block_id, candidates=ids,
                campaign=campaign, endpoint_drift=drift, results=results, baseline_shared=True,
                short_ms_note='common fixed N, some samples can fall outside100-300ms; no input scaling')
    lab.save(output, data)
    for row in results:
        s.update(row['candidate'], status='SCREENED', screen_sun=row['ratios']['sunspider/s001']['gm'],
                 screen_octane=row['ratios']['octane/s001']['gm'], short_block=block_id,
                 short_drift='UNSTABLE' if drift else 'OK')
    return data


def pilot():
    os.sched_setaffinity(0, {2})
    if (H / 'pilot.complete.json').exists(): return
    for row in all_rows():
        config, parent, unsupported = generate.resolve(row)
        if unsupported and row['status'] == 'PLANNED': s.update(row['id'], status='UNSUPPORTED', reason=unsupported, parent=parent)
    calibrate()
    begin = time.monotonic()
    successful = []
    for cid in REPS:
        art = build(cid, lifecycle=True)
        if art is not None and row_for(cid)['status'] != 'INVALID': successful.append(cid)
    for start in range(0, len(successful), 6):
        ids = successful[start:start + 6]
        quick_block(ids, 'pilot.block' + str(start // 6), 'pilot_screen')
    data = dict(status='COMPLETE_REPRESENTATIVE_PILOT', planned=len(REPS), built_and_correct=len(successful), candidates=successful,
                seconds=time.monotonic() - begin, compilation_serial=True, measurement_serial=True,
                budget_next='All supported initial seeds; short screen blocks6; reuse checked reps; no expansion before full layer1 analysis')
    lab.save(H / 'pilot.complete.json', data)
    print('PILOT_COMPLETE', json.dumps(data), flush=True)


def screen():
    os.sched_setaffinity(0, {2})
    assert (H / 'pilot.complete.json').exists()
    pending = [r['id'] for r in all_rows() if r['status'] in ['PLANNED', 'CHECKED']]
    random.Random(s.SEED).shuffle(pending)
    for block, start in enumerate(range(0, len(pending), 6)):
        ids = []
        for cid in pending[start:start + 6]:
            art = build(cid)
            if art is not None and row_for(cid)['status'] == 'CHECKED': ids.append(cid)
        if ids:
            result = quick_block(ids, 'screen.block' + str(block))
            if result['endpoint_drift']:
                result2 = quick_block(ids, 'screen.block' + str(block) + '.retry1', 'screen1_retry')
                if result2['endpoint_drift']:
                    lab.save(H / 'STOP', 'Repeated endpoint drift; inspect environment before more measurement.\n')
                    raise RuntimeError('Repeated block drift; both records retained')
        complete = sum(r['status'] == 'SCREENED' for r in all_rows())
        print('SEARCH_PROGRESS', complete, '/288', json.dumps({status: sum(r['status'] == status for r in all_rows()) for status in sorted({r['status'] for r in all_rows()})}), flush=True)
        atomic_json(H / 'progress.json', dict(timestamp=lab.stamp(), boot_id=lab.boot(), screened=complete, block=block, initial=288))
    lab.save(H / 'screen.complete.json', dict(status='COMPLETE_SUPPORTED_INITIAL_LAYER1', counts={status: sum(r['status'] == status for r in all_rows()) for status in sorted({r['status'] for r in all_rows()})}))


def analyze():
    import analysis
    analysis.main()


def audit():
    import analysis
    analysis.audit()
