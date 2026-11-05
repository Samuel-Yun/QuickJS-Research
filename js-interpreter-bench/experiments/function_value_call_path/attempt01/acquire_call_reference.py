"""One bounded authorized-network pass after sandbox socket denial; TLS stays enabled."""
import urllib.request
from common import *
REV='37fb84941c9be9f9914ee50b1ad366f06a1bd764'
def main():
    rows=[]
    for rel in ['src/interpreter/interpreter-assembler.cc','src/builtins/builtins-interpreter-gen.cc','src/builtins/builtins-call-gen.cc','src/builtins/x64/builtins-x64.cc']:
        url=f'https://raw.githubusercontent.com/v8/v8/{REV}/{rel}';p=HERE/'source_reference'/rel
        try:
            with urllib.request.urlopen(url,timeout=20) as r:data=r.read(1000001)
            assert len(data)<=1000000 and b'Copyright' in data[:1500];save(p,data)
            row=dict(url=url,reference_commit=REV,sha256=sha(p),bytes=len(data),git_blob_sha1=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest(),status='ACQUIRED',TLS_verification=True,actual_binary_build_commit=None)
        except (OSError,AssertionError) as e:row=dict(url=url,status='UNAVAILABLE',error=str(e),TLS_verification=True)
        rows.append(row);print(rel,row['status'],flush=True)
    save(HERE/'source_reference/authorized_network_pass.json',dict(reason='initial process sandbox denied sockets WinError10013; explicit network-permitted invocation, not changed TLS or upstream retry',files=rows))
if __name__=='__main__':main()
