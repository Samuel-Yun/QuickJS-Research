"""New cohort, SAME verified E; do not merge the externally interrupted boot.
Launched by a separate hidden Windows WSL process, not the interactive tool PTY.
"""
from common import *
def step(script,*args):
    print('STEP',script,*args,flush=True)
    subprocess.run(['python3','-u',str(HERE/script),*args],cwd=HERE,check=True)
def main():
    assert not (HERE/'execution_started.json').exists()
    parent=HERE.parent/'attempt02';old=read(parent/'campaign_runtime.json')
    assert read(parent/'campaign_stop.json')['status']=='INTERRUPTED_EXTERNAL_BOOT_CHANGED'
    for item in list(old['artifacts'].values())+old['v8']['dependencies']+old['dynamic_dependencies']:
        assert sha(item['path'])==item['sha256']
    assert old['host']==platform.node() and old['architecture']==platform.machine()
    for p in (HERE/'engine').glob('*'):assert sha(p)==sha(parent/'engine'/p.name)
    gates=['semantic_gate.json','safety_gate.json','serialization_gate.json','additional_gate.json']
    for f in gates:assert sha(HERE/'correctness'/f)==sha(parent/'correctness'/f) and read(HERE/'correctness'/f)['status']=='PASS'
    save(HERE/'artifact_reuse.json',dict(timestamp=stamp(),unchanged_host=True,unchanged_release_E=True,release_sha256=old['artifacts']['E']['sha256'],
        source_campaign='../attempt02',old_measurement_boot_id=old['boot_id'],new_boot_id=boot(),
        safety_gates_reused_not_rerun=gates,gate_raw_records='../attempt02/raw/validation/',
        build_records_reused=True,fresh_workload_correctness_calibration_and_formal=True,
        historical_timing_records_imported=0,new_optimization_variant=False))
    save(HERE/'execution_started.json',dict(timestamp=stamp(),pid=os.getpid(),boot_id=boot(),reuse_fixed_E=True))
    try:
        step('reuse_sources.py');step('prepare.py');step('campaign.py')
        step('diagnostics.py','build');step('diagnostics.py','collect');step('host_diagnostic.py');step('post_identity.py')
        step('analyze.py','--output','summary');step('audit.py');step('plot.py');step('report.py')
        save(HERE/'execution_end.json',dict(timestamp=stamp(),boot_id=boot(),status='COLLECTED_ANALYZED_AND_REPORTED'))
    except Exception as e:
        save(HERE/'execution_stop.json',dict(timestamp=stamp(),boot_id=boot(),error=str(e)))
        raise
if __name__=='__main__':main()
