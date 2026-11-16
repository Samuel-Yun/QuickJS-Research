"""Preserve LSan startup failure; finish with ASan/UBSan and no leak claim."""
import gzip
import hashlib
import json
import os
from pathlib import Path
import run as r


def main():
    b=r.b;h=r.H;r.verify();os.sched_setaffinity(0,{2})
    prior=b.records();failures=[x for x in prior if x['event']=='process_result' and x['exit_code']!=0]
    assert len(failures)==1
    failure=failures[0]
    assert failure['token']=='build/sanitized' and 'LeakSanitizer has encountered a fatal error' in failure['stderr']
    assert not any(x['event']=='measurement' for x in prior)
    b.save('sanitizer_environment_issue.json',dict(failed_token=failure['token'],exit_code=failure['exit_code'],
        reason='LeakSanitizer startup failed; diagnostic mentions ptrace restriction, exact sandbox mechanism not independently proven',
        stdout=failure['stdout'],stderr=failure['stderr'],resolution='disable leak detection only; preserve ASan and UBSan',
        leak_sanitizer_validated=False,new_performance_samples_before_repair=0,
        frozen_combination_runner_changed=False,followup_sha256=b.sha(Path(__file__))))
    env=['env','ASAN_OPTIONS=detect_leaks=0:abort_on_error=1','UBSAN_OPTIONS=halt_on_error=1:print_stacktrace=1']
    sanitized=h/'work/sanitized'
    r.checked([*env,'make','-j1','CONFIG_ASAN=y','CONFIG_UBSAN=y','qjs','qjsc'],'build','sanitized_lsan_disabled',sanitized,300)
    checks=[dict(name=x['token'],token=x['token']) for x in prior if x['event']=='process_result' and x['token'].split('/')[0] in ['semantic','safety_run','embed_run']]
    for test in [h/'combined.js',r.LAB/'v6_targeted_ic/targeted.js',r.LAB/'v3_mass_search/semantic.js']:
        result=r.checked([*env,sanitized/'qjs','--std',test],'sanitizer_followup',test.name,timeout=90)
        checks.append(dict(name='ASan/UBSan '+test.name,token=result['token']))
    source=h/'work'/r.LABEL
    for name,want in b.load(h/'source_manifest.json')['files'].items():assert b.sha(source/name)==want,name
    b.save('safety_gate.json',dict(status='PASS_TARGETED',checks=checks,serialization_and_qjsc=True,
        sanitizers=True,ASan=True,UBSan=True,LSan=False,leak_validation='UNAVAILABLE_IN_CURRENT_EXECUTION_ENVIRONMENT',
        mechanism=b.load(h/'mechanism.json'),full_test262=False))
    print('SAFETY_PASS_ASAN_UBSAN_LSAN_UNAVAILABLE',flush=True)
    b.correctness();b.measure();r.analyze()
    rows=b.records();starts={x['token']:x for x in rows if x['event']=='process_start'};ends={x['token']:x for x in rows if x['event']=='process_result'}
    assert starts.keys()==ends.keys()
    for token,x in ends.items():
        assert starts[token]['command']==x['command'] and not x['timeout']
        assert x['boot_id']==x['boot_id_after']==b.load(h/'environment.before.json')['boot_id']
        if token==failure['token']:assert x==failure
        else:assert x['exit_code']==0,token
    intervals=sorted(ends.values(),key=lambda x:x['outer_start_ns'])
    assert all(a['outer_stop_ns']<=z['outer_start_ns'] for a,z in zip(intervals,intervals[1:]))
    samples=[x for x in rows if x['event']=='measurement']
    assert len(samples)==85 and all(x['valid'] and x['condition']==r.LABEL for x in samples)
    assert [dict(rep=x['rep'],case=x['case'],condition=x['condition'],order=x['order']) for x in samples]==b.schedule()
    oldbins={x['path'] for x in b.load(r.OLD/'runtime_manifest.json').values()}
    assert all(x['command'][0] not in oldbins for x in ends.values())
    r.verify()
    b.save('audit.json',dict(status='PASS_COMPLETE_WITH_LSAN_UNAVAILABLE',new_performance_samples=85,new_control_samples=0,
        all_17_cases_5_processes=True,all_sources_inputs_runtime_hashes_checked=True,serial_intervals_checked=True,
        previous_batch_controls_reused=True,SunSpider_samples=0,V8_OFF_samples=0,
        correctness_records=sum(x['event']=='correctness' for x in rows),
        below_1000ms_retained=sum(x['below_1000ms'] for x in samples),same_boot_as_previous_batch=True,
        preserved_failed_build=failure['token'],failure_does_not_affect_release_artifact=True,
        ASan=True,UBSan=True,LSan=False,
        maximum_raw_clock_disagreement_ms=max(abs(x['raw_minus_monotonic_ms']) for x in ends.values())))
    raw=(h/'runs.jsonl').read_bytes();packed=gzip.compress(raw,mtime=0)
    b.save('raw/runs.jsonl.gz',packed);b.save('raw/archive.json',dict(compressed_sha256=hashlib.sha256(packed).hexdigest(),uncompressed_sha256=hashlib.sha256(raw).hexdigest()))
    print('AUDIT_PASS_85_COMBINATION_ONLY_LSAN_UNAVAILABLE',flush=True)


if __name__=='__main__':main()
