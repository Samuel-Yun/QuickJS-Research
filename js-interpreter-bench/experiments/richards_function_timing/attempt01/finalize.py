"""Offline completion checks and identity ledger; no new benchmark processes."""
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
from zoneinfo import ZoneInfo
import run as r

H=r.HERE
m=r.verify()
assert r.read(H/'audit.json')['status']=='A_B_FORMAL_PASS'
assert r.read(H/'independent_audit.json')['status']=='INDEPENDENT_A_B_AUDIT_PASS'
analysis=r.read(H/'diagnostics/C_profile_analysis.json')
rows=analysis['rows'];assert len(rows)==4
identity=r.read(H/'diagnostics/C_profile_source_identity.json')
src=Path(identity['diagnostic_script']).read_bytes()
assert r.sha(identity['diagnostic_script'])==identity['diagnostic_script_sha256']
assert src.count(r.target_bytes())==1
assert src.count((r.UP/'richards.js').read_bytes())==1
assert src.count((r.UP/'base.js').read_bytes())==1
assert hashlib.sha256(r.target_bytes()).hexdigest()==m['original_function_sha256']
source_lines=src.decode().splitlines()
target_line=source_lines[identity['target_line_zero_based']]
# Actual V8 column is the parameter-list opening, not the `function` keyword.
assert target_line.index('(',target_line.index('function'))==56
for row in rows:
    assert row['N']==2048 and row['target_samples']>0 and row['target_children']==[]
    assert row['target_callFrame']['url']==identity['diagnostic_script']
    assert row['target_callFrame']['lineNumber']==identity['target_line_zero_based']
    assert 0<row['target_weighted_interior_fraction']<1
    tag=row['run'];rec=r.read(H/'raw/C'/('api_on_'+tag+'.json'))
    _,valid=r.payload('richards_run',rec,2048,'diagnostic');assert valid
    assert '--max-opt=0' in rec['command'] and '--no-lazy' in rec['command']
    assert '--cpu-profiler-sampling-interval='+str(row['requested_interval_us']) in rec['command']
    assert rec['LD_PRELOAD'] is None
    if tag!='interval2000':
        _,valid=r.payload('richards_run',r.read(H/'raw/C'/('api_off_'+tag+'.json')),2048,'diagnostic')
        assert valid
frequency=r.read(H/'diagnostics/function_frequency.json')['records']
assert len(frequency)==4 and all(x['calls']==10671*x['N'] for x in frequency)
main=[x for x in rows if x['run']!='interval2000']
span=lambda field:[min(x[field] for x in main),max(x[field] for x in main)]
cap=r.read(H/'raw/C/platform_capabilities.json')
assert cap['stdout'].splitlines()==['2'], 'revisit perf availability if platform output changes'
result=dict(
    formal_A_B_status='COMPLETE_240_OF_240_AUDIT_PASS',
    quickjs=dict(status='UNAVAILABLE',calls_per_Run=10671,cumulative_ms_per_Run=None,share=None,
        reasons=['no JS-function profiler exposed by frozen qjs help',
                 'existing safe samplers retain native PC/property site, not full current JS function',
                 'perf command unavailable; no root/sysctl changes or new profiler build'],
        command_evidence=['raw/C/qjs_help.json','raw/C/platform_capabilities.json'],
        source_schema='diagnostics/C_source_notes.json'),
    v8=dict(status='DIAGNOSTIC_ONLY_COARSE_JS_FRAME_SAMPLING_ESTIMATE',calls_per_Run=10671,
        exact_function_key=dict(script_sha256=identity['diagnostic_script_sha256'],
            line_zero_based=700,column_zero_based=56,original_function_sha256=m['original_function_sha256']),
        independent_processes_1000us=3,independent_processes_2000us=1,
        diagnostic_ms_per_Run_range=span('diagnostic_interval_assigned_ms_per_Run'),
        diagnostic_interval_share_range=span('target_weighted_interior_fraction'),
        confidence_interval=None,range_is_not_CI=True,
        uninstrumented_true_cumulative_ms_per_Run=None,
        sample_loss_or_throttling_count=None,
        time_basis='elapsed profile intervals labelled by endpoint JS stack; not CPU fraction times formal A wall time',
        denominator='same diagnostic profile conservative interior window; no startup/frontend or other benchmark',
        boundaries='start/end bracketed against benchNow; distinct absolute origins; rate fully attested UNKNOWN',
        caller_lookup_and_dispatch_included=False,
        GC_special='outside target ancestry, not charged to target; counts retained per run',
        helper='charged only if profiler stack retains target; exact attribution coverage UNKNOWN',
        perturbation_on_over_off_minus_1=span('profile_on_over_off_minus_1'),
        alternate_2000us=rows[-1],evidence='diagnostics/C_profile_analysis.json'),
    no_B_times_calls=True,no_claim_of_cross_engine_gap_contribution=True,
    C_disjoint_from_formal=True,C_tooling_investigation='bounded existing-capability attempt; stopped, no new VM build')
r.save(H/'C_results.json',result)
checks=[]
for engine in r.ENGINES:
    e=m['engines'][engine]
    for item in [e['binary']]+e['dependencies']+e['dynamic_libraries']+m['adapters'][engine]:
        checks.append(dict(path=item['path'],expected=item['sha256'],actual=r.sha(item['path']),valid=True))
for path,expected in m['inputs'].items():
    checks.append(dict(path=path,expected=expected,actual=r.sha(r.ROOT/path),valid=True))
r.save(H/'final_artifact_check.json',dict(status='PASS',all_frozen_runtime_dependency_adapter_and_old_input_hashes_unchanged=True,checks=checks))
dates={};boots={}
for group,paths in [('formal',sorted((H/'raw/formal').glob('*.json'))),
                    ('C',sorted((H/'raw/C').glob('api_*rep*.json'))+list((H/'raw/C').glob('api_on_interval2000.json')))]:
    records=[r.read(p) for p in paths]
    stamps=[datetime.fromisoformat(x['timestamp_utc']).astimezone(ZoneInfo('Asia/Shanghai')).isoformat() for x in records]
    dates[group]=dict(first_local=min(stamps),last_local=max(stamps),timezone='Asia/Shanghai')
    boots[group]=sorted({x['boot_id'] for x in records})
assert len(boots['formal'])==1
for name in ('README.md','results.md','ppt_summary.md','summary.csv','manifest.json','run.py','check_results.py',
             'profiling.py','analyze_profiles.py','C_results.json','final_artifact_check.json'):
    assert (H/name).is_file(),name
completion=dict(status='COMPLETE_A_B_WITH_PARTIAL_C_DIAGNOSTIC',formal_valid=240,formal_expected=240,
    A_B_independent_audit='PASS',C_status={'quickjs':result['quickjs']['status'],'v8':result['v8']['status']},
    frozen_artifacts_after_C='PASS',target_and_upstream_original_bytes_in_C=True,
    formal_trace_profile_flags=False,formal_workload_warmup=False,
    sampling_loss_or_throttle='UNKNOWN',exact_C_time_and_cross_engine_C_comparison='UNAVAILABLE',
    dates=dates,boot_ids=boots,C_boots_not_pooled_with_A_B=True,
    output_hashes={name:r.sha(H/name) for name in ('summary.csv','bootstrap.json','results.md','ppt_summary.md',
        'manifest.json','run.py','check_results.py','profiling.py','analyze_profiles.py','C_results.json')})
r.save(H/'completion.json',completion)
print(json.dumps(completion,ensure_ascii=False,indent=2))
