"""Serial, resumable IC search. Old experiments and binaries are read-only."""
import argparse
import csv
import hashlib
import itertools
import json
import math
import os
import platform
import random
import shutil
import statistics
import subprocess
import sys
import tarfile
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
LAB = HERE.parent
V2 = LAB / 'v2_20261105'
sys.path.insert(0, str(LAB))
import lab
import measure

lab.HERE = HERE
measure.HERE = HERE
measure.SEED = 20261105
lab.candidate_metadata_path = lambda cid: HERE / 'identities' / (cid + '.json')
SEED = 20261105
SHORT = [('sunspider', c) for c in ['3d-raytrace', 'access-binary-trees', 'bitops-bitwise-and', 'regexp-dna']]
SHORT += [('octane', c) for c in ['Richards.Richards', 'Splay.Splay', 'RayTrace.RayTrace', 'CodeLoad.CodeLoadClosure']]


def gate():
    if (HERE / 'STOP').exists():
        raise RuntimeError('STOP requested; checkpoint retained')
    if (HERE / 'environment.json').exists():
        assert lab.boot() == lab.load(HERE / 'environment.json')['boot_id'], 'BOOT_CHANGED; explicit new cohort required'


lab.execution_gate = gate


def update(cid, **changes):
    rows = lab.load(HERE / 'state.json')
    row = next(r for r in rows if r['id'] == cid)
    row.update(changes)
    lab.append(dict(event='candidate_status', timestamp=lab.stamp(), id=cid, fields=changes))
    pending = HERE / 'state.pending'
    pending.write_text(json.dumps(rows, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    os.replace(pending, HERE / 'state.json')
    columns = ['id', 'family', 'parent', 'status', 'classification', 'effective_config', 'binary_sha256', 'correctness', 'reason', 'screen_sun', 'screen_octane', 'level2_sun', 'level2_octane', 'decision']
    with (HERE / 'candidates.pending').open('w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, columns, extrasaction='ignore', lineterminator='\n')
        writer.writeheader()
        for r in rows:
            record = dict(r)
            record['effective_config'] = json.dumps(r.get('effective_config'), sort_keys=True)
            writer.writerow(record)
    os.replace(HERE / 'candidates.pending', HERE / 'candidates.csv')


def seeds():
    caps = [2, 3, 4, 5, 6, 8, 12, 16]
    families = {
        'P': dict(slots=caps, probe=['fixed', 'mru'], eviction=['rr', 'lru', 'clock']),
        'L': dict(slots=caps, locate=['index', 'pc_rel'], layout=['soa', 'hot_cold', 'u16_checked']),
        'T': dict(entries=[8, 16, 32, 64], ways=[1, 2, 4], admission=[1, 2], scope=['function', 'runtime']),
        'Q': dict(slots=[1, 2, 4, 8], warm=[2, 4, 8], policy=['miss_streak', 'sampled_rate', 'confidence', 'cooldown']),
        'H': dict(scope=['site', 'shape', 'function_atom'], hints=[1, 2, 3, 4], update=['rr', 'second_observation', 'fill_only']),
        'F': dict(pattern=['loc_read', 'arg_read', 'read_read', 'read_drop', 'read_method0'], parent=['M', 's001'], fallback=['shared', 'inline']),
        'S': dict(parent=['A', 's001'], max_props=[2, 3, 4, 6, 8], scan=['forward', 'reverse'], coverage=['own_data', 'all_own_descriptors']),
    }
    rows = []
    for family, axes in families.items():
        for i, values in enumerate(itertools.product(*axes.values()), 1):
            rows.append(dict(id=f'{family}{i:03}', family=family, status='PLANNED', **dict(zip(axes, values))))
    assert len(rows) == len({r['id'] for r in rows}) == 288
    return rows


def prepare():
    assert not (HERE / 'environment.json').exists(), 'preparation already exists'
    os.sched_setaffinity(0, {2})
    process = subprocess.check_output(['ps', '-eo', 'pid,comm,args'], text=True)
    busy = []
    for line in process.splitlines()[1:]:
        fields = line.split(None, 2)
        if len(fields) >= 2 and (fields[1] in ['qjs', 'd8', 'gcc', 'cc1', 'cc1plus', 'make'] or fields[1].endswith('.qjs')):
            busy.append(line)
    assert not busy, 'Existing engines/compiler must finish: ' + repr(busy)
    env = dict(timestamp=lab.stamp(), boot_id=lab.boot(), platform=platform.uname()._asdict(),
               os_release=Path('/etc/os-release').read_text(), cpuinfo=Path('/proc/cpuinfo').read_text(),
               meminfo=Path('/proc/meminfo').read_text(), affinity=[2], load_average=os.getloadavg(),
               compiler=subprocess.check_output(['gcc', '--version'], text=True), process_inventory=process,
               temperature='UNKNOWN', power_frequency_control='UNKNOWN', background_load_control='UNKNOWN',
               git_head='dafef00c9a5231208253c76329b9d13eb26cc564')
    lab.save(HERE / 'environment.json', env)
    for folder in ['active', 'artifacts', 'identities', 'patches', 'scripts', 'runners']:
        (HERE / folder).mkdir(exist_ok=False)
    old = lab.load(V2 / 'manifest.json')
    artifacts = {}
    for label in ['A', 'M', 's001']:
        art = old['artifacts'][label]
        assert lab.sha(art['path']) == art['sha256'], label + ' identity'
        target = HERE / 'artifacts' / (label + '.qjs')
        shutil.copyfile(art['path'], target)
        target.chmod(0o755)
        artifacts[label] = dict(path=str(target), sha256=lab.sha(target), size=target.stat().st_size, source=art['path'])
        if label == 's001':
            lab.save(HERE / 'identities/s001.json', artifacts[label])
    shutil.copyfile(V2 / 'seed_M.tar.gz', HERE / 'seed_M.tar.gz')
    shutil.copyfile(V2 / 'patches/s001.patch', HERE / 'patches/seed_s001.patch')
    previous = lab.HERE
    previous_metadata = lab.candidate_metadata_path
    lab.HERE = V2
    lab.candidate_metadata_path = lambda cid: V2 / (cid + '.matched.json')
    source_m = lab.reconstructed_sources('M')
    source_s001 = lab.reconstructed_sources('s001')
    lab.HERE = previous
    lab.candidate_metadata_path = previous_metadata
    for name, data in source_s001.items():
        (HERE / 'active' / name).write_bytes(data)
    (HERE / 'active/compat').mkdir()
    support = (LAB / 'build_support/test-closefrom.c').read_bytes().replace(b'\r\n', b'\n').replace(b'\n', b'\r\n')
    (HERE / 'active/compat/test-closefrom.c').write_bytes(support)
    assert lab.sha(HERE / 'active/compat/test-closefrom.c') == '6cd3fc4b77a33b7d496d9d51f32e7a2d62ab00cd604462fd2a8f70ceba52b813'
    source_a_dir = Path('/home/mzyx/read_ic_dequickening_attempt01/A')
    source_a = {p.name: p.read_bytes() for p in source_a_dir.iterdir() if p.is_file() and (p.suffix in ['.c', '.h', '.inc', '.js', '.mjs'] or p.name in ['Makefile', 'VERSION', 'LICENSE'])}
    assert 'quickjs.c' in source_a and 'qjs.c' in source_a
    with tarfile.open(HERE / 'seed_A.tar.gz', 'w:gz') as archive:
        import io
        for name, data in source_a.items():
            entry = tarfile.TarInfo(name); entry.size = len(data); entry.mtime = 0
            archive.addfile(entry, io.BytesIO(data))
    lab.save(HERE / 'workspace.json', dict(active_source=str(HERE / 'active'), artifacts=artifacts,
             source_files={n: hashlib.sha256(d).hexdigest() for n, d in source_m.items()},
             seed_archive_sha256=lab.sha(HERE / 'seed_M.tar.gz'),
             A_source=dict(path=str(source_a_dir), files={n: hashlib.sha256(d).hexdigest() for n, d in source_a.items()},
                           archive_sha256=lab.sha(HERE / 'seed_A.tar.gz'), binary_correspondence='Existing frozen A source path; prior identity records, no rebuild')))
    rows = seeds()
    with (HERE / 'candidate_seeds.jsonl').open('x', encoding='utf-8', newline='\n') as f:
        for row in rows:
            f.write(json.dumps(row, sort_keys=True) + '\n')
    lab.save(HERE / 'state.json', rows)
    protocol = dict(status='FROZEN_BEFORE_SEARCH', seed=SEED, initial_seeds=288, short_cases=SHORT,
                    metric='FIRST_CALL_INCLUSIVE_NATIVE_MONOTONIC_V1', warmup_calls=0, affinity=[2],
                    short_target_ms=200, short_drift_limit=1.15, block_candidates=6, block_retry_limit=1,
                    pilot_representatives=14, level2_target=28, level3_max=4, level3_rounds=3,
                    final_if_ready_rounds=30, maximum_short_candidates=416,
                    maximum_build_seconds=300, per_process_timeout_seconds=300,
                    short_ranking='Each candidate / geometric mean of block endpoints; Sun4 and Octane4 separate; no CI',
                    level2='Whole26+17, one sample each, same-batch A/s001 endpoints; Crypto old N exact ciphertext',
                    formal_bootstrap='10000 shared-round paired draws seed20261105, exploratory unadjusted',
                    old_times_used=False, private_JWST_used=False, fixed_build='GCC13.3, -O2 -g -fwrapv -DHAVE_CLOSEFROM; no LTO/PGO/NDEBUG/padding')
    lab.save(HERE / 'protocol.json', protocol)
    for name in ['checks.js']:
        shutil.copyfile(LAB / name, HERE / name)
    for label in ['A', 'M', 's001']:
        r = lab.capture([artifacts[label]['path'], HERE / 'semantic.js'], 'runtime_gate', label, 20, artifacts[label])
        assert r['exit_code'] == 0 and not r['stderr'] and r['stdout'].startswith('MASS_SEMANTIC_PASS:')
    for kind in ['sunspider', 'octane']:
        info = measure.inputs(kind)
        lab.save(HERE / (kind + '.inputs.json'), info)
    helper = subprocess.Popen(['python3', '-c', 'import time; time.sleep(21600)'], stdin=subprocess.DEVNULL,
                              stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, start_new_session=True)
    lab.save(HERE / 'idle_helper.json', dict(pid=helper.pid, boot_id=lab.boot(), purpose='Finite idle process retains this WSL boot between foreground tool calls; no benchmark/compiler', seconds=21600))
    lab.save(HERE / 'preflight.json', dict(status='PASS_BOUNDED_SMOKE_ONLY', labels=['A', 'M', 's001'], boot_id=lab.boot()))
    update('P001', parent='s001')
    print('MASS_PREPARED_288_SEEDS_3_FROZEN_RUNTIMES', lab.boot(), flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('action')
    parser.add_argument('args', nargs='*')
    args = parser.parse_args()
    if args.action == 'prepare':
        prepare()
    else:
        gate()
        import stages
        getattr(stages, args.action)(*args.args)


if __name__ == '__main__':
    main()
