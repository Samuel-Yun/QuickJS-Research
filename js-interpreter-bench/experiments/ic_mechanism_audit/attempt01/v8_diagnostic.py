"""One bounded ON diagnostic of this case; no OFF vector snapshot retries."""
from common import *
from run import script
def main():
    verify_runtime();help=read(HERE/'raw/build/d8_help.json')['stdout']
    flags=['print-bytecode','print-bytecode-filter','log-ic','log-maps','log-maps-details','logfile','logfile-per-isolate','allow-natives-syntax','print-builtin-code','print-builtin-code-filter']
    assert all('  --'+f+' ' in help for f in flags)
    base=script(CASES[0],2,True);js=HERE/'inputs/v8_m1_diagnostic.js'
    save(js,base.read_bytes()+b'\n%DebugPrint(microObject);\n')
    log=STORE/'reports/v8_m1.log'
    cmd=prefixes()['V8_ON']+['--print-bytecode','--print-bytecode-filter=m1Read','--log-ic','--log-maps','--log-maps-details','--no-logfile-per-isolate','--logfile='+str(log),'--allow-natives-syntax',str(js)]
    cached=HERE/'raw/build/v8_m1_bytecode_maps.json'
    r=read(cached) if cached.exists() else capture('v8_m1_bytecode_maps',cmd,timeout=180)
    assert r['command']==cmd and r['exit_code']==0 and r['stderr'] in ['', 'V8 is running with developer-only features enabled. Stability and security will suffer.\n'] and 'TEB_RESULT:' in r['stdout']
    save(HERE/'bytecode/V8_m1Read.txt',r['stdout'])
    data=log.read_bytes();out=HERE/'raw/diagnostic/v8_m1.log.gz';save(out,gzip.compress(data,mtime=0))
    save(HERE/'raw/diagnostic/v8_m1.log.identity.json',dict(uncompressed_sha256=hashlib.sha256(data).hexdigest(),compressed_sha256=sha(out),size_bytes=len(data),script_sha256=sha(js)))
    text=data.decode(errors='replace');transitions=[l for l in text.splitlines() if l.startswith('LoadIC,') and ',x,' in l]
    assert transitions
    save(HERE/'bytecode/V8_m1_IC_transitions.txt','\n'.join(transitions)+'\n')
    maps={l.split(',')[7] for l in transitions}
    details=[l for l in text.splitlines() if l.startswith('map-details,') and any(m in l for m in maps)]
    save(HERE/'bytecode/V8_m1_receiver_maps.txt','\n'.join(details)+'\n')
    r=capture('v8_GetNamedProperty_actual_machine_code',prefixes()['V8_ON']+['--print-builtin-code','--print-builtin-code-filter=GetNamedProperty','-e','0'],timeout=180)
    save(HERE/'bytecode/V8_GetNamedProperty_machine_code.txt',r['stdout'])
    save(HERE/'v8_diagnostic_gate.json',dict(status='PASS',ON_transitions=transitions,field_storage='see actual map-details; absence means UNKNOWN',OFF_direct_feedback_snapshot=None,per_access_hit_rate=None,exact_binary_source_commit=None))
    print('V8_DIAGNOSTIC_SAVED',flush=True)
if __name__=='__main__':main()
