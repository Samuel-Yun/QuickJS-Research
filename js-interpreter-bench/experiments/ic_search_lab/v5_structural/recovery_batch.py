"""One bounded recovery after the recorded environment discontinuity."""
import json
import subprocess
import sys
import run
import balanced

run.gate()
info = run.measure.inputs('octane')
cases = ['Richards.Richards','RayTrace.RayTrace','RegExp.RegExp','CodeLoad.CodeLoadClosure']
protocol = dict(status='FROZEN_BEFORE_RECOVERY', cases=cases, conditions=['s001','null_s001'],
    recovery_limit=1, drift_max_ratio=1.15, cutoff_action='Stop, preserve new raw; no repeated retry',
    candidate_code_changes=False, new_campaign='recovery.v5.octane',
    wall_monotonic_guard_seconds=1, launcher='Detached owned process, file output and exit record',
    motivation='Prior campaign incomplete after a2923s UTC/monotonic discrepancy; no performance inference from its retained rows')
run.lab.save(run.H/'recovery_protocol.json',protocol)
checks=[]
for i,case in enumerate(cases):
    values={}
    order=['s001','null_s001']
    if i%2:
        order.reverse()
    for pos,label in enumerate(order):
        values[label]=run.measure.invoke(info,'recovery_control',case,label,info['N'][case],
             'recovery_control',pos,0,'recovery_control.v5')['elapsed_ms']
    drift=max(values.values())/min(values.values())
    checks.append(dict(case=case,elapsed_ms=values,max_over_min=drift))
    if drift>1.15:
        run.lab.save(run.H/'recovery_control.json',dict(status='BLOCKED_DRIFT',checks=checks))
        raise RuntimeError('Recovery control drift, no further automatic retry')
run.lab.save(run.H/'recovery_control.json',dict(status='PASS',checks=checks))
balanced.sample(['s001','A','mx019','d03','d04'],'octane',5,'recovery.v5.octane')
