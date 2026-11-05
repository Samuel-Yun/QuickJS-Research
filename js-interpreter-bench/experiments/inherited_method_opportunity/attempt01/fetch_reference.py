"""At most one TLS-verified fetch per small pinned official source, no VM build."""
import urllib.request
from common import *
COMMIT='37fb84941c9be9f9914ee50b1ad366f06a1bd764'
FILES=['src/ic/handler-configuration.cc','src/ic/handler-configuration.h','src/objects/data-handler.h','src/objects/data-handler.tq']
def main():
    results=[]
    for file in FILES:
        url=f'https://raw.githubusercontent.com/v8/v8/{COMMIT}/{file}';p=HERE/'source_reference'/file
        if p.exists():raise RuntimeError('no silent overwrite/refetch')
        t=stamp()
        try:
            with urllib.request.urlopen(url,timeout=20) as response:
                data=response.read();assert response.status==200 and len(data)<150000 and b'Copyright' in data and b'<html' not in data.lower()
            save(p,data);r=dict(path=file,url=url,reference_commit=COMMIT,status='AVAILABLE',sha256=sha(p),git_blob_sha1=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest(),bytes=len(data),timestamp=t)
        except Exception as e:r=dict(path=file,url=url,reference_commit=COMMIT,status='UNAVAILABLE',error=repr(e),timestamp=t)
        results.append(r);print(file,r['status'],flush=True)
    save(HERE/'source_reference/manifest.json',dict(files=results,TLS_verification=True,attempts_per_URL=1,artifact_exact_source_commit=None,source_commit_is_reference_only=True))
if __name__=='__main__':main()
