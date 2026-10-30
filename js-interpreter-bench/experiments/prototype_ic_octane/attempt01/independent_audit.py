"""Independent closure of saved records only. No benchmark processes are started."""
import collections
from common import *
def main():
    frozen=read(HERE/'frozen.json');plan=read(HERE/'schedule.json');cases=read(HERE/'formal_cases.json')
    actual=sorted([read(p) for p in (HERE/'raw/formal').rglob('*.json')],key=lambda r:r['schedule_index'])
    seen=set();counts=collections.Counter();scriptsets=collections.defaultdict(set)
    for r in actual:
        key=r['case'],r['condition'],r['rep'];assert key not in seen;seen.add(key)
        s=plan[r['schedule_index']]
        assert all(s[k]==r[k] for k in ['case','condition','rep','N','order'])
        assert r['boot_id']==r['boot_id_after']==frozen['boot_id'] and r['affinity']==frozen['affinity']
        assert r['option']==('0' if r['condition']=='OFF' else '1')
        counts[r['case'],r['condition']]+=1;scriptsets[r['case']].add(r['script_sha256'])
    assert all(a['outer_stop_ns']<=b['outer_start_ns'] for a,b in zip(actual,actual[1:]))
    for case in cases:
        pos=collections.Counter((s['condition'],s['order']) for s in plan if s['case']==case)
        assert pos=={(c,p):6 for c in CONDITIONS for p in range(5)}
        if scriptsets[case]:assert len(scriptsets[case])==1
    assert len({r['environment_excluding_option_sha256'] for r in actual})<=1
    for p,h in frozen['files'].items():assert sha(HERE/p)==h
    ready=read(HERE/'analysis_ready.json');assert sha(HERE/'analyze.py')==ready['analyzer_sha256']
    assert ready['formal_records_at_definition']==0
    for p,h in read(HERE/'reused_evidence.json')['files'].items():assert sha(ROOT/p)==h
    before=read(HERE/'runtime.json')['artifacts'];after=read(HERE/'identity_after.json')['artifacts']
    for c in CONDITIONS:
        for key in ['path','realpath','sha256','size','dependencies']:assert before[c][key]==after[c][key]
    full=len(actual)==len(cases)*150 and all(r['valid'] for r in actual) and all(counts[k,c]==30 for k in cases for c in CONDITIONS)
    audit=dict(status='PASS' if full else 'PARTIAL',timestamp=stamp(),formal_expected=len(cases)*150,formal_actual=len(actual),formal_valid=sum(r['valid'] for r in actual),base_expected=2400,base_valid=sum(r['case'] in BASE_CASES and r['valid'] for r in actual),same_script_across_conditions=True,serial_nonoverlap=True,one_boot=True,fixed_affinity=frozen['affinity'],each_condition_each_position_six=True,claims_all120_permutations=False,pre_post_ELF_dependencies_and_scripts_identity=True,analysis_predeclared_before_formal=True,old_public_evidence_unchanged=True,raw_only=True,runtime_paths_opened=False,counts=[dict(case=k,condition=c,n=counts[k,c]) for k in cases for c in CONDITIONS])
    save(HERE/'independent_audit.json',audit);print('INDEPENDENT_AUDIT',audit['status'])
if __name__=='__main__':main()
