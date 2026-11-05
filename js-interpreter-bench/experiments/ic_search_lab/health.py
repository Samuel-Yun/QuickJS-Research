"""Exactly one finite A-only stability diagnostic after repeat drift; no ranking."""
import math,os,json
import lab,measure
HERE=lab.HERE
if __name__=='__main__':
    # Explicit health check may run while STOP_CURRENT blocks candidates. It
    # cannot remove the stop or start a candidate/campaign as a side effect.
    assert not (HERE/'health_after_drift.json').exists(), 'one bounded check only; preserve prior failure'
    os.sched_setaffinity(0,{2});info=measure.inputs('sunspider');case='date-format-xparb';bid=lab.boot();rows=[]
    for rep in range(4):
        rows.append(measure.invoke(info,'environment_only',case,'A',info['N'][case],'environment_stability',0,rep,'postreboot.environment.after_drift01'))
    values=[r['elapsed_ms'] for r in rows];drift=max(values)/min(values)
    result=dict(status='PASS_BOUNDED_A_STABILITY' if drift<=1.10 else 'BLOCKED_A_STABILITY',
        boot_id=bid,boot_id_after=lab.boot(),case=case,N=info['N'][case],values_ms=values,
        max_over_min=drift,threshold=1.10,records=[r['process_token'] for r in rows],
        candidate_performance=False,meaning='Four fresh A-only processes, same existing workload; no favorable retry and no full search GM; passing is not proof of long-campaign stability')
    lab.save(HERE/'health_after_drift.json',result);print('A_ONLY_STABILITY',json.dumps(result),flush=True)
