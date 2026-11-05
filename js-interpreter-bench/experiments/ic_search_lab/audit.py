"""Small offline check. No Linux/binary launch, private input or old home path."""
import csv,difflib,hashlib,io,json,tarfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):
    data=(json.dumps(d,ensure_ascii=False,indent=2)+'\n').encode()
    if p.exists():assert p.read_bytes()==data;return
    with p.open('xb') as f:f.write(data)
def main():
    runs=[json.loads(x) for x in (HERE/'runs.jsonl').read_text(encoding='utf-8').splitlines() if x]
    starts={};ends={}
    for row in runs:
        if row['event']=='process_start':assert row['token'] not in starts;starts[row['token']]=row
        elif row['event']=='process_result':assert row['token'] not in ends;ends[row['token']]=row
    assert set(ends)<=set(starts)
    for token,r in ends.items():
        assert r['command']==starts[token]['command'] and r['boot_id']==starts[token]['boot_id']
        assert r['outer_stop_ns']>=r['outer_start_ns']
    smokes=[r for r in ends.values() if r['stage']=='bounded_smoke']
    assert len(smokes)==8 and all(r['exit_code']==0 and not r['stderr'] and r['stdout']=='SMOKE_PASS:83988480000\n' and r['boot_id']==r['boot_id_after'] for r in smokes)
    orphan=[r for token,r in starts.items() if token not in ends]
    assert len(orphan)==1 and orphan[0]['stage']=='build' and orphan[0]['label']=='c001'
    ws=load(HERE/'workspace.json');assert sha(HERE/'seed_M.tar.gz')==ws['seed_archive_sha256']
    changed=[];patch=[]
    with tarfile.open(HERE/'seed_M.tar.gz','r:gz') as archive:
        assert set(m.name for m in archive.getmembers())==set(ws['source_files'])
        for name,h in ws['source_files'].items():
            assert '/' not in name and '\\' not in name
            original=archive.extractfile(name).read();assert hashlib.sha256(original).hexdigest()==h
            current=(HERE/'active'/name).read_bytes()
            if original!=current:
                changed.append(name);patch.extend(difflib.unified_diff(original.decode().splitlines(True),current.decode().splitlines(True),fromfile='a/'+name,tofile='b/'+name))
    assert changed==['read_ic_runtime.inc']
    assert ''.join(patch).encode()==(HERE/'patches/c001.patch').read_bytes()
    assert sha(HERE/'patches/c001.patch')=='b3627ebdda14987031dbd8e52500bfa789403d67cf36455bdb1bb00fe8c22f82'
    artifacts={}
    for label,r in ws['artifacts'].items():
        p=HERE/'artifacts'/(label+'.qjs');artifacts[label]=sha(p)==r['sha256'];assert artifacts[label]
    assert not (HERE/'artifacts/c001.qjs').exists() and not (HERE/'c001.json').exists()
    candidates=list(csv.DictReader((HERE/'candidates.csv').open(encoding='utf-8',newline='')))
    assert candidates[0]['status']=='BLOCKED_EXECUTION' and all(c['status']=='PLANNED' for c in candidates[1:])
    performance=[r for r in ends.values() if r.get('performance_sample')]
    assert not performance
    result=dict(status='BLOCKED_EXECUTION',start_commit='f191a09a21be9a672f2c4ac06ddbe9d11b483a77',branch='myx',
       bounded_smoke_valid=8,process_starts=len(starts),process_completions=len(ends),uncompleted_positions=orphan,
       candidates_planned=8,candidates_source_modified=1,candidates_built=0,candidates_correctness_passed=0,
       sunspider_initial_samples=0,sunspider_recheck_samples=0,octane_coarse_samples=0,formal_samples=0,
       independent_validation_samples=0,reliable_improvement=None,
       search_conclusion='Search did not find a validated improvement; candidate execution was blocked before screening, not a negative performance result.',
       patch_matches_active_source=True,changed_seed_files=changed,seed_archive_integrity=True,A_M_copies_byte_identical=artifacts,
       old_source_and_results_modified=False,private_material_used=False,root_cause='UNKNOWN',
       host_post_observation=load(HERE/'host_observation.json'))
    save(HERE/'audit.json',result)
    print(json.dumps({k:result[k] for k in ['status','bounded_smoke_valid','process_starts','process_completions','candidates_built','formal_samples']},ensure_ascii=True))
if __name__=='__main__':main()
