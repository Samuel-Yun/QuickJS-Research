"""Seal public deliverable byte identities after completion. No engine or Git writes."""
import hashlib,json
from pathlib import Path
H=Path(__file__).resolve().parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
    assert json.loads((H/'audit.json').read_text(encoding='utf-8'))['status']=='PASS_COMPLETE_BOUNDED_SEARCH'
    assert json.loads((H/'completion.json').read_text(encoding='utf-8'))['formal_valid']==4380
    assert (H/'idle_cleanup.json').exists() and not (H/'final_collector.lock').exists()
    archive=json.loads((H/'raw_archive.json').read_text(encoding='utf-8'))
    assert sha(H/'runs.jsonl.gz')==archive['compressed_SHA256'] and sha(H/'runs.jsonl')==archive['uncompressed_SHA256']
    excluded={'active','artifacts','__pycache__'};files={}
    for p in sorted(H.rglob('*')):
        if not p.is_file():continue
        rel=p.relative_to(H)
        if any(part in excluded for part in rel.parts) or rel.name in ['runs.jsonl','evidence_manifest.json'] or p.suffix in ['.pending','.pyc','.lock']:continue
        files[rel.as_posix()]=dict(SHA256=sha(p),bytes=p.stat().st_size)
    assert not any(v['bytes']>=90_000_000 for v in files.values()),'unexpected large public artifact'
    out=dict(status='SEALED_COMPLETED_PUBLIC_EVIDENCE',files=files,public_files=len(files),
        omitted='local active/build ELF/cache/uncompressed raw; private JWST never accessed or packaged',
        raw_archive=archive,counts=dict(formal=4380,independent_repeat=230,all_measurements=6097),
        verification='Each listed SHA is the final handoff byte identity. Re-running derived analyses may rewrite reports/audit; never rewrite raw to match a new hash.',
        VM_changes_after_selection=False,automatic_commit_push=False)
    with (H/'evidence_manifest.json').open('x',encoding='utf-8',newline='\n') as f:f.write(json.dumps(out,indent=2,ensure_ascii=False)+'\n')
    assert all(sha(H/name)==meta['SHA256'] for name,meta in files.items())
    print('PUBLIC_EVIDENCE_SEALED',len(files),'files; largest',max(v['bytes'] for v in files.values()))
if __name__=='__main__':main()
