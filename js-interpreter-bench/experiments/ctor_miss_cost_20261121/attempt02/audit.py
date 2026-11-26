"""Audit source scope, independent counters, three patterns and all samples."""
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
    verify();normal=manifest('NORMAL','release');keep=manifest('KEEP_PLAN','release')
    assert normal['sources']==load(PREV/'NORMAL.manifest.json')['sources']
    bypass=manifest('BYPASS','release');old_bypass=load(PREV/'BYPASS.manifest.json')
    assert bypass['sources']==old_bypass['sources']
    if bypass.get('reused_from'):assert bypass['elf_sha256']==old_bypass['elf_sha256']
    assert normal['sources'].keys()==keep['sources'].keys()
    assert [n for n,h in normal['sources'].items() if h!=keep['sources'][n]]==['quickjs.c']
    q=Path(normal['elf']).parent/'quickjs.c';r=Path(keep['elf']).parent/'quickjs.c'
    def split(p):
        s=p.read_text();a=s.index('        CASE(OP_four_ctor):');b=s.index('        CASE(OP_call_constructor):',a)
        return s[:a],s[a:b],s[b:]
    x,y=split(q),split(r);assert x[0]==y[0] and x[2]==y[2]
    assert all(s in y[1] for s in ['int fast=different?0:four_ctor_try','int eligible=different?0:four_ctor_slow_eligible','if(!different){'])
    for label in LABELS:
        release=manifest(label,'release');counts=manifest(label,'counts')
        names=subprocess.check_output(['nm','-a',release['elf']],text=True)
        assert not re.search(r'\b(?:mc_calls|mc_four|mc_report|follow_stats|four_active)\b',names)
        names=subprocess.check_output(['nm','-a',counts['elf']],text=True);assert re.search(r'\bmc_calls\b',names)
        a=(Path(release['elf']).parent/'four_runtime.inc').read_text().split('static inline __exception')[0]
        b=(Path(counts['elf']).parent/'four_runtime.inc').read_text().split('static inline __exception')[0]
        assert a==b
    timed=events('measure');samples=[r for r in timed if r['event']=='sample']
    done=[r for r in timed if r['event']=='process_result']
    assert len(samples)==len(done)==45
    assert len({r['child_pid'] for r in done})==45
    assert all(r['exit_code']==0 and not r['timeout'] and not r['stderr'] for r in done)
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(done,done[1:]))
    assert all(r['valid'] and r['mode']=='release' and r['iterations']==N and r['payload']['checksum']==3*N for r in samples)
    protocol=load(HERE/'raw/measure/protocol.json')
    assert [(s['pattern'],s['label'],s['rep']) for s in samples]==[(s['pattern'],s['label'],s['rep']) for s in protocol['schedule']]
    for p,h in protocol['frozen'].items():assert sha(p)==h
    diagnostic=[r for r in events('counts') if r['event']=='sample'];assert len(diagnostic)==9
    for row in diagnostic:
        c=row['counts'];assert row['valid'] and c['total_calls']==N==c['four'][1]+c['normal_constructions']
        assert c['pc']==18 and c['site_count']==1
        if row['label']=='BYPASS':assert c['four'][1]==c['four'][3]==0
        elif row['label']=='KEEP_PLAN':
            assert c['four'][3]==1
            assert c['four'][0]+c['identity_bypasses']==N
            if row['pattern']=='all_c':assert c['four'][1]==N-2 and c['identity_bypasses']==0
            elif row['pattern']=='alternating':assert c['four'][1]==N//2-1 and c['phase_D_four'][3]==1
            else:
                assert c['phase_D_four'][1]==c['phase_D_four'][3]==0
                assert c['phase_normal'][1]==N//2
        elif row['pattern']=='alternating':assert c['four'][1]==0 and c['four'][3]==N-1
        elif row['pattern']=='all_c':assert c['four'][1]==N-2 and c['four'][3]==1
        else:assert c['four'][3]==2 and c['phase_D_four'][3]==1
    result=load(HERE/'analysis/data.json')
    assert len(result['summary'])==9 and len(result['switch_phases'])==6
    for row in result['summary']:
        vals=[s['elapsed_ms'] for s in samples if s['pattern']==row['pattern'] and s['label']==row['label']]
        assert len(vals)==REPEATS and statistics.median(vals)==row['median_ms']
        assert min(vals)==row['min_ms'] and max(vals)==row['max_ms']
    assert load(HERE/'gate.json')['status']=='PASS'
    save(HERE/'audit.json',dict(status='PASS',Release_change='only OP_four_ctor handler in quickjs.c',
        helper_functions_and_record_layout_unchanged=True,same_target_old_path_preserved=True,
        semantic_tests='target switches, setter/read-only/prototype changes, exceptions and non-object target',
        alternating_JS_identical_to_previous=True,all_C_uses_previous_script=True,
        switch_uses_identical_ctorLoop=True,switch_is_one_C_block_then_one_D_block=True,
        total_calls_per_input=N,fresh_Release_processes=45,processes_per_cell=5,
        diagnostic_processes=9,diagnostics_excluded_from_time=True,all_samples_retained=True,
        full_benchmarks_run=False,artifacts={n:sha(HERE/n) for n in [
            'KEEP_PLAN.release.patch','ctor.js','switch.js','semantics.js','results.md',
            'analysis/samples.csv','analysis/summary.csv','analysis/switch_phases.csv','analysis/counts.csv']}))
    print('AUDIT_PASS',flush=True)
if __name__=='__main__':main()
