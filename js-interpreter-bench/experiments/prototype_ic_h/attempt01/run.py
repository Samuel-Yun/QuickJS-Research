"""Bounded admission campaign; build outside Git, immutable local evidence.

build/run require the fixed WSL runtime. analyze only needs archived public raw.
Never writes to historical experiments, frozen runtime/source, or prior records.
"""
import argparse
import csv
import difflib
import gzip
import hashlib
import importlib.util
import io
import json
import os
import platform
import re
import shutil
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PREV = ROOT / 'experiments/ic_mechanism_audit/attempt01'
METHOD = ROOT / 'experiments/inherited_method_opportunity/attempt01'
STORE = Path('/home/mzyx/prototype_ic_h_attempt01')
RUNTIMES = {
    'A': ('/home/mzyx/read_ic_dequickening_attempt01/A/qjs', '584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1'),
    'M': ('/home/mzyx/ic_mechanism_audit_attempt01/M/qjs', '7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef'),
}
REASONS = ['eligible', 'receiver_not_ordinary', 'not_direct_one_level',
           'holder_not_ordinary', 'not_data', 'receiver_unhashed', 'holder_unhashed']


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def read(p):
    if str(p).endswith('.gz'):
        return json.loads(gzip.decompress(Path(p).read_bytes()))
    return json.loads(Path(p).read_text(encoding='utf-8'))


def save(p, v):
    p = Path(p)
    p.parent.mkdir(parents=True, exist_ok=True)
    data = v if isinstance(v, bytes) else (v if isinstance(v, str) else json.dumps(v, ensure_ascii=False, indent=2) + '\n').encode('utf-8')
    if p.exists():
        assert p.read_bytes() == data, 'refuse overwrite: ' + str(p)
    else:
        with p.open('xb') as f:
            f.write(data)


def stamp():
    return datetime.now(timezone.utc).isoformat()


def csvout(p, rows):
    rows = list(rows)
    assert rows
    s = io.StringIO(newline='')
    w = csv.DictWriter(s, list(rows[0]), lineterminator='\n')
    w.writeheader()
    w.writerows(rows)
    save(p, s.getvalue())


def capture(label, cmd, cwd=None, env=None, timeout=600):
    path = HERE / 'raw/commands' / (label + '.json')
    assert not path.exists(), 'no automatic retries / overwrites'
    t, start = stamp(), time.perf_counter_ns()
    try:
        r = subprocess.run(list(map(str, cmd)), cwd=cwd or ROOT, env=env, timeout=timeout, capture_output=True, text=True)
        out = dict(exit_code=r.returncode, stdout=r.stdout, stderr=r.stderr, timeout=False)
    except subprocess.TimeoutExpired as e:
        def dec(v): return v.decode(errors='replace') if isinstance(v, bytes) else v or ''
        out = dict(exit_code=None, stdout=dec(e.stdout), stderr=dec(e.stderr), timeout=True)
    stop = time.perf_counter_ns()
    out.update(command=list(map(str, cmd)), cwd=str(cwd or ROOT), timestamp=t, completed_at=stamp(),
               outer_start_ns=start, outer_stop_ns=stop, outer_wall_ns=stop-start,
               boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip())
    save(path, out)
    print(label, out['exit_code'], flush=True)
    return out


def one(s, a, b):
    assert s.count(a) == 1, (a[:100], s.count(a))
    return s.replace(a, b, 1)


def verify():
    for label, (p, expected) in RUNTIMES.items():
        assert sha(p) == expected, label
    src = Path('/home/mzyx/ic_mechanism_audit_attempt01/M')
    expected = read(PREV / 'sources.json')['M_source_files']
    for name, h in expected.items():
        assert sha(src / name) == h, name
    return src, expected


def build():
    src, expected = verify()
    assert not STORE.exists(), 'new build area must be unused'
    start = dict(timestamp=stamp(), task_budget_seconds=21600, admission_target_seconds=1800)
    save(HERE / 'started.json', start)
    capture('environment', ['sh', '-c', 'uname -a; cat /etc/os-release; lscpu; free -b; df -B1 /home; uptime; gcc --version; make --version; ps -eo pid,stat,comm,pcpu,args'])
    env = dict(platform=platform.platform(), host=platform.node(), architecture=platform.machine(),
               boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
               power_mode='UNKNOWN', cpu_frequency_control='UNKNOWN', background_host_load='UNKNOWN',
               environment={k: os.environ[k] for k in ['LANG', 'LC_ALL', 'LD_PRELOAD', 'LD_AUDIT'] if k in os.environ})
    save(HERE / 'environment.json', env)
    dst = STORE / 'M_admission'
    for name in expected:
        target = dst / name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src / name, target)
    originals = {name: (dst / name).read_text() for name in ['quickjs.c', 'qjs.c', 'read_ic_opcodes.inc', 'read_ic_runtime.inc']}
    # Reuse the exact prior narrow function/PC, lookup and result counters.
    sys.path.insert(0, str(PREV))
    spec = importlib.util.spec_from_file_location('previous_diagnostic_build', PREV / 'diagnostic_build.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    for name in ['audit_hooks.h', 'audit_tail.inc']:
        raw = (PREV / 'diagnostic' / name).read_bytes()
        save(HERE / 'diagnostic/reused' / name, raw)
        shutil.copy2(PREV / 'diagnostic' / name, dst / name)
    module.instrument('M', dst)
    p = dst / 'audit_hooks.h'
    t = p.read_text()
    t = one(t, '    char *atom;', '    unsigned long long admission_found,admission_eligible;\n    unsigned long long admission_reason[7],admission_mask[64],admission_depth[4];\n    char *atom;')
    t += '\n' + (HERE / 'admission_hooks.inc').read_text()
    p.write_text(t)
    p = dst / 'audit_tail.inc'
    t = p.read_text()
    t = one(t, r'\"value_other\":%llu}', r'\"value_other\":%llu')
    t = one(t, 's->operations,s->ic_queries,s->hits,s->misses,s->cache_probes,s->updates,s->insertions,s->replacements,s->same_shape_updates,s->find_normal,s->find_with_offset,s->buckets,s->chain_probes,s->generic_get,s->value_int,s->value_object,s->value_other);',
            's->operations,s->ic_queries,s->hits,s->misses,s->cache_probes,s->updates,s->insertions,s->replacements,s->same_shape_updates,s->find_normal,s->find_with_offset,s->buckets,s->chain_probes,s->generic_get,s->value_int,s->value_object,s->value_other);\n            admission_json(out,s);fprintf(out,"}");')
    p.write_text(t)
    p = dst / 'read_ic_opcodes.inc'
    t = p.read_text()
    t = one(t, '        uint32_t index = get_u32(pc), offset;', '        unsigned admission_depth = 0;                                  \\\n        uint32_t index = get_u32(pc), offset;')
    t = one(t, '                if (prs) {', '                if (prs) {                                              \\\n                    admission_found(origin,p,prs,admission_depth);')
    t = one(t, '                p = p->shape->proto;', '                admission_depth++;                                     \\\n                p = p->shape->proto;')
    p.write_text(t)
    patch = ''.join(''.join(difflib.unified_diff(old.splitlines(True), (dst / name).read_text().splitlines(True), fromfile='a/' + name, tofile='b/' + name)) for name, old in originals.items())
    save(HERE / 'diagnostic/M_to_admission.patch', patch)
    for name in ['audit_hooks.h', 'audit_tail.inc']:
        save(HERE / 'diagnostic/generated' / name, (dst / name).read_bytes())
    r = capture('build_admission', ['make', '-j2', 'qjs'], dst, timeout=600)
    assert r['exit_code'] == 0, 'build failed; saved actual failure'
    manifest = dict(timestamp=stamp(), upstream_commit=read(HERE / 'protocol.json')['base_upstream_commit'],
                    A=dict(path=RUNTIMES['A'][0], sha256=RUNTIMES['A'][1]),
                    M=dict(path=RUNTIMES['M'][0], sha256=RUNTIMES['M'][1]),
                    M_source=dict(path=str(src), files=expected),
                    diagnostic=dict(path=str(dst / 'qjs'), sha256=sha(dst / 'qjs'), source=str(dst),
                                    formal=False, source_files={name: sha(dst / name) for name in [*originals, 'audit_hooks.h', 'audit_tail.inc']}),
                    compiler='gcc 13.3.0 (actual banner in raw/commands/environment.json)',
                    optimization='unchanged Makefile: -O2 -g -fwrapv; full commands in build_admission.json',
                    reused_tools={str(p.relative_to(ROOT)): sha(p) for p in [PREV / 'diagnostic_build.py', PREV / 'diagnostic/audit_hooks.h', PREV / 'diagnostic/audit_tail.inc']})
    save(HERE / 'manifest.json', manifest)
    print('ADMISSION_BUILD_READY', flush=True)


def script(case, n):
    if case == 'Richards.Richards':
        config = dict(case=case, N=n, phase='correctness')
        d = (METHOD / 'inputs/richards_driver.js').read_text().replace('__CONFIG__', json.dumps(config)).replace('__SUITE__', '"Richards"').replace('__INDEX__', '0').replace('__BENCHMARK__', '"Richards"')
        data = b'\n;\n'.join((METHOD / 'inputs' / name).read_bytes() for name in ['adapter.js', 'base.js', 'richards.js']) + b'\n;\n' + d.encode()
    else:
        d = (METHOD / 'inputs/micro_driver.js').read_text().replace('__N__', str(n)).replace('__CHECK__', 'true').replace('__EXPECTED__', '8390656').replace('__CASE__', json.dumps(case)).replace('__MODE__', '"H_ADMISSION_DIAGNOSTIC_V1"').replace('__PHASE__', '"correctness"')
        data = (METHOD / 'inputs/adapter.js').read_bytes() + b'\n;\nvar CASE_KIND="inherited";\n' + (METHOD / 'cases/method_control.js').read_bytes() + b'\n;\n' + d.encode()
    p = HERE / 'scripts' / case / ('N' + str(n) + '.js')
    save(p, data)
    return p


def run():
    verify()
    m = read(HERE / 'manifest.json')
    a = m['diagnostic']
    assert sha(a['path']) == a['sha256']
    for case in ['Richards.Richards', 'prototype_method']:
        for n in [1, 2]:
            js = script(case, n)
            report = STORE / 'reports' / (case + '.N' + str(n) + '.json')
            report.parent.mkdir(parents=True, exist_ok=True)
            assert not report.exists()
            env = os.environ.copy()
            env['IC_MECHANISM_REPORT'] = str(report)
            label = case + '.N' + str(n)
            r = capture(label, [a['path'], js], env=env, timeout=180)
            assert r['exit_code'] == 0 and not r['stderr'], label
            payloads = re.findall(r'^TEB_RESULT:(.*)$', r['stdout'], re.M)
            assert len(payloads) == 1
            payload = json.loads(payloads[0])
            assert payload['correctness'] == 'PASS' and payload['N'] == n and payload['warmup_calls'] == 0
            if case == 'prototype_method':
                assert payload['last'] == 8390656 and payload['checksum'] == 8390656 * n
            data = report.read_bytes()
            dest = HERE / 'raw/admission' / (label + '.json.gz')
            save(dest, gzip.compress(data, mtime=0))
            save(HERE / 'raw/admission' / (label + '.identity.json'), dict(
                binary=a, script_relative=js.relative_to(HERE).as_posix(), script_sha256=sha(js),
                compressed_sha256=sha(dest), raw_sha256=hashlib.sha256(data).hexdigest(), raw_bytes=len(data),
                input_sources={str(p.relative_to(ROOT)): sha(p) for p in [METHOD / 'inputs/richards.js', METHOD / 'cases/method_control.js']},
                phase='admission only', formal_performance=False, payload=payload))
    verify()
    print('FOUR_ADMISSION_PROCESSES_FINISHED', flush=True)


def function_name(f, original):
    raw = bytes.fromhex(f['function_hex']).decode(errors='replace')
    source = bytes.fromhex(f['source_hex']).decode(errors='replace')
    if raw:
        return raw
    off = original.find(source) if source else -1
    match = re.search(r'([\w.$]+)\s*=\s*$', original[:off]) if off >= 0 else None
    return match[1] if match else 'UNKNOWN'


def analyze():
    out = HERE / 'analysis'
    assert not out.exists(), 'use a new --output directory for replay'
    analyze_to(out)


def analyze_to(out):
    # This entry uses only repository materials; never opens runtime/build paths.
    rows, combos, checks = [], [], []
    original = (METHOD / 'inputs/richards.js').read_text(encoding='utf-8')
    targets = {
        ('Scheduler.prototype.schedule', 'isHeldOrSuspended'): (30, 10671, '927f4561195466f7b1ddc4deed5c9deb70cb1ee6cc095a49059e499c5cb59f79'),
        ('Scheduler.prototype.schedule', 'run'): (83, 6573, '927f4561195466f7b1ddc4deed5c9deb70cb1ee6cc095a49059e499c5cb59f79'),
        ('TaskControlBlock.prototype.run', 'run'): (73, 6573, '10a938963415dedb8156eb5cfab58f0ef58498c0a7a998de96c456442aba2268'),
        ('methodLoop', 'step'): (13, 4096, None),
    }
    for case in ['Richards.Richards', 'prototype_method']:
        for n in [1, 2]:
            label = case + '.N' + str(n)
            p = HERE / 'raw/admission' / (label + '.json.gz')
            identity = read(HERE / 'raw/admission' / (label + '.identity.json'))
            assert sha(p) == identity['compressed_sha256']
            raw = gzip.decompress(p.read_bytes())
            assert hashlib.sha256(raw).hexdigest() == identity['raw_sha256']
            assert sha(HERE / identity['script_relative']) == identity['script_sha256']
            r = read(HERE / 'raw/commands' / (label + '.json'))
            assert r['exit_code'] == 0 and not r['stderr'] and not r['timeout']
            data = json.loads(raw)
            for f in data['functions']:
                name = function_name(f, original)
                source = bytes.fromhex(f['source_hex'])
                source_sha = hashlib.sha256(source).hexdigest()
                before = bytes.fromhex(f['code_before_hex'])
                for op in f['opcodes']:
                    if not op['operations']:
                        continue
                    adm = op['admission']
                    assert sum(adm['first_reason']) == sum(adm['mask_counts']) == sum(adm['depth_counts']) == adm['found']
                    assert adm['eligible'] == adm['first_reason'][0] == adm['mask_counts'][63]
                    if op['ic_read_stats_instrumented']:
                        assert op['ic_queries'] == op['hits'] + op['misses']
                        assert adm['found'] <= op['misses']
                    atom = bytes.fromhex(op['atom_hex']).decode(errors='replace')
                    key = name, atom
                    if key not in targets:
                        continue
                    pc, per_run, expected_sha = targets[key]
                    assert op['pc'] == pc and before[pc] == op['before_id'], (key, op['pc'], pc)
                    if expected_sha:
                        assert source_sha == expected_sha, (key, source_sha)
                    assert op['operations'] == op['ic_queries'] == op['misses'] == per_run * n and not op['hits']
                    assert adm['found'] == per_run * n
                    assert sum(adm['depth_counts'][1:]) == per_run * n
                    assert op['find_normal'] == 2 * per_run * n
                    row = dict(case=case, N=n, function=name, source_sha256=source_sha, instance_id=f['instance_id'],
                               code_before_sha256=hashlib.sha256(before).hexdigest(), pc=pc, opcode=op['before_op'],
                               site_index=op['operand_before'], atom=atom, total_reads=op['operations'], queries=op['ic_queries'],
                               hits=op['hits'], fallback=op['misses'], own_find=op['find_normal'], found=adm['found'],
                               inherited=sum(adm['depth_counts'][1:]), direct_one_level=adm['depth_counts'][1],
                               eligible=adm['eligible'], eligible_per_total_read=adm['eligible']/op['operations'],
                               **{reason: adm['first_reason'][i] for i, reason in enumerate(REASONS) if i},
                               report_relative=p.relative_to(HERE).as_posix())
                    rows.append(row)
                    for mask, count in enumerate(adm['mask_counts']):
                        if count:
                            combos.append(dict(case=case, N=n, function=name, instance_id=f['instance_id'], pc=pc, atom=atom,
                                               mask=mask, receiver_ordinary=bool(mask&1), holder_ordinary=bool(mask&2),
                                               direct_one_level=bool(mask&4), data=bool(mask&8), receiver_hashed=bool(mask&16),
                                               holder_hashed=bool(mask&32), count=count, denominator_found=adm['found']))
                    lines = [f'# {case} N={n}: {name}, compiled instance {f["instance_id"]}',
                             f'Source SHA256: {source_sha}', f'Final prepared code SHA256: {hashlib.sha256(before).hexdigest()}',
                             'Source and final opcode starts from the new diagnostic, not sf->cur_pc.',
                             '```javascript', source.decode(errors='replace'), '```', '```text', 'pc size opcode u32_operand_when_size_ge_5 atom']
                    for item in f['opcodes']:
                        prop = bytes.fromhex(item['atom_hex']).decode(errors='replace')
                        lines.append(f'{item["pc"]:4} {item["size"]:2} {item["before_op"]} {item["operand_before"] if item["size"]>=5 else "-"} {prop}')
                    lines += ['```', 'Non-u32 immediates are NOT decoded here; raw final bytes:', '`'+f['code_before_hex']+'`']
                    dest = out / 'bytecode' / case / f'N{n}.{f["instance_id"]}.md'
                    save(dest, '\n'.join(lines)+'\n')
            checks.append(dict(case=case, N=n, exit_code=r['exit_code'], stderr=r['stderr'], correctness='PASS',
                               report_sha256=sha(p), script_sha256=identity['script_sha256']))
    assert len(rows) == 8, len(rows)
    for fn, atom in targets:
        rr = sorted([r for r in rows if r['function'] == fn and r['atom'] == atom], key=lambda r:r['N'])
        assert len(rr) == 2
        for k in ['total_reads','queries','hits','fallback','own_find','found','inherited','direct_one_level','eligible']+REASONS[1:]:
            assert rr[1][k] == 2 * rr[0][k], (fn, atom, k)
    richards = [r for r in rows if r['case'] == 'Richards.Richards']
    status = 'NO_TARGET_ELIGIBILITY' if all(r['eligible'] == 0 for r in richards) else 'ADMITTED_CONTINUE_H'
    csvout(out/'admission_sites.csv', rows)
    csvout(out/'admission_combinations.csv', combos)
    csvout(out/'correctness.csv', checks)
    save(out/'audit.json', dict(status=status, independent_processes=4, matched_target_rows=len(rows),
                               Richards_sites=3, source_instance_opcode_mapping='PASS', N2_counts_double_N1=True,
                               counter_invariants='PASS', raw_archive_hashes='PASS',
                               H_implemented=False, formal_samples=0, formal_target_if_admitted=450,
                               lookup_counts_not_times=True, OFF_feedback_not_applicable=True))
    print(status, flush=True)
    for r in rows:
        print(r['case'], r['N'], r['function'],r['pc'],r['atom'],'eligible',r['eligible'],'/',r['total_reads'], flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('stage', choices=['build','run','analyze'])
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    if args.stage == 'analyze' and args.output:
        assert not args.output.exists()
        analyze_to(args.output)
    else:
        globals()[args.stage]()
