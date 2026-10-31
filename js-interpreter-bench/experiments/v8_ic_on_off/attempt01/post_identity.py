"""Recheck reused original artifacts; no build and no performance invocation."""
from common import *
def main():
 m=read(HERE/'runtime.json');q=m['quickjs'];v=m['v8'];assert sha(q['binary']['path'])==q['binary']['sha256'];assert all(sha(Path(q['source'])/p)==h for p,h in q['source_files'].items())
 files=[v['binary'],*v['dependencies'],v['build_metadata_artifact']]
 for a in files:assert sha(a['path'])==a['sha256']
 libs=[]
 for condition,path in [('QJS_ORIGINAL',q['binary']['path']),('V8_SHARED',v['binary']['path'])]:
  r=capture('ldd_'+condition,['ldd',path]);assert r['exit_code']==0
  for line in r['stdout'].splitlines():
   match=re.search(r'(/\S+)\s+\(0x',line)
   if match:
    p=Path(match[1]);libs.append(dict(condition=condition,path=str(p),sha256=sha(p),size_bytes=p.stat().st_size))
 source=Path(q['source']);names=['quickjs.c','quickjs.h','quickjs-libc.c','Makefile','VERSION'];identities=[]
 for name in names:
  b=(source/name).read_bytes();identities.append(dict(file=name,original_bytes_SHA256=hashlib.sha256(b).hexdigest(),LF_normalized_SHA256=hashlib.sha256(b.replace(b'\r\n',b'\n')).hexdigest(),CRLF_count=b.count(b'\r\n')))
 save(HERE/'identity_after.json',dict(status='PASS',source_files_checked=len(q['source_files']),quickjs_sha256=q['binary']['sha256'],v8_sha256=v['binary']['sha256'],v8_files=files,libraries=libs,original_and_normalized_source=identities,builds_performed=0,mode_changes_to_historical_runner=False,timestamp=stamp()))
 print('REUSED_ARTIFACT_IDENTITY_PASS',len(q['source_files']))
if __name__=='__main__':main()
