"""Reuse the frozen public input-identity algorithm without changing workloads."""
from common import *
SOURCE=ROOT/'experiments/v8_ic_octane/attempt01/crypto_inputs.py'
EXPECTED='fcd0a3685007e1ccca595301db9b759e7e1a0119dabed093b0ccff8de16192f8'

def validate(campaign,case,n):
    assert sha(SOURCE)==EXPECTED
    def block(*args):raise RuntimeError(str(args))
    ns=dict(__name__='crypto_identity_reused',__file__=str(SOURCE))
    exec(compile(SOURCE.read_text(),str(SOURCE),'exec'),ns)
    ns.update(HERE=campaign.dir,ROOT=ROOT,CONDITIONS=campaign.conditions,CRYPTO_SEED=305419896,TIMEOUT=TIMEOUT,
      prefixes=lambda:{c:[campaign.artifacts[c]['path']]+(runtime()['v8_flags'] if c=='V8_ON' else []) for c in campaign.conditions},
      environment=lambda:dict(os.environ),block=block)
    save(campaign.dir/'crypto_identity_reuse.json',dict(source=SOURCE.relative_to(ROOT).as_posix(),sha256=EXPECTED,
      actual_conditions=campaign.conditions,changes='unmodified fixed input algorithm with new output namespace and explicit frozen conditions',private_source=False))
    return ns['validate'](case,n)
