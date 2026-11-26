"""Final data-only checks, including archive integrity and preserved tracked history."""
import ast,math
from common import *
def main():
 for p in HERE.glob('*.py'):ast.parse(p.read_text(encoding='utf-8'),filename=p.name)
 f=read(HERE/'pre_pilot_freeze.json')
 for p,h in f['files'].items():assert sha(HERE/p)==h,p
 frozen=read(HERE/'frozen.json');assert sha(HERE/'pre_pilot_freeze.json')==frozen['pre_pilot_sha256'] and sha(HERE/'schedule.json')==frozen['schedule_sha256']
 for p,h in frozen['selected'].items():assert sha(HERE/'selected'/p)==h
 for key in ['analysis/audit.json','analysis/post_identity.json','diagnostic/gate.json','diagnostic/measurement_driver/gate.json','layout/gate.json','layout/relocation_gate.json','analysis/phases_complete.json']:assert read(HERE/key)['status']=='PASS',key
 assert read(HERE/'layout/padding_unreachable.json')['status']=='STATIC_EVIDENCE_PASS'
 archives=read(HERE/'delivery_archives.json')
 for a in archives:
  p=HERE/a['archive'];assert sha(p)==a['compressed_sha256'];h=hashlib.sha256()
  with gzip.open(p,'rb') as z:
   for b in iter(lambda:z.read(1048576),b''):h.update(b)
  assert h.hexdigest()==a['original_sha256']
 replays=sorted((HERE/'replays').glob('*/audit.json'));assert len(replays)>=2
 assert all(read(p)['status']=='PASS' and len(read(p)['outputs'])==11 for p in replays[-2:])
 # Recheck generated formal script hashes and identity consistency without ELF execution.
 records=[read(p) for s in ['base_pre','layout','base_post'] for p in (HERE/'raw'/s).rglob('*.json')]
 assert len(records)==704 and all(r['valid'] for r in records)
 for r in records:assert r['script_sha256']==frozen['scripts'][r['case']]
 git=['git','-c','safe.directory='+ROOT.parent.as_posix()];head=subprocess.check_output(git+['rev-parse','HEAD'],cwd=ROOT,text=True).strip();branch=subprocess.check_output(git+['branch','--show-current'],cwd=ROOT,text=True).strip();changed=subprocess.check_output(git+['diff','HEAD','--name-only'],cwd=ROOT,text=True).splitlines()
 assert head==read(HERE/'origin.json')['HEAD'] and branch=='myx' and not changed,changed
 assert sha(OLD/'manifest.json')==read(HERE/'origin.json')['old_manifest_sha256']
 oversized=[p.relative_to(HERE).as_posix() for p in HERE.rglob('*') if p.is_file() and p.stat().st_size>50*1024**2];assert not oversized
 unexpected=[p.relative_to(HERE).as_posix() for p in HERE.rglob('*') if p.is_file() and p.suffix in ['.o','.exe']];assert not unexpected
 started=datetime.fromisoformat(read(HERE/'origin.json')['timestamp']);elapsed=(datetime.now(timezone.utc)-started).total_seconds();assert elapsed<4*3600
 report=dict(status='PASS',HEAD=head,branch=branch,historical_tracked_changes=changed,formal_valid=704,archives_verified=len(archives),portable_replays=[str(p.relative_to(HERE)) for p in replays],replay_outputs_each=11,source_and_measurement_freeze_unchanged=True,oversized_files=oversized,object_or_exe_files=unexpected,elapsed_wall_seconds_including_sampling=elapsed,investigation_budget_upper_bound_seconds=14400,performance_records_added_after_fixed_schedule=0,unknowns=['hardware events','actual native branch trace','per-formal-sample CPU time/load base','host power/frequency/background causes'],checked_at=stamp())
 save(HERE/'analysis/delivery_audit.json',report);print(json.dumps(report,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
