"""Freeze selected runtime/source/contract identities; evidence hashes close separately."""
import json
import run
H=run.HERE;lab=run.lab
def main():
    d=lab.load(H/'decision.json');cid=d['candidate'];safety=lab.load(H/'final_safety.json');v8=lab.load(H/'final_runtime_gate.json')
    assert cid and safety['candidate']==cid and v8['status']=='PASS_SAME_FROZEN_ARTIFACT'
    env=lab.load(H/'environment_confirmation.json');ws=lab.load(H/'workspace.json')
    m=dict(status='FROZEN_BEFORE_NEW_FORMAL_RESULTS',start_commit=lab.load(H/'protocol.json')['start_commit'],
        boot_id=d['boot_id'],platform=env['platform'],OS=env['os_release'],affinity=[2],
        temperature='UNKNOWN',power_frequency_control='UNKNOWN',invisible_background_activity='UNKNOWN',
        versions=dict(QuickJS='2026-06-04',upstream_commit='04be246001599f5995fa2f2d8c91a0f198d3f34c',V8='15.6.21',V8_source_exact_commit=None,V8_build_toolchain=None),
        artifacts={label:run.measure.artifact(label) for label in ['A','M',cid,'V8_ON']},V8_dependencies=v8['sha256'],
        V8_flags=['--jitless','--no-lazy','--use-ic'],QuickJS_flags='none; zlib only --std -I frozen zlib_read.js as existing adapter',
        seed_M_archive_sha256=ws['seed_archive_sha256'],compiler_observed=lab.load(H/'environment.json')['compiler'],
        candidate_compile_link_commands=run.measure.artifact(cid)['compile_link_commands'],
        source_patch_chain='public M seed -> patches/'+cid+'.patch; no additional VM changes after selection',
        timing='internal native monotonic ms/complete Run, first Run included, no extra workload warmup; Setup/driver outside as frozen contract',
        timed_costs='runtime first-call preparation, GC/helper/builtin/RegExp/dynamic code and original assertions according to actual workload',
        inputs={kind:run.measure.inputs(kind) for kind in ['octane','sunspider']},
        statistical_policy='10000 shared whole-round paired bootstrap seed20261105, median ratios, fixed suite/case aggregates, exploratory/unadjusted',
        old_results_reused=False,old_N_reused=True,private_JWST_read=False,automatic_commit_push=False,
        limitations=['SunSpider two unseeded cases retained; bytewise identical source does not fix random input',
                    'Octane core16/13suite and extended17/14suite are not official scores; Box2D/officiallatency exclusions unchanged',
                    'Exact V8 binary source/toolchain not claimed; existing official artifact frozen',
                    'A/M artifacts reused, not rebuilt or renamed from new builds; safety Release rebuild matches selected frozen ELF',
                    'Not full test262; sanitizer and upstream coverage recorded in final_safety.json'])
    lab.save(H/'manifest.json',m);print('RUNTIME_SOURCE_CONTRACT_FROZEN',cid)
if __name__=='__main__':main()
