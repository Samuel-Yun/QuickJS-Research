"""Owned active tree, immutable artifacts, serial new-process exploration."""
import argparse
import csv
import hashlib
import itertools
import json
import math
import os
from pathlib import Path
import random
import shutil
import statistics
import subprocess
import sys
import tarfile
import time

H = Path(__file__).resolve().parent
LAB = H.parent
V3 = LAB / 'v3_mass_search'
V4 = LAB / 'v4_refine_s001'
sys.path.insert(0, str(LAB))
import lab
import measure
import designs

lab.HERE = measure.HERE = H
lab.candidate_metadata_path = lambda cid: H / 'identities' / (cid + '.json')
ORIGINAL_CAPTURE = lab.capture
SEED = 2026110605


def gate():
    if (H / 'STOP').exists():
        raise RuntimeError('Explicit STOP; all records retained')
    assert lab.boot() == lab.load(H / 'environment.json')['boot_id'], 'BOOT_CHANGED'


def capture(cmd, stage, label, timeout=30, identity=None, cwd=None):
    gate()
    identity = dict(identity or {}, controller_sha256={n: lab.sha(H / n) for n in ['run.py', 'designs.py', 'extra_designs.py']})
    result = ORIGINAL_CAPTURE(cmd, stage, label, timeout, identity, cwd)
    assert result['boot_id'] == result['boot_id_after'], 'BOOT_CHANGED'
    return result


lab.capture = capture
lab.execution_gate = gate


def write_json(name, value):
    path = H / name
    tmp = path.with_suffix(path.suffix + '.pending')
    tmp.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    os.replace(tmp, path)


def csvfile(name, rows):
    if not rows:
        return
    keys = list(dict.fromkeys(k for row in rows for k in row))
    with (H / name).open('w', encoding='utf-8', newline='') as stream:
        writer = csv.DictWriter(stream, keys, lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def state(cid, **updates):
    rows = lab.load(H / 'state.json')
    row = next(r for r in rows if r['id'] == cid)
    row.update(updates)
    lab.append(dict(event='candidate_state', id=cid, timestamp=lab.stamp(), **updates))
    write_json('state.json', rows)
    csvfile('candidates.csv', rows)


def prepare():
    if (H / 'environment.json').exists():
        gate()
        return
    os.sched_setaffinity(0, {2})
    inventory = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    for line in inventory.splitlines()[1:]:
        p = line.split(None, 2)
        if len(p) > 1:
            assert p[1] not in ['qjs', 'd8', 'gcc', 'cc1', 'make'] and not p[1].endswith('.qjs'), line
    for name in ['active', 'artifacts', 'identities', 'patches', 'scripts', 'runners']:
        (H / name).mkdir(exist_ok=False)
    previous = lab.load(V3 / 'workspace.json')['artifacts']
    frozen = {k: previous[k] for k in ['A', 'M', 's001']}
    frozen['mx019'] = lab.load(V4 / 'identities/mx019.json')
    for cid, art in frozen.items():
        assert lab.sha(art['path']) == art['sha256'], cid
        lab.save(H / 'identities' / (cid + '.json'), art)
    lab.save(H / 'identities/null_s001.json', dict(frozen['s001'], alias_of='s001', exact_same_file=True))
    lab.save(H / 'workspace.json', dict(active_source=str(H / 'active'), artifacts=frozen))
    lab.save(H / 'environment.json', dict(timestamp=lab.stamp(), boot_id=lab.boot(), uname=os.uname(),
        os_release=Path('/etc/os-release').read_text(), cpuinfo=Path('/proc/cpuinfo').read_text(),
        meminfo=Path('/proc/meminfo').read_text(), process_inventory=inventory, affinity=[2],
        compiler=subprocess.check_output(['gcc', '--version'], text=True),
        power_frequency_control='UNKNOWN', temperature='UNKNOWN', background_load_control='UNKNOWN'))
    n = {}
    for kind in ['octane', 'sunspider']:
        info = measure.inputs(kind)
        lab.save(H / (kind + '.inputs.json'), info)
        for case in info['cases']:
            n[kind + '/' + case] = info['N'][case] if case.startswith('Crypto.') else max(1, info['N'][case] // 4)
    lab.save(H / 'protocol.json', dict(status='FROZEN_BEFORE_NEW_SAMPLES', seed=SEED, N=n,
        cohort='WSL2 Ubuntu24.04.2 x86_64, same boot, affinity CPU2',
        mode='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1', warmup_calls=0,
        source='Exact s001, frozen upstream04be246001599f5995fa2f2d8c91a0f198d3f34c',
        build='GCC13.3 -O2 -g -fwrapv -DHAVE_CLOSEFROM; no NDEBUG/LTO/PGO/padding',
        screen='One complete17-case process per condition, s001/candidate AB or BA in balanced shuffled cases; null control first',
        drift='Baseline block endpoint, >15% is quality flag; at most one separate diagnostic, no favorable replacement',
        promotion='At most3 entrants. core<=0.985 or >=5% local gain in2 cases with core<=1.01. One mechanism reserve within2% allowed.',
        recheck='3-5 independent complete Octane rounds, then full SunSpider if credible',
        final='Only a supported winner receives full safety and fresh30-round confirmation; no winner means no formal performance claim',
        budget='First12 genuine prototypes across6 routes; bounded feasibility failure may be UNSUPPORTED; max24-36 with combinations',
        aggregates='core16cases/13suites, expanded17/14suites; within-suite GM then equal suites; Sun26 equal case',
        limitations='Single screen has no CI; exploratory pair bootstrap10000 only for independent multiple rounds'))
    lab.save(H / 'state.json', [dict(row, status='PLANNED') for row in designs.DESIGNS])
    for cid in ['A', 's001', 'mx019']:
        r = capture([frozen[cid]['path'], '-e', 'print(123456)'], 'bounded_smoke', cid, 15)
        assert r['exit_code'] == 0 and r['stdout'] == '123456\n' and not r['stderr']
    print('PREPARED', lab.boot(), flush=True)


def build(cid):
    gate()
    os.sched_setaffinity(0, {2})
    path = H / 'identities' / (cid + '.json')
    if path.exists():
        identity = lab.load(path)
        assert lab.sha(identity['path']) == identity['sha256']
        row = next(r for r in lab.load(H / 'state.json') if r['id'] == cid)
        assert row['status'] not in ['INVALID', 'BUILD_FAILED'], row
        return identity
    design = next(r for r in designs.DESIGNS if r['id'] == cid)
    # New routes may be defined after earlier prototypes, but are logged before their first build/sample.
    states = lab.load(H / 'state.json')
    if not any(r['id'] == cid for r in states):
        states.append(dict(design, status='PLANNED'))
        write_json('state.json', states)
    lab.append(dict(event='design_before_build', timestamp=lab.stamp(), **design))
    print('TRY', cid, design['before'], design['change'], design['cost'], flush=True)
    active = H / 'active'
    if (H / 'active_inventory.json').exists():
        for name, digest in lab.load(H / 'active_inventory.json').items():
            assert lab.sha(active / name) == digest, 'Unrecorded source edit ' + name
    files = designs.render(cid)
    hashes = {name: hashlib.sha256(content.encode()).hexdigest() for name, content in files.items()}
    for name, content in files.items():
        p = active / name
        if not p.exists() or p.read_bytes() != content.encode():
            p.write_bytes(content.encode())
    write_json('active_inventory.json', hashes)
    compat = active / 'compat'
    compat.mkdir(exist_ok=True)
    with tarfile.open(V3 / 'build_support.tar.gz') as archive:
        (compat / 'test-closefrom.c').write_bytes(archive.extractfile('compat/test-closefrom.c').read())
    lab.save(H / 'patches' / (cid + '.patch'), designs.patch(cid))
    for name in ['run.py', 'designs.py', 'extra_designs.py']:
        lab.save(H / 'runners' / (name[:-3] + '.' + lab.sha(H / name) + '.py'), (H / name).read_bytes())
    state(cid, status='BUILDING')
    for p in [active / '.obj/quickjs.o', active / '.obj/qjsc.o', active / '.obj/qjs.o']:
        if p.exists():
            p.unlink()
    r = capture(['make', '-j1', 'qjs', 'qjsc'], 'build', cid, 300, dict(source_sha256=hashes), active)
    if r['exit_code']:
        state(cid, status='BUILD_FAILED', reason=r['token'])
        return None
    commands = [line for line in r['stdout'].splitlines() if line.startswith('gcc ')]
    c = [line for line in commands if ' -c -o .obj/quickjs.o ' in line]
    assert len(c) == 1 and all(x in c[0] for x in ['-O2', '-g', '-fwrapv', '-DHAVE_CLOSEFROM'])
    assert not any(x in c[0] for x in ['-DNDEBUG', '-O3', '-flto', '-fprofile'])
    assert hashes == {name: lab.sha(active / name) for name in files}
    dest = H / 'artifacts' / (cid + '.qjs')
    assert not dest.exists()
    shutil.copyfile(active / 'qjs', dest)
    dest.chmod(0o755)
    artifact = dict(id=cid, path=str(dest), sha256=lab.sha(dest), size=dest.stat().st_size,
        source_sha256=hashes, compiler_commands=commands, design=design, build_token=r['token'],
        patch_sha256=lab.sha(H / 'patches' / (cid + '.patch')), boot_id=lab.boot())
    lab.save(path, artifact)
    tests = [(LAB / 'checks.js', 'CHECKS_PASS:7020\n'), (V3 / 'semantic.js', 'MASS_SEMANTIC_PASS:9013\n'),
             (V4 / 'targeted.js', 'REFINE_TARGETED_PASS:1941\n'), (H / 'targeted.js', 'STRUCTURAL_PASS:6019\n')]
    passed = []
    for test, expected in tests:
        result = capture([dest, test], 'correctness', cid + '/' + test.name, 45,
                         dict(binary_sha256=artifact['sha256'], test_sha256=lab.sha(test)))
        passed.append(result['exit_code'] == 0 and result['stdout'] == expected and not result['stderr'])
    state(cid, status='CHECKED' if all(passed) else 'INVALID', correctness=str(passed), sha256=artifact['sha256'])
    print('BUILT', cid, all(passed), artifact['sha256'], flush=True)
    return artifact if all(passed) else None


def aggregate(kind, values, expanded=False):
    if kind == 'sunspider':
        assert len(values) == 26
        return math.exp(statistics.mean(math.log(v) for v in values.values()))
    assert len(values) == 17
    suites = {}
    for case, value in values.items():
        if expanded or case != 'zlib.zlib':
            suites.setdefault(case.split('.')[0], []).append(math.log(value))
    assert len(suites) == (14 if expanded else 13)
    return math.exp(statistics.mean(statistics.mean(v) for v in suites.values()))


def measurements(campaign):
    if not (H / 'runs.jsonl').exists():
        return []
    return [r for line in (H / 'runs.jsonl').read_text().splitlines()
            if (r := json.loads(line)).get('event') == 'measurement' and r.get('campaign') == campaign]


def compare(cid, kind='octane', rounds=1, tag='screen', controls=None):
    gate()
    os.sched_setaffinity(0, {2})
    info = measure.inputs(kind)
    labels = controls or ['s001', cid]
    assert len(set(labels)) == len(labels)
    measure.verify(info, labels)
    campaign = tag + '.' + cid + '.' + kind
    protocol = dict(campaign=campaign, kind=kind, labels=labels, rounds=rounds,
                    boot_id=lab.boot(), seed=SEED, N=lab.load(H / 'protocol.json')['N'])
    lab.save(H / (campaign + '.protocol.json'), protocol)
    previous = measurements(campaign)
    complete = {(r['case'], r['condition'], r['rep']): r for r in previous if r['valid']}
    assert len(complete) == len([r for r in previous if r['valid']]), 'duplicate valid position'
    assert all(r['valid'] for r in previous), 'Saved failure requires explicit new attempt, never silent replacement'
    rng = random.Random(SEED + sum(map(ord, campaign)))
    cases = info['cases'].copy()
    for rep in range(rounds):
        rng.shuffle(cases)
        for index, case in enumerate(cases):
            order = labels.copy()
            # Two-label AB/BA balanced over cases. Multi-label cyclic positions across rounds.
            if len(labels) == 2:
                if (index + rep) % 2:
                    order.reverse()
            else:
                start = (index + rep) % len(labels)
                order = order[start:] + order[:start]
                if index % 2:
                    order.reverse()
            for pos, label in enumerate(order):
                key = case, label, rep
                if key in complete:
                    continue
                gate()
                n = protocol['N'][kind + '/' + case]
                result = measure.invoke(info, cid, case, label, n, tag, pos, rep, campaign)
                complete[key] = result
    measure.verify(info, labels)
    gate()
    rows = list(complete.values())
    assert len(rows) == len(cases) * len(labels) * rounds
    values = {}
    for case in info['cases']:
        med = {label: statistics.median(complete[case, label, r]['elapsed_per_Run_ms'] for r in range(rounds))
               for label in labels}
        values[case] = med
    base = labels[0]
    ratios = {label: {case: values[case][label] / values[case][base] for case in cases} for label in labels[1:]}
    result = dict(status='COMPLETE_EXPLORATORY', campaign=campaign, kind=kind, rounds=rounds,
                  valid=len(rows), labels=labels, median_ms_per_Run=values, ratios=ratios,
                  core={label: aggregate(kind, v) for label, v in ratios.items()},
                  expanded={label: aggregate(kind, v, True) for label, v in ratios.items()},
                  max_regressions={label: [case for case, v in ratios[label].items() if v > 1.10] for label in ratios},
                  intervals=None if rounds == 1 else 'See independent analysis; whole-round pairing required')
    lab.save(H / (campaign + '.json'), result)
    csvfile(campaign + '.csv', [dict(case=case, **values[case], **{label + '_over_' + base: r[case] for label, r in ratios.items()})
                               for case in info['cases']])
    if cid not in ['null_s001', 's001']:
        state(cid, **{kind + '_' + tag: json.dumps(result['core'])})
    print('COMPLETE', campaign, result['core'], result['max_regressions'], flush=True)


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('action', choices=['prepare', 'build', 'screen', 'null', 'compare'])
    p.add_argument('ids', nargs='*')
    p.add_argument('--kind', default='octane', choices=['octane', 'sunspider'])
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--tag', default='recheck')
    p.add_argument('--controls', nargs='+')
    args = p.parse_args()
    if args.action == 'prepare':
        prepare()
    elif args.action == 'null':
        compare('null_s001', rounds=1, tag='null')
    else:
        for cid in args.ids:
            if args.action == 'build':
                build(cid)
            elif args.action == 'screen':
                artifact = build(cid)
                if artifact:
                    compare(cid, args.kind, 1, 'screen')
            else:
                compare(cid, args.kind, args.rounds, args.tag, args.controls)
