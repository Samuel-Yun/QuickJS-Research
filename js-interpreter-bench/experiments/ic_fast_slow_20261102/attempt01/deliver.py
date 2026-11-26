"""Final local delivery manifest, no VM/private source access."""
import json,subprocess
from pathlib import Path
from datetime import datetime,timezone
HERE=Path(__file__).resolve().parent;REPO=HERE.parents[3]
def read(p):return json.loads(p.read_text(encoding='utf-8'))
def main():
    audit=read(HERE/'independent_audit_v2.json');assert all(r['status']=='PASS' for r in audit.values())
    assert sum(r['valid'] for r in audit.values())==6060
    for name in ['completion.json','privacy_gate.json','replay_verification.json','post_identity.json']:
        r=read(HERE/name);assert r.get('status') in ['PASS','COMPLETE_PUBLIC_EXPERIMENT']
    assert (HERE/'worker_stopped.json').exists()
    files=['prior_evidence.md','paths.md','paths.csv','review_guide.md','change_plan.md','results.md',
      'patches/M_to_U_generated.patch','patches/M_to_control.patch','machinecode/U_notes.md',
      'mechanism/analysis/adoption_curves_labeled.svg','sunspider/results.md','sunspider/analysis/U_over_M.svg',
      'micro/results.md','octane/results.md','octane/analysis/U_over_M.svg','README.md','statistics_contract.md']
    assert all((HERE/f).is_file() for f in files)
    m=read(HERE/'runtime.json');u=read(HERE/'U_runtime.json')['U'];artifacts={}
    for c,a in (m['artifacts']|{'U':u}).items():
        artifacts[c]=dict(path=a['path'],sha256=a['sha256'],size_bytes=a['size_bytes'],
          version='15.6.21' if c=='V8_ON' else '2026-06-04',
          compiler=None if c=='V8_ON' else m['compiler'],build_flags=None if c=='V8_ON' else m['flags'],
          source_commit=None if c in ['M','U','V8_ON'] else '04be246001599f5995fa2f2d8c91a0f198d3f34c',
          source_identity='official prebuilt; exact build compiler/commit UNKNOWN' if c=='V8_ON' else 'M archived per-file SHA; U applies saved patch' if c in ['M','U'] else 'frozen upstream source',
          runtime_flags=m['v8_flags'] if c=='V8_ON' else 'no extra flags; zlib alone uses recorded std/read adapter')
    def git(*args):return subprocess.check_output(['git','--no-optional-locks','-c','safe.directory='+REPO.as_posix(),'-C',str(REPO),*args],text=True,encoding='utf-8').strip()
    result=dict(status='COMPLETE',timestamp=datetime.now(timezone.utc).isoformat(),
      counts={k:{f:v[f] for f in ['actual','valid','expected','short_samples_retained']} for k,v in audit.items()},
      artifacts=artifacts,V8_dependencies=m['dependencies'],clock='captured native monotonic internal interval',
      correctness='PASS; independent U ASan/UBSan, serialization, GC/OOM, qjsc embedding; NOT full test262',
      final_audit='independent_audit_v2.json; v1 false-positive record retained',
      privacy='PASS; private details remain locally excluded',raw_only_replay='Windows; numeric delta0; raw SHA256 unchanged; no engines',
      files=files,post_identity='PASS',worker='exited',source_reference='public QuickJS only',
      HEAD=git('rev-parse','HEAD'),branch=git('branch','--show-current'),
      tracked_changes_count=len(git('diff','--name-only').splitlines()),staged_changes_count=len(git('diff','--cached','--name-only').splitlines()),
      commits_or_pushes_performed=False,
      unknowns=['V8 exact compiler/build flags/build commit','hardware perf counters','per-instruction self time',
       'separate layout/compiler-decision contribution','complex-workload per-site hit fractions','RSS and indirect-retention change',
       'continuous host power/frequency/temperature/background control'])
    p=HERE/'delivery_manifest.json';assert not p.exists();p.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print('DELIVERY_COMPLETE 6060/6060; tracked changes',result['tracked_changes_count'],'staged',result['staged_changes_count'])
if __name__=='__main__':main()
