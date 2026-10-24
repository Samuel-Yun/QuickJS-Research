"""Only after fixed formal schedule: diagnostics/statistics/identity, all serial."""
import audit,diagnostic_measure,padding_check,analyze,postcheck
from common import *
if __name__=='__main__':
 audit.main()
 diagnostic_measure.main()
 padding_check.main()
 analyze.analyze()
 postcheck.main()
 save(HERE/'analysis/phases_complete.json',dict(status='PASS',timestamp=stamp(),formal_expected=704,formal_actual=read(HERE/'analysis/audit.json')['actual'],formal_valid=read(HERE/'analysis/audit.json')['valid'],new_strategy=False,perf=read(HERE/'capabilities.json')['perf'],stop_at_fixed_schedule=True))
