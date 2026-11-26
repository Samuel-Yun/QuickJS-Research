"""Independent final checks; no engine execution, build, or new samples."""
import ast,collections
from common import *
def main():
    before=read(HERE/'attempt01_identity_before.json')
    now={p.relative_to(PREVIOUS).as_posix():sha(p) for p in sorted(PREVIOUS.rglob('*'),key=lambda p:p.as_posix()) if p.is_file() and '__pycache__' not in p.parts}
    assert now==before and read(PREVIOUS/'summary/audit.json')['status']=='BLOCKED_IC_INTERVENTION'
    rows=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
    assert len(rows)==270 and all(r['valid'] and r['exit_code']==0 and not r['stderr'] for r in rows)
    groups=collections.Counter((r['case'],r['condition']) for r in rows)
    assert groups=={(case,c):30 for case in CASES for c in CONDITIONS}
    assert len({(r['case'],r['condition'],r['rep']) for r in rows})==270
    assert len(list((HERE/'raw/started/formal').rglob('*.json')))==270
    for r in rows:
        text=(HERE/r['script_relative']).read_text(encoding='utf-8')
        assert text.index('var now=__icSwitchNow;')<text.index('var start=now();')<text.index('last=run();')<text.index('var stop=now();')<text.index('console.log("IC_SWITCH_RESULT:')
        assert '--max-opt=0' not in r['command'] and not any('trace-' in s or 'allow-natives-syntax' in s for s in r['command'])
    for f in ['pre_pilot_freeze.json','analysis_freeze.json','frozen.json']:
        for p,h in read(HERE/f)['files'].items():assert sha(HERE/p)==h,p
    assert read(HERE/'replay_audit.json')['status']=='PASS'
    assert read(HERE/'summary/audit.json')['status']=='COMPLETE'
    assert read(HERE/'summary/audit.json')['OFF_direct_snapshot_verified'] is None
    assert read(HERE/'gate.json')['selected_OFF_no_cache_state_verified'] is None
    assert read(HERE/'campaign_timing.json')['pilot_selected_correctness_and_formal_span_seconds']<7200
    assert sha(ROOT.parent/'V8_IC_Resume_Materials_20261025.zip')==read(HERE/'source_verification.json')['archive_sha256']
    for p in HERE.glob('*.py'):ast.parse(p.read_text(encoding='utf-8'))
    report=(HERE/'results.md').read_text(encoding='utf-8')
    table=list(csv.DictReader((HERE/'summary/comparison.csv').open(encoding='utf-8',newline='')))
    for row in table:
        for field in ['QJS_median_ms','V8_ON_median_ms','V8_OFF_median_ms']:assert f'{float(row[field]):.6f}' in report
    files=[p for p in HERE.rglob('*') if p.is_file() and '__pycache__' not in p.parts]
    assert not any(p.suffix in {'.o','.a','.so','.exe','.zip'} for p in files)
    assert max(p.stat().st_size for p in files)<1048576
    git=['git','-c','safe.directory='+ROOT.parent.as_posix(),'-C',str(ROOT.parent)]
    def query(args):return subprocess.run(git+args,capture_output=True,text=True,check=True).stdout.strip()
    assert query(['rev-parse','HEAD'])=='0bf70fbee135b3b3ebf35040cb9cddc33e543969' and query(['branch','--show-current'])=='myx'
    assert query(['diff','--name-only'])==query(['diff','--cached','--name-only'])==''
    save(HERE/'delivery_audit.json',dict(status='PASS',experiment_status='COMPLETE',evidence_status='PASS_WITH_OBSERVABILITY_LIMITATION',formal_valid=270,formal_failed=0,attempt01_unchanged=True,attempt01_status='BLOCKED_IC_INTERVENTION',analysis_and_acquisition_code_frozen=True,two_windows_raw_replays_match_linux_published_results=True,OFF_snapshot_verified=None,artifact_build_source_commit=None,no_new_ELF_or_build_tree=True,total_delivery_files=len(files),largest_file_bytes=max(p.stat().st_size for p in files),git_HEAD=query(['rev-parse','HEAD']),branch='myx',tracked_changes=[],worktree_status=query(['status','--short']),no_automatic_commit_push=True))
    print('FINAL_DELIVERY_PASS; 270/270; prior attempt unchanged; no new performance run',flush=True)
if __name__=='__main__':main()
