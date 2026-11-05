"""Save observed interruption metadata; do not fabricate an execution result."""
from common import *
raw=[read(p) for p in (HERE/'raw/formal').rglob('*.json')]
pending=[p for p in (HERE/'raw/started/formal').rglob('*.json') if not (HERE/'raw/formal'/p.parent.name/p.name).exists()]
for p in pending:
    d=read(p)
    save(HERE/'raw/interrupted'/p.name,dict(status='START_MARKER_WITHOUT_COMPLETION',source_marker=p.relative_to(HERE).as_posix(),marker=d,exit_code=None,stdout=None,stderr=None,elapsed_ms=None,execution_observed='UNKNOWN; marker was saved before subprocess launch',not_automatically_retried=True))
inspection=read(HERE/'post_interrupt_inspection.json')
save(HERE/'campaign_stop.json',dict(status='GLOBAL_BOOT_CHANGED_EXTERNAL_INTERRUPTION',timestamp=stamp(),reason='tool session disappeared; old controller absent and WSL boot differs; no cross-boot continuation',old_boot=inspection['frozen_boot_id'],inspection_boot=inspection['current_boot_id'],formal_expected=2550,formal_completed=len(raw),formal_valid=sum(r['valid'] for r in raw),completed_missing=2550-len(raw),started_without_completion=len(pending),cause='UNKNOWN',automatic_retries=0,new_performance_processes_after_interrupt=0))
save(HERE/'collection_closed.json',dict(timestamp=stamp(),status='STOPPED_CROSS_BOOT',completed_records=len(raw),started_without_completion=len(pending),old_performance_boot=inspection['frozen_boot_id'],new_inspection_boot=inspection['current_boot_id'],old_cohort_not_resumed=True))
print('PARTIAL_COHORT_CLOSED',len(raw),'completed;',len(pending),'pending')
