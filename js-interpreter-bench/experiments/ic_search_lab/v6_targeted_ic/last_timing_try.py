"""One bounded post-build timing recovery. Any further STOP ends performance."""
import experiment as e
assert e.EPOCH=='recovery02' and not e.DIAGNOSTIC_ONLY
assert e.lab.load(e.H/'diagnostic_phase_complete.json')['status']=='COMPLETE'
assert e.lab.load(e.H/'memory_complete.json')['status']=='COMPLETE'
e.preflight()
labels=e.lab.load(e.H/'short_plan.json')['conditions']
e.campaign('short_recovery02',labels,'short')
