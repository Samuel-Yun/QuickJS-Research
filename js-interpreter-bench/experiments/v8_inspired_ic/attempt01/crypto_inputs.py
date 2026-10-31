"""Unmodified archived three-condition stream verifier, current explicit identities."""
from common import *
assert sha(SOURCE/'crypto_inputs.py')==read(HERE/'crypto_source_reuse.json')['sha256']
exec(compile((SOURCE/'crypto_inputs.py').read_text(),str(SOURCE/'crypto_inputs.py')+' [A/E/V8_ON]','exec'),globals())
