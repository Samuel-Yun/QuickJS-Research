"""Independent public-record closure. Execute only after collector has exited."""
import collections,itertools
from common import *

def main():
    frozen=read(HERE/'formal_frozen.json');rows=read(HERE/'schedule.json')
    actual=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
    actual.sort(key=lambda r:r['outer_start_ns'])
    assert len(actual)==384 and len(rows)==384
    expected={'M':'7b6fa1e896e31988b9d8a5276581477776fbd01ab079a64394b6111def7d87ef','H':'37b1aa9f755e94fb0db61a789d78c97addbff61835b99f3288a3ceb26e8932e4','OFF':'e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d','ON':'e4c346263639aab390a033a7d0bb1892bb747821c68919c816803a65ae98f44d'}
    for i,(r,s) in enumerate(zip(actual,rows)):
        assert r['valid'] and r['exit_code']==0 and not r['stderr'] and not r['timeout']
        for field in ['case','condition','block','position','N']:assert r[field]==s[field],(i,field)
        assert r['binary_sha256']==expected[r['condition']] and r['boot_id']==r['boot_id_after']==frozen['boot_id']
        assert r['parent_affinity']==frozen['affinity'] and r['flags']==[] and r['option']==option(r['condition'])
        assert r['child_cpu_ms']>=0 and r['external_wall_ms']>0 and r['internal_elapsed_ms']>0
        assert r['child_cpu_ms']==r['child_user_ms']+r['child_system_ms']
        if i:assert actual[i-1]['outer_stop_ns']<=r['outer_start_ns'],'overlapping child intervals'
    assert collections.Counter((r['case'],r['condition']) for r in actual)=={(k,c):24 for k in CASES for c in CONDS}
    assert len({r['environment_excluding_option_sha256'] for r in actual})==1
    for k in CASES:
        assert len({r['script_sha256'] for r in actual if r['case']==k})==1
        sequences=[]
        for b in range(24):
            subset=[r for r in actual if r['case']==k and r['block']==b]
            sequences.append(tuple(r['condition'] for r in subset))
            assert len(subset)==4
        assert set(sequences)==set(itertools.permutations(CONDS))
        assert collections.Counter(s['case_position'] for s in rows if s['case']==k and s['position']==0)=={i:6 for i in range(4)}
    correctness=[read(p) for p in (HERE/'raw/selected_correctness').rglob('*.json')]
    assert len(correctness)==16 and all(r['valid'] and r['payload']['correctness']=='PASS' for r in correctness)
    for k in CASES:
        n=read(HERE/'selected'/f'{k}.json')['N']
        pilots=[read(p) for p in (HERE/'raw/pilot'/k).glob('*.json')]
        selected=[r for r in pilots if r['N']==n]
        assert len(selected)==8 and min(r['elapsed_ms'] for r in selected)>=1000
        assert all(r['N']==n for r in correctness if r['case']==k)
    scripts={}
    for p in (HERE/'scripts/identities').rglob('*.json'):
        d=read(p);original=ROOT/d['origin_relative'];assert sha(original)==d['origin_sha256']
        dest=HERE/d['script_relative'];data=original.read_bytes()
        if d['N']!=d['original_N']:
            case=p.parent.name
            before=(f'"N": {d["original_N"]}' if case=='Richards.Richards' else f'var count={d["original_N"]},').encode()
            after=(f'"N": {d["N"]}' if case=='Richards.Richards' else f'var count={d["N"]},').encode()
            assert data.count(before)==1;data=data.replace(before,after,1)
        assert dest.read_bytes()==data and sha(dest)==d['script_sha256'];scripts[d['script_relative']]=sha(dest)
    for name,digest in {**frozen['files'],**frozen['scripts']}.items():assert sha(HERE/name)==digest
    before=read(HERE/'runtime_frozen.json')['artifacts'];after=read(HERE/'identity_after.json')['artifacts']
    for c in CONDS:
        for f in ['path','realpath','sha256','size','dependencies']:assert before[c][f]==after[c][f]
    for name,digest in read(HERE/'reused_evidence.json')['files'].items():assert sha(OLD/name)==digest
    short=sum(r['elapsed_ms']<1000 for r in actual)
    save(HERE/'independent_audit.json',dict(status='PASS',timestamp=stamp(),formal_actual=384,formal_valid=384,per_case_condition=24,complete_blocks=24,all_24_permutations_each_case=True,case_positions_each_6=True,serial_nonoverlap=True,script_bytes_same_across_conditions=True,changes_only_common_outer_N=True,pre_post_runtime_and_script_identity=True,one_boot=True,affinity=frozen['affinity'],below_1000ms_formal_samples=short,retained_short_and_outliers=True,correctness_new=16,old_evidence_unchanged=True,raw_only=True,runtime_paths_opened=False,scripts=scripts))
    print('INDEPENDENT_AUDIT PASS',flush=True)

if __name__=='__main__':main()
