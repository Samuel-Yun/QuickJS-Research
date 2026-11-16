"""Reuse the existing stream input verifier; only adapt env and scope to five conditions."""
from common import *
original=(SOURCE/'crypto_inputs.py').read_text(encoding='utf-8')
assert original.count('env=environment(),')==1
adapted=original.replace('env=environment(),','env=environment(c),').replace('N/three conditions','N/five conditions')
exec(compile(adapted,str(SOURCE/'crypto_inputs.py')+' [five-condition env adaptation]','exec'),globals())
