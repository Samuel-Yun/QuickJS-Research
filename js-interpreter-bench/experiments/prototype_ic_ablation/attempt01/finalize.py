"""Local/public evidence closure; never executes a VM."""
import ast,collections,csv,gzip,subprocess
from common import *

def main():
    audit=read(HERE/'analysis_final/audit.json');assert audit['status']=='PERFORMANCE_ENV_UNSTABLE' and audit['formal_actual']==0
    assert read(HERE/'identity_closing.json')['status']=='PASS'
    assert not list((HERE/'raw/formal').rglob('*.json'))
    # The first analysis wrote valid files before a final console-print error.
    compared=[]
    for p in sorted((HERE/'analysis').iterdir()):
        assert p.is_file() and sha(p)==sha(HERE/'analysis_final'/p.name),p.name
        compared.append(p.name)
    for p in HERE.glob('*.py'):ast.parse(p.read_text(encoding='utf-8'))
    counts=collections.Counter();records=[];experimental=[]
    for p in sorted((HERE/'raw/commands').glob('*.json')):
        r=read(p);name=Path(r['command'][0]).name
        if name not in ['qjs','serial_check']:continue
        label=p.stem;kind=label.split('.')[0]
        counts[kind]+=1
        if kind=='invalid_option':assert r['exit_code']==2 and 'must be 0 or 1' in r['stderr']
        else:assert r['exit_code']==0 and not r['stderr']
        records.append(dict(stage=kind,record=p.relative_to(HERE).as_posix(),exit_code=r['exit_code'],boot_id=r['boot_id'],option=r['option'],raw_sha256=sha(p)))
        if kind in ['pilot','selected_correctness','stability0','stability1','timer']:experimental.append(r)
    expected=dict(semantic=64,invalid_option=4,workload=32,diagnostic=16,lifecycle=2,serial=3,timer=4,pilot=32,selected_correctness=16,stability0=12,stability1=12)
    assert dict(counts)==expected,(counts,expected)
    assert len({r['environment_excluding_option_sha256'] for r in experimental})==1
    assert {tuple(r['parent_affinity']) for r in experimental}=={(15,)}
    assert len({r['boot_id'] for r in experimental})==1
    csvout(HERE/'process_inventory.csv',records)
    hot=read(HERE/'raw/hot_archive_identity.json');assert sha(HERE/hot['path'])==hot['compressed_sha256']
    assert hashlib.sha256(gzip.decompress((HERE/hot['path']).read_bytes())).hexdigest()==hot['raw_sha256']
    repo=HERE.parents[3]
    def git(*args):
        r=subprocess.run(['git','-c','safe.directory='+repo.as_posix(),'-C',str(repo),*args],capture_output=True,text=True);assert not r.returncode,r.stderr;return r.stdout.strip()
    state=dict(HEAD=git('rev-parse','HEAD'),branch=git('branch','--show-current'),tracked_diff=git('diff','--name-only'),staged_diff=git('diff','--cached','--name-only'),status=git('status','--short'))
    assert state['HEAD']=='92b2350708494f8037b19bba3a3323cf5e6b3f47' and state['branch']=='myx' and not state['tracked_diff'] and not state['staged_diff']
    save(HERE/'workspace_closing.json',state)
    files=[p for p in HERE.rglob('*') if p.is_file()]
    assert not [p for p in files if p.suffix in ['.o','.exe','.so','.pyc'] or p.name in ['qjs','qjsc']]
    result=dict(status='PERFORMANCE_ENV_UNSTABLE',implementation='COMPLETE_MINIMAL_SWITCH',timestamp=stamp(),reference_commit=state['HEAD'],
       experimental_processes=sum(counts.values()),process_counts=dict(counts),build_nested_subprocesses_not_counted=True,
       formal_expected=384,formal_actual=0,formal_valid=0,bootstrap_draws_actual=0,
       main_ratios={'ON/OFF':None,'ON/H':None,'OFF/M':None,'H/M':None},
       same_ELF_ON_OFF=True,switch_ELF_SHA256=read(HERE/'manifest.json')['switch']['sha256'],
       semantic='64/64 PASS',workload_correctness='32/32 PASS',mechanism='16 independent processes PASS',
       short_lifecycle='2/2 PASS',hot_serialization='3/3 PASS; copy/ROM and immutability',
       sanitizer=read(HERE/'gates/sanitizer.json')['status'],
       stability_groups=[read(HERE/'stability'/f'group{i}.json') for i in [0,1]],
       allowed_environment_rearrangements_used=1,planned_schedule_audit='PASS, NOT executed',
       all_old_artifacts_unchanged=True,all_old_tracked_files_unchanged=True,all_outliers_retained=True,
       analysis_exit0_replay='analysis_final',first_analysis_byte_comparison=compared,
       statistical_outcome='UNKNOWN, no pilot-as-formal substitutions',
       unknown=['net benefit in same ELF','ON framework perturbation relative to H','OFF common cost relative to M','host power/frequency/thermal control','reason sanitizer build/WSL frontend was interrupted','peak indirect retention and RSS'],
       next='new quiet window, same frozen program/protocol, new cohort; no additional IC design',
       V8_A_JSC_runs=0,automatic_commits=False,push=False,new_IC_designs_after_stop=0,
       files_before_completion=len(files),total_bytes_before_completion=sum(p.stat().st_size for p in files))
    save(HERE/'completion.json',result);print(json.dumps(dict(status=result['status'],processes=result['experimental_processes'],formal=0,analysis_replay='PASS'),ensure_ascii=False))

if __name__=='__main__':main()
