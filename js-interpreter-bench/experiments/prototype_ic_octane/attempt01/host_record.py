"""Reuse the read-only Windows power/system-CPU-delta recorder, not an engine."""
from common import *
exec(compile((ABLATION/'host_record.py').read_text(encoding='utf-8'),str(ABLATION/'host_record.py'),'exec'),globals())
