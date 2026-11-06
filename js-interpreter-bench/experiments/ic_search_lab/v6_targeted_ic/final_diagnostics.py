"""Finish all CPU-heavy preparation before the last bounded timing check."""
import runpy
from pathlib import Path
import experiment as e
import counts
import native_inspect
assert e.DIAGNOSTIC_ONLY
runpy.run_path(str(e.H/'build_call_followup.py'),run_name='__main__')
counts.run('C1')
native_inspect.run()
e.save('diagnostic_phase_complete.json',dict(status='COMPLETE',boot_id=e.lab.boot(),
    full_test262=False,all_performance_still_paused=True,source_private_JWST_used=False))
print('ALL_DIAGNOSTICS_COMPLETE',flush=True)
