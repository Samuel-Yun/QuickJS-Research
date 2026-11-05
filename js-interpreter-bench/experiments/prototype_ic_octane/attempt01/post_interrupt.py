"""Read-only post-interruption runtime check, NOT a resumed campaign."""
from common import *
from prepare import verify_runtime
a=verify_runtime();before=read(HERE/'runtime.json')['artifacts'];checks={}
for c in CONDITIONS:
    checks[c]={f:a[c][f]==before[c][f] for f in ['path','realpath','sha256','size','dependencies']}
ps=subprocess.run(['ps','-eo','pid,ppid,stat,comm,args'],capture_output=True,text=True)
frozen=read(HERE/'frozen.json')
save(HERE/'post_interrupt_inspection.json',dict(timestamp=stamp(),current_boot_id=boot(),frozen_boot_id=frozen['boot_id'],same_boot=boot()==frozen['boot_id'],processes=ps.stdout,artifact_checks=checks,performance_processes_started=0))
save(HERE/'identity_after.json',dict(timestamp=stamp(),status='HASHES_MATCH_POST_INTERRUPT_DIFFERENT_BOOT' if all(all(d.values()) for d in checks.values()) else 'POST_INTERRUPT_IDENTITY_MISMATCH',boot_id=boot(),performance_boot=frozen['boot_id'],artifacts=a,continuous_cohort_end_verification=False))
print('POST_INTERRUPT_IDENTITY',checks,'oldboot',frozen['boot_id'],'current',boot(),flush=True)
