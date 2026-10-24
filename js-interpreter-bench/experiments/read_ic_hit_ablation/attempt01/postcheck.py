"""Optional post-campaign live identity audit; not invoked by data-only replay."""
from common import *

def main():
    m=verify_runtime();ids=read(HERE/'sources/identities.json');facts=[]
    for v,files in ids['files'].items():
        mismatches=[n for n,h in files.items() if sha(STORE/v/n)!=h]
        facts.append(dict(source=v,files_checked=len(files),mismatches=mismatches))
        assert not mismatches,(v,mismatches)
    diag=read(HERE/'diagnostic_manifest.json')
    assert sha(diag['path'])==diag['sha256']
    san=read(HERE/'correctness/gate.json')['same_sanitizer_ELF_both_modes']
    assert sha(STORE/'SW_sanitizer/qjs')==san
    save(HERE/'analysis/post_runtime_sources.json',dict(status='PASS',checked_at=stamp(),
      source_files=facts,release_hashes={v:a['sha256'] for v,a in m['artifacts'].items()},
      shared_diagnostic_sha256=diag['sha256'],shared_sanitizer_sha256=san,
      inputs_match_manifest=True,formal_inputs_and_raw_modified=False))
    print('POST_RUNTIME_SOURCES_PASS',flush=True)

if __name__=='__main__':main()
