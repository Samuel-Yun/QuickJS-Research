"""Audit the two-miss policy, unchanged workloads and independent evidence."""
import json
from pathlib import Path
import re
import statistics
import subprocess

from build import HERE,PREV,LABELS,sha,save
from run import verify,manifest,PATTERNS,N,REPEATS

def load(p):return json.loads(Path(p).read_text())
def events(phase):return [json.loads(s) for s in (HERE/'raw'/phase/'runs.jsonl').read_text().splitlines()]
def main():
    verify();normal=manifest('NORMAL','release');twice=manifest('TWICE','release')
    assert normal['sources']==load(PREV/'NORMAL.release.manifest.json')['sources']
    assert manifest('KEEP_PLAN','release')['sources']==load(PREV/'KEEP_PLAN.release.manifest.json')['sources']
    assert {n for n,h in normal['sources'].items() if h!=twice['sources'][n]}=={'quickjs.c','four_runtime.inc'}
    def split(q):
        a=q.index('        CASE(OP_four_ctor):');b=q.index('        CASE(OP_call_constructor):',a)
        return q[:a],q[a:b],q[b:]
    nq=(Path(normal['elf']).parent/'quickjs.c').read_text()
    tq=(Path(twice['elf']).parent/'quickjs.c').read_text()
    x,y=split(nq),split(tq);assert x[0]==y[0] and x[2]==y[2]
    assert 'int fast=four_ctor_try(ctx,s,' in y[1]
    assert y[1].index('if(fast)')<y[1].index('int skip_learning=0')<y[1].index('if(s->plan')
    assert 'if(s->identity_misses){s->identity_misses=0;}' in y[1]
    nf=(Path(normal['elf']).parent/'four_runtime.inc').read_text()
    tf=(Path(twice['elf']).parent/'four_runtime.inc').read_text()
    restored=tf.replace('    uint8_t identity_misses; /* existing tail padding: offset 30, still 32 B */\n','')
    restored=restored.replace('_Static_assert(sizeof(FourSite)==32 && offsetof(FourSite,identity_misses)==30,"site layout unchanged");\n','')
    restored=restored.replace('\n    if(slot->identity_misses){slot->identity_misses=0;}','')
    assert restored==nf
    for label in LABELS:
        m=manifest(label,'release')
        symbols=subprocess.check_output(['nm','-a',m['elf']],text=True)
        assert not re.search(r'\b(?:mc_calls|mc_four|mc_report|four_active|follow_stats)\b',symbols)
    assembly=load(HERE/'assembly/verification.json')
    assert assembly['conditional_store'] and assembly['binary_sha256']==twice['elf_sha256']
    samples=[r for r in events('measure') if r['event']=='sample']
    processes=[r for r in events('measure') if r['event']=='process_result']
    assert len(samples)==len(processes)==45
    assert len({r['child_pid'] for r in processes})==45
    assert all(r['exit_code']==0 and not r['timeout'] and not r['stderr'] for r in processes)
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(processes,processes[1:]))
    assert all(r['valid'] and r['mode']=='release' and r['iterations']==N and r['payload']['checksum']==3*N for r in samples)
    protocol=load(HERE/'raw/measure/protocol.json')
    assert [(r['pattern'],r['label'],r['rep']) for r in samples]==[(r['pattern'],r['label'],r['rep']) for r in protocol['schedule']]
    for p,h in protocol['frozen'].items():assert sha(p)==h
    diagnostic=[r for r in events('counts') if r['event']=='sample'];assert len(diagnostic)==9
    for r in diagnostic:
        c=r['counts'];assert c['total_calls']==N==c['four'][1]+c['normal_constructions']
        assert c['pc']==18 and c['site_count']==1
        if r['label']=='TWICE':
            assert c['four'][0]==N
            if r['pattern']=='alternating':
                assert c['four'][3]==1 and c['four'][1]==N//2-1 and c['threshold_allows']==0
                assert sum(c['recipe'])==3 and c['hit_reset_writes']==N//2-1
            elif r['pattern']=='all_c':
                assert c['four'][3]==1 and c['four'][1]==N-2
                assert c['hit_reset_writes']==c['other_reset_writes']==c['increment_writes']==c['learning_reset_writes']==0
            else:
                assert c['four'][3]==2 and c['four'][1]==N-4
                assert c['first_update'][1]==2 and c['first_hit'][1]==3
                assert c['phase_D_four'][3]==1 and c['phase_normal'][1]==2
                assert c['trace_D_before'][:3]==[0,1,0] and c['trace_D_after'][:3]==[1,0,0]
                assert c['trace_D_flags'][:3]==[10,22,1]
        elif r['label']=='KEEP_PLAN':assert c['four'][3]==1
        elif r['pattern']=='alternating':assert c['four'][1]==0 and c['four'][3]==N-1
    policy=load(HERE/'policy_gate.json');assert policy['status']=='PASS'
    assert policy['counts']['TWICE']['other_reset_writes']==1
    assert policy['counts']['TWICE']['first_hit'][1]==4
    result=load(HERE/'analysis/data.json')
    for r in result['summary']:
        v=[s['elapsed_ms'] for s in samples if s['pattern']==r['pattern'] and s['label']==r['label']]
        assert len(v)==REPEATS and statistics.median(v)==r['median_ms']
        assert min(v)==r['min_ms'] and max(v)==r['max_ms']
    assert load(HERE/'gate.json')['status']=='PASS'
    save(HERE/'audit.json',dict(status='PASS',independent_from_original_SPARSE=True,
        source_changes=['quickjs.c: OP_four_ctor','four_runtime.inc: one padding byte and learning reset'],
        extra_slots=0,site_bytes=32,full_plan_bytes=96,counter_offset=30,
        same_target_other_guard_failure_keeps_original_behavior=True,
        hit_zero_does_not_store_verified_in_Release_assembly=True,
        alternating_positive_updates=1,D_first_learn_call=2,D_first_hit_call=3,
        fresh_Release_processes=45,independent_diagnostic_processes=9,all_samples_retained=True,
        no_benchmark_algorithm_changes=True,full_benchmarks_run=False,
        artifacts={n:sha(HERE/n) for n in ['TWICE.release.patch','ctor.js','switch.js','policy_probe.js',
            'results.md','analysis/summary.csv','analysis/samples.csv','analysis/counts.csv',
            'analysis/switch_phases.csv','analysis/switch_trace.csv','assembly/hit_reset.txt']}))
    print('AUDIT_PASS',flush=True)
if __name__=='__main__':main()
