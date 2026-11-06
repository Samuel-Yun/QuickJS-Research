"""Raw-position and portable identity-consistency audit, separate from stats."""
import collections
import gzip
import hashlib
import json
import os
from pathlib import Path

H = Path(__file__).resolve().parent


def rows():
    if (H/'runs.jsonl').exists() and os.environ.get('STRUCTURAL_ARCHIVE_ONLY')!='1':
        return [json.loads(x) for x in (H/'runs.jsonl').read_text(encoding='utf-8').splitlines()]
    with gzip.open(H/'runs.jsonl.gz','rt',encoding='utf-8') as stream:
        return [json.loads(x) for x in stream]


def audit():
    data=rows()
    starts={}
    ends={}
    for r in data:
        if r['event'] in ['process_start','process_result']:
            target=starts if r['event']=='process_start' else ends
            assert r['token'] not in target
            target[r['token']]=r
    measurements=[r for r in data if r['event']=='measurement']
    campaigns={}
    for campaign in sorted({r['campaign'] for r in measurements}):
        subset=[r for r in measurements if r['campaign']==campaign]
        keys=[(r['case'],r['condition'],r['rep']) for r in subset]
        assert len(keys)==len(set(keys)),('duplicate',campaign)
        for r in subset:
            process=ends[r['process_token']]
            identity=r['identity']
            assert identity==process['identity'] or all(process['identity'].get(k)==v for k,v in identity.items())
            assert r['exit_code']==process['exit_code']==0 and not process['stderr']
            assert r['boot_id']==r['boot_id_after']
            art=json.loads((H/'identities'/(r['condition']+'.json')).read_text(encoding='utf-8'))
            assert identity['binary_sha256']==art['sha256']
            assert identity['warmup_calls']==0
            assert identity['flags']==(['--std','-I',identity['flags'][2]] if r['case']=='zlib.zlib' else [])
        script_groups=collections.defaultdict(set)
        for r in subset:
            script_groups[r['case'],r['N']].add(r['identity']['script_sha256'])
        assert all(len(v)==1 for v in script_groups.values())
        p=H/(campaign+'.protocol.json')
        expected=None
        balanced=None
        if p.exists():
            protocol=json.loads(p.read_text(encoding='utf-8'))
            info=json.loads((H/(protocol['kind']+'.inputs.json')).read_text(encoding='utf-8'))
            expected=len(info['cases'])*len(protocol['labels'])*protocol['rounds']
            if campaign in ['recovery.v5.octane','sun.v5.sunspider'] and len(subset)==expected:
                positions=collections.defaultdict(collections.Counter)
                for r in subset:positions[r['case'],r['condition']][r['order']]+=1
                balanced=all(len(v)==len(protocol['labels']) and len(set(v.values()))==1 for v in positions.values())
                assert balanced
        status='COMPLETE' if expected is not None and expected==len(subset) else 'PARTIAL_OR_CONTROL'
        if campaign=='independent.v5.octane':status='INVALID_ENVIRONMENT_DISCONTINUITY_PARTIAL'
        if campaign=='screen12.d05.octane':status='BLOCKED_TIMING_ENVIRONMENT_PARTIAL'
        campaigns[campaign]=dict(actual=len(subset),valid_numeric=sum(r['valid'] for r in subset),expected=expected,
            status=status,exact_position_balance=balanced,boot_ids=sorted({r['boot_id'] for r in subset}),duplicates=0,
            script_identical_per_case_N=True,identity_consistency=True)
    historical=json.loads((H/'historical_raw_before.json').read_text(encoding='utf-8'))
    preserved={n:(hashlib.sha256((H/n).read_bytes()).hexdigest()==sha if (H/n).exists() else 'MISSING')
               for n,sha in historical.items()}
    assert all(value is not False for value in preserved.values())
    result=dict(status='PASS_COMPLETED_CAMPAIGNS_WITH_DISCLOSED_INTERRUPTED_BATCH',campaigns=campaigns,
        total_measurements=len(measurements),missing_process_results=sorted(set(starts)-set(ends)),
        historical_raw_preserved=preserved,
        note='Numeric valid does not override environment invalidation. Artifact byte verification is a separate Linux identity gate.')
    (H/'audit.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    print(json.dumps(result,indent=2))


if __name__=='__main__':audit()
