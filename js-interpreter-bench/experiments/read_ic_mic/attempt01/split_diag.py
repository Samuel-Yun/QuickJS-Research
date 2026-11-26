"""Mechanical extraction: diagnostic-only code is not part of formal source patches."""
from pathlib import Path
H=Path(__file__).resolve().parent
p=H/'implementation/read_ic_prepare.inc';s=p.read_text()
a=s.index('#ifdef READ_IC_DIAGNOSTIC\nstatic void rdi_diag_prepare');z=s.index('static int rdi_prepare',a)
block=s[a:z];assert block.endswith('#endif\n')
q=H/'implementation/read_ic_diag_prepare.inc';assert not q.exists();q.write_bytes(block[len('#ifdef READ_IC_DIAGNOSTIC\n'):-len('#endif\n')].encode())
p.write_bytes((s[:a]+s[z:]).encode())
