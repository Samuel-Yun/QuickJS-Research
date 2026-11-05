"""Read-only runtime/input/library identity check after all timing processes exit."""
from pathlib import Path
import run
H=run.HERE;lab=run.lab
def main():
    assert not (H/'final_collector.lock').exists(),'timing/key repeat still active'
    expected=lab.load(H/'manifest.json');assert lab.boot()==expected['boot_id']
    actual={}
    for label in ['A','M','s001','s002','s003','s004','V8_ON']:
        a=run.measure.artifact(label);h=lab.sha(a['path']);assert h==a['sha256'];actual[label]=h
    original={
        '/home/mzyx/read_ic_dequickening_attempt01/A/qjs':actual['A'],
        '/home/mzyx/ic_mechanism_audit_attempt01/M/qjs':actual['M']}
    for p,h in original.items():assert lab.sha(p)==h
    v8=Path(run.measure.artifact('V8_ON')['path']).parent
    for name,h in lab.load(H/'final_runtime_gate.json')['sha256'].items():assert lab.sha(v8/name)==h
    for kind in ['sunspider','octane']:run.measure.verify(run.measure.inputs(kind),['A','M','s001','V8_ON'])
    libraries=lab.load(H/'final_environment.json')['dynamic_library_sha256']
    for p,h in libraries.items():assert lab.sha(p)==h,'dynamic library changed '+p
    src=run.measure.artifact('s001')['source_sha256_after_build']
    assert {n:lab.sha(H/'active'/n) for n in src}==src
    lab.save(H/'postflight.json',dict(status='PASS_IDENTITY_UNCHANGED',boot_id=lab.boot(),timestamp=lab.stamp(),
        runtime_sha256=actual,original_A_M_sha256=original,dynamic_library_sha256=libraries,
        inputs_unchanged=True,selected_active_source_unchanged=True,
        active_qjs_note='sanitizer safety output, never used for performance; frozen artifacts path used',
        limitations='identity checks do not demonstrate isolated power/frequency or zero background perturbation'))
    print('POSTFLIGHT_IDENTITY_PASS',lab.boot(),flush=True)
if __name__=='__main__':main()
