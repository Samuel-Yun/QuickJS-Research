"""Performance-statistics gate: there are currently no authorized formal samples."""
from common import *
if __name__=='__main__':
 audit=read(HERE/'summary/audit.json')
 if audit['status']=='BLOCKED_IC_INTERVENTION':raise SystemExit('BLOCKED_IC_INTERVENTION: 0/270 formal samples; performance statistics unavailable. Use review.py for raw capability evidence, not a timing table.')
 raise SystemExit('New validated formal campaign required; this blocked attempt has no frozen formal N/scripts/order.')
