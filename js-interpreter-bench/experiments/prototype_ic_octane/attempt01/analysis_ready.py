"""Freeze analysis identity before formal data exist; no engine invoked."""
from common import *
assert not any((HERE/'raw/formal').rglob('*.json')),'analysis must be ready before formal observations'
save(HERE/'analysis_ready.json',dict(timestamp=stamp(),analyzer_sha256=sha(HERE/'analyze.py'),test_sha256=sha(HERE/'test_analysis.py'),old_math_sha256=sha(SOURCE/'analyze.py'),formal_records_at_definition=0,bootstrap_draws=10000,seed=SEED,main_set=BASE_CASES,main_includes_fixed_input_Crypto=True,expanded_full_set=CASES,raw_only=True))
print('ANALYSIS_PREDECLARED_AT_FORMAL0')
