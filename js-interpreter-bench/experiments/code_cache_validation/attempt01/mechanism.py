import base64, json, re, sys, urllib.request
from common import *

def fetch():
    urls=[('d8.cc','https://chromium.googlesource.com/v8/v8/+/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/d8/d8.cc?format=TEXT'),
          ('d8.github.cc','https://raw.githubusercontent.com/v8/v8/37fb84941c9be9f9914ee50b1ad366f06a1bd764/src/d8/d8.cc')]
    for name,url in urls:
        log=HERE/'probes/source'/(name+'.fetch.json')
        if log.exists(): continue
        r={'url':url,'reference_commit':'37fb84941c9be9f9914ee50b1ad366f06a1bd764','artifact_commit_proof':False,'timestamp':stamp()}
        try:
            with urllib.request.urlopen(url,timeout=25) as f: b=f.read();r['http_status']=f.status
            if 'format=TEXT' in url:b=base64.b64decode(b)
            save(HERE/'probes/source'/name,b);r.update(success=True,sha256=sha(HERE/'probes/source'/name))
        except Exception as e:r.update(success=False,error=str(e))
        save(log,r)

def main():
    initialize()
    if len(sys.argv)>1 and sys.argv[1]=='fetch': fetch();return
    h=capture('help',command(extra=['--help']))
    capture('flag_values',command(extra=['--print-flag-values','-e','0']))
    script=HERE/'probes/preparation.js'
    for kind in ('none','code','after-execute','full-code-cache'):
        r=capture('cache_'+kind,command(script,['--cache='+kind]))
        print(kind,r['exit_code'],r['stdout'][-500:],r['stderr'][:150],flush=True)
    for flag in ('trace-serializer','profile-deserialization','trace-deserializer','print-bytecode'):
        exists=bool(re.search(r'^\s*--'+re.escape(flag)+r'\b',h['stdout'],re.M))
        print('HELP',flag,exists,flush=True)
        if exists:
            r=capture('diagnostic_'+flag,command(script,['--cache=code','--'+flag]))
            print('DIAG',flag,r['exit_code'],'outbytes',len(r['stdout']),'stderr',r['stderr'][:200],flush=True)
    for lazy in (True,False):
        capture('bytecode_'+('lazy' if lazy else 'no_lazy'),command(script,['--cache=none','--print-bytecode'],lazy=lazy))
    capture('target_cache_combined',command(script,['--cache=code','--trace-serializer','--profile-deserialization','--print-bytecode']))
    capture('target_source_combined',command(script,['--cache=none','--trace-serializer','--profile-deserialization','--print-bytecode']))
    if '--trace-deserialization ' in h['stdout']:
        capture('target_deserialization_trace',command(script,['--cache=code','--trace-deserialization']))
    capture('isolate_ids',command(script,['--cache=code','--log','--logfile='+str(HERE/'probes/isolate.log')]))
    fetch()

if __name__=='__main__':main()
