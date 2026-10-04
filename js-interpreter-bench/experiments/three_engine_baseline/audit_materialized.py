#!/usr/bin/env python3
"""Audit stored Linux probe evidence without executing any runtime.

Runtime/dependency hashes were checked by cohort.verify immediately before
successful WSL probes. A future sampling session must run run_case --verify-only.
"""
import csv
import json
from pathlib import PurePosixPath
from cohort import HERE, ROOT, ENGINES, SUNSPIDER, OCTANE, validated_payload
from runtime_setup import preservation, save, sha

m = json.loads((HERE / 'manifest.json').read_text())
inputs = json.loads((HERE / 'input_manifest.json').read_text())
for path, expected in inputs.items():
    if sha(ROOT / path) != expected:
        raise RuntimeError('input/manifest differs: ' + path)
before = json.loads((HERE / 'preservation_before.json').read_text())
current = {path.replace('\\', '/'): value for path, value in preservation().items()}
if before != current:
    changed = [path for path in set(before) | set(current) if before.get(path) != current.get(path)]
    raise RuntimeError('old baseline/raw/summary changed: ' + str(changed[:20]))
tier = json.loads((HERE / 'probes/tier/summary.json').read_text())
timers = json.loads((HERE / 'probes/timer/summary.json').read_text())
frontend = json.loads((HERE / 'probes/frontend_order/summary.json').read_text())
regex = json.loads((HERE / 'probes/tier/regexp_trace_limitation.json').read_text())
with (HERE / 'probes/correctness/results.csv').open(newline='', encoding='utf-8') as f:
    rows = list(csv.DictReader(f))
expected_keys = {(b, c, e, str(n)) for b, cases in [('SunSpider', SUNSPIDER), ('Octane', OCTANE)]
                 for c in cases for e in ENGINES for n in (1, 2, 16)}
observed_keys = {(r['benchmark'], r['case'], r['engine'], r['N']) for r in rows}
if observed_keys != expected_keys or len(rows) != len(expected_keys):
    raise RuntimeError('missing/duplicated correctness position')
for row in rows:
    directory = (HERE / row['stdout_path']).parent
    record = json.loads((directory / 'command.json').read_text())
    record['stdout'] = (directory / 'stdout.txt').read_text()
    record['stderr'] = (directory / 'stderr.txt').read_text()
    payload = validated_payload(record, row['benchmark'], row['case'], int(row['N']), 'correctness')
    prefix = m['engines'][row['engine']]['command_prefix']
    if record['command'][:len(prefix)] != prefix:
        raise RuntimeError('probe flags/binary differ from manifest')
    relative_script = PurePosixPath(record['command'][-1]).relative_to(PurePosixPath(m['project_root']))
    if sha(ROOT / str(relative_script)) != row['script_sha256'] or row['status'] != 'PASS':
        raise RuntimeError('script hash/status differs')
    if payload['warmup_calls'] != 0:
        raise RuntimeError('unexpected performance warmup')
timers_valid = all(timers[e]['date_available'] and timers[e]['date']['changes'] > 0 for e in ENGINES)
ready = tier['all_mode_gates_pass'] and timers_valid and regex['untraced_checksum_pass']
latest = json.loads((HERE / 'probes/tier/regexp_v8_no_trace/command.json').read_text())
output = {
    'status': 'READY_FIRST_CALL_INCLUSIVE' if ready else 'BLOCKED_VALIDATION',
    'cohort_id': m['cohort_id'], 'platform': 'WSL2 Ubuntu 24.04.2 x86_64',
    'same_host_os_architecture': True, 'old_windows_results_comparable': False,
    'runtime_hashes_verified': True,
    'runtime_hash_verification_evidence': 'Successful WSL diagnose_regexp.py calls cohort.verify before the recorded probe; all runtime/dependency/input/old-data hashes checked',
    'latest_runtime_verification_timestamp_utc': latest['timestamp_utc'],
    'runtime_reverification_required_before_future_sampling': True,
    'audit_method': 'Read-only materialized-evidence and input/old-data hash audit; no new runtime execution',
    'execution_mode_gates': tier,
    'main_metric': 'first-call-inclusive interpreter-mode execution time',
    'no_performance_warmup': True, 'static_frontend_exclusion': 'UNKNOWN',
    'frontend_prepared_no_warmup_ready': False,
    'jsc_static_probe_generation_inside_region': frontend['jsc_source']['__tebStaticWorkload']['generation_inside_region'],
    'timer': timers,
    'correctness': {'expected': 72, 'actual': len(rows), 'pass': len(rows), 'all_pass': True},
    'regexp_trace_limitation': regex,
    'old_baseline_and_data_preserved': True, 'formal_samples_taken': 0,
    'full_suite_compatibility': None, 'future_full_formal_run_authorized': False,
    'v8_exact_artifact_source_commit': None, 'v8_exact_compiler_revision': None,
    'binary_sha256': {e: m['engines'][e]['binary']['sha256'] for e in ENGINES},
    'manifest_sha256': sha(HERE / 'manifest.json'), 'input_manifest_sha256': sha(HERE / 'input_manifest.json'),
    'execution_contract_sha256': sha(HERE / 'execution_contract.json'),
    'materialized_auditor_sha256': sha(__file__)
}
save(HERE / 'summary/audit.json', output)
save(HERE / 'preservation_after.json', json.loads((HERE / 'preservation_before.json').read_text()))
print(output['status'] + '; independently audited 72/72 stored correctness records')
