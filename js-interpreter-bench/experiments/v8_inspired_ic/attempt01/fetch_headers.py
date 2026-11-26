"""Windows default Python trust store alternative; never disable verification."""
import hashlib,json,urllib.request,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
rows=[]
for f in ['src/ic/ic.h','src/ic/stub-cache.cc','src/objects/data-handler-inl.h']:
    p=HERE/'source_reference/v8'/f;url='https://raw.githubusercontent.com/v8/v8/37fb84941c9be9f9914ee50b1ad366f06a1bd764/'+f
    assert not p.exists()
    r=dict(url=url,upstream_path=f,TLS_verification=True,method='Windows Python default trust store; WSL failure preserved')
    try:
        with urllib.request.urlopen(url,timeout=35) as response:b=response.read()
        p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(b)
        r.update(status='FETCHED_OFFICIAL_FIXED_COMMIT',sha256=hashlib.sha256(b).hexdigest(),size_bytes=len(b))
    except Exception as e:r.update(status='MISSING_ALTERNATIVE_TRUST_FETCH_FAILED',error=str(e),sha256=None)
    rows.append(r);print(f,r['status'],flush=True)
out=HERE/(sys.argv[1] if len(sys.argv)>1 else 'source_headers_supplement.json');assert not out.exists();out.write_text(json.dumps(rows,indent=2)+'\n')
