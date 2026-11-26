"""Final evidence/report/replay protection checks; no Git write or VM launch."""
from common import *
def main():
    assert read(HERE/'analysis/audit.json')['valid']==2160
    assert read(HERE/'analysis/completion.json')['status']=='COMPLETE'
    assert read(HERE/'analysis/post_identity.json')['status']=='PASS'
    assert read(HERE/'correctness/gate.json')['status']=='PASS'
    repaired=(HERE/'bridge_check/matched_environment/audit.json').exists()
    bridge=HERE/'bridge_check/matched_environment' if repaired else HERE/'bridge_check'
    assert read(bridge/'audit.json')['actual']==48
    bridge_rows=[read(p) for p in (bridge/'raw').glob('*.json')]
    assert len(bridge_rows)==48 and all(r['valid'] and r['environment'].get('QJS_READ_IC_MODE')=='1' for r in bridge_rows)
    archive_audit=read(HERE/'analysis'/('archives.with_bridge_repair.json' if repaired else 'archives.json'))
    assert archive_audit['status']=='PASS' and len(archive_audit['files'])==(74 if repaired else 70)
    matched_counter_equivalence=[]
    if repaired:
        for c in ['M4.numeric_control','Richards.Richards']:
            for v in ['M','SW']:
                old=read(HERE/'bridge_check/diagnostic'/f'{c}.{v}.json.gz.metadata.json');new=read(bridge/'diagnostic'/f'{c}.{v}.json.gz.metadata.json')
                assert old['original_sha256']==new['original_sha256']
                matched_counter_equivalence.append(dict(case=c,variant=v,decompressed_sha256=new['original_sha256'],initial_and_matched_counter_content_identical=True))
    replay=[read(p) for p in (HERE/'replays').glob('*/audit.json')]
    assert len(replay)>=2 and all(r['status']=='PASS' and r['original_raw_and_outputs_unchanged'] for r in replay)
    for name in ['README.md','results.md','bridge_check/results.md','ownership.md','analysis/tables.md']:assert (HERE/name).is_file(),name
    m=read(HERE/'measurement_manifest.json')
    assert all(sha(ROOT/p)==h for p,h in m['inputs'].items())
    repo=ROOT.parent
    def git(*args):return subprocess.check_output(['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),*args],text=True)
    head=git('rev-parse','HEAD').strip();branch=git('branch','--show-current').strip()
    initial=read(HERE/'origin.json')['reference_HEAD'];prefix=HERE.relative_to(repo).as_posix()+'/'
    historical=[n for n in git('diff',initial,'--name-only').splitlines() if not n.startswith(prefix)]
    files=git('ls-files','--others','--exclude-standard',HERE.relative_to(repo).as_posix()).splitlines();oversized=[n for n in files if (repo/n).stat().st_size>=50*1024*1024]
    assert not oversized and not historical,(oversized,historical)
    out=HERE/'analysis/delivery_audit.json';i=1
    while out.exists():i+=1;out=HERE/'analysis'/f'delivery_audit.{i}.json'
    save(out,dict(status='PASS',initial_HEAD=initial,HEAD=head,branch=branch,historical_tracked_changes=historical,no_oversized_public_files=True,
      formal_valid=2160,bridge_accepted=48,bridge_initial_protocol_deviation_preserved=48 if repaired else 0,bridge_mode_environment_matched=True,
      diagnostic_archives=74 if repaired else 70,portable_replays=len(replay),replay_output_counts=[len(r['outputs']) for r in replay],matched_counter_equivalence=matched_counter_equivalence,
      frozen_runtime_runner_inputs_unchanged=True,no_automatic_commit_push_branch_switch=True,checked_at=stamp()))
    print('DELIVERY_AUDIT_PASS',flush=True)
if __name__=='__main__':main()
