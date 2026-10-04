#!/usr/bin/env python3
"""RegExp policy evidence only; no performance measurements."""
import re
from cohort import HERE, command, evidence, verify
from runtime_setup import save

verify()
script = HERE / 'probes/tier/regexp_probe.js'
help_text = (HERE / 'probes/tier/v8_help/stdout.txt').read_text()
supported = bool(re.search(r'^\s*--trace-regexp-tier-up(?:\s|$)', help_text, re.M))
results = {}
for label, engine, flags, default in [
    ('quickjs', 'quickjs', (), False),
    ('v8_candidate', 'v8', ('--trace-regexp-tier-up',) if supported else (), False),
    ('jsc_default', 'jsc', ('--traceRegExpJITExecution=true',), True),
    ('jsc_candidate', 'jsc', ('--traceRegExpJITExecution=true',), False)]:
    record = evidence('tier/regexp_' + label, command(engine, script, flags, default))
    text = record['stdout'] + '\n' + record['stderr']
    results[label] = {
        'exit_code': record['exit_code'], 'checksum_pass': 'TEB_REGEXP_PASS:1000' in record['stdout'],
        'native_compilation_messages': len(re.findall(r'native code size', text)),
        'jsc_regexp_jit_execution_messages': len(re.findall(r'RegExpJIT \[', text))}
save(HERE / 'probes/tier/regexp_policy.json', {'v8_trace_supported': supported, 'results': results,
    'note': 'JS interpreter tier policy is separate from regex/native builtin policy; no timing comparison'})
print('RegExp policy probes recorded')
