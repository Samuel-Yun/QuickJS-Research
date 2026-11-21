"""Check the narrow source change, fresh processes and measured evidence."""
import json
from pathlib import Path
import re
import statistics
import subprocess

from build import HERE,PARENT,sha,save
from run import verify,N,REPEATS

def load(path):return json.loads(Path(path).read_text())
def events(phase):return [json.loads(s) for s in (HERE/'raw'/phase/'runs.jsonl').read_text().splitlines()]
def main():
    verify()
    manifests={k:load(HERE/(k+'.manifest.json')) for k in ['NORMAL','BYPASS','COUNTS']}
    parent=load(PARENT/'release.manifest.json')
    assert manifests['NORMAL']['sources']==parent['sources']
    assert (HERE/'NORMAL.patch').read_bytes()==b''
    a=manifests['NORMAL']['sources'];b=manifests['BYPASS']['sources']
    assert a.keys()==b.keys()
    changed=[n for n in a if a[n]!=b[n]];assert changed==['quickjs.c']
    normal=(HERE/'work/NORMAL/quickjs.c').read_text()
    bypass=(HERE/'work/BYPASS/quickjs.c').read_text()
    def parts(q):
        start=q.index('        CASE(OP_four_ctor):');end=q.index('        CASE(OP_call_constructor):',start)
        return q[:start],q[start:end],q[end:]
    x,y=parts(normal),parts(bypass)
    assert x[0]==y[0] and x[2]==y[2]
    assert all(s not in y[1] for s in ['four_ctor_try','four_ctor_slow_eligible','four_ctor_learn','sparse_remember'])
    assert y[1].count('JS_CallConstructorInternal(')==1
    assert 'FourSite*s=&b->four_sites[get_u16(pc)]' in y[1]
    for label in ['NORMAL','BYPASS','COUNTS']:
        f=(HERE/'work'/label/'four_runtime.inc').read_text()
        assert f[:f.index('static inline __exception')]==(HERE/'work/NORMAL/four_runtime.inc').read_text().split('static inline __exception')[0]
    for label in ['NORMAL','BYPASS']:
        nm=subprocess.check_output(['nm','-a',manifests[label]['elf']],text=True)
        assert not re.search(r'\b(?:mc_four|mc_recipe|mc_report|four_active|follow_stats)\b',nm)
    count_symbols=subprocess.check_output(['nm','-a',manifests['COUNTS']['elf']],text=True)
    assert re.search(r'\bmc_four\b',count_symbols)
    timed=events('measure');samples=[r for r in timed if r['event']=='sample']
    started=[r for r in timed if r['event']=='process_start'];done=[r for r in timed if r['event']=='process_result']
    assert len(samples)==len(started)==len(done)==2*REPEATS
    assert len({r['child_pid'] for r in done})==len(done)
    assert all(r['valid'] and r['iterations']==N and r['payload']['checksum']==3*N for r in samples)
    assert all(r['label'] in ['NORMAL','BYPASS'] for r in samples)
    assert all(r['exit_code']==0 and not r['stderr'] and not r['timeout'] for r in done)
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(done,done[1:]))
    expected=[k for i in range(REPEATS) for k in (['NORMAL','BYPASS'] if i%2==0 else ['BYPASS','NORMAL'])]
    assert [r['label'] for r in samples]==expected
    protocol=load(HERE/'raw/measure/protocol.json')
    assert protocol['script_sha256']==sha(HERE/'ctor.js')
    assert protocol['CPU']==2 and protocol['warmup_calls']==0
    count_rows=[r for r in events('counts') if r['event']=='sample']
    assert len(count_rows)==1 and count_rows[0]['label']=='COUNTS'
    c=count_rows[0]['counts'];assert c['four'][0]==N and c['four'][1]==0
    assert c['normal_constructions']==N and c['four'][3]==N-1
    assert sum(c['recipe'])==2*N-1
    result=load(HERE/'analysis/data.json')
    for row in result['timing']:
        values=[r['elapsed_ms'] for r in samples if r['label']==row['label']]
        assert row['median_ms']==statistics.median(values)
        assert row['min_ms']==min(values) and row['max_ms']==max(values)
    assert load(HERE/'gate.json')['status']=='PASS'
    save(HERE/'audit.json',dict(status='PASS',normal_sources_identical_to_frozen_SPARSE=True,
        Release_source_change='only OP_four_ctor handler in quickjs.c',
        record_and_opcode_preparation_unchanged=True,other_optimizations_unchanged=True,
        cache_policy_unchanged_in_normal=True,JS_bytes_identical_between_all_conditions=True,
        fresh_Release_processes=len(done),processes_per_condition=REPEATS,
        all_samples_retained=True,timing_has_no_counters=True,independent_counter_processes=1,
        single_new_site=dict(function='ctorLoop',pc=c['pc'],argc=c['argc']),
        measured_diagnostic_hit_percent=0.0,full_benchmarks_run=False,
        artifacts={n:sha(HERE/n) for n in ['ctor.js','BYPASS.patch','COUNTS.patch','results.md',
            'analysis/samples.csv','analysis/summary.csv','analysis/work_counts.csv','analysis/data.json']}))
    print('AUDIT_PASS',flush=True)
if __name__=='__main__':main()
