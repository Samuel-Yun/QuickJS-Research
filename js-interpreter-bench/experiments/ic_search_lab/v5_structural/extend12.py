"""The single predeclared coverage reduction, no further search expansion."""
import run

run.lab.save(run.H/'d05.protocol.json',dict(status='FROZEN_BEFORE_BUILD',candidate='d05',
    conditions=['s001','d03','d05'],screens=['octane17','sunspider26'],rounds=1,
    workload='Same medium N as initial screen, Crypto full deterministic N',
    comparison='Fresh same-batch s001 and d03, no old elapsed denominators',
    expansion='Twelfth genuine timed structural prototype; no further designs this round'))
artifact=run.build('d05')
assert artifact is not None
for kind in ['octane','sunspider']:
    run.compare('d05',kind,1,'screen12',['s001','d03','d05'])
