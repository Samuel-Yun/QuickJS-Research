"""Recover only hash-verified fixed official V8 references; one fetch per missing file."""
import hashlib,json,shutil,urllib.request
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
OLD=ROOT/'experiments/v8_qjs_ic_source_compare/attempt01'
COMMIT='37fb84941c9be9f9914ee50b1ad366f06a1bd764'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
    out=HERE/'source_reference';out.mkdir(exist_ok=True);files=[];known={}
    for name in ['source_inventory_v8.json','source_inventory_v8_entry.json','source_inventory_v8_supplement.json']:
        data=json.loads((OLD/name).read_text())
        for r in data.get('files',[data]):
            if r.get('status','').startswith(('REUSED','FETCHED')) and r.get('sha256'):
                p=OLD/r['path'];assert sha(p)==r['sha256'],str(p);known[r['upstream_path']]=dict(r)
    for f,r in known.items():
        src=OLD/r['path'];dest=out/'v8'/f;dest.parent.mkdir(parents=True,exist_ok=True)
        if not dest.exists():shutil.copyfile(src,dest)
        assert sha(dest)==r['sha256'];r.update(local=dest.relative_to(HERE).as_posix());files.append(r)
    for f in ['src/ic/ic.h','src/ic/stub-cache.cc','src/objects/data-handler-inl.h']:
        if f in known:continue
        dest=out/'v8'/f;url=f'https://raw.githubusercontent.com/v8/v8/{COMMIT}/{f}'
        r=dict(upstream_path=f,url=url,reference_commit=COMMIT,TLS_verification=True)
        try:
            with urllib.request.urlopen(url,timeout=40) as response:data=response.read()
            dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data)
            r.update(sha256=sha(dest),size_bytes=len(data),status='FETCHED_OFFICIAL_FIXED_COMMIT',local=dest.relative_to(HERE).as_posix())
        except Exception as e:r.update(status='MISSING_FETCH_FAILED_NO_RETRY',error=str(e),sha256=None)
        files.append(r)
    lic=out/'v8/LICENSE';lic.parent.mkdir(parents=True,exist_ok=True)
    if not lic.exists():shutil.copyfile(OLD/'source_reference/v8/LICENSE',lic)
    result=dict(reference_commit=COMMIT,actual_d8_build_commit=None,files=files,license_sha256=sha(lic))
    p=HERE/'source_manifest.json';assert not p.exists();p.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print([(r['upstream_path'],r['status']) for r in files])
if __name__=='__main__':main()
