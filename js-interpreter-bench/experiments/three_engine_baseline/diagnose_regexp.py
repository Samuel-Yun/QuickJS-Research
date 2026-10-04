#!/usr/bin/env python3
"""Retain readonly diagnostic failure; check the identical probe untraced."""
import json
from cohort import HERE, command, evidence, verify
from runtime_setup import save

verify()
record = evidence('tier/regexp_v8_no_trace', command('v8', HERE / 'probes/tier/regexp_probe.js'))
prior = json.loads((HERE / 'probes/tier/regexp_policy.json').read_text())['results']['v8_candidate']
save(HERE / 'probes/tier/regexp_trace_limitation.json', {
    'trace_attempt_exit_code': prior['exit_code'],
    'trace_flag_listed_in_help': True,
    'trace_effectively_settable': False,
    'reason': 'Contradictory value for readonly flag --trace-regexp-tier-up',
    'untraced_exit_code': record['exit_code'],
    'untraced_checksum_pass': 'TEB_REGEXP_PASS:1000' in record['stdout'],
    'v8_regexp_native_execution_observed': None,
    'native_execution_permitted_by_effective_policy': True,
    'main_runtime_flags_changed': False
})
if record['exit_code'] != 0 or 'TEB_REGEXP_PASS:1000' not in record['stdout']:
    raise RuntimeError('untraced regex probe failed')
print('Untraced regexp smoke PASS; readonly trace remains UNKNOWN for native execution')
