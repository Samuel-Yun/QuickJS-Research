"""Final read-only Git/public-file hygiene and delivery completeness."""
import argparse,xml.etree.ElementTree as ET
from common import *
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output',default='analysis/delivery_audit.json');a=ap.parse_args()
    repo=ROOT.parent
    def git(*args):
        return subprocess.run(['git','-c','safe.directory='+repo.as_posix(),'-C',repo.as_posix(),*args],capture_output=True,text=True,check=True).stdout
    head=git('rev-parse','HEAD').strip();branch=git('branch','--show-current').strip()
    diff=git('diff','--name-only').splitlines();assert not diff,diff
    status=git('status','--short','--ignore-submodules=all')
    assert head=='696cfd8530fca5d52e9358a626e03d9280ea7008' and branch=='myx'
    assert read(HERE/'analysis/completion.json')['formal_valid']==1890
    assert read(HERE/'analysis/formal_audit.json')['status']=='PASS'
    assert read(HERE/'analysis/independent_audit.json')['status']=='PASS_WITH_CLOCK_METADATA_LIMITATION'
    assert read(HERE/'analysis/portable_replay_audit.json')['status']=='PASS'
    assert read(HERE/'recovery/previous_replay_audit.json')['status']=='PASS'
    assert read(HERE/'machinecode/post_static_audit.json')['status']=='PASS'
    required=['README.md','results.md','environment.txt','protocol.json','manifest.json','measurement_manifest.json','patches/C_to_D.patch','machinecode/notes.md',
      'analysis/octane_summary.csv','analysis/micro_summary.csv','analysis/diagnostic_summary.csv','analysis/memory_comparison.csv',
      'analysis/octane_CD_CI.svg','analysis/micros_CD_CI.svg','analysis/archive_verification.json']
    for p in required:assert (HERE/p).is_file(),p
    for p in (HERE/'analysis').glob('*.svg'):ET.parse(p)
    dumps=[]
    for c in MICRO_CASES:
        p=HERE/'bytecode'/f'{c}.target_only.txt';assert p.exists()
        text=p.read_text(encoding='utf-8');dumps.append(dict(case=c,sha256=sha(p),function_headings=text.count(': function: ')))
        if c.startswith('M4.'):assert not any(op in text for op in ['get_field','put_field','get_array_el','put_array_el'])
        if c.startswith('M5.'):assert 'put_field x' in text and 'get_field' not in text
    files=[p for p in HERE.rglob('*') if p.is_file() and not any(x in ['generated','artifacts','__pycache__'] for x in p.relative_to(HERE).parts)]
    oversized=[str(p.relative_to(HERE)) for p in files if p.stat().st_size>50*1024*1024];assert not oversized
    for v in VERSIONS:
        log=(HERE/'raw/build'/f'{v}_release.1.log').read_text(encoding='utf-8')
        assert '-O2' in log and '-g ' in log and '-fwrapv' in log
        assert not any(x in log for x in ['-DNDEBUG','-flto','-fprofile-use','-fprofile-generate','fsanitize'])
    save(HERE/a.output,dict(status='PASS_WITH_DOCUMENTED_LIMITATIONS',reference=head,branch=branch,
      tracked_changes_outside_new_attempt=diff,status_at_check=status,old_records_changed=False,new_experiment_only=True,committed=False,pushed=False,
      formal_records=1890,formal_expected=1890,diagnostic_archives=52,RSS_processes=144,plots_XML_valid=True,
      max_public_file_bytes=max(p.stat().st_size for p in files),public_files_over_50MiB=oversized,dumps=dumps,
      unknowns=['PMU counters','power/frequency/background control','calendar/monotonic metadata divergence cause','micro absolute monotonic endpoints','indirect shape retention bytes','pure call/helper self times'],
      tool_sha256={p.name:sha(p) for p in sorted(HERE.glob('*.py'))}))
    print('DELIVERY_PASS_WITH_DOCUMENTED_LIMITATIONS',flush=True)
if __name__=='__main__':main()
